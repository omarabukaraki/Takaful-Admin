import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/description_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/doner_account_box.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/image_count_and_full_count.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_button.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_image.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_information.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';

class DeletePostDetailsPage extends StatefulWidget {
  const DeletePostDetailsPage({super.key});

  @override
  State<DeletePostDetailsPage> createState() => _PostPageState();
}

class _PostPageState extends State<DeletePostDetailsPage> {
  int inIndex = 0;
  final _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'الإعلان',
            style: TextStyle(fontSize: 32, color: AppColor.kPrimary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // start post title

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

                            //end post title

                            //start textField
                            const Expanded(
                              child: CustomTextFiled(
                                horizontalPadding: double.infinity,
                                maxLines: 5,
                                hintText: 'سبب الحذف',
                              ),
                            ),

                            //end textField
                            //start delete button
                            PostDetailsButton(
                              text: 'حذف الإعلان',
                              onTap: () {},
                              color: AppColor.kRed,
                              textColor: AppColor.kWhite,
                            )
                            //end delete button
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      //start post image
                      Expanded(
                        flex: 8,
                        child: Container(
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
                        //end post image
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: const PostDetailsInformation()),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: const Row(
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
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
