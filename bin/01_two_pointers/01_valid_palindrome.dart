void main() {
  bool isPalindrome(String string) {
    var left = 0;
    var right = string.length - 1;

    while (left < right) {
      while (left < right && !RegExp(r'[a-zA-Z]').hasMatch(string[left])) {
        left += 1;
      }
      while (left < right && !RegExp(r'[a-zA-Z]').hasMatch(string[right])) {
        right -= 1;
      }
      if (string[left].toLowerCase() != string[right].toLowerCase()) {
        return false;
      }
      left += 1;
      right -= 1;
    }
    return true;
  }

  // CASE 1
  final string1 = 'Madam, in Eden, Im Adam';
  print(isPalindrome(string1));

  final string2 = 'Able was I, I saw Elba';
  print(isPalindrome(string2));

  final string3 = 'OP';
  print(isPalindrome(string3));

  final string4 = '@#\$%^&*';
  print(isPalindrome(string4));

  final string5 = 'A Santa at NASA';
  print(isPalindrome(string5));

  final string6 = 'race a car';
  print(isPalindrome(string6));

  final string7 = '123abccba321';
  print(isPalindrome(string7));
}
