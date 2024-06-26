import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class DonationCoverInformation extends StatelessWidget {
  const DonationCoverInformation({
    this.title,
    this.typePost,
    this.location,
    super.key,
  });
  final String? title;
  final String? typePost;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title ?? 'وجبة لشخص صالح لمدة يوم',
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColor.kFont,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip),
              textAlign: TextAlign.end,
              maxLines: 2,
            ),
          ),
          Expanded(
              flex: 1,
              child: Text(
                typePost ?? 'الاستهلاكيات , الطعام',
                style: const TextStyle(
                    fontSize: 13,
                    color: AppColor.kFont,
                    overflow: TextOverflow.clip),
              )),
          Expanded(
              flex: 1,
              child: Text(
                location ?? 'الموقع في عمان',
                style: const TextStyle(
                    fontSize: 11,
                    color: AppColor.kFont,
                    overflow: TextOverflow.clip),
                maxLines: 1,
              ))
        ],
      ),
    );
  }
}
