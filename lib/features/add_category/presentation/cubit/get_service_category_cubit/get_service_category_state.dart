import 'package:takaful_admin1/features/add_category/data/category_model.dart';

abstract class GetServiceCategoryState {}

final class GetServiceCategoryInitialState extends GetServiceCategoryState {}

final class GetServiceCategoryLodingState extends GetServiceCategoryState {}

final class GetServiceCategorySeccState extends GetServiceCategoryState {
  List<CategoryModel> categoryList = [];
  List<String> serviceCategoryIdList = [];
  GetServiceCategorySeccState(this.categoryList, this.serviceCategoryIdList);
}

final class GetServiceCategoryFaliuerState extends GetServiceCategoryState {}
