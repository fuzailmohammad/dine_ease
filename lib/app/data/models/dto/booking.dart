class Booking {
 late final String bookingId;
 late final String userId;
 late final String restaurantId;
 late final Date date;
 late final String time;
 late final int numberOfPeople;
 late final String paymentStatus;

  Booking(
      {
        required this.bookingId,
        required this.userId,
        required this.restaurantId,
        required this.date,
        required this.time,
        required this.numberOfPeople,
        required this.paymentStatus});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    userId = json['userId'];
    restaurantId = json['restaurantId'];
    date = (json['date'] != null ? Date.fromJson(json['date']) : null)!;
    time = json['time'];
    numberOfPeople = json['numberOfPeople'];
    paymentStatus = json['paymentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bookingId'] = bookingId;
    data['userId'] = userId;
    data['restaurantId'] = restaurantId;
    data['date'] = date.toJson();
      data['time'] = time;
    data['numberOfPeople'] = numberOfPeople;
    data['paymentStatus'] = paymentStatus;
    return data;
  }
}

class Date {
 late final int seconds;
 late final int nanoseconds;

  Date({required this.seconds, required this.nanoseconds});

  Date.fromJson(Map<String, dynamic> json) {
    seconds = json['seconds'];
    nanoseconds = json['nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seconds'] = seconds;
    data['nanoseconds'] = nanoseconds;
    return data;
  }
}
