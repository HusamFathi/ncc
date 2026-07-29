extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String toTitle() {
    if (isEmpty) {
      return this;
    }
    final words = split(' ');
    return words.map((word) => word.capitalizeFirstLetter()).join(' ');
  }
}
