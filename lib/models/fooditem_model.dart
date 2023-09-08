class FoodItem {
  int? id;
  final String type;
  final String category;
  final String name;

  FoodItem(
      {this.id,
      required this.type,
      required this.category,
      required this.name});

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
      id: json['id'],
      type: json['type'],
      category: json['category'],
      name: json['name']);

  FoodItem copyWith({int? id, String? type, String? category, String? name}) {
    return FoodItem(
        id: id ?? this.id,
        type: type ?? this.type,
        category: category ?? this.category,
        name: name ?? this.name);
  }
}
