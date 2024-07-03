class Restaurant {
  late final String restaurantId;
  late final String name;
  late final String address;
  late final Coordinates coordinates;
  late final String description;
  late final String image;
  late final double rating;
  late final List<Reviews> reviews;

  Restaurant(
      {required this.restaurantId,
      required this.name,
      required this.address,
      required this.coordinates,
      required this.description,
      required this.image,
      required this.rating,
      required this.reviews});

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    name = json['name'];
    address = json['address'];
    coordinates = (json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null)!;
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurantId'] = restaurantId;
    data['name'] = name;
    data['address'] = address;
    data['coordinates'] = coordinates.toJson();
    data['description'] = description;
    data['image'] = image;
    data['rating'] = rating;
    data['reviews'] = reviews.map((v) => v.toJson()).toList();
    return data;
  }
}

class Coordinates {
  late final double latitude;
  late final double longitude;

  Coordinates({required this.latitude, required this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Reviews {
  late final String userId;
  late final String reviewText;
  late final int rating;

  Reviews(
      {required this.userId, required this.reviewText, required this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    reviewText = json['reviewText'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['reviewText'] = reviewText;
    data['rating'] = rating;
    return data;
  }
}
