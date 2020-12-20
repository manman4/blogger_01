require 'prime'

(1..50).each{|i|
  j = 78557 * 2 ** i + 1
  p [j, j.prime_division]
}

