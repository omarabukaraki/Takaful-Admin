import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/description_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/doner_account_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/image_count_and_full_count.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_button.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_image.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_information.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int inIndex = 0;
  final _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        //widget.donationModel!.title,
                        'متبرع لصيانة مسجد في عمان متبرع لصيانة مسجد في عمانمتبرع لصيانة مسجد في عمان',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                        maxLines: 2,
                      ),
                      PostDetailsButton(
                        text: 'نشر الإعلان',
                        onTap: () {},
                        color: AppColor.kPrimary,
                        textColor: AppColor.kWhite,
                      ),
                      PostDetailsButton(
                        text: 'رفض النشر',
                        onTap: () {},
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
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) {
                            return const PostDetailsImage(
                              image:
                                  'https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200',
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
                        ImageCountAndFullCount(
                          countImage: inIndex + 1,
                          fullCountImage: 3,
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
          const Expanded(child: SizedBox()),
          const Expanded(flex: 4, child: PostDetailsInformation()),
          const Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TitleDonationDetailsPage(
                          text: 'حساب المتبرع',
                        ),
                        DonarAccountBox(),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TitleDonationDetailsPage(
                            text: 'الوصف',
                          ),
                          DescriptionBox(),
                        ],
                      ))
                ],
              ))
        ],
      ),
    ));
  }
}
