def guess(word: str, secret: str) -> int:
    count = 0
    for i in range(len(word)):
        if word[i] == secret[i]:
            count += 1
    return count

def findSecretWord(secret: str, words: list[str], allowedGuesses: int) -> None:
    guessCount = 0
    candidates = list(words)

    while candidates:
        if guessCount > allowedGuesses:
            break
        min_max_group_size = float('inf')
        best_guess = candidates[0]
        for word in candidates:
            k_list = 7 * [0]
            for other in candidates:
                if word == other:
                    continue
                k = guess(word, other)
                k_list[k] += 1
            max_k = max(k_list)
            if max_k < min_max_group_size:
                min_max_group_size  = max_k
                best_guess = word
        count = guess(best_guess, secret)
        guessCount += 1
        if count == 6:
           print('You guessed the secret word correctly.')
           return
        newCandidates = []
        for word in candidates:
            if word == best_guess:
                continue
            k = guess(best_guess, word)
            if k == count:
                newCandidates.append(word)
        candidates = newCandidates
    print('Either you took too many guesses, or you did not find the secret word')

# CASE 1
secret1 = "acckzz"
words1 = ["acckzz","ccbazz","eiowzz","abcczz"]
allowedGuesses1 = 2
findSecretWord(secret1, words1, allowedGuesses1)

# CASE 2
secret2 = "castle"
words2 = ["battle", "beetle", "bottle", "cackle", "castle", "cattle", "hustle", "jungle", "little", "settle"]
allowedGuesses2 = 10
findSecretWord(secret2, words2, allowedGuesses2)

# CASE 3
secret3 = "hbaczn"
words3 = ["gaxckt","trlccr","jxwhkz","ycbfps","peayuf","yiejjw","ldzccp","nqsjoa","qrjasy","pcldos","acrtag","buyeia","ubmtpj","drtclz","zqderp","snywek","caoztp","ibpghw","evtkhl","bhpfla","ymqhxk","qkvipb","tvmued","rvbass","axeasm","qolsjg","roswcb","vdjgxx","bugbyv","zipjpc","tamszl","osdifo","dvxlxm","iwmyfb","wmnwhe","hslnop","nkrfwn","puvgve","rqsqpq","jwoswl","tittgf","evqsqe","aishiv","pmwovj","sorbte","hbaczn","coifed","hrctvp","vkytbw","dizcxz","arabol","uywurk","ppywdo","resfls","tmoliy","etriev","oanvlx","wcsnzy","loufkw","onnwcy","novblw","mtxgwe","rgrdbt","ckolob","kxnflb","phonmg","egcdab","cykndr","lkzobv","ifwmwp","jqmbib","mypnvf","lnrgnj","clijwa","kiioqr","syzebr","rqsmhg","sczjmz","hsdjfp","mjcgvm","ajotcx","olgnfv","mjyjxj","wzgbmg","lpcnbj","yjjlwn","blrogv","bdplzs","oxblph","twejel","rupapy","euwrrz","apiqzu","ydcroj","ldvzgq","zailgu","xgqpsr","wxdyho","alrplq","brklfk"]
allowedGuesses3 = 10
findSecretWord(secret3, words3, allowedGuesses3)

# CASE 4
secret4 = "ccoyyo"
words4 = ["wichbx","oahwep","tpulot","eqznzs","vvmplb","eywinm","dqefpt","kmjmxr","ihkovg","trbzyb","xqulhc","bcsbfw","rwzslk","abpjhw","mpubps","viyzbc","kodlta","ckfzjh","phuepp","rokoro","nxcwmo","awvqlr","uooeon","hhfuzz","sajxgr","oxgaix","fnugyu","lkxwru","mhtrvb","xxonmg","tqxlbr","euxtzg","tjwvad","uslult","rtjosi","hsygda","vyuica","mbnagm","uinqur","pikenp","szgupv","qpxmsw","vunxdn","jahhfn","kmbeok","biywow","yvgwho","hwzodo","loffxk","xavzqd","vwzpfe","uairjw","itufkt","kaklud","jjinfa","kqbttl","zocgux","ucwjig","meesxb","uysfyc","kdfvtw","vizxrv","rpbdjh","wynohw","lhqxvx","kaadty","dxxwut","vjtskm","yrdswc","byzjxm","jeomdc","saevda","himevi","ydltnu","wrrpoc","khuopg","ooxarg","vcvfry","thaawc","bssybb","ccoyyo","ajcwbj","arwfnl","nafmtm","xoaumd","vbejda","kaefne","swcrkh","reeyhj","vmcwaf","chxitv","qkwjna","vklpkp","xfnayl","ktgmfn","xrmzzm","fgtuki","zcffuv","srxuus","pydgmq"]
allowedGuesses4 = 10
findSecretWord(secret4, words4, allowedGuesses4)