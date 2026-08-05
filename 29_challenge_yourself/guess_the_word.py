def guess(word: str, secret: str, words: list[str]) -> int:
    count = 0
    for i in range(len(word)):
        if word[i] == secret[i]:
            count += 1
    return count if count !=0 else -1

def findSecretWord(secret: str, words: list[str], allowedGuesses: int) -> None:
    guessCount = 0
    for word in words:
       if guessCount > allowedGuesses:
           break
       count = guess(word, secret, words)
       guessCount += 1
       print(count)
       if count == 6:
           print('You guessed the secret word correctly.')
           return
    print('Either you took too many guesses, or you did not find the secret word')

# CASE 1
secret1 = "acckzz"
words1 = ["acckzz","ccbazz","eiowzz","abcczz"]
allowedGuesses1 = 2
findSecretWord(secret1, words1, allowedGuesses1)