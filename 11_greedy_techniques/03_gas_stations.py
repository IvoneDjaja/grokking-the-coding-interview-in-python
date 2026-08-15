def gasStations(gas, cost):
    if sum(cost) > sum(gas):
        return -1
    n = len(gas)
    total = 0
    startIndex = 0
    for i in range(n):
        total = total + gas[i] - cost[i]
        if  total < 0:
            startIndex += 1
            total = 0
    return startIndex