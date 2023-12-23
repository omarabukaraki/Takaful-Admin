import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

import '../../../../core/widget/custom_button.dart';
import '../../../manage_post_request/presentation/views/widgets/post_details_widget/post_details_image.dart';
import '../../../manage_post_request/presentation/views/widgets/post_details_widget/post_details_info_component.dart';
import '../../../manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';
import 'widget/Charities_account_box.dart';

class AccountVerificationRequestDetailsPage extends StatelessWidget {
  const AccountVerificationRequestDetailsPage({super.key});

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
                const Expanded(
                  flex: 8,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TitleDonationDetailsPage(text: 'حساب الجمعية'),
                      CharitiesAccountBox(
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
                        child: Container(
                          height: 225,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const PostDetailsImage(
                            image:
                                'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
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
                        text: 'رفض النشر',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CustomButton(
                        height: 75,
                        horizontalPadding: double.infinity,
                        textColor: AppColor.kWhite,
                        color: AppColor.kPrimary,
                        text: 'نشر الإعلان',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                const Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TitleDonationDetailsPage(
                        text: 'معلومات الحساب',
                      ),
                      PostDetailsInformationComponent(),
                      PostDetailsInformationComponent(),
                      PostDetailsInformationComponent(),
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
