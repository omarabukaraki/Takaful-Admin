import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'manage_verification_account_state.dart';

class ManageVerificationAccountCubit
    extends Cubit<ManageVerificationAccountState> {
  ManageVerificationAccountCubit() : super(ManageVerificationAccountInitial());

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference verificationRequests =
      FirebaseFirestore.instance.collection('verification requests');

  Future<void> acceptVerification({required String userId}) async {
    try {
      await users.doc(userId).update({'isVerified': true});
    } catch (e) {
      e.toString();
    }
  }

  Future<void> rejectVerification({required String documentId}) async {
    try {
      await verificationRequests.doc(documentId).delete();
    } catch (e) {
      e.toString();
    }
  }
}
