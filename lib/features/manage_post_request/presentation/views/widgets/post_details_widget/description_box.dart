import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    super.key,
    // required this.widget,
  });

  // final DonationDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            )
          ],
          color: Colors.white),
      child: const Text(
        // widget.donationModel!.description,
        'حداد متفرغ لصيانة الساجد من الساعة 10 صباحا الى 5 مسائا بدون مقابل',
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
