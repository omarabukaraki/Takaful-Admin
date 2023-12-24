import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takaful_admin1/core/helper/snak_bar.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/features/manage_ad/data/ad_model.dart';
import 'package:takaful_admin1/features/manage_ad/presnentation/cubit/add_ad_cubit/add_ad_cubit.dart';
import 'package:takaful_admin1/features/manage_ad/presnentation/cubit/get_ad_cubit/get_ad_cubit.dart';
import 'package:takaful_admin1/features/manage_ad/presnentation/cubit/get_ad_cubit/get_ad_state.dart';

import '../../../add_category/presentation/cubit/add_image_cubit/add_image_cubit.dart';
import '../../../add_category/presentation/view/widget/add_image_button.dart';
import '../../../add_category/presentation/view/widget/edit_image_component.dart';
import '../../../manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';
import 'widget/custom_delete_awsome_dialog.dart';
import 'widget/delete_ad_component.dart';

class ManageAdPage extends StatefulWidget {
  const ManageAdPage({super.key});

  @override
  State<ManageAdPage> createState() => _ManageAdPageState();
}

class _ManageAdPageState extends State<ManageAdPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAdCubit>(context).getAds();
  }

  String? imageUrl;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Row(
          children: [
            const Ads(),
            const Expanded(
              child: VerticalDivider(
                thickness: 2,
                indent: 35,
                endIndent: 20,
              ),
            ),
            Expanded(
              flex: 5,
              child: BlocConsumer<AddImageCubit, AddImageState>(
                listener: (context, state) {
                  if (state is AddImageSuccess) {
                    imageUrl = state.url;
                    isLoading = false;
                  } else if (state is AddImageLoading) {
                    isLoading = true;
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TitleDonationDetailsPage(
                        text: 'إضافة أعلان',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: isLoading != true
                            ? imageUrl == null
                                ? AddImageButton(
                                    onTap: () async {
                                      await BlocProvider.of<AddImageCubit>(
                                              context)
                                          .pickImageFromGallery();
                                    },
                                    icon: Icons.camera_enhance,
                                    text: 'اضف صورة',
                                  )
                                : EditImageComponent(
                                    imageUrl: imageUrl,
                                    onTap: () async {
                                      await BlocProvider.of<AddImageCubit>(
                                              context)
                                          .pickImageFromGallery();
                                    },
                                  )
                            : Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromARGB(50, 58, 68, 160)),
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        height: 75,
                        text: 'إضافة إعلان',
                        horizontalPadding: double.infinity,
                        color: AppColor.kPrimary,
                        textColor: AppColor.kWhite,
                        onTap: () async {
                          if (imageUrl != null) {
                            BlocProvider.of<AddAdCubit>(context)
                                .addAd(image: imageUrl!);
                            setState(() {
                              imageUrl = null;
                            });
                          } else {
                            showSankBar(
                              context,
                              'صورة الإعلان مطلوبة',
                            );
                          }
                        },
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ads extends StatefulWidget {
  const Ads({
    super.key,
  });

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  List<AdModel> ads = [];
  List<String> adsId = [];
  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAdCubit, GetAdState>(
      listener: (context, state) {
        if (state is GetAdLodingState) {
          isLoding = true;
        } else if (state is GetAdSuccessState) {
          ads = state.adList;
          adsId = state.adIdList;
        } else if (state is GetAdFailureState) {}
      },
      builder: (context, state) {
        return Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const TitleDonationDetailsPage(
                text: 'حذف الإعلان',
              ),
              Expanded(
                child: BlurryModalProgressHUD(
                  inAsyncCall: isLoding,
                  progressIndicator: const SpinKitFadingCircle(
                      color: AppColor.kPrimary, size: 90.0),
                  dismissible: false,
                  opacity: 0.4,
                  child: ListView.builder(
                    itemCount: ads.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: DeleteAdComponent(
                          imageUrl: ads[index].image,
                          onTap: () {
                            customDeleteDialog(
                                context: context,
                                dialogBody: 'تاكيد الحذف',
                                btnOkOnPress: () async {
                                  await BlocProvider.of<GetAdCubit>(context)
                                      .deleteAd(adId: adsId[index]);
                                }).show();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
