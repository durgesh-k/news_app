import 'package:flutter/material.dart';

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

String timeAgo(String timestamp) {
  try {
    final newsTime = DateTime.parse(timestamp);
    final currentTime = DateTime.now().toUtc();
    final timeDifference = currentTime.difference(newsTime);

    if (timeDifference.inDays >= 365) {
      final yearsAgo = (timeDifference.inDays / 365).floor();
      return '$yearsAgo year${yearsAgo != 1 ? 's' : ''} ago';
    } else if (timeDifference.inDays >= 30) {
      final monthsAgo = (timeDifference.inDays / 30).floor();
      return '$monthsAgo month${monthsAgo != 1 ? 's' : ''} ago';
    } else if (timeDifference.inDays >= 1) {
      final daysAgo = timeDifference.inDays;
      return '$daysAgo day${daysAgo != 1 ? 's' : ''} ago';
    } else if (timeDifference.inHours >= 1) {
      final hoursAgo = timeDifference.inHours;
      return '$hoursAgo hour${hoursAgo != 1 ? 's' : ''} ago';
    } else if (timeDifference.inMinutes >= 1) {
      final minutesAgo = timeDifference.inMinutes;
      return '$minutesAgo minute${minutesAgo != 1 ? 's' : ''} ago';
    } else {
      return 'a moment ago';
    }
  } catch (e) {
    return 'Invalid timestamp format. Please provide a timestamp in the format "YYYY-MM-DDTHH:MM:SSZ".';
  }
}

String getFirstTwoInitials(String input) {
  if (input == null || input.isEmpty) return '     ';

  final words = input.split(' ');
  final initials = words
      .map((word) => word.isNotEmpty ? word[0].toUpperCase() : '')
      .where((initial) => initial.isNotEmpty)
      .take(2)
      .join('');

  if (initials.length == 1) return ' ${initials[0]} ';

  return initials;
}
