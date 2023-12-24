import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/manage_ad/presnentation/cubit/add_ad_cubit/add_ad_state.dart';

class AddAdCubit extends Cubit<AddAdState> {
  AddAdCubit() : super(AddAdInitialState());

  CollectionReference ad = FirebaseFirestore.instance.collection('ad');
  Future<void> addAd({required String image}) async {
    emit(AddAdLodingState());
    try {
      await ad.add({
        'image': image,
        'createAt': DateTime.now().toString(),
      });
      emit(AddAdSuccessState());
    } catch (e) {
      emit(AddAdFailurState());
    }
  }
}
