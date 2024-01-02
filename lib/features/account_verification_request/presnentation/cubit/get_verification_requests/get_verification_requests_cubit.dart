import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/account_verification_request/data/acc_verificatoin_model.dart';

part 'get_verification_requests_state.dart';

class GetVerificationRequestsCubit extends Cubit<GetVerificationRequestsState> {
  GetVerificationRequestsCubit() : super(GetVerificationRequestsInitial());

  CollectionReference verificationRequests =
      FirebaseFirestore.instance.collection('verification requests');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void getVerificationRequests() {
    emit(GetVerificationRequestsLoading());
    try {
      verificationRequests.snapshots().listen((event) {
        List<AccVerificationModel> verificationRequests = [];
        List<String> docsId = [];
        for (var doc in event.docs) {
          verificationRequests.add(AccVerificationModel.fromJson(doc));
          docsId.add(doc.id);
        }
        emit(GetVerificationRequestsSuccess(
            verificationRequests: verificationRequests, docsId: docsId));
      });
    } catch (e) {
      emit(GetVerificationRequestsFailure());
    }
  }
  //   void getUsersBySearch({required String searchValue}) {
  //   emit(GetUsersLoading());
  //   try {
  //     users
  //         .orderBy('name')
  //         .startAt([searchValue])
  //         .endAt(["$searchValue\uf8ff"])
  //         .snapshots()
  //         .listen((event) {
  //           List<UserModel> usersList = [];
  //           for (var doc in event.docs) {
  //             usersList.add(UserModel.fromJson(doc));
  //           }
  //           emit(GetUsersSuccess(users: usersList));
  //         });
  //   } catch (e) {
  //     emit(GetUsersFailure());
  //   }
  // }
}
