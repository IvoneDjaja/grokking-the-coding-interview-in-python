def letterCombinationsOfAPhoneNumber(digits):
    output = []
    if len(digits) == 0:
        return output
    numCharMap = {
        '2': 'abc',
        '3': 'def',
        '4': 'ghi',
        '5': 'jkl',
        '6': 'mno',
        '7': 'pqrs',
        '8': 'tuv',
        '9': 'wxyz'
    }
    n = len(digits)
    def backtrack(current, index):
        if len(current) == n:
            output.append(''.join(current))
            return
        digit = digits[index]
        for letter in numCharMap[digit]:
            current.append(letter)
            backtrack(current, index + 1)
            current.pop()
        
    backtrack([], 0)
    return output