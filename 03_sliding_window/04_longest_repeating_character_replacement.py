def longest_repeating_character_replacement(s, k):
	char_map = {}
	start = 0
	max_length = 0
	n = len(s)
	start = 0
	for i in range(n):
		char = s[i]
		count = char_map.get(char, 0)
		char_map[char] = count + 1
		while s[start] != s[i] and i - start > k:
			char_map[s[start]] -= 1
			start += 1
		max_length = max(max_length, i + 1 - start)
	return max_length

input1 = 'ABBBCD'
k1 = 3
print(longest_repeating_character_replacement(input1, 3))
