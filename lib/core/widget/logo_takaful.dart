import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_assets.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';

class LogoTakaful extends StatelessWidget {
  const LogoTakaful({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(AppString.textTakafulArabicName,
                style: TextStyle(fontSize: 51, color: AppColor.kPrimary)),
            Text(AppString.textTakafulEnglishName,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kGrey)),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAveLogo(image: AppAssets.assetsImageFoodlogin),
              SizedBox(
                width: 40,
              ),
              CircleAveLogo(
                  image: AppAssets.assetsImageClotherss,
                  color: AppColor.kWhite),
              SizedBox(
                width: 40,
              ),
              CircleAveLogo(image: AppAssets.assetsImageSofa),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class CircleAveLogo extends StatelessWidget {
  const CircleAveLogo({
    this.color,
    required this.image,
    super.key,
  });
  final String image;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.kPrimary,
      radius: 27,
      child: CircleAvatar(
        radius: 23,
        backgroundColor: color ?? AppColor.kPrimary,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
