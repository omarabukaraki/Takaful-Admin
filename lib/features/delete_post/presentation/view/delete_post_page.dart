import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
import 'package:takaful_admin1/features/manage_post_request/data/post_model.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_post_cubit/get_post_cubit.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_post_cubit/get_post_state.dart';

import '../../../../core/helper/snak_bar.dart';
import '../../../manage_post_request/presentation/views/widgets/post_widget/post_component.dart';
import 'delete_post_details_page.dart';

class DeletePostPage extends StatefulWidget {
  const DeletePostPage({super.key});

  @override
  State<DeletePostPage> createState() => _DeletePostPageState();
}

class _DeletePostPageState extends State<DeletePostPage> {
  @override
  void initState() {
    BlocProvider.of<GetPostCubit>(context).getPostToDeletePost();
    super.initState();
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<GetPostCubit, GetPostState>(
      listener: (context, state) {
        if (state is GetPostSuccessState) {
          posts = state.posts;
          postsId = state.postsId;
          isLoading = false;
        } else if (state is GetPostLodingState) {
          isLoading = true;
        } else if (state is GetPostFailureState) {
          isLoading = false;
          showSankBar(context, AppString.textErrorOccurredPleaseTryLater);
        }
      },
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                CustomSearchBar(
                    hintText: AppString.textSearchInPosts,
                    onChanged: (searchValue) {
                      BlocProvider.of<GetPostCubit>(context).getPostsBySearch(
                          searchValue: searchValue, getAllPost: true);
                    },
                    icon: const Icon(Icons.search)),
                Expanded(
                  child: isLoading != true
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                          ),
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return DonationComponent(
                                post: posts[index],
                                onTapRequest: () {
                                  showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                          child: DeletePostDetailsPage(
                                              post: posts[index],
                                              postId: postsId[index]),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ],
            ));
      },
    ));
  }
}
