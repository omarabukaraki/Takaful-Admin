import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/features/generate_analitices/data/request_model.dart';
part 'get_request_state.dart';

class GetRequestCubit extends Cubit<GetRequestState> {
  GetRequestCubit() : super(GetRequestInitial());
  CollectionReference requests =
      FirebaseFirestore.instance.collection('requests');

  void getRequestToAnalytics() {
    try {
      requests.snapshots().listen((event) {
        List<RequestModel> requestData = [];
        for (var doc in event.docs) {
          requestData.add(RequestModel.fromJson(doc));
        }
        emit(GetRequestSuccess(requestsList: requestData));
      });
    } catch (e) {}
  }
}
