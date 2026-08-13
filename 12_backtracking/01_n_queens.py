def n_queens(n: int):
    board = [['.'] * n for _ in range(n)]
    col_set = set()
    pos_diags = set()
    neg_diags = set()
    output = []
    def backtrack(row):
        if row == n:
            output.append([''.join(board[i]) for i in range(n)])
            return
        for col in range(n):
            if col in col_set or row + col in pos_diags or row - col in neg_diags:
                continue
            board[row][col] = 'Q'
            col_set.add(col)
            pos_diags.add(row + col)
            neg_diags.add(row - col)
            backtrack(row + 1)
            board[row][col] = '.'
            col_set.remove(col)
            pos_diags.remove(row + col)
            neg_diags.remove(row - col)
    	
    backtrack(0)
    return output