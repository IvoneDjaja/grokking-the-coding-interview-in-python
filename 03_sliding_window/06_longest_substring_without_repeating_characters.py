def find_longest_substring(input_str):
   letter_map = {}
   start = 0
   max_length = 0
   for i in range(len(input_str)):
      letter = input_str[i]
      if letter not in letter_map:
         letter_map[letter] = 0
      letter_map[letter] += 1
      while letter_map[letter] > 1:
         letter_map[input_str[start]] -= 1
         start += 1
      max_length= max(max_length, i + 1 - start)
   return max_length

input1 = 'pwwkew'
print(find_longest_substring(input1))