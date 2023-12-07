import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/features/add_category/presentation/view/add_category_page.dart';
import 'package:takaful_admin1/features/ban_user/presentation/view/ban_user_page.dart';
import 'package:takaful_admin1/features/delete_post/presentation/view/delete_post_page.dart';
import 'package:takaful_admin1/features/generate_analitices/presentation/view/generate_analitices_page.dart';
import 'package:takaful_admin1/features/home/presentation/view/widgets/custom_list_tile.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/view/manage_post_request_page.dart';

import '../../../send_message/presentation/view/send_message_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screen = const [
    ManagePostReqPage(),
    SendMessagePage(),
    BanUserPage(),
    DeletepostPage(),
    AddCategoryPage(),
    GenerateAnaliticesPage(),
  ];
  int index = 5;
  String appBarTitle = 'الإحصائيات';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 4,
              child: Center(
                child: Text(
                  appBarTitle,
                  style:
                      const TextStyle(fontSize: 32, color: AppColor.kPrimary),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppString.textTakafulArabicName,
                        style: TextStyle(
                            fontSize: 32, color: AppColor.kPrimary, height: 1)),
                    Text(
                      AppString.textTakafulEnglishName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kGrey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width / 4,
            child: screen[index],
          ),
          Drawer(
            width: MediaQuery.of(context).size.width / 4,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
            backgroundColor: const Color(0xff3A44A0),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
              children: [
                const CustomListTile(
                    title: AppString.textManageUsers,
                    mainIcon: Icons.manage_accounts_outlined,
                    isleadingIcon: true),
                const Divider(height: 2),
                CustomListTile(
                  onTap: () {
                    setState(() {
                      index = 0;
                      appBarTitle = AppString.textManageUserPosts;
                    });
                  },
                  title: AppString.textManageUserPosts,
                  mainIcon: Icons.manage_accounts_outlined,
                  size: 19,
                ),
                CustomListTile(
                  onTap: () {
                    setState(() {
                      index = 1;
                      appBarTitle = AppString.textSendNotiToUsers;
                    });
                  },
                  title: AppString.textSendNotiToUsers,
                  mainIcon: Icons.manage_accounts_outlined,
                  size: 19,
                ),
                CustomListTile(
                  onTap: () {
                    setState(() {
                      index = 2;
                      appBarTitle = AppString.textBanUser;
                    });
                  },
                  title: AppString.textBanUser,
                  mainIcon: Icons.manage_accounts_outlined,
                  size: 19,
                ),
                CustomListTile(
                  onTap: () {
                    setState(() {
                      index = 3;
                      appBarTitle = AppString.textDeletePost;
                    });
                  },
                  title: AppString.textDeletePost,
                  mainIcon: Icons.manage_accounts_outlined,
                  size: 19,
                ),
                const CustomListTile(
                  title: AppString.textManageApplication,
                  mainIcon: Icons.manage_accounts_outlined,
                  isleadingIcon: true,
                ),
                const Divider(height: 2),
                CustomListTile(
                  onTap: () {
                    setState(() {
                      index = 4;
                      appBarTitle = AppString.textAddCategory;
                    });
                  },
                  title: AppString.textAddCategory,
                  mainIcon: Icons.manage_accounts_outlined,
                  size: 19,
                ),
                CustomListTile(
                  onTap: () {
                    setState(() {
                      index = 5;
                      appBarTitle = AppString.textAnalitices;
                    });
                  },
                  title: AppString.textAnalitices,
                  mainIcon: Icons.manage_accounts_outlined,
                  size: 19,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
