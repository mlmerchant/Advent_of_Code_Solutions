import hashlib

def find_hash_characters():
    counter = 0
    inc = 0
    result = []

    while inc < 8:
        # Generating the string to be hashed
        string_to_hash = f"reyedfim{counter}"

        # Calculating the MD5 hash
        hash_result = hashlib.md5(string_to_hash.encode()).hexdigest()

        # Check if the hash starts with "00000"
        if hash_result.startswith("00000"):
            # Extracting the next character after "00000"
            result.append(hash_result[5])
            inc += 1

        counter += 1

    return result

# Running the function to find the hash characters
find_hash_characters()

# Result is ['f', '9', '7', 'c', '3', '5', '4', 'd']
