import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/category_page.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    this.image,
    this.text,
    this.onTap,
    super.key,
  });
  final String? text;
  final String? image;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: image != null
          ? onTap
          : () {
              showDialog(
                barrierColor: Colors.transparent,
                context: context,
                builder: (context) => Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 4,
                      child: const CategoryPage(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                  ],
                ),
              );
            },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            width: double.infinity,
            height: 105,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 12,
                ),
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(50)),
              color: Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      text != null ? text! : 'إضافة قسم',
                      style: const TextStyle(
                        fontSize: 30,
                        color: AppColor.kFont,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     top: 28,
          //     left: 10,
          //     child: CircleAvatar(
          //       radius: 25,
          //       backgroundColor: Colors.grey.shade200,
          //       child: const CircleAvatar(
          //         radius: 24,
          //         backgroundColor: Colors.white,
          //         child: Icon(
          //           Icons.arrow_back_ios_rounded,
          //           color:  AppColor.kPrimary,
          //           // AppColor.kPrimary,
          //         ),
          //       ),
          //     )),
          Positioned(
            right: 0,
            top: 20,
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: AppColor.kPrimary,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 2),
                          blurRadius: 10)
                    ]),
                width: 90,
                height: 90,
                child: image != null
                    ? Image(
                        image: CachedNetworkImageProvider(
                          image!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : const FittedBox(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
