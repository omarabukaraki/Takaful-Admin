import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
import 'package:takaful_admin1/features/ban_user/data/user_model.dart';
import 'package:takaful_admin1/features/ban_user/presentation/view/widgets/user_widget/user_component.dart';

import 'account_verification_request_details_page.dart';

class AccountVerificationRequestsPage extends StatefulWidget {
  const AccountVerificationRequestsPage({super.key});

  @override
  State<AccountVerificationRequestsPage> createState() =>
      _AccountVerificationRequestsPageState();
}

UserModel user = UserModel(
    id: '1',
    image:
        'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
    name: 'name',
    email: 'email',
    mobileNumber: 'mobileNumber',
    userToken: 'userToken',
    createAt: 2);

class _AccountVerificationRequestsPageState
    extends State<AccountVerificationRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          CustomSearchBar(
            hintText: AppString.textSearchInUsers,
            icon: const Icon(Icons.search),
            onChanged: (searchValue) {},
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return UserComponent(
                  colorButton: AppColor.kPrimary,
                  nameButton: AppString.textView,
                  user: user,
                  onTapRequest: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return const DeletePostDetailsPage();
                    // }));
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                MediaQuery.of(context).size.width / 4,
                            child:
                                const AccountVerificationRequestDetailsPage(),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                        ],
                      ),
                    );
                  });
            },
          )),
        ],
      ),
    );
  }
}
