use std


def two [] {
    let input = lines | split words | each { into int }
    mut result = 0

    for row in $input {
        for index in -1..($row | length) {
            mut valid = true
            mut sign = 0
            
            let row = if $index == -1 {
                $row
            } else {
                $row | drop nth $index
            }
    
            for pair in ($row | window 2) {
                if (not $valid) {
                    break
                }
    
                let distance = ($pair.0 - $pair.1) | math abs
    
                if ($distance < 1) or ($distance > 3) {
                    $valid = false
                    break
                }
    
                let current_sign = ($pair.0 - $pair.1) / $distance
                if $sign == 0 {
                    $sign = $current_sign
                } else if $sign != $current_sign {
                    $valid = false
                    break
                }
            }
    
            if $valid {
                $result = $result + 1
                break
            }
        }
    }

    $result
}

let input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"

std assert equal ($input | two) 4

open day-02/input.txt | two
