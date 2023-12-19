import 'package:takaful_admin1/features/manage_post_request/data/post_model.dart';

abstract class GetPostState {}

final class GetPostInitial extends GetPostState {}

final class GetPostLodingState extends GetPostState {}

final class GetPostSuccessState extends GetPostState {
  List<PostModel> posts = [];
  List<String> postsId = [];
  GetPostSuccessState({required this.posts, required this.postsId});
}

final class GetPostFailureState extends GetPostState {}
