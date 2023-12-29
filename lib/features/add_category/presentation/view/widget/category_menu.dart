import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/features/add_category/data/category_model.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_item_category_cubit/get_item_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_service_category_cubit/get_service_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/category_page.dart';

import '../../../../manage_ad/presnentation/view/widget/custom_delete_awsome_dialog.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    this.image,
    this.text,
    this.onTap,
    super.key,
    this.categoryModel,
    required this.type,
    required this.categoryId,
  });
  final String? text;
  final String? image;
  final VoidCallback? onTap;
  final CategoryModel? categoryModel;
  final String type;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: categoryModel?.image != null
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
                      child: CategoryPage(
                        type: type,
                      ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryModel?.image != null
                        ? GestureDetector(
                            onTap: () {
                              customDeleteDialog(
                                  context: context,
                                  dialogBody: AppString.textConfirmDeletion,
                                  btnOkOnPress: () async {
                                    type == 'category'
                                        ? await BlocProvider.of<
                                                GetItemCategoryCubit>(context)
                                            .deleteItemcategory(
                                                itemCategoryId: categoryId)
                                        : await BlocProvider.of<
                                                    GetServiceCategoryCubit>(
                                                context)
                                            .deleteServiceCategory(
                                                serviceCategoryId: categoryId);
                                  }).show();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                color: AppColor.kRed,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: AppColor.kWhite,
                                size: 28,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Text(
                      categoryModel?.title != null
                          ? categoryModel!.title!
                          : AppString.textAddCategory,
                      style: const TextStyle(
                        fontSize: 25,
                        color: AppColor.kFont,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
              child: categoryModel?.image != null
                  ? Image(
                      image: CachedNetworkImageProvider(
                        categoryModel!.image!,
                      ),
                      fit: BoxFit.cover,
                    )
                  : const FittedBox(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
