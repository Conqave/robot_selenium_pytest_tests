import pytest

from calculator import Calculator


@pytest.fixture
def calculator():
    return Calculator()


def test_addition(calculator):
    calculator.add(5)
    assert calculator.get_value() == 5


def test_subtraction(calculator):
    calculator.add(10)
    calculator.subtract(4)
    assert calculator.get_value() == 6


def test_multiplication(calculator):
    calculator.add(3)
    calculator.multiply(2)
    assert calculator.get_value() == 6


def test_division(calculator):
    calculator.add(8)
    calculator.divide(4)
    assert calculator.get_value() == 2


def test_division_by_zero(calculator):
    with pytest.raises(ZeroDivisionError):
        calculator.divide(0)


def test_reset(calculator):
    calculator.add(10)
    calculator.reset()
    assert calculator.get_value() == 0


def test_chaining_operations(calculator):
    calculator.add(10)
    calculator.subtract(2)
    calculator.multiply(5)
    calculator.divide(4)
    assert calculator.get_value() == 10


def test_floating_point_operations(calculator):
    calculator.add(2.5)
    calculator.multiply(4.0)
    assert calculator.get_value() == 10.0


@pytest.mark.parametrize(
    "initial, to_add, expected", [(0, 5, 5), (-5, 5, 0), (2.5, 2.5, 5.0), (100, 0, 100)]
)
def test_parameterized_addition(initial, to_add, expected):
    calculator = Calculator(initial)
    calculator.add(to_add)
    assert calculator.get_value() == expected
