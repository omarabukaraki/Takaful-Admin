import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/add_category/data/category_model.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_service_category_cubit/get_service_category_state.dart';

class GetServiceCategoryCubit extends Cubit<GetServiceCategoryState> {
  GetServiceCategoryCubit() : super(GetServiceCategoryInitialState());

  CollectionReference serviceCategory =
      FirebaseFirestore.instance.collection('service category');

  void getServiceCategories() {
    emit(GetServiceCategoryLodingState());

    serviceCategory.orderBy('createAt').snapshots().listen((event) {
      List<CategoryModel> categoryList = [];
      for (var element in event.docs) {
        categoryList.add(CategoryModel.fromJson(element));
      }
      categoryList.add(CategoryModel());
      emit(GetServiceCategorySeccState(categoryList));
    });
    // FirebaseFirestore.instance
    //     .collection('service category')
    //     .orderBy('createAt')
    //     .get()
    //     .then((value) {
    //   for (var element in value.docs) {
    //     categoryList.add(CategoryModel.fromJson(element.data()));
    //   }
    //   categoryList.add(CategoryModel());
    //   emit(GetServiceCategorySeccState(categoryList));
    // }).catchError((onError) {
    //   emit(GetServiceCategoryFaliuerState());
    // });
  }
}
