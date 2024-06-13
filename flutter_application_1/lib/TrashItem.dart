// trash_item.dart
class TrashItem {
  final String name;
  final String sortingType;
  final String? imageUrl;
  final String? tips;

  TrashItem({
    required this.name,
    required this.sortingType,
    this.imageUrl,
    this.tips,
  });
}
