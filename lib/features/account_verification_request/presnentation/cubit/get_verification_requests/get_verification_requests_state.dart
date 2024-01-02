part of 'get_verification_requests_cubit.dart';

abstract class GetVerificationRequestsState {}

final class GetVerificationRequestsInitial
    extends GetVerificationRequestsState {}

final class GetVerificationRequestsSuccess
    extends GetVerificationRequestsState {
  List<AccVerificationModel> verificationRequests;
  List<String> docsId;
  GetVerificationRequestsSuccess(
      {required this.verificationRequests, required this.docsId});
}

final class GetVerificationRequestsLoading
    extends GetVerificationRequestsState {}

final class GetVerificationRequestsFailure
    extends GetVerificationRequestsState {}
