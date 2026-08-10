def wordBreak(s: str, wordDict: List[str]) -> bool:
    word_set = set(wordDict)
    n = len(s)
    memo = (n + 1) * [False]
    memo[0] = True
    start = 0
    for i in range(1, n + 1):
        for j in range(i):
            if memo[j] and s[j:i] in word_set:
                memo[i] = True
                break
    return memo[n]