import 'package:intl/intl.dart';

final currencyFormat = NumberFormat("#,##0.00", "en_US");

extension CustomStringExtension on String {
  toTitleCase() {
    final words = toLowerCase().split(' ');
    var newWord = '';
    for (var word in words) {
      word.isNotEmpty
          ? newWord += '${word[0].toUpperCase()}${word.substring(1)} '
          : null;
    }

    return newWord;
  }

  String getInitials3([int limitTo = 2]) {
    if (isEmpty) {
      return '';
    }

    var buffer = StringBuffer();
    var split = this.split(' ');

    //For one word
    if (split.length == 1) {
      return substring(0, 1);
    }

    for (var i = 0; i < (limitTo); i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }

  getInitials2() {
    var s = isNotEmpty
        ? trim().split(' ').map((l) => l[0]).take(2).join()
        : 'ST';
    return s;
  }

  getInitials() {
    if (isNotEmpty) {
      List<String> names = trim().split(" ");

      String initials = "";
      int numWords = names.length;

      if (numWords < names.length) {
        numWords = names.length;
      }
      for (var i = 0; i < numWords; i++) {
        initials += names[i][0];
      }
      return '${initials[0].toUpperCase()}${initials[initials.length - 1].toUpperCase()}';
    } else {
      return 'ST';
    }
  }

  getSingleInitial() {
    return split('')[0].toUpperCase();
  }

  sanitizeToDouble() {
    return double.tryParse(replaceAll(",", ""));
  }
}

extension CustomDoubleExtension on double {
  formatCurrency({String? currencySymbol = 'NGN'}) {
    return "${currencySymbol ?? ""}$this";
  }
}

extension CustomIntExtension on int {
  formatCurrency({String? currencySymbol = 'NGN'}) {
    toDouble();
    return "${currencySymbol ?? ""}$this";
  }
}

extension CustomCurrencyStringExtension on String {
  formatCurrency({String? currencySymbol = 'NGN'}) {
    return "${currencySymbol ?? ""}$this";
  }
}

formatNumber({required String number}) {
  String numb = num.parse(number).toDouble().toStringAsFixed(2);
  var f = NumberFormat("###,###.00#", "en_US");
  return f.format(double.parse(numb));
}

formatNumberNoZero({required String number}) {
  String numb = num.parse(number).toInt().toString();
  var f = NumberFormat("###,###", "en_US");
  return f.format(int.parse(numb));
}

/*String formatKorM({required String number}) {
  number = number.split(".").first;
  String formatted = "";
  if (int.parse(number).isLowerThan(9999)) {
    formatted = "${formatNumber(number: number)}";
  } else {
    if (int.parse(number).isLowerThan(999999) ) {
      formatted = "${(num.parse(number)/1000).toStringAsFixed(2)}K";
    } else {
      if (int.parse(number).isLowerThan(999999999)) {
        formatted = "${(num.parse(number)/1000000).toStringAsFixed(2)}M";
      } else{
        if (int.parse(number).isLowerThan(99999999999)) {
          formatted = "${(num.parse(number)/100000000).toStringAsFixed(2)}B";
        }
      }
    }
  }
  return formatted;
}*/

formatPercentage({required String number}) {
  var split = number.split(".");
  String formatted = "${split.first}%";
  return formatted;
}

formatPercentageNonWhole({required String number}) {
  String formatted = "$number%";
  return formatted;
}

String milliSecondDateFormat({required int data}) {
  return DateTime.fromMillisecondsSinceEpoch(data * 1000)
      .toString()
      .split(" ")[0];
}

formatDate({String? date}) {
  final dateData = date != null && date.isNotEmpty
      ? DateFormat.yMMMMd('en_US').format(DateTime.parse(date.split('T')[0]))
      : '';
  return dateData;
}

formatDay(DateTime date) {
  // Format the date using the desired pattern
  return DateFormat('EEE, MMM d').format(date);
}

stringDate({DateTime? date}) {
  String? formatter;
  if (date != null) {
    // formatter =  DateFormat('yyyy-MM-dd');
    formatter =  DateFormat.yMMMd().format(date.add(const Duration(hours: 1)));
  }
  return formatter;
}

stringTime({DateTime? date}) {
  String? formatter;
  if (date != null) {
    // formatter =  DateFormat('yyyy-MM-dd');
    formatter =  DateFormat.jm().format(date.add(const Duration(hours: 1)));
  }
  return formatter;
}

dateString({required String date}) {
  var data = DateTime.parse(date);
  return data;
}

String daySuffix(int day){
  String stringDate = day.toString().split("").last;
  String d = "";
  if (stringDate == "1" && day != 11) {
    d = "st";
  }  else if (stringDate == "2" && day != 12) {
    d = "nd";
  } else if (stringDate == "3" && day != 13) {
    d = "rd";
  } else {
    d = "th";
  }
  return d;
}
