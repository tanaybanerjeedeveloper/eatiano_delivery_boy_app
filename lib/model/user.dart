class User {
  final String imagePath;
  final String name;
  final String address;
  final String aadharNumber;
  final String phoneNumber;
  final String country;

  const User({
    required this.aadharNumber,
    required this.address,
    required this.country,
    required this.imagePath,
    required this.name,
    required this.phoneNumber,
  });

  User copy({
    String? aadharNumber,
    String? address,
    String? country,
    String? imagePath,
    String? name,
    String? phoneNumber,
  }) =>
      User(
          aadharNumber: aadharNumber ?? this.aadharNumber,
          address: address ?? this.address,
          country: country ?? this.country,
          imagePath: imagePath ?? this.imagePath,
          name: name ?? this.name,
          phoneNumber: phoneNumber ?? this.phoneNumber);

  static User fromJson(Map<String, dynamic> json) => User(
      aadharNumber: json['aadharNumber'],
      address: json['address'],
      country: json['country'],
      imagePath: json['imagePath'],
      name: json['name'],
      phoneNumber: json['phoneNumber']);

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'aadharNumber': aadharNumber,
        'address': address,
        'country': country,
        'phoneNumber': phoneNumber,
      };
}
