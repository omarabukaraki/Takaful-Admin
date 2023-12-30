import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/helper/custom_awsome_dialog.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/features/ban_user/data/user_model.dart';
import 'package:takaful_admin1/features/manage_post_request/data/post_model.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/description_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/doner_account_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/image_count_and_full_count.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_button.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_image.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_information.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';
import 'package:takaful_admin1/features/send_notification/presentation/cubit/send_notification_cubit.dart';

import '../cubits/get_user_information_cubit/get_user_information_cubit.dart';
import '../cubits/get_user_information_cubit/get_user_information_state.dart';
import '../cubits/manage_post_cubit/manage_post_cubit.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post, required this.postId});
  final PostModel post;
  final String postId;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int inIndex = 0;
  final _controller = CarouselController();
  @override
  void initState() {
    BlocProvider.of<GetUserInformationCubit>(context)
        .getUserInformationByEmail(email: widget.post.donarAccount!);
    super.initState();
  }

  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: const Text(
            AppString.textPost,
            style: TextStyle(fontSize: 32, color: AppColor.kPrimary),
          ),
          centerTitle: true,
          backgroundColor: AppColor.kWhite,
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<GetUserInformationCubit, GetUserInformationState>(
          listener: (context, state) {
            if (state is GetUserInformationSuccess) {
              user = state.user;
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.post.title!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.end,
                                maxLines: 2,
                              ),
                              PostDetailsButton(
                                text: AppString.textPublishPost,
                                onTap: () async {
                                  await BlocProvider.of<ManagePostCubit>(
                                          context)
                                      .acceptPost(
                                          postId: widget.postId,
                                          postState: true);
                                  // ignore: use_build_context_synchronously
                                  await BlocProvider.of<SendNotificationCubit>(
                                          context)
                                      .sendPushNotification(
                                          title: 'تم نشر اعلانك بنجاح',
                                          body: widget.post.title!,
                                          token: user != null
                                              ? user!.userToken
                                              : '',
                                          context: context,
                                          userId: widget.post.id!,
                                          typeOfNotification: 'APP',
                                          donarEmail:
                                              widget.post.donarAccount!);
                                  // ignore: use_build_context_synchronously
                                  await customDialog(
                                    context: context,
                                    dialogBody: AppString.publishedSuccessfully,
                                    dialogType: DialogType.success,
                                    onDismissCallback: (dismiss) {
                                      Navigator.pop(context);
                                    },
                                  ).show();
                                },
                                color: AppColor.kPrimary,
                                textColor: AppColor.kWhite,
                              ),
                              PostDetailsButton(
                                text: AppString.textRejectPublish,
                                onTap: () async {
                                  await BlocProvider.of<ManagePostCubit>(
                                          context)
                                      .rejectPost(postId: widget.postId);
                                  // ignore: use_build_context_synchronously
                                  await BlocProvider.of<SendNotificationCubit>(
                                          context)
                                      .sendPushNotification(
                                          title: 'تم رفض نشر اعلانك',
                                          body: widget.post.title!,
                                          token: user != null
                                              ? user!.userToken
                                              : '',
                                          context: context,
                                          userId: widget.post.id!,
                                          typeOfNotification: 'RPP',
                                          donarEmail:
                                              widget.post.donarAccount!);
                                  // ignore: use_build_context_synchronously
                                  await customDialog(
                                    context: context,
                                    dialogBody: AppString.successfullyRejected,
                                    dialogType: DialogType.error,
                                    onDismissCallback: (dismiss) {
                                      Navigator.pop(context);
                                    },
                                  ).show();
                                },
                                color: AppColor.kRed,
                                textColor: AppColor.kWhite,
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: const Color.fromARGB(10, 58, 68, 160),
                                  child: CarouselSlider.builder(
                                    itemCount: widget.post.image!.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return PostDetailsImage(
                                        image: widget.post.image![index],
                                      );
                                    },
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                      height: double.infinity,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          inIndex = index;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                ImageCountAndFullCount(
                                  countImage: inIndex + 1,
                                  fullCountImage: widget.post.image!.length,
                                  height: 25,
                                ),
                                Positioned(
                                  top: 100,
                                  left: 0,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      _controller.previousPage();
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 100,
                                  right: 0,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios),
                                    onPressed: () {
                                      _controller.nextPage();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: PostDetailsInformation(post: widget.post)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const TitleDonationDetailsPage(
                                text: AppString.textAdvertiser,
                              ),
                              DonarAccountBox(
                                user: user != null
                                    ? user!
                                    : UserModel(
                                        id: '',
                                        image:
                                            'https://firebasestorage.googleapis.com/v0/b/takafultest-2ef6f.appspot.com/o/imagesForApplication%2Fuser_image.jpg?alt=media&token=1742bede-af30-493e-8e79-b08ca3c7bb0f',
                                        name: '',
                                        email: '',
                                        mobileNumber: '',
                                        userToken: '',
                                        createAt: 12,
                                        isVerified: false,
                                        numberOfRatingUsers: 0,
                                        rating: 0,
                                        ratingList: []),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const TitleDonationDetailsPage(
                                  text: AppString.textDescription,
                                ),
                                DescriptionBox(
                                  postDescription: widget.post.description!,
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
