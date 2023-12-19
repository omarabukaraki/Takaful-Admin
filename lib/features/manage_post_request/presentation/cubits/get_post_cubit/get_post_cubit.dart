import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/manage_post_request/data/post_model.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_post_cubit/get_post_state.dart';

class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit() : super(GetPostInitial());
  CollectionReference posts =
      FirebaseFirestore.instance.collection('donations');
  void getPost() {
    emit(GetPostLodingState());
    try {
      posts.snapshots().listen((event) {
        List<PostModel> postsList = [];
        for (var element in event.docs) {
          postsList.add(PostModel.fromJson(element));
        }
        emit(GetPostSuccessState(posts: postsList));
      });
    } catch (e) {
      emit(GetPostFailureState());
    }
  }
}
