import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'manage_post_state.dart';

class ManagePostCubit extends Cubit<ManagePostState> {
  ManagePostCubit() : super(ManagePostInitial());
  CollectionReference posts =
      FirebaseFirestore.instance.collection('donations');

  Future<void> acceptPost({
    required String postId,
    required bool postState,
  }) async {
    try {
      await posts.doc(postId).update({'postState': postState});
    } catch (e) {
      // emit(t);
    }
  }

  Future<void> rejectPost({required String postId}) async {
    try {
      await posts.doc(postId).delete();
    } catch (e) {
      // emit(t);
    }
  }
}
