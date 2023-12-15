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
      for (var element in event.docs) {
        categoryList.add(CategoryModel.fromJson(element));
      }
      categoryList.add(CategoryModel());
      emit(GetItemCategorySeccState(categoryList));
    });

    // FirebaseFirestore.instance
    //     .collection('category')
    //     .orderBy('createAt')
    //     .get()
    //     .then((value) {
    //   for (var element in value.docs) {
    //     categoryList.add(CategoryModel.fromJson(element.data()));
    //   }
    //   categoryList.add(CategoryModel());
    //   emit(GetItemCategorySeccState(categoryList));
    // }).catchError((onError) {
    //   emit(GetItemCategoryFaliuerState());
    // });
  }
}
