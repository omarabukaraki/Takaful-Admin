import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/add_category/data/category_model.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_item_category_cubit/get_item_category_state.dart';

class GetItemCategoryCubit extends Cubit<GetItemCategoryState> {
  GetItemCategoryCubit() : super(GetItemCategoryInitialState());

  CollectionReference itemCategory =
      FirebaseFirestore.instance.collection('category');

  void getItemCategories() {
    emit(GetItemCategoryLodingState());

    itemCategory.orderBy('createAt').snapshots().listen((event) {
      List<CategoryModel> categoryList = [];
      List<String> itemCategoryIdList = [];
      for (var element in event.docs) {
        categoryList.add(CategoryModel.fromJson(element));
        itemCategoryIdList.add(element.id);
      }
      categoryList.add(CategoryModel());
      itemCategoryIdList.add('');
      emit(GetItemCategorySeccState(
        categoryList,
        itemCategoryIdList,
      ));
    });
  }

  Future<void> deleteItemcategory({required String itemCategoryId}) async {
    try {
      await itemCategory.doc(itemCategoryId).delete();
    } catch (e) {
      e.toString();
    }
  }
}
