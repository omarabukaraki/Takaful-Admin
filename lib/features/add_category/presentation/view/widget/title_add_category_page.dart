import 'package:flutter/material.dart';

class TitleAddCategoryPage extends StatelessWidget {
  const TitleAddCategoryPage({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'الوصف',
      style: const TextStyle(
        fontSize: 38,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
    );
  }
}
