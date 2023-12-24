// ignore_for_file: public_member_api_docs, sort_constructors_first
class AdModel {
  String? image;
  String? createAt;

  AdModel({this.image, this.createAt});

  factory AdModel.fromJson(jsonData) {
    return AdModel(
      image: jsonData['image'],
      createAt: jsonData['createAt'],
    );
  }
}
