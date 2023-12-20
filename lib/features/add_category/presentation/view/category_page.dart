import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/add_category_cubit/add_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/add_image_cubit/add_image_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/widget/add_image_button.dart';

import 'widget/edit_image_component.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.type});
  final String type;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? categoryName;
  String? description;
  String? imageUrl;
  bool isLoading = false;
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
                    BlocConsumer<AddImageCubit, AddImageState>(
                      listener: (context, state) {
                        if (state is AddImageSuccess) {
                          imageUrl = state.url;
                          isLoading = false;
                        } else if (state is AddImageLoading) {
                          isLoading = true;
                        }
                      },
                      builder: (context, state) {
                        return Expanded(
                          flex: 6,
                          child: isLoading != true
                              ? imageUrl == null
                                  ? AddImageButton(
                                      onTap: () async {
                                        await BlocProvider.of<AddImageCubit>(
                                                context)
                                            .pickImageFromGallery();
                                      },
                                      icon: Icons.camera_enhance,
                                      text: 'اضف صورة',
                                    )
                                  : EditImageComponent(
                                      imageUrl: imageUrl,
                                      onTap: () async {
                                        await BlocProvider.of<AddImageCubit>(
                                                context)
                                            .pickImageFromGallery();
                                      },
                                    )
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          50, 58, 68, 160)),
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                ),
                        );
                      },
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
                    description = data;
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
                    if (imageUrl != null) {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AddCategoryCubit>(context).addCategory(
                            typeOfCategory: widget.type,
                            title: categoryName!,
                            image: imageUrl!);
                        Navigator.pop(context);
                      }
                    } else {
                      // add a dialog or sank bar to tell admin the image is required
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
