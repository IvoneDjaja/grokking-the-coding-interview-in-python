def wordSearch(board: List[List[str]], word: str) -> bool:
    m = len(board)
    n = len(board[0])
    visited = set()

    def backtrack(i, j, index):
        if index == len(word):
            return True
        if i < 0 or j < 0 or i >= m or j >= n or board[i][j] != word[index]:
            return False

        visited.add((i, j))
        for ni, nj in [(0,-1), (-1,0), (1,0), (0,1)]:
            if (i + ni, j + nj) not in visited and backtrack(i + ni, j + nj, index + 1):
                return True
        visited.remove((i, j))
        return False

    for i in range(m):
        for j in range(n):
            if backtrack(i, j, 0):
                return True
    return False
