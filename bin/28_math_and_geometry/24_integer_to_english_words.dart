void main() {
  final lessThanTwentyMap = <int, String>{
    1: 'One',
    2: 'Two',
    3: 'Three',
    4: 'Four',
    5: 'Five',
    6: 'Six',
    7: 'Seven',
    8: 'Eight',
    9: 'Nine',
    10: 'Ten',
    11: 'Eleven',
    12: 'Twelve',
    13: 'Thirteen',
    14: 'Fourteen',
    15: 'Fifteen',
    16: 'Sixteen',
    17: 'Seventeen',
    18: 'Eighteen',
    19: 'Nineteen',
  };

  final tenMultiplesMap = <int, String>{
    2: 'Twenty',
    3: 'Thirty',
    4: 'Torty',
    5: 'Fifty',
    6: 'Sixty',
    7: 'Seventy',
    8: 'Eighty',
    9: 'Ninety',
  };

  final thousandMultiplesMap = <int, String>{
    1: 'Thousand',
    2: 'Million',
    3: 'Billion',
  };
  String numberToWords(int num) {
    var current = num;

    List<String> processLessThanThousand(int num) {
      var current = num;
      final chunk = <String>[];
      if (current == 0) {
        return [];
      } else if (current < 20) {
        chunk.add(lessThanTwentyMap[current]!);
      } else if (current < 100) {
        final quotient = current ~/ 10;
        chunk.add(tenMultiplesMap[quotient]!);
        final remainder = current % 10;
        chunk.addAll(processLessThanThousand(remainder));
      } else if (current < 1000) {
        final quotient = current ~/ 100;
        chunk.add('${lessThanTwentyMap[quotient]!} Hundred');
        final remainder = current % 100;
        chunk.addAll(processLessThanThousand(remainder));
      }
      return chunk;
    }

    if (current == 0) {
      return 'Zero';
    }

    // 2147483647
    var i = 0;
    final output = <String>[];
    while (current > 0) {
      final remainder = current % 1000;

      if (remainder > 0) {
        final words = processLessThanThousand(remainder);
        if (i > 0) {
          words.add(thousandMultiplesMap[i]!);
        }
        output.insert(0, words.join(' '));
      }
      current ~/= 1000;
      i += 1;
    }

    return output.join(' ');
  }

  /// CASE 1
  // print(numberToWords(5));
  // print(numberToWords(15));
  // print(numberToWords(20));
  // print(numberToWords(25));
  // print(numberToWords(30));
  // print(numberToWords(35));
  // print(numberToWords(90));
  // print(numberToWords(95));
  // print(numberToWords(100));
  // print(numberToWords(105));
  // print(numberToWords(115));
  // print(numberToWords(120));
  // print(numberToWords(199));
  // print(numberToWords(999));
  print(numberToWords(1000));
  print(numberToWords(1999));
  print(numberToWords(10999));
  print(numberToWords(100999));
  print(numberToWords(199999));
  print(numberToWords(1999999));
  print(numberToWords(19999999));
  print(numberToWords(199999999));
  print(numberToWords(1999999999));
}
