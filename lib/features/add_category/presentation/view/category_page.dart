import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/add_category_cubit/add_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_item_category_cubit/get_item_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_service_category_cubit/get_service_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/widget/add_image_button.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.type});
  final String type;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? categoryName;
  String? discription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColor.kWhite,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: CustomTextFiled(
                        horizontalPadding: double.infinity,
                        hintText: 'اسم القسم',
                        maxLines: 9,
                        onChanged: (data) {
                          categoryName = data;
                        },
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const Expanded(
                      flex: 6,
                      child: AddImageButton(
                        icon: Icons.camera_enhance,
                        text: 'اضف صورة',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: CustomTextFiled(
                  paddingVertical: 25,
                  hintText: 'وصف القسم',
                  horizontalPadding: double.infinity,
                  maxLines: 12,
                  onChanged: (data) {
                    discription = data;
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                child: CustomButton(
                  textColor: AppColor.kWhite,
                  color: AppColor.kPrimary,
                  text: 'إضافة قسم',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AddCategoryCubit>(context).addCategory(
                          typeOfCategory: widget.type,
                          title: categoryName!,
                          image:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg');
                      BlocProvider.of<GetItemCategoryCubit>(context)
                          .getItemCategories();
                      BlocProvider.of<GetServiceCategoryCubit>(context)
                          .getServiceCategories();
                      Navigator.pop(context);
                    }
                  },
                  horizontalPadding: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
