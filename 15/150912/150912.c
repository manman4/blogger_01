#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>


struct board {
    // 盤面の大きさ
    int num_rows, num_cols;

    //counts[行インデックス][列インデックス]:
    //そのマスから/マスへ移動可能なマスがいくつあるか。
    //解の探索で、利き筋のマスが訪問済になると減少する。
    //また、訪問済のマスは -1 とする。
    int** counts;

    // カウントが1のマスの数。これが3以上になると
    // そのすべてを訪問することはできないため解なしとなる。
    int num_ones;
};


// マスの位置を表す構造体。
struct board_index {
    int row, col;
};


// ナイトの利き筋。
const struct board_index g_knight_movement[] = {
 { 1, 2 }, { -1, 2 }, { 1, -2 }, { -1, -2 },
 { 2, 1 }, { -2, 1 }, { 2, -1 }, { -2, -1 },
};
// g_knight_movement の要素数。
#define NUM_KNIGHT_MOVEMENTS  ((sizeof(g_knight_movement) / sizeof(g_knight_movement[0])))


// 指定されたインデックスが盤面の範囲に入っているか。
static bool in_board(const struct board* brd, struct board_index index)
{
    return ((0 <= index.row) && (index.row < brd->num_rows))
        && ((0 <= index.col) && (index.col < brd->num_cols));
}


// 指定したマスの利き筋の数の初期値を求める。
int initial_count_at(const struct board* brd, int row, int col)
{
    int count = 0;
    for (size_t i = 0; i < NUM_KNIGHT_MOVEMENTS; i++) {
        struct board_index next = { // (row, col) から一回動いた位置
         .row = g_knight_movement[i].row + row,
         .col = g_knight_movement[i].col + col,
        };
        count += in_board(brd, next);
    }
    return count;
}


// init_board_result() の戻り値。
enum init_board_result {
    IB_SUCCESS,         // 初期化成功
    IB_ERROR,           // エラー発生
    IB_NO_SOLUTION,     // 初期化時に解がないことが確定して初期化を中断した
};


// 盤面の情報を初期化する。
enum init_board_result init_board(struct board* brd, int num_rows, int num_cols)
{
    enum init_board_result err_retval;
    brd->num_rows = num_rows;
    brd->num_cols = num_cols;
    brd->num_ones = 0;
    brd->counts = (int**)malloc(sizeof(brd->counts[0]) * num_rows);
    if (brd->counts == NULL) {
        err_retval = IB_ERROR;
        goto err_alloc_baseptr;
    }
    int row;
    for (row = 0; row < num_rows; row++) {
        brd->counts[row] = (int*)malloc(sizeof(brd->counts[0][0]) * num_cols);
        if (brd->counts[row] == NULL) {
            err_retval = IB_ERROR;
            goto err_alloc_row;
        }
        for (int col = 0; col < num_cols; col++) {
            brd->counts[row][col] = initial_count_at(brd, row, col);
            switch (brd->counts[row][col]) {
            case 1:
                brd->num_ones++;
                break;

            case 0:
                err_retval = IB_NO_SOLUTION;
                goto no_solution;

            default:
                break;
            }
        }
    }
    return IB_SUCCESS;

    // error or no solution
no_solution:
    free(brd->counts[row]);
err_alloc_row:
    while (row-- > 0) {
        free(brd->counts[row]);
    }
    free(brd->counts);
err_alloc_baseptr:
    return err_retval;
}


// 盤面を破棄する。
void destray_board(struct board* brd)
{
    for (int row = 0; row < brd->num_rows; row++) {
        free(brd->counts[row]);
    }
    free(brd->counts);
}


// 後述の update_next_counts_and_enum_available_indices() とペアで使う。
// 上記関数で列挙されたマスのカウントを元に戻す。
void restore_next_counts(
    struct board* brd,
    const struct board_index nexts[],
    size_t num_nexts)
{
    for (size_t i = 0; i < num_nexts; i++) {
        // カウント戻し + 1のマス数の調整
        switch (brd->counts[nexts[i].row][nexts[i].col]++) {
        case 1:
            brd->num_ones--;
            break;

        case 0:
            brd->num_ones++;
            break;
        }
    }
}


// 現在位置から到達できるマスのカウントを減らしつつ、
// 指定された位置から次に動ける候補一覧を列挙する。
// nexts[] に候補が格納され、候補数が返される。解がないと判断されたら
// カウントの変更はキャンセルされ、0が返されら。
size_t update_next_counts_and_enum_available_indices(
    struct board* brd,
    struct board_index index,
    bool is_last_step,
    struct board_index nexts[])
{
    size_t num_nexts = 0;
    for (size_t i = 0; i < NUM_KNIGHT_MOVEMENTS; i++) {
        struct board_index next = {
         .row = g_knight_movement[i].row + index.row,
         .col = g_knight_movement[i].col + index.col,
        };
        if (!in_board(brd, next)) {
            // 盤面の範囲外は候補たり得ないので何もしない
            continue;
        }
        int count = brd->counts[next.row][next.col];
        if (count < 0) {
            // 訪問済のマスは触らない。
            continue;
        }
        // 以降、すべて正の数となる。(0となるパターンは存在しない)
        assert(count != 0);
        // カウントを減らす。
        brd->counts[next.row][next.col] = count - 1;
        if (count == 1) {
            // 1のマス (今回0になった) が見付かった時点で、それが唯一の候補。
            // ただし、それが最後の空きマスでなければ、さらに
            // 次の一歩を移動できないので解なしとなる。
            if (is_last_step) {
                num_nexts = 1;
                nexts[0] = next;
                brd->num_ones--;
                // 他のマスはすべて訪問済なので、これ以上見る必要はない。
                break;
            }
            else {
                // 解なし。変更を元に戻して0を返す。
                brd->counts[next.row][next.col] = count;
                restore_next_counts(brd, nexts, num_nexts);
                return 0;
            }
        }
        else {
            nexts[num_nexts++] = next;
            if (count == 2) {
                // 減算の結果、1になるので、記録してある1の数を増やす。
                brd->num_ones++;
            }
        }
    }
    assert(num_nexts > 0);
    return num_nexts;
}


