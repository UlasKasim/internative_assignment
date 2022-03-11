import 'dart:convert';

class Category {
  String? id;
  String? image;
  String? title;
  Category({
    this.id,
    this.image,
    this.title,
  }) {
    id ??= "";
    image ??= "";
    title ??= "";
  }

  Category copyWith({
    String? id,
    String? image,
    String? title,
  }) {
    return Category(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Image': image,
      'Title': title,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['Id'],
      image: map['Image'],
      title: map['Title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, image: $image, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.id == id && other.image == image && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ title.hashCode;
}
