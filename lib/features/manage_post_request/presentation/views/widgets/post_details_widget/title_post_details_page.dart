import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';

class TitleDonationDetailsPage extends StatelessWidget {
  const TitleDonationDetailsPage({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? AppString.textDescription,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
    );
  }
}
