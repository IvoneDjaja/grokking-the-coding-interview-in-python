def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
    output = []

    candidates.sort()

    def backtrack(start, combination, total):
        if total > target:
            return
        if total == target:
            output.append(combination.copy())
            return
            
        for i in range(start, len(candidates)):
            if i > start and candidates[i-1] == candidates[i]:
                continue
            num = candidates[i]
            combination.append(num)
            backtrack(i + 1, combination, total + num)
            combination.pop()

    backtrack(0, [], 0)
    return output