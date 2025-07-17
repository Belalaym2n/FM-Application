class OwnerModel {
  final String name;
  final bool isValid;
  final String gmail;
  final String password;
  final String address;
    String userID;

  OwnerModel({
    required this.name,
    this.isValid = false,
    required this.gmail,
    required this.password,
    required this.userID,
    required this.address,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      name: json['owner_name'] ?? '',
      userID: json['userID'] ?? '',
      isValid: json['valid'] ?? false,
      gmail: json['email_address'] ?? '',
      address: json['owner_Address'] ?? '',
      password: '',
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'owner_name': name,
      'userID': userID,
      'valid': isValid,
      'email_address': gmail,
      'owner_Address': address,
    };

}

}