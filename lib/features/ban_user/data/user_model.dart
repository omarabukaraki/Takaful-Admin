class UserModel {
  String id;
  String name;
  String email;
  String mobileNumber;
  String image;
  String userToken;
  int createAt;
  bool isVerified;
  double rating;
  List<dynamic> ratingList;
  int numberOfRatingUsers;

  UserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.userToken,
    required this.createAt,
    required this.isVerified,
    required this.rating,
    required this.ratingList,
    required this.numberOfRatingUsers,
  });

  factory UserModel.fromJson(data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      image: data['image'],
      mobileNumber: data['mobileNumber'],
      userToken: data['userToken'],
      createAt: data['createAt'],
      isVerified: data['isVerified'],
      rating: data['rating'],
      ratingList: data['rating list'],
      numberOfRatingUsers: data['numberOfRatingUsers'],
    );
  }
}
