void main() {
  String numberToWords(int num) {
    var output = <String>[];
    var current = num;

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
      1: '',
      1000: 'Thousand',
      1000000: 'Million',
      1000000000: 'Billion',
    };

    String processLessThanThousand(int num) {
      final output = <String>[];
      var current = num;
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

    // 2147483647
    var divisor = 1000000000;
    while (current > 0) {
      final quotient = current ~/ divisor;

      if (quotient > 0) {
        output.add(processLessThanThousand(quotient));
        output.add(thousandMultiplesMap[divisor]!);
      }

      current %= divisor;
      divisor ~/= 1000;
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
