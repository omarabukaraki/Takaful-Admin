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
        List<UserModel> usersList = [];
        for (var doc in event.docs) {
          usersList.add(UserModel.fromJson(doc));
        }
        emit(GetUsersSuccess(users: usersList));
      });
    } catch (e) {
      emit(GetUsersFailure());
    }
  }

  void getUsersBySearch({required String searchValue}) {
    emit(GetUsersLoading());
    try {
      users
          .orderBy('name')
          .startAt([searchValue])
          .endAt(["$searchValue\uf8ff"])
          .snapshots()
          .listen((event) {
            List<UserModel> usersList = [];
            for (var doc in event.docs) {
              usersList.add(UserModel.fromJson(doc));
            }
            emit(GetUsersSuccess(users: usersList));
          });
    } catch (e) {
      emit(GetUsersFailure());
    }
  }
}
