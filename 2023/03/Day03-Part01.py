
def is_adjacent_to_special_chars(x_location, y_location, grid_list):
    adjacent_cells = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
    for adjacent_cell in adjacent_cells:
        new_x = x_location + adjacent_cell[0]
        new_y = y_location + adjacent_cell[1]
        try:
            if not grid_list[new_x][new_y] in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]:
                return True
        except IndexError:
            pass
    return False


with open("input.txt") as file:
    input_data = file.read().split("\n")

grid = []
for line in input_data:
    grid.append(list(line))

x_len = len(grid)
y_len = len(grid[0])
parts_sum = 0
in_number = False
is_touching_part_number = False
number_string = ""

for x in range(x_len):
    if is_touching_part_number:
        parts_sum += int(number_string)
    number_string = ""  # Begin collecting a new number
    in_number = False
    is_touching_part_number = False
    for y in range(y_len):
        cell = grid[x][y]
        if cell in "1234567890":
            in_number = True
            if is_adjacent_to_special_chars(x, y, grid):
                is_touching_part_number = True
            number_string += cell
        elif in_number and is_touching_part_number:  # Handling after number is done.
            parts_sum += int(number_string)
            in_number = False
            is_touching_part_number = False
            number_string = ""
        else:
            in_number = False
            number_string = ""
            is_touching_part_number = False



# Test input answer is 4361
# Challenge input answer is 536202
print(parts_sum)
