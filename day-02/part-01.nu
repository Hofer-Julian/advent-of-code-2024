use std


def part-one [] {
    let input = lines | split words | each { into int }
    $input |
      each {
        window 2 |
        reduce --fold [0 true] {|it, acc|
            if (not $acc.1) {
                return [$acc.0 $acc.1]
            }
  
            let distance = ($it.0 - $it.1) | math abs

            if ($distance < 1) or ($distance > 3) {
                return [$acc.0 false]
            } 

            let sign = ($it.0 - $it.1) / $distance
            if $acc.0 == 0 {
                return [$sign true]
            }

            if $acc.0 == $sign {
                [$acc.0 true]
            } else {
                [$acc.0 false]
            }
        }
      } |
      reduce --fold 0 {|it, acc| if $it.1 { $acc + 1 } else { $acc }}
}

let input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"

std assert equal ($input | part-one) 2

open day-02/input.txt | part-one
