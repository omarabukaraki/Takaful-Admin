import 'package:flutter/material.dart';
//import 'package:takaful/features/get_donation/data/model/donation_model.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/ban_user/presentation/view/widgets/user_widget/user_cover_image.dart';
import 'package:takaful_admin1/features/ban_user/presentation/view/widgets/user_widget/user_cover_info.dart';

class UserComponent extends StatelessWidget {
  const UserComponent({
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
                    flex: 2,
                    child: UserCoverInformation(
                        userName: 'ايهم عامر صالح',
                        //donation!.title,
                        userNumber: '0781884410',
                        //'${donation!.category} - ${donation!.itemOrService}',
                        userEmail: 'ayhamsaleh234@gmail.com'
                        // '${donation!.location} - ${donation!.subLocation}',
                        ),
                  ),
                  Expanded(
                      flex: 1,
                      child: UserCoverImage(
                        // image: donation!.image[0],
                        image:
                            'https://www.bbcgoodfoodme.com/wp-content/uploads/2023/11/Sirali_007-scaled.jpg',
                      )),
                ],
              )),
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onTapRequest,
                child: Container(
                  margin: const EdgeInsets.only(top: 5, left: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.kRed),
                  child: const Center(
                      child: Text(
                    'حظر المستخدم',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ))
        ]),
      ),
    );
  }
}