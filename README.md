
# Test Automation Project

## Project Description

This project contains a set of automated tests written using the [Robot Framework](https://robotframework.org/) and [pytest](https://docs.pytest.org/). The tests are divided into two main segments:

1. **Robot Framework tests** located in `robot/test_nokia_task_1.robot`.
2. **Python tests using pytest** located in `tests/test_calculator.py`.

### Robot Framework Task Overview

The Robot Framework script performs a series of automated actions on a web page using Selenium and Firefox. The test script does the following:

1. Opens [Google](https://www.google.com/) in Firefox.
2. Searches for "nokia wikipedia".
3. Verifies that a Wikipedia link is present in the search results.
4. Clicks the first Wikipedia link, if it exists.
5. Waits for the Wikipedia page to load completely.
6. Captures a screenshot of the entire page.
7. Verifies that the page title contains "Nokia".
8. Extracts Nokia's founding year from the Wikipedia page using XPath.
9. Verifies that the extracted year is 1865.
10. Implements error handling for scenarios where the Wikipedia link is not found.
11. Defines and uses variables for browser type, URL, search term, expected founding year, and all XPath locators used in the script.
12. Includes a test teardown to close the browser.

### Python OOP and Testing Task Overview

This task involves creating a `Calculator` class in Python with the following features:

- A constructor that initializes the calculator with a starting value (default to 0).
- Methods for basic arithmetic operations: `add`, `subtract`, `multiply`, and `divide`.
- Error handling for division by zero.
- A method to get the current value and reset the calculator.
- pytest tests to validate the calculator's functionality, including edge cases and floating-point operations.

## Requirements

To run this project, you need to install the following software:

- Python 3.11
- [Robot Framework 6.0.1](https://robotframework.org/)
- [SeleniumLibrary 6.1.0](https://robotframework.org/SeleniumLibrary/)
- Firefox browser (latest stable version)
- geckodriver (compatible with the installed Firefox version)
- [pytest](https://docs.pytest.org/)

### Installing Dependencies

You can install all required dependencies using pip:

```bash
pip install -r requirements.txt
```

## Running Tests

### 1. Running Robot Framework Tests

Before running the Robot Framework tests, ensure that the path to `geckodriver` is correctly set. You can configure the following line at the `.robot` file to specify the path explicitly:

```robot
*** Variables ***
${GECKODRIVER_PATH}    /path/to/your/geckodriver
```

The Robot Framework tests are located in the `robot/` directory. To run these tests, execute the following command in your terminal:

```bash
robot robot/test_nokia_task_1.robot
```

Ensure that you have Firefox and geckodriver properly installed and configured.

### 2. Running pytest Tests

The Python tests are located in the `tests/` directory. To run these tests, execute the following command in your terminal:

```bash
pytest tests/test_calculator.py
```

## Project Structure

The project consists of the following files and directories:

```plaintext
|-- robot/
|   |-- test_nokia_task_1.robot    # Tests written in Robot Framework
|
|-- tests/
|   |-- test_calculator.py         # Unit tests written in Python using pytest
|
|-- README.md                      # This file, which describes the project
|-- requirements.txt               # List of required Python packages
```