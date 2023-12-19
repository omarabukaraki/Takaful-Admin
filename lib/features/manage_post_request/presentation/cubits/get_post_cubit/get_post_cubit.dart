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
        List<String> postsId = [];
        for (var element in event.docs) {
          if (element['postState'] == false) {
            postsList.add(PostModel.fromJson(element));
            postsId.add(element.id);
          }
        }
        emit(GetPostSuccessState(posts: postsList, postsId: postsId));
      });
    } catch (e) {
      emit(GetPostFailureState());
    }
  }

  void getPostsBySearch({required String searchValue}) {
    posts
        .orderBy('title')
        .startAt([searchValue])
        .endAt(["$searchValue\uf8ff"])
        .snapshots()
        .listen((event) {
          List<PostModel> postsList = [];
          List<String> postsId = [];
          for (var doc in event.docs) {
            if (doc['postState'] == false) {
              postsList.add(PostModel.fromJson(doc));
              postsId.add(doc.id);
            }
          }
          emit(GetPostSuccessState(posts: postsList, postsId: postsId));
        });
  }
}
