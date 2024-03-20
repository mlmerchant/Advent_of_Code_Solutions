DATA = "Challenge.txt"

with open(DATA) as file:
    # Collect the seeds into a list.
    seeds = file.readline()[:-1]
    seeds = seeds.split(": ")
    seeds = seeds[1].split(" ")
    seeds = [int(seed) for seed in seeds]

    # Collect the rest of the values into a lookup table.
    tableFlow = ["soil", "fertilizer", "water", "light", "temperature", "humidity", "location"]
    lookupTable = {}
    line = file.readline()
    while line:
        if "map" in line:
            mapName = line.split("-")[2].split(" ")[0]
            lookupTable[mapName] = []
        elif len(line.strip()) > 0:
            lookupTable[mapName].append(line.strip().split(' '))
        line = file.readline()

# Process the seeds in base and count pairs
seed_base_seeds = [seeds[i] for i in range(0, len(seeds), 2)]
seed_counts = [seeds[i] for i in range(1, len(seeds), 2)]

seed_base_count = len(seed_base_seeds)
current_seed_base = 1

result = float('inf')  # Using infinity as the initial highest possible result

for seed_base_seed, count in zip(seed_base_seeds, seed_counts):
    print(f"Working {current_seed_base} of {seed_base_count}.")
    current_seed_base += 1
    for seed in range(seed_base_seed, seed_base_seed + count):
        start_seed = seed
        for table in tableFlow:
            for mapping in lookupTable[table]:
                destination_range_start = int(mapping[0])
                source_range_start = int(mapping[1])
                range_length = int(mapping[2])
                source_range_end = source_range_start + range_length - 1  # Inclusive
                if source_range_start <= seed <= source_range_end:
                    seed = (seed - source_range_start) + destination_range_start
                    break
        if seed < result:
            result = seed

print(result)
