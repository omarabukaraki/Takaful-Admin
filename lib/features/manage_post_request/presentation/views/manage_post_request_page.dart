import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/helper/snak_bar.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
import 'package:takaful_admin1/core/widget/custom_warning_component.dart';
import 'package:takaful_admin1/features/manage_post_request/data/post_model.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_post_cubit/get_post_cubit.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_post_cubit/get_post_state.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/post_details_page.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_widget/post_component.dart';

class ManagePostReqPage extends StatefulWidget {
  const ManagePostReqPage({super.key});

  @override
  State<ManagePostReqPage> createState() => _ManagePostReqPageState();
}

class _ManagePostReqPageState extends State<ManagePostReqPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPostCubit>(context).getPostToManagePost();
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPostCubit, GetPostState>(
      listener: (context, state) {
        if (state is GetPostLodingState) {
          isLoading = true;
        } else if (state is GetPostSuccessState) {
          posts = state.posts;
          postsId = state.postsId;
          isLoading = false;
        } else if (state is GetPostFailureState) {
          isLoading = false;
          showSankBar(context, AppString.textErrorOccurredPleaseTryLater);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                // start search bar
                CustomSearchBar(
                  hintText: AppString.textSearchInPosts,
                  icon: const Icon(Icons.search),
                  onChanged: (searchValue) {
                    BlocProvider.of<GetPostCubit>(context).getPostsBySearch(
                        searchValue: searchValue, getAllPost: false);
                  },
                ),
                // end search bar

                //start post list
                Expanded(
                  child: posts.isNotEmpty
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
                                      Container(
                                        height: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom ==
                                                0
                                            ? MediaQuery.of(context).size.height
                                            : 0,
                                        color: Colors.amber,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width -
                                            MediaQuery.of(context).size.width /
                                                4,
                                        child: PostPage(
                                          post: posts[index],
                                          postId: postsId[index],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : const CustomWarningComponent(),
                ),
                //end post list
              ],
            ),
          ),
        );
      },
    );
  }
}
