class UserResponseAddressModel {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final UserResponseGeoModel geo;

  UserResponseAddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory UserResponseAddressModel.fromJson(Map<String, dynamic> json) {
    return UserResponseAddressModel(
      street: json["street"] ?? '',
      suite: json["suite"] ?? '',
      city: json["city"] ?? '',
      zipcode: json["zipcode"] ?? '',
      geo: UserResponseGeoModel.fromJson(json["geo"]),
    );
  }
}

class UserResponseGeoModel {
  final String? lat;
  final String? lng;

  UserResponseGeoModel({
    required this.lat,
    required this.lng,
  });

  factory UserResponseGeoModel.fromJson(Map<String, dynamic> json) {
    return UserResponseGeoModel(
      lng: json["lng"] ?? '',
      lat: json["lat"] ?? '',
    );
  }
}
