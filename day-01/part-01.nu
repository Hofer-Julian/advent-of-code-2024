use std


def part-one [] {
    let input = lines | parse "{first}   {second}"
    let first_list = $input | get first | into int | sort
    let second_list = $input | get second | into int | sort

    $first_list | zip $second_list | each { ($in.0 - $in.1) | math abs } | math sum
}

let input = "3   4
4   3
2   5
1   3
3   9
3   3"

std assert equal ($input | part-one) 11

open day-01/input.txt | part-one
