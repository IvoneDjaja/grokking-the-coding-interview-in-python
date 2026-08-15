def handOfStraights(hand, groupSize):
    counter = Counter(hand)
    for num in hand:
        startNum = num
        while counter[startNum - 1] > 0:
            startNum -= 1
        while startNum <= num:
            count = counter[startNum]
            if count > 0:
                for i in range(groupSize):
                    target = startNum + i
                    if counter[target] < count:
                        return False
                    counter[target] -= count
            startNum += 1
    return True