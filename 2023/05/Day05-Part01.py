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


results = []
for seed in seeds:
    start_seed = seed
    for table in tableFlow:
        for mapping in lookupTable[table]:
            destination_range_start = int(mapping[0])
            source_range_start = int(mapping[1])
            range_length = int(mapping[2])
            source_range_end = int(source_range_start + range_length - 1)  # Inclusive
            if source_range_start <= seed <= source_range_end:
                seed = (seed - source_range_start) + destination_range_start
                break

    results.append(seed)

# Solution is 486613012.
print(min(results))


