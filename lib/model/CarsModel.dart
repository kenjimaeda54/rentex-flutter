class CarsModel {
  late final int id;
  late final String brand;
  late final String name;
  late final String about;
  late final Rent rent;
  late final String fuelType;
  late final String thumbNail;
  late final List<Accessories> accessories;
  late final List<String> photos;

  CarsModel(
      {required this.accessories,
      required this.id,
      required this.brand,
      required this.name,
      required this.rent,
      required this.fuelType,
      required this.thumbNail,
      required this.about,
      required this.photos});

  factory CarsModel.fromJson(Map<String, dynamic> json) {
    var photosFromJson = json["photos"];
    var acessoriesFromJson = json["accessories"];

    List<String> photosList = photosFromJson.cast<String>();
    List<Accessories> acessoriesList = acessoriesFromJson.cast<Accessories>();

    return CarsModel(
        accessories: acessoriesList,
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        rent: Rent.fromJson(json["rent"]),
        fuelType: json["fuelType"],
        thumbNail: json["thumbNail"],
        about: json["about"],
        photos: photosList);
  }
}

class Rent {
  late final int price;
  late final String period;
  Rent({required this.price, required this.period});

  factory Rent.fromJson(Map<String, dynamic> json) {
    return Rent(price: json["price"], period: json["period"]);
  }
}

class Accessories {
  late final String name;
  late final String type;
  Accessories({required this.type, required this.name});

  factory Accessories.fromJson(Map<String, dynamic> json) {
    return Accessories(
      type: json["type"],
      name: json["name"],
    );
  }
}
