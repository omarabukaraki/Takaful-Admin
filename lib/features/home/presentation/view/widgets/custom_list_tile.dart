import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      this.mainIcon,
      this.isleadingIcon = false,
      this.onTap,
      this.size = 22,
      this.isIcon = true,
      this.image});
  final String title;
  final IconData? mainIcon;
  final bool? isleadingIcon;
  final VoidCallback? onTap;
  final double? size;
  final bool? isIcon;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      trailing: isIcon == true
          ? Icon(
              mainIcon,
              color: Colors.white,
            )
          : Image.asset(
              image!,
              color: AppColor.kWhite,
              height: 30,
              width: 23,
            ),
      title: Text(
        title,
        textAlign: TextAlign.end,
        style: TextStyle(
            fontSize: size,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      leading: isleadingIcon == true
          ? const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white)
          : const SizedBox(),
    );
  }
}
