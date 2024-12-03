from pathlib import Path
import re

pattern = re.compile(r"mul\((\d{1,3}),(\d{1,3})\)")


def solve(input: str) -> int:
    result = 0
    for f, s in pattern.findall(input):
        result += int(f) * int(s)
    return result


def test() -> None:
    test_input = Path(__file__).parent.joinpath("test.txt").read_text()
    assert solve(test_input) == 161, "Test failed"


if __name__ == "__main__":
    test()
    actual_input = Path(__file__).parent.joinpath("input.txt").read_text()
    print(solve(actual_input))
