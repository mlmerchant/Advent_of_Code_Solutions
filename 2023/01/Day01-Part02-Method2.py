def find_first_number_in_string(string, reversed_words=False):
    # Check for the earliest occurrence of each digit and word number
    earliest_index = len(string)
    number_found = None

    # Check for digit numbers
    for digit in range(1, 10):
        index = string.find(str(digit))
        if 0 <= index < earliest_index:
            earliest_index = index
            number_found = digit

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

    if reversed_words:
        # Reverse the word keys for searching in reversed strings
        word_numbers = {word[::-1]: num for word, num in word_numbers.items()}

    for word, number in word_numbers.items():
        index = string.find(word)
        if 0 <= index < earliest_index:
            earliest_index = index
            number_found = number

    return number_found


# Reading file content
with open("input.txt", "r") as file:
    lines = file.readlines()

input_sum = 0

for line in lines:
    # Find the first number from the start
    first_number = find_first_number_in_string(line)

    # Find the first number from the reversed end
    reversed_line = line[::-1]
    last_number = find_first_number_in_string(reversed_line, reversed_words=True)

    # Concatenate and add to sum if both numbers are found
    if first_number is not None and last_number is not None:
        line_number = int(str(first_number) + str(last_number))
        input_sum += line_number

print(input_sum)
# Correct Answer is 55093
