import 'package:takaful_admin1/features/add_category/data/category_model.dart';

abstract class GetItemCategoryState {}

final class GetItemCategoryInitialState extends GetItemCategoryState {}

final class GetItemCategoryLodingState extends GetItemCategoryState {}

final class GetItemCategorySeccState extends GetItemCategoryState {
  List<CategoryModel> categoryList = [];

  GetItemCategorySeccState(this.categoryList);
}

final class GetItemCategoryFaliuerState extends GetItemCategoryState {}
