import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class UserCoverInformation extends StatelessWidget {
  const UserCoverInformation({
    this.userName,
    this.userNumber,
    this.userEmail,
    super.key,
  });
  final String? userName;
  final String? userNumber;
  final String? userEmail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    userName ?? 'وجبة لشخص صالح لمدة يوم',
                    style: const TextStyle(
                        fontSize: 15,
                        color: AppColor.kFont,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.clip),
                    textAlign: TextAlign.end,
                    maxLines: 2,
                  ),
                ),
                const Expanded(
                  child: Text(
                    ':الاسم',
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.kPrimary,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.clip),
                    maxLines: 2,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    userNumber ?? 'الاستهلاكيات , الطعام',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColor.kFont,
                      overflow: TextOverflow.clip,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                const Expanded(
                  child: Text(
                    ':رقم الهاتف',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.kPrimary,
                      overflow: TextOverflow.clip,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      userEmail ?? 'الموقع في عمان',
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColor.kFont,
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      ':البريد الإلكتروني',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColor.kPrimary,
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
