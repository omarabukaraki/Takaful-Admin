import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/manage_ad/data/ad_model.dart';
import 'package:takaful_admin1/features/manage_ad/presnentation/cubit/get_ad_cubit/get_ad_state.dart';

class GetAdCubit extends Cubit<GetAdState> {
  GetAdCubit() : super(GetAdInitialState());
  CollectionReference ad = FirebaseFirestore.instance.collection('ad');

  void getAds() {
    emit(GetAdLodingState());

    try {
      ad.orderBy('createAt').snapshots().listen((event) {
        List<AdModel> adList = [];
        List<String> adIdList = [];
        for (var element in event.docs) {
          adList.add(AdModel.fromJson(element));
          adIdList.add(element.id);
        }

        emit(
          GetAdSuccessState(
            adList: adList,
            adIdList: adIdList,
          ),
        );
      });
    } catch (e) {
      emit(GetAdFailureState());
    }
  }

  Future<void> deleteAd({required String adId}) async {
    try {
      await ad.doc(adId).delete();
    } catch (e) {
      e.toString();
    }
  }
}