long long solve_knight_tour_impl(
    struct board* brd,
    int depth,
    struct board_index index)
{
    if (depth == brd->num_rows * brd->num_cols - 1) {
        // 解がひとつ見付かった
        return 1;
    }

    struct board_index nexts[NUM_KNIGHT_MOVEMENTS]; // 移動先候補は最大でナイトの利き筋の数。
    size_t num_nexts = update_next_counts_and_enum_available_indices(
        brd, index,
        depth == brd->num_rows * brd->num_cols - 2,
        nexts);
    if (num_nexts == 0) {
        // この探索では解がない。
        return 0;
    }
    // 現在位置を無効化する。
    // 後で戻せるように値の退避もしておく。
    int saved_count = brd->counts[index.row][index.col];
    if (saved_count == 1) {
        brd->num_ones--;
    }
    brd->counts[index.row][index.col] = -1;

    long long found = 0;
    // ここで、現在の1のマスの数を調べる。
    if (brd->num_ones >= 3) {
        // 3以上なら解なしとなるので何もしない。
    }
    else {
        if (brd->num_ones >= 2) {
            // カウントが1の移動先候補それぞれについて解を探索。
            for (size_t i = 0; i < num_nexts; i++) {
                if (brd->counts[nexts[i].row][nexts[i].col] == 1) {
                    found += solve_knight_tour_impl(brd, depth + 1, nexts[i]);
                }
            }
        }
        else {
            // 移動先候補それぞれについて解を探索。
            for (size_t i = 0; i < num_nexts; i++) {
                found += solve_knight_tour_impl(brd, depth + 1, nexts[i]);
            }
        }
    }
    // [A] の変更元に戻す。
    brd->counts[index.row][index.col] = saved_count;
    if (saved_count == 1) {
        brd->num_ones++;
    }
    restore_next_counts(brd, nexts, num_nexts);

    return found;
}


// num_rows × num_cols の盤面のナイトツアーを満たす解の数を返す。
// エラー発生時は -1 。
// なお、回転・線対称・逆周りはすべて別個の解として数えている。
long long solve_knight_tour(size_t num_rows, size_t num_cols)
{
    struct board brd;
    switch (init_board(&brd, num_rows, num_cols)) {
    case IB_SUCCESS:
        break;

    case IB_ERROR:
        return -1;

    case IB_NO_SOLUTION:
        return 0;
    }
    long long found = 0;

    // 各座標を視点とした解の個数を合計する。
    // なお、縦横2等分すれば、それぞれ線対称の位置になるので、
    // その 1/4 の部分だけ計算し、4倍することで全体の結果が求められる。
    // ただし、奇数の場合は、中央の行・列の追加計算も必要。
    for (int row = 0; row < num_rows / 2; row++) {
        for (int col = 0; col < num_cols / 2; col++) {
            found += solve_knight_tour_impl(&brd, 0, (struct board_index) { .row = row, .col = col });
        }
    }
    found *= 4;
    // 奇数の場合の追加パターン
    if (num_rows & 1) {
        long long extra_found = 0;
        // 行数が奇数 → 真ん中の行を追加計算。これも半分だけ計算して2倍する。
        for (int col = 0; col < num_cols / 2; col++) {
            extra_found += solve_knight_tour_impl(&brd, 0, (struct board_index) { .row = num_rows / 2, .col = col });
        }
        found += extra_found * 2;
    }
    if (num_cols & 1) {
        long long extra_found = 0;
        // 列数が奇数 → 真ん中の列を追加計算。これも半分だけ計算して2倍する。
        for (int row = 0; row < num_rows / 2; row++) {
            extra_found += solve_knight_tour_impl(&brd, 0, (struct board_index) { .row = row, .col = num_cols / 2 });
        }
        found += extra_found * 2;
    }
    if ((num_rows & 1) && (num_cols & 1)) {
        // どちらも奇数 → 中央のマスを追加計算。
        found += solve_knight_tour_impl(&brd, 0, (struct board_index) { .row = num_rows / 2, .col = num_cols / 2 });
    }
    destray_board(&brd);
    return found;
}


// 引数に盤面のサイズを指定する。
// 不正な引数が渡された場合のエラー処理はしていない(手抜き)。
int main(int argc, char* argv[])
{
    if (argc < 3) {
        printf("Usage: %s #-rows #-cols\n", argv[0]);
        return 1;
    }
    int num_rows = strtol(argv[1], NULL, 0);
    int num_cols = strtol(argv[2], NULL, 0);

    // 探索本体
    long long num_solutions = solve_knight_tour(num_rows, num_cols);
    if (num_solutions == -1) {
        perror("");
        return 1;
    }
    printf("# of solutions = %lld\n", num_solutions);
    return 0;
}
