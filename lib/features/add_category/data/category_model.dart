// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String image;
  String title;
  String description;
  CategoryModel({
    required this.image,
    required this.title,
    required this.description,
  });

  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(
        image: jsonData['image'],
        title: jsonData['title'],
        description: jsonData['description']);
  }
}
