import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
import 'package:takaful_admin1/features/account_verification_request/data/acc_verificatoin_model.dart';
import 'package:takaful_admin1/features/ban_user/data/user_model.dart';
import 'package:takaful_admin1/features/ban_user/presentation/view/widgets/user_widget/user_component.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_user_information_cubit/get_user_information_cubit.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_user_information_cubit/get_user_information_state.dart';

import '../cubit/get_verification_requests/get_verification_requests_cubit.dart';
import 'account_verification_request_details_page.dart';

class AccountVerificationRequestsPage extends StatefulWidget {
  const AccountVerificationRequestsPage({super.key});

  @override
  State<AccountVerificationRequestsPage> createState() =>
      _AccountVerificationRequestsPageState();
}

class _AccountVerificationRequestsPageState
    extends State<AccountVerificationRequestsPage> {
  @override
  void initState() {
    BlocProvider.of<GetVerificationRequestsCubit>(context)
        .getVerificationRequests();
    super.initState();
  }

  List<AccVerificationModel> verificationRequests = [];
  List<String> docsId = [];
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
          BlocConsumer<GetVerificationRequestsCubit,
              GetVerificationRequestsState>(
            listener: (context, state) {
              if (state is GetVerificationRequestsSuccess) {
                verificationRequests = state.verificationRequests;
                docsId = state.docsId;
              }
            },
            builder: (context, state) {
              return Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemCount: verificationRequests.length,
                itemBuilder: (context, index) {
                  return userComponentProcess(
                      context: context,
                      index: index,
                      verificationRequest: verificationRequests[index],
                      docId: docsId[index]);
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget userComponentProcess(
      {required BuildContext context,
      required int index,
      required AccVerificationModel verificationRequest,
      required String docId}) {
    BlocProvider.of<GetUserInformationCubit>(context)
        .getUserInformationByEmail(email: verificationRequest.userEmail);
    return UserComponentToVerification(
      index: index,
      docId: docId,
      verificationRequest: verificationRequest,
    );
  }
}

class UserComponentToVerification extends StatefulWidget {
  const UserComponentToVerification({
    super.key,
    required this.index,
    required this.docId,
    required this.verificationRequest,
  });
  final int index;
  final AccVerificationModel verificationRequest;
  final String docId;

  @override
  State<UserComponentToVerification> createState() =>
      _UserComponentToVerificationState();
}

class _UserComponentToVerificationState
    extends State<UserComponentToVerification> {
  List<UserModel> users = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserInformationCubit, GetUserInformationState>(
      listener: (context, state) {
        if (state is GetUserInformationSuccess) {
          users.add(state.user);
        } else if (state is GetUserInformationLoading) {
          users = [];
        }
      },
      builder: (context, state) {
        return users.length > widget.index
            ? UserComponent(
                colorButton: AppColor.kPrimary,
                nameButton: AppString.textView,
                user: users[widget.index],
                onTapRequest: () {
                  showDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (context) => Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 4,
                          child: AccountVerificationRequestDetailsPage(
                              docId: widget.docId,
                              user: users[widget.index],
                              image: widget.verificationRequest.image),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                      ],
                    ),
                  );
                })
            : const SizedBox();
      },
    );
  }
}
