import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/manage_ad/data/ad_model.dart';
import 'package:takaful_admin1/features/manage_ad/presnentation/cubit/get_ad_cubit/get_ad_state.dart';

class GetAdCubit extends Cubit<GetAdState> {
  GetAdCubit() : super(GetAdInitialState());
  CollectionReference ad = FirebaseFirestore.instance.collection('ad');

  void getAds() {
    emit(GetAdLodingState());

    ad.orderBy('createAt').snapshots().listen((event) {
      List<AdModel> adList = [];
      for (var element in event.docs) {
        adList.add(AdModel.fromJson(element));
      }

      emit(GetAdSuccessState(adList));
    });
  }
}
