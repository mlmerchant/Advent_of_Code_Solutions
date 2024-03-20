import re


def return_only_int(string_with_numbers):
    regx_results = re.sub(r'[^0-9]', '', string_with_numbers)
    if regx_results == "":
        return 0
    else:
        return int(regx_results)


with open("input.txt") as file:
    input_file = file.readlines()

sum_of_each_games_marble_powers = 0

for line in input_file:
    game_and_results = line.split(":")
    game = game_and_results[0]
    game_id = return_only_int(game)

    one_full_game_results = game_and_results[1].split(";")
    blue_max = red_max = green_max = 0
    blue = red = green = 0
    for single_game_results in one_full_game_results:
        continue_game_round = True
        marble_sets = single_game_results.split(',')
        for marbles in marble_sets:
            if "blue" in marbles:
                blue = return_only_int(marbles)
            if "red" in marbles:
                red = return_only_int(marbles)
            if "green" in marbles:
                green = return_only_int(marbles)

        if blue > blue_max:
            blue_max = blue
        if red > red_max:
            red_max = red
        if green > green_max:
            green_max = green

    marble_powers = blue_max * red_max * green_max
    sum_of_each_games_marble_powers += marble_powers

# Correct Answer of 2286 for test data.
# Correct Answer of 83105 for input data.
print(sum_of_each_games_marble_powers)
