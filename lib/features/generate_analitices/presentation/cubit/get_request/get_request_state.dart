part of 'get_request_cubit.dart';

abstract class GetRequestState {}

final class GetRequestInitial extends GetRequestState {}

final class GetRequestSuccess extends GetRequestState {
  List<RequestModel> requestsList;
  GetRequestSuccess({required this.requestsList});
}

final class GetRequestLoading extends GetRequestState {}

final class GetRequestFailure extends GetRequestState {}
