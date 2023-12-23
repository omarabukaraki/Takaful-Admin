class AccVerificationModel {
  String image;
  String userEmail;
  AccVerificationModel({required this.image, required this.userEmail});

  factory AccVerificationModel.fromJson(jsonData) {
    return AccVerificationModel(
        image: jsonData['image'], userEmail: jsonData['userEmail']);
  }
}
