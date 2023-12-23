import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/ban_user/data/user_model.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../manage_post_request/presentation/views/widgets/post_details_widget/post_details_image.dart';
import '../../../manage_post_request/presentation/views/widgets/post_details_widget/post_details_info_component.dart';
import '../../../manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';
import '../cubit/manage_verification_account/manage_verification_account_cubit.dart';
import 'widget/Charities_account_box.dart';

class AccountVerificationRequestDetailsPage extends StatelessWidget {
  const AccountVerificationRequestDetailsPage(
      {super.key,
      required this.user,
      required this.image,
      required this.docId});

  final UserModel user;
  final String image;
  final String docId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'معلومات الطلب',
          style: TextStyle(fontSize: 32, color: AppColor.kPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TitleDonationDetailsPage(text: 'حساب الجمعية'),
                      CharitiesAccountBox(
                        user: user,
                        vertical: 10,
                        height: 225,
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 8,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TitleDonationDetailsPage(
                          text: 'وثيقة تسجيل الجمعية'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CachedNetworkImage(
                                  imageUrl: image,
                                  fit: BoxFit.fitHeight,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) {
                                    return CircularProgressIndicator(
                                        value: downloadProgress.progress);
                                  },
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 225,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(20, 58, 68, 160),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: PostDetailsImage(
                              image: image,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 27,
                      ),
                      CustomButton(
                        height: 75,
                        horizontalPadding: double.infinity,
                        textColor: AppColor.kWhite,
                        color: AppColor.kRed,
                        text: 'رفض التوثيق',
                        onTap: () async {
                          await BlocProvider.of<ManageVerificationAccountCubit>(
                                  context)
                              .rejectVerification(documentId: docId);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CustomButton(
                        height: 75,
                        horizontalPadding: double.infinity,
                        textColor: AppColor.kWhite,
                        color: AppColor.kPrimary,
                        text: 'توثيق الحساب',
                        onTap: () async {
                          await BlocProvider.of<ManageVerificationAccountCubit>(
                                  context)
                              .acceptVerification(userId: user.id);
                          // ignore: use_build_context_synchronously
                          await BlocProvider.of<ManageVerificationAccountCubit>(
                                  context)
                              .rejectVerification(documentId: docId);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        },
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
                        text: 'معلومات الحساب',
                      ),
                      PostDetailsInformationComponent(
                          section: 'الاسم', data: user.name),
                      PostDetailsInformationComponent(
                          section: 'رقم الهاتف', data: user.mobileNumber),
                      PostDetailsInformationComponent(
                          section: 'البريد الإالكتروني', data: user.email),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
