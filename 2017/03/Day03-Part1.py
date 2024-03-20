#!/bin/env python3

# The challenge number to reach
challenge = 361527

# Initialize the coordinates
x = 0
y = 0

# Initialize the step count and the heading direction
count = 0
heading = 'R'  # R for right, other directions are U for up, L for left, D for down
jump = 2  # The number of steps to move in a certain direction

def left():
    """
    Change the heading direction to the left of the current direction.
    """
    global heading
    if heading == 'R':
        heading = 'U'  # From right to up
    elif heading == 'U':
        heading = 'L'  # From up to left
    elif heading == 'L':
        heading = 'D'  # From left to down
    else:
        heading = 'R'  # From down to right

def move():
    """
    Move one step in the current heading direction and update the step count.
    If the step count reaches the challenge number, print the Manhattan distance
    from the origin and exit.
    """
    global x, y, count
    if heading == 'U':
        y += 1
    elif heading == 'D':
        y -= 1
    elif heading == 'R':
        x += 1
    else:
        x -= 1
    count += 1
    if count == challenge:
        print(abs(x) + abs(y) - 1)
        exit()
    
# Initial moves to start the spiral pattern
move()
left()
move()
left()

# Loop to create the spiral pattern
while True:
    # Move in one direction and then turn left
    for _ in range(jump):
        move()
    left()
    # Move in the new direction and then turn left again
    for _ in range(jump):
        move()
    left()
    # Increase the number of steps to take before the next turn
    jump += 1

# Note: The correct answer for the challenge number 361527 is 326.
