Simple NASM Calculator
A basic command-line calculator written in NASM assembly language for Linux x86_64 systems. The program supports addition, subtraction, multiplication, and division of two integers.
Features

Supports four arithmetic operations:
Addition (1)
Subtraction (2)
Multiplication (3)
Division (4)


Handles division by zero with an error message
User-friendly prompts for input
Outputs results in decimal format

Prerequisites

NASM (Netwide Assembler)
GCC (GNU Compiler Collection)
Linux x86_64 system

Installation

Clone the repository:

git clone <repository-url>
cd <repository-directory>


Assemble the source code:

nasm -f elf64 simple_calculator.asm -o simple_calculator.o


Link the object file:

gcc -no-pie simple_calculator.o -o simple_calculator

Usage

Run the program:

./simple_calculator


Follow the prompts:

Enter the operation (1 for addition, 2 for subtraction, 3 for multiplication, 4 for division)
Enter the first number
Enter the second number


The program will display the result or an error message (e.g., for division by zero).


Example
$ ./simple_calculator
Enter operation (1 for add, 2 for sub, 3 for mul, 4 for div): 1
Enter first number: 10
Enter second number: 5
Result: 15

File Structure

simple_calculator.asm: The main assembly source code

Limitations

Only supports integer inputs
Division results are truncated to integers
No input validation for non-numeric inputs

Contributing
Contributions are welcome! Please feel free to submit a Pull Request or open an Issue for any bugs or feature requests.
License
This project is licensed under the MIT License - see the LICENSE file for details.
