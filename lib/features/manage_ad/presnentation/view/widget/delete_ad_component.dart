import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class DeleteAdComponent extends StatelessWidget {
  const DeleteAdComponent(
      {super.key, required this.imageUrl, required this.onTap});

  final String? imageUrl;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image(
              image: CachedNetworkImageProvider(
                imageUrl!,
              ),
              fit: BoxFit.fill,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(50, 58, 68, 160)),
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: AppColor.kRed,
                  child: Icon(
                    Icons.delete,
                    color: AppColor.kWhite,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
