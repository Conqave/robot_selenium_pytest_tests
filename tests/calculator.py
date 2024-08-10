class Calculator:

    def __init__(self, starting_value: float = 0.0) -> None:
        self.value = starting_value

    def add(self, number: float) -> None:
        """
        Adds the given number to the current value.

        Args:
            number (float): The number to add.
        """
        self.value += number

    def subtract(self, number: float) -> None:
        """
        Subtracts the given number from the current value.

        Args:
            number (float): The number to subtract.
        """
        self.value -= number

    def multiply(self, number: float) -> None:
        """
        Multiplies the current value by the given number.

        Args:
            number (float): The number to multiply by.
        """
        self.value *= number

    def divide(self, number: float) -> None:
        """
        Divides the current value by the given number.

        Args:
            number (float): The number to divide by.

        Raises:
            ZeroDivisionError: If an attempt is made to divide by zero.
        """
        if number == 0:
            raise ZeroDivisionError("Cannot divide by zero.")
        self.value /= number

    def get_value(self) -> float:
        """
        Returns the current value of the calculator.

        Returns:
            float: The current value.
        """
        return self.value

    def reset(self) -> None:
        """
        Resets the calculator value to zero.
        """
        self.value = 0.0
