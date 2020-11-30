import 'dart:convert';
import 'dart:typed_data';

class User {
  String Name;
  Uint8List photo;
  String Phone;
  User({
    this.Name,
    this.photo,
    this.Phone,
  });

  User copyWith({
    String Name,
    Uint8List photo,
    String Phone,
  }) {
    return User(
      Name: Name ?? this.Name,
      photo: photo ?? this.photo,
      Phone: Phone ?? this.Phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'photo': photo?.asMap(),
      'Phone': Phone,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'User(Name: $Name, photo: $photo, Phone: $Phone)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.Name == Name && o.photo == photo && o.Phone == Phone;
  }

  @override
  int get hashCode => Name.hashCode ^ photo.hashCode ^ Phone.hashCode;
}
