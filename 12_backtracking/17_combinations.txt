def combine(n, k):
    output = []
    def backtrack(path, start):
        if len(path) == k:
            output.append(path.copy())
            return
        for i in range(start, n):
            path.append(i + 1)
            backtrack(path, i + 1)
            path.pop()
    
    backtrack([], 0)
    return output