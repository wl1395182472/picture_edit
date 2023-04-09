class Trend {
  final int userId;
  final String userName;
  final String text;
  final List<String> imageUrlList;
  final bool canEdit;

  Trend({
    required this.userId,
    required this.userName,
    required this.text,
    required this.imageUrlList,
    this.canEdit = false,
  });
}
