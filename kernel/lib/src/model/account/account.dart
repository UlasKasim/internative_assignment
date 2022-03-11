import 'dart:convert';

import 'package:collection/collection.dart';

class Account {
  String? id;
  String? email;
  String? image;
  Location? location;
  List<String>? favoriteBlogIds;

  Account({
    this.id,
    this.email,
    this.image,
    this.location,
    this.favoriteBlogIds,
  }) {
    id ??= "";
    email ??= "";
    image ??= "";
    location ??= Location();
    favoriteBlogIds ??= [];
  }

  Account copyWith({
    String? id,
    String? email,
    String? image,
    Location? location,
    List<String>? favoriteBlogIds,
  }) {
    return Account(
      id: id ?? this.id,
      email: email ?? this.email,
      image: image ?? this.image,
      location: location ?? this.location,
      favoriteBlogIds: favoriteBlogIds ?? this.favoriteBlogIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Email': email,
      'Image': image,
      'Location': location?.toMap(),
      'FavoriteBlogIds': favoriteBlogIds,
    };
  }

  Map<String, dynamic> updateMap() {
    return {
      'Image': image,
      'Location': location?.toMap(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['Id'],
      email: map['Email'],
      image: map['Image'],
      location: map['Location'] != null ? Location.fromMap(map['Location']) : null,
      favoriteBlogIds: List<String>.from(map['FavoriteBlogIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Account(id: $id, email: $email, image: $image, location: $location, favoriteBlogIds: $favoriteBlogIds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Account &&
        other.id == id &&
        other.email == email &&
        other.image == image &&
        other.location == location &&
        listEquals(other.favoriteBlogIds, favoriteBlogIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        image.hashCode ^
        location.hashCode ^
        favoriteBlogIds.hashCode;
  }
}

class Location {
  String? longitude;
  String? latitude;
  Location({
    this.longitude,
    this.latitude,
  }) {
    longitude ??= "";
    latitude ??= "";
  }

  Location copyWith({
    String? longitude,
    String? latitude,
  }) {
    return Location(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Longtitude': longitude, //!(Ulaş Kasım) TYPO in swagger api
      'Latitude': latitude,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      longitude: map['Longtitude'], //!(Ulaş Kasım) TYPO in swagger api
      latitude: map['Latitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source));

  @override
  String toString() => 'Location(longitude: $longitude, latitude: $latitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other.longitude == longitude && other.latitude == latitude;
  }

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}
