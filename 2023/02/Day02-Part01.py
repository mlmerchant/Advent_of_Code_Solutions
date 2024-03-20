import re

RED_CUBES = 12
GREEN_CUBES = 13
BLUE_CUBES = 14


def return_only_int(string_with_numbers):
    regx_results = re.sub(r'[^0-9]', '', string_with_numbers)
    if regx_results == "":
        return 0
    else:
        return int(regx_results)


with open("input.txt") as file:
    input_file = file.readlines()

total_of_valid_game_ids = 0

for line in input_file:
    game_and_results = line.split(":")
    game = game_and_results[0]
    game_id = return_only_int(game)

    one_full_game_results = game_and_results[1].split(";")
    results_valid = True
    for single_game_results in one_full_game_results:
        continue_game_round = True
        blue = 0
        red = 0
        green = 0
        marble_sets = single_game_results.split(',')
        for marbles in marble_sets:
            if "blue" in marbles:
                blue = return_only_int(marbles)
            if "red" in marbles:
                red = return_only_int(marbles)
            if "green" in marbles:
                green = return_only_int(marbles)

        if blue > BLUE_CUBES or red > RED_CUBES or green > GREEN_CUBES:
            results_valid = False
            break

    if results_valid:
        total_of_valid_game_ids += game_id

# Correct Answer of 8 for test data.
# Correct Answer of 1931 for input data.
print(total_of_valid_game_ids)
