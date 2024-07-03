class SignUpRequest {
  late String name;
  late String phone;
  late String email;

  SignUpRequest({
    required this.name,
    required this.phone,
    required this.email,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
