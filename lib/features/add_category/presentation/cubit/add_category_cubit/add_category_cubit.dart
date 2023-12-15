import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/add_category_cubit/add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitialState());

  CollectionReference category =
      FirebaseFirestore.instance.collection('category');
  CollectionReference serviceCategory =
      FirebaseFirestore.instance.collection('service category');
  Future<void> addCategory(
      {required String typeOfCategory,
      required String title,
      required String image}) async {
    if (typeOfCategory == 'category') {
      await category.add({
        'categoryName': title,
        'createAt': DateTime.now().toString(),
        'image': image
      });
    } else {
      await serviceCategory.add({
        'categoryName': title,
        'createAt': DateTime.now().toString(),
        'image': image
      });
    }
  }
}
