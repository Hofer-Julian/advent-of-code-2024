from pathlib import Path
import re

pattern = re.compile(
    r"(mul\((?P<first>\d{1,3}),(?P<second>\d{1,3})\))|(?P<not>don't\(\))|(?P<do>do\(\))"
)


def solve(input: str) -> int:
    result = 0
    do = True
    for match in pattern.finditer(input):
        if match.group("not"):
            do = False
        elif match.group("do"):
            do = True
        elif do:
            first = match.group("first")
            second = match.group("second")

            if first is not None and second is not None:
                result += int(first) * int(second)

    return result


def test() -> None:
    test_input = Path(__file__).parent.joinpath("test.txt").read_text()
    assert solve(test_input) == 48, "Test failed"


if __name__ == "__main__":
    test()
    actual_input = Path(__file__).parent.joinpath("input.txt").read_text()
    print(solve(actual_input))
