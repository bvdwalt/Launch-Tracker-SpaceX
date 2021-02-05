DateTime getUtcDateTimeFromUnix(num dateUnix) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(dateUnix * 1000);
  return dateTime;
}
