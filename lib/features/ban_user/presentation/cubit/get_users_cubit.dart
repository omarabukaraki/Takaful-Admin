import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../data/user_model.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit() : super(GetUsersInitial());

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void getAllUsers() {
    emit(GetUsersLoading());
    try {
      users.snapshots().listen((event) {
        List<UserModel> users = [];
        for (var doc in event.docs) {
          users.add(UserModel.fromJson(doc));
        }
        emit(GetUsersSuccess(users: users));
      });
    } catch (e) {
      emit(GetUsersFailure());
    }
  }
}
