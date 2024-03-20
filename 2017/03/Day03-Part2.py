challenge = 361527  # Target value for the challenge

x=0  # Initial X-coordinate
y=0  # Initial Y-coordinate

count=0  # Counter for the number of moves
heading='R'  # Initial heading direction (Right)
jump=2  # Initial jump count

grid = {}  # Dictionary to store values on the grid
grid['0.0']=1  # Initializing the starting position with a value of 1

def left():
    global heading
    # Function to change the direction of movement in a leftward spiral
    if heading == 'R':
        heading = 'U'  # Right to Up
    elif heading == 'U':
        heading = 'L'  # Up to Left
    elif heading == 'L':
        heading = 'D'  # Left to Down
    else:
        heading = 'R'  # Down to Right

def move():
    global x, y, count
    # Function to move one step in the current heading direction
    if heading == 'U':
        y += 1  # Move up
    elif heading == 'D':
        y -= 1  # Move down
    elif heading == 'R':
        x += 1  # Move right
    else:
        x -= 1  # Move left
    count += 1
    value = set_current_and_get_neighbor_values(count)
    if value > challenge:
        print(value)  # Print the value if it exceeds the challenge value
        exit()
        
def set_current_and_get_neighbor_values(value):
    global x, y, grid
    # Function to set the current cell's value and return the sum of neighbor values
    sum = 0
    # Check all eight neighboring cells and add their values if they are in the grid
    for dx in [-1, 0, 1]:
        for dy in [-1, 0, 1]:
            if dx == 0 and dy == 0:
                continue  # Skip the current cell itself
            if f"{x+dx}.{y+dy}" in grid:
                sum += grid[f"{x+dx}.{y+dy}"]
    grid[f"{x}.{y}"] = sum
    return sum

# Initial moves to start the spiral pattern
move()
left()
move()
left()

# Main loop to continue the spiral movement
while True:
    for _ in range(jump):
        move()
    left()
    for _ in range(jump):
        move()
    left()
    jump += 1  # Increment the jump count after completing each spiral arm

# The correct answer is 363010