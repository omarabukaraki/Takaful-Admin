import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'send_notification_state.dart';

class SendNotificationCubit extends Cubit<SendNotificationState> {
  SendNotificationCubit() : super(SendNotificationInitial());

  CollectionReference notification =
      FirebaseFirestore.instance.collection('notification');
  Future<void> addNotification(
      {required String titleNotification,
      required String bodyNotification}) async {
    await notification.add({
      'titleNotification': titleNotification,
      'bodyNotification': bodyNotification,
      'userId': '0',
      'typeOfNotification': 'adminNotification',
      'acceptTime': DateTime.now(),
      'donarEmail': 'admin',
    });
  }
}
