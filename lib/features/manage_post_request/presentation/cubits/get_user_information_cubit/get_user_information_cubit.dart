import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ban_user/data/user_model.dart';
import 'get_user_information_state.dart';

class GetUserInformationCubit extends Cubit<GetUserInformationState> {
  GetUserInformationCubit() : super(GetUserInformationInitial());

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void getUserInformationByEmail({required String email}) async {
    emit(GetUserInformationLoading());
    try {
      users.snapshots().listen((event) {
        UserModel user;
        for (var doc in event.docs) {
          if (doc['email'] == email) {
            user = UserModel.fromJson(doc);
            emit(GetUserInformationSuccess(user: user));
          }
        }
      });
    } catch (e) {
      emit(GetUserInformationFailure());
    }
  }
}
