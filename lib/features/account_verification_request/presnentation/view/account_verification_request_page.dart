import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
import 'package:takaful_admin1/features/account_verification_request/data/acc_verificatoin_model.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_user_information_cubit/get_user_information_cubit.dart';

import '../../../../core/helper/snak_bar.dart';
import '../cubit/get_verification_requests/get_verification_requests_cubit.dart';
import 'widget/user_component_to_verification.dart';

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
  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomSearchBar(
            hintText: AppString.textSearchInUsers,
            icon: Icon(Icons.search),
            //  onChanged: (searchValue) {
            //         BlocProvider.of<GetUsersCubit>(context)
            //             .getUsersBySearch(searchValue: searchValue);
            //       },
          ),
          BlocConsumer<GetVerificationRequestsCubit,
              GetVerificationRequestsState>(
            listener: (context, state) {
              if (state is GetVerificationRequestsSuccess) {
                verificationRequests = state.verificationRequests;
                docsId = state.docsId;
                isLoding = false;
              } else if (state is GetVerificationRequestsLoading) {
                isLoding = true;
              } else if (state is GetVerificationRequestsFailure) {
                isLoding = false;
                showSankBar(
                  context,
                  AppString.textErrorOccurredPleaseTryLater,
                );
              }
            },
            builder: (context, state) {
              return Expanded(
                child: BlurryModalProgressHUD(
                  inAsyncCall: isLoding,
                  progressIndicator: const SpinKitFadingCircle(
                      color: AppColor.kPrimary, size: 90.0),
                  dismissible: false,
                  opacity: 0.4,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                  ),
                ),
              );
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
