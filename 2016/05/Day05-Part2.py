import hashlib

def find_hash_characters():
    counter = 0
    inc = 0
    result = ['$', '$', '$', '$', '$', '$', '$', '$']

    while '$' in result:
        # Generating the string to be hashed
        string_to_hash = f"reyedfim{counter}"

        # Calculating the MD5 hash
        hash_result = hashlib.md5(string_to_hash.encode()).hexdigest()

        # Check if the hash starts with "00000"
        if hash_result.startswith("00000"):
            # Extracting the next character after "00000"
            index= hash_result[5]
            digit = hash_result[6]
            if index.isnumeric():
            	if int(index) < 8:
            	    if result[int(index)] == '$':
            	        result[int(index)] = digit
        counter += 1

    return result

# Running the function to find the hash characters
print("". join(find_hash_characters()))

# The answer is 863dde27