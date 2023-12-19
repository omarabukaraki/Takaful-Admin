import 'package:takaful_admin1/features/ban_user/data/user_model.dart';

abstract class GetUserInformationState {}

class GetUserInformationInitial extends GetUserInformationState {}

class GetUserInformationSuccess extends GetUserInformationState {
  UserModel user;
  GetUserInformationSuccess({required this.user});
}

class GetUserInformationLoading extends GetUserInformationState {}

class GetUserInformationFailure extends GetUserInformationState {}
