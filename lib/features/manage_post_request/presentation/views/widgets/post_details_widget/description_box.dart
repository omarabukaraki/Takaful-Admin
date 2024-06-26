import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    super.key,
    required this.postDescription,
  });

  final String postDescription;
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
      child: Text(
        postDescription,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
