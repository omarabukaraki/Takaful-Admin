import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.mainIcon,
      this.isleadingIcon = false,
      this.onTap,
      this.size = 22});
  final String title;
  final IconData mainIcon;
  final bool? isleadingIcon;
  final VoidCallback? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      trailing: Icon(
        mainIcon,
        color: Colors.white,
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
