class ChoiceChipsItemData {
  final String title;
  bool isSelected;
  final bool isEnabled;
  final Object? value;

  ChoiceChipsItemData({
    required this.title,
    required this.isSelected,
    required this.isEnabled,
    this.value,
  });
}
