import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/widget/add_image_button.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: const Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: CustomTextFiled(
                      horizontalPadding: double.infinity,
                      hintText: 'اسم القسم',
                      maxLines: 9,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
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
              child: const CustomTextFiled(
                paddingVertical: 25,
                hintText: 'وصف القسم',
                horizontalPadding: double.infinity,
                maxLines: 12,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: CustomButton(
                textColor: AppColor.kWhite,
                color: AppColor.kPrimary,
                text: 'إضافة قسم',
                onTap: () {},
                horizontalPadding: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
