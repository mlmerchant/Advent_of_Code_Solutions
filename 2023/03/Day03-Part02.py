def touching_number_coordinates(x_location, y_location, grid_list):
    """Return a list of all x,y coordinates of touching numbers"""
    adjacent_cells = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
    number_list = []
    for adjacent_cell in adjacent_cells:
        new_x = x_location + adjacent_cell[0]
        new_y = y_location + adjacent_cell[1]
        try:
            if grid_list[new_x][new_y] in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]:
                number_list.append((new_x, new_y))
        except IndexError:
            pass
    return number_list


def get_full_number_from_starting_coordinates(start_x, start_y, grid_list):
    number_list = "0123456789"
    current_x = start_x

    string_num = ""

    # Move right until we find a non-digit character or reach the right edge of the grid
    try:
        while current_x <= len(grid_list[start_y]) and grid_list[start_y][current_x] in number_list:
            string_num += grid_list[start_y][current_x]
            current_x += 1
    except IndexError:
        pass  # Hit the end of the line.

    return int(string_num)


def expand_coordinate(start_x, start_y, grid_list):
    number_list = "0123456789"
    current_x = start_x

    # Move left until we find a non-digit character or reach the left edge of the grid
    while current_x >= 0 and grid_list[start_y][current_x] in number_list:
        current_x -= 1

    # Move back to the first digit character
    current_x += 1

    # Now, current_x is the starting point of the first continuous sequence of digits
    return start_y, current_x


all_number_lists = []

with open("input.txt") as file:
    input_data = file.read().split("\n")

grid = []
for line in input_data:
    grid.append(list(line))

x_len = len(grid)
y_len = len(grid[0])

for x in range(x_len):
    for y in range(y_len):
        if grid[x][y] == "*":
            temp = touching_number_coordinates(x, y, grid)
            if not temp == []:
                all_number_lists.append(temp)

total_of_ratios = 0
for number_list in all_number_lists:
    pair_dict = {}  # keys are a tuple of (y,x)
    for pair in number_list:
        pair_dict[expand_coordinate(start_x=pair[1], start_y=pair[0], grid_list=grid)] = None
    if len(pair_dict.keys()) == 2:
        key1, key2 = pair_dict.keys()

        value1 = get_full_number_from_starting_coordinates(start_x=key1[1], start_y=key1[0], grid_list=grid)
        value2 = get_full_number_from_starting_coordinates(start_x=key2[1], start_y=key2[0], grid_list=grid)

        total_of_ratios += value1 * value2

# Test input result is 467835
# Challenge input result is 78272573
print(total_of_ratios)
