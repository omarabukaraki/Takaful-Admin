import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:takaful_admin1/features/ban_user/data/user_model.dart';

class DonarAccountBox extends StatelessWidget {
  const DonarAccountBox({super.key, required this.user});

  final UserModel user;
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
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star_purple500_sharp,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_purple500_sharp,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_purple500_sharp,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_purple500_sharp,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_purple500_sharp,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    )
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: user.image,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return CircularProgressIndicator(
                        value: downloadProgress.progress);
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ));
  }
}
