extension StringExtension on String? {
  bool get isValidEmail {
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return this != null ? emailRegExp.hasMatch(this!) : false;
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return this != null ? nameRegExp.hasMatch(this!) : false;
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return this != null ? passwordRegExp.hasMatch(this!) : false;
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isNotNullOrEmpty {
    return this != null && this!.isNotEmpty;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^[0-9]{10}$");
    return this != null ? phoneRegExp.hasMatch(this!) : false;
  }

  String formatJoinedText() {
    final formattedText = this != null
        ? this!
            .split('_')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ')
        : '';

    return formattedText;
  }
}

extension CustomDateTimeFormat on DateTime {
  String formatDay() {
    return day.toString();
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));

    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }
}
