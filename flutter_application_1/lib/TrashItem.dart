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

// Konverterer TrashItem til et Firestore-dokument
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'sortingType': sortingType,
      'imageUrl': imageUrl,
      'tips': tips,
    };
  }
  // Opretter en TrashItem fra et Firestore-dokument
  factory TrashItem.fromFirestore(Map<String, dynamic> doc) {
    return TrashItem(
      name: doc['name'],
      sortingType: doc['sortingType'],
      imageUrl: doc['imageUrl'],
      tips: doc['tips'],
    );
  }
}