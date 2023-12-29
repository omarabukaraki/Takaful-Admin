import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/features/add_category/data/category_model.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_item_category_cubit/get_item_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_item_category_cubit/get_item_category_state.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_service_category_cubit/get_service_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_service_category_cubit/get_service_category_state.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/widget/category_menu.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/widget/title_add_category_page.dart';

import '../../../../core/helper/snak_bar.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetServiceCategoryCubit>(context).getServiceCategories();
    BlocProvider.of<GetItemCategoryCubit>(context).getItemCategories();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, right: 30, left: 30),
        child: Row(
          children: [
            ServiceCategories(),
            Expanded(
              child: VerticalDivider(
                thickness: 0.5,
                indent: 70,
                endIndent: 15,
              ),
            ),
            ItemCategories(),
          ],
        ),
      ),
    );
  }
}

class ServiceCategories extends StatefulWidget {
  const ServiceCategories({super.key});

  @override
  State<ServiceCategories> createState() => _ServiceCategoriesState();
}

class _ServiceCategoriesState extends State<ServiceCategories> {
  bool isLoding = false;
  List<CategoryModel> categories = [];
  List<String> serviceCategoryId = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetServiceCategoryCubit, GetServiceCategoryState>(
      listener: (context, state) {
        if (state is GetServiceCategoryLodingState) {
          isLoding = true;
        } else if (state is GetServiceCategorySeccState) {
          categories = state.categoryList;
          serviceCategoryId = state.serviceCategoryIdList;
          isLoding = false;
        } else if (state is GetServiceCategoryFaliuerState) {
          isLoding = false;
          showSankBar(context, AppString.textErrorOccurredPleaseTryLater);
        }
      },
      builder: (context, state) {
        return Expanded(
          flex: 5,
          child: BlurryModalProgressHUD(
            inAsyncCall: isLoding,
            progressIndicator:
                const SpinKitFadingCircle(color: AppColor.kPrimary, size: 90.0),
            dismissible: false,
            opacity: 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const TitleAddCategoryPage(
                  text: AppString.textServices,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryMenu(
                        type: 'service category',
                        categoryId: serviceCategoryId[index],
                        categoryModel: categories[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ItemCategories extends StatefulWidget {
  const ItemCategories({super.key});

  @override
  State<ItemCategories> createState() => _ItemCategoriesState();
}

class _ItemCategoriesState extends State<ItemCategories> {
  bool isLodingItem = false;
  List<String> itemCategoryId = [];
  List<CategoryModel> categories = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetItemCategoryCubit, GetItemCategoryState>(
      listener: (context, state) {
        if (state is GetItemCategoryLodingState) {
          isLodingItem = true;
        } else if (state is GetItemCategorySeccState) {
          categories = state.categoryList;
          itemCategoryId = state.itemCategoryIdList;
          isLodingItem = false;
        } else if (state is GetItemCategoryFaliuerState) {
          isLodingItem = false;
          showSankBar(context, AppString.textErrorOccurredPleaseTryLater);
        }
      },
      builder: (context, state) {
        return Expanded(
          flex: 5,
          child: BlurryModalProgressHUD(
            inAsyncCall: isLodingItem,
            progressIndicator:
                const SpinKitFadingCircle(color: AppColor.kPrimary, size: 90.0),
            dismissible: false,
            opacity: 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const TitleAddCategoryPage(
                  text: AppString.textItems,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryMenu(
                        type: 'category',
                        categoryId: itemCategoryId[index],
                        categoryModel: categories[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
