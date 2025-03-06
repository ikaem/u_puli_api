// TODO this should be Equatable

class ScrapedEventEntity {
  ScrapedEventEntity({
    required this.title,
    required this.venue,
    required this.date,
    required this.uri,
    required this.imageUri,
  });

  final String title;
  final String venue;
  // this is complete date and time, not only date
  final DateTime date;
  final Uri uri;
  final Uri imageUri;

  // https://www.darttutorial.org/dart-tutorial/dart-object-identity-equality/
  @override
  operator ==(Object other) {
    if (other is! ScrapedEventEntity) return false;
    if (other.date != date) return false;
    if (other.title != title) return false;
    if (other.venue != venue) return false;
    if (other.uri != uri) return false;
    if (other.imageUri != imageUri) return false;

    return true;
  }

  @override
  // TODO: implement hashCode
  // int get hashCode => Object.hash(title, venue, date, uri);
  int get hashCode => Object.hash(title, venue, date, uri, imageUri);
}
