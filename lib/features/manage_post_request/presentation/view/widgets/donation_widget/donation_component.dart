import 'package:flutter/material.dart';
//import 'package:takaful/features/get_donation/data/model/donation_model.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/view/widgets/donation_widget/donation_cover_image.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/view/widgets/donation_widget/donation_cover_info.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/view/widgets/image_count.dart';

class DonationComponent extends StatelessWidget {
  const DonationComponent({
    super.key,
    this.onTapRequest,
    // this.donation,
    this.donationId,
  });
  final String? donationId;
  // final DonationModel? donation;
  final VoidCallback? onTapRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 20, right: 5),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DonationCoverInformation(
                        title: 'سعيد علم حاسوب',
                        //donation!.title,
                        typePost: 'علم حاسوب',
                        //'${donation!.category} - ${donation!.itemOrService}',
                        location: 'الجامعة الهاشمية'
                        // '${donation!.location} - ${donation!.subLocation}',
                        ),
                  ),
                  Expanded(
                      flex: 1,
                      child: DonationCoverImage(
                        // image: donation!.image[0],
                        image:
                            'https://www.bbcgoodfoodme.com/wp-content/uploads/2023/11/Sirali_007-scaled.jpg',
                      )),
                ],
              )),
          const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Container(
                  //   width: 95,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5),
                  //     color: AppColor.kFontSecondary,
                  //   ),
                  //   child: Center(
                  //       child: Text(
                  //     donation!.typeOfDonation.toString(),
                  //     style: const TextStyle(color: AppColor.kWhite),
                  //   )),
                  // ),
                  // const SizedBox(width: 10),
                  ImageCount(countImage: 2
                      //donation!.image.length
                      ),
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5, left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.kPrimary)),
                        child: const Center(
                          child: Text(
                            'نوع التبرع',
                            //donation!.typeOfDonation.toString(),
                            style: TextStyle(
                              color: AppColor.kPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      //  SaveDonation(
                      //       onTapSave: onTapSave,
                      //       donationId: donationId!,
                      //       userId: donation!.id),
                      ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: onTapRequest,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5, left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.kPrimary),
                        child: const Center(
                            child: Text(
                          'عرض',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
