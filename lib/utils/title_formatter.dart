String formatTitle(String title) {
  final titleList = title.split(' ');
  final first = titleList[0];
  final second = titleList[1].length <= 2 ? titleList[2] : titleList[1];
  return '$first $second';
}
