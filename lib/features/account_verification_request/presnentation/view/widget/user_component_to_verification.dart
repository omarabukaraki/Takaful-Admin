import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../ban_user/data/user_model.dart';
import '../../../../ban_user/presentation/view/widgets/user_widget/user_component.dart';
import '../../../../manage_post_request/presentation/cubits/get_user_information_cubit/get_user_information_cubit.dart';
import '../../../../manage_post_request/presentation/cubits/get_user_information_cubit/get_user_information_state.dart';
import '../../../data/acc_verificatoin_model.dart';
import '../account_verification_request_details_page.dart';

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
