use std

def part-two [] {
    let input = lines | parse "{first}   {second}"
    let first_list = $input | get first | into int
    let second_list = $input | get second | into int

    $first_list | each {|f| $second_list | filter {|s| $f == $s} | length | $in * $f} | math sum
}

let input = "3   4
4   3
2   5
1   3
3   9
3   3"

std assert equal ($input | part-two) 31

open day-01/input.txt | part-two
