
class Fact {
  final String id;
  final String title;
  final String category;
  final String shortDescription;
  final String fullDescription;
  final String imageUrl;
  bool _isFavorite;

  static List<String> favoriteIds = [];

  Fact({
    required this.id,
    required this.title,
    required this.category,
    required this.shortDescription,
    required this.fullDescription,
    required this.imageUrl,
    bool isFavorite = false,
  }) : _isFavorite = isFavorite {
    if (favoriteIds.contains(id)) {
      _isFavorite = true;
    }
  }

  bool get isFavorite => _isFavorite;

  set isFavorite(bool value) {
    _isFavorite = value;
    if (value) {
      if (!favoriteIds.contains(id)) {
        favoriteIds.add(id);
      }
    } else {
      favoriteIds.remove(id);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'shortDescription': shortDescription,
      'fullDescription': fullDescription,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      shortDescription: json['shortDescription'],
      fullDescription: json['fullDescription'],
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}