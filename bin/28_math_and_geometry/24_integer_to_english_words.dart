void main() {
  String numberToWords(int num) {
    var output = <String>[];
    var current = num;

    final lessThanTwentyMap = <int, String>{
      1: 'one',
      2: 'two',
      3: 'three',
      4: 'four',
      5: 'five',
      6: 'six',
      7: 'seven',
      8: 'eight',
      9: 'nine',
      10: 'ten',
      11: 'eleven',
      12: 'twelve',
      13: 'thirteen',
      14: 'fourteen',
      15: 'fifteen',
      16: 'sixteen',
      17: 'seventeen',
      18: 'eighteen',
      19: 'nineteen',
    };

    final tenMultiplesMap = <int, String>{
      2: 'twenty',
      3: 'thirty',
      4: 'forty',
      5: 'fifty',
      6: 'sixty',
      7: 'seventy',
      8: 'eighty',
      9: 'ninety',
    };

    while (current > 0) {
      // less than 100
      if (current < 20) {
        output.add(lessThanTwentyMap[current]!);
        current -= 20;
      } else if (current < 100) {
        final quotient = current ~/ 10;
        output.add(tenMultiplesMap[quotient]!);
        current %= 10;
      } else if (current < 1000) {
        final quotient = current ~/ 100;
        output.add('${lessThanTwentyMap[quotient]!} hundred');
        current %= 100;
      }
    }

    return output.join(' ');
  }

  /// CASE 1
  print(numberToWords(5));
  print(numberToWords(15));
  print(numberToWords(20));
  print(numberToWords(25));
  print(numberToWords(30));
  print(numberToWords(35));
  print(numberToWords(90));
  print(numberToWords(95));
  print(numberToWords(100));
  print(numberToWords(105));
  print(numberToWords(115));
  print(numberToWords(120));
  print(numberToWords(199));
  print(numberToWords(999));
}
