class Melding {
  final DateTime time;
  final String title;
  final String content;
  final String author;
  final String? image;

  Melding(
      {required this.time,
      required this.title,
      required this.content,
      required this.author,
      this.image});
}
