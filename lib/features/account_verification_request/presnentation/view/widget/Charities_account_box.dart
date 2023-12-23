import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharitiesAccountBox extends StatelessWidget {
  const CharitiesAccountBox({super.key, this.height, this.vertical});
  final double? height;
  final double? vertical;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: vertical ?? 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        height: height ?? 200,
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
            const Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // user != null ? user!.name : '',
                    'ayham saleh',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  Row(
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
                flex: 2,
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
                    imageUrl:
                        // user != null
                        // ? user!.image
                        //:
                        'https://firebasestorage.googleapis.com/v0/b/takafultest-2ef6f.appspot.com/o/imagesForApplication%2Fuser_image.jpg?alt=media&token=1742bede-af30-493e-8e79-b08ca3c7bb0f',
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return CircularProgressIndicator(
                          value: downloadProgress.progress);
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )),
          ],
        )
        // : const Center(
        //     child: CircularProgressIndicator(),
        //   )
        );
  }
}
