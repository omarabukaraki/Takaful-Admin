class UserModel {
  String id;
  String name;
  String email;
  String mobileNumber;
  String image;
  String userToken;

  UserModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.email,
      required this.mobileNumber,
      required this.userToken});

  factory UserModel.fromJson(data) {
    return UserModel(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        image: data['image'],
        mobileNumber: data['mobileNumber'],
        userToken: data['userToken']);
  }
}
