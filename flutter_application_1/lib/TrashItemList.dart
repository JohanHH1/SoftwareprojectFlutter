// trash_item_list.dart
import 'TrashItem.dart';

final List<TrashItem> allItems = [
  TrashItem(
    name: 'Pizzabakke',
    sortingType: 'Restaffald',
    imageUrl: 'https://example.com/plastic_bottle.jpg',
    tips: 'Smid eventuele madreesterne i kompost.',
  ),
  TrashItem(
    name: 'Frugt',
    sortingType: 'Kompost',
    imageUrl: 'https://example.com/banana_peel.jpg',
    tips: 'kan bruges som kompost eller gødning',
  ),
  // Tilføj flere TrashItems her
];
