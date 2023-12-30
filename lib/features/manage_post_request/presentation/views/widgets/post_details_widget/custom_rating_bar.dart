import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../ban_user/data/user_model.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.usersModel,
  });

  final UserModel? usersModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(),
        const SizedBox(width: 8),
        Text('(${usersModel!.numberOfRatingUsers})'),
        const SizedBox(width: 5),
        Directionality(
          textDirection: TextDirection.rtl,
          child: RatingBar.builder(
            ignoreGestures: true,
            itemSize: 20,
            initialRating: usersModel!.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
        ),
      ],
    );
  }
}
