import 'dart:convert';

class Blog {
  String? id;
  String? title;
  String? content;
  String? image;
  String? categoryId;

  Blog({
    this.id,
    this.title,
    this.content,
    this.image,
    this.categoryId,
  }) {
    id ??= "";
    title ??= "";
    content ??= "";
    image ??= "";
    categoryId ??= "";
  }

  Blog copyWith({
    String? id,
    String? title,
    String? content,
    String? image,
    String? categoryId,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Td': id,
      'Title': title,
      'Content': content,
      'Image': image,
      'CategoryId': categoryId,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['Id'],
      title: map['Title'],
      content: map['Content'],
      image: map['Image'],
      categoryId: map['CategoryId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Blog(id: $id, title: $title, content: $content, image: $image, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Blog &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.image == image &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ content.hashCode ^ image.hashCode ^ categoryId.hashCode;
  }
}
