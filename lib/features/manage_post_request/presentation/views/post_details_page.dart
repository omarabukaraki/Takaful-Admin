import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/manage_post_request/data/post_model.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/description_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/doner_account_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/image_count_and_full_count.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_button.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_image.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_information.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});
  final PostModel post;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int inIndex = 0;
  final _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: const Text(
            'الإعلان',
            style: TextStyle(fontSize: 32, color: AppColor.kPrimary),
          ),
          centerTitle: true,
          backgroundColor: AppColor.kWhite,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
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
                            // 'متبرع لصيانة مسجد في عمان متبرع لصيانة مسجد في عمانمتبرع لصيانة مسجد في عمان',
                            style: const TextStyle(
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
                            text: 'حساب المتبرع',
                          ),
                          DonarAccountBox(
                              donarAccount: widget.post.donarAccount!),
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
                              text: 'الوصف',
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
        ));
  }
}
