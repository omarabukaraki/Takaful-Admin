import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:takaful_admin1/features/account_verification_request/data/acc_verificatoin_model.dart';

part 'get_verification_requests_state.dart';

class GetVerificationRequestsCubit extends Cubit<GetVerificationRequestsState> {
  GetVerificationRequestsCubit() : super(GetVerificationRequestsInitial());

  CollectionReference verificationRequests =
      FirebaseFirestore.instance.collection('verification requests');

  void getVerificationRequests() {
    emit(GetVerificationRequestsLoading());
    try {
      verificationRequests.snapshots().listen((event) {
        List<AccVerificationModel> verificationRequests = [];
        List<String> docsId = [];
        for (var doc in event.docs) {
          verificationRequests.add(AccVerificationModel.fromJson(doc));
          docsId.add(doc.id);
        }
        emit(GetVerificationRequestsSuccess(
            verificationRequests: verificationRequests, docsId: docsId));
      });
    } catch (e) {
      emit(GetVerificationRequestsFailure());
    }
  }
}
