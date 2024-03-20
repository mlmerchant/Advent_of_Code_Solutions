def find_number_in_string(string):
    # Check for digit numbers
    for digit in range(1, 10):
        if str(digit) in string:
            return digit

    # Check for word numbers
    word_numbers = {
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9
    }

    for word, number in word_numbers.items():
        if word in string:
            return number

    # Return None if no number is found
    return None


# Reading file content
with open("input.txt", "r") as file:
    lines = file.readlines()

input_sum = 0

for line in lines:
    # Initialize variables for the first and last numbers
    first_number = None
    last_number = None

    # Find the first number from the front
    for i in range(len(line)):
        first_number = find_number_in_string(line[:i+1])
        if first_number is not None:
            break

    # Find the first number from the back
    reversed_line = line[::-1]
    for i in range(len(reversed_line)):
        reversed_line_segment = reversed_line[:i+1]
        restored_line_segment = reversed_line_segment[::-1]
        last_number = find_number_in_string(restored_line_segment)
        if last_number is not None:
            break

    # Concatenate and add to sum if both numbers are found
    if first_number is not None and last_number is not None:
        line_number = int(str(first_number) + str(last_number))
        input_sum += line_number

print(input_sum)
# Correct Answer is 55093
