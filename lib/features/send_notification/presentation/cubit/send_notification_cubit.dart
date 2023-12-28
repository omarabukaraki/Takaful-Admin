import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:takaful_admin1/core/utils/app_contsants.dart';
part 'send_notification_state.dart';

class SendNotificationCubit extends Cubit<SendNotificationState> {
  SendNotificationCubit() : super(SendNotificationInitial());

  CollectionReference notification =
      FirebaseFirestore.instance.collection('notification');

  Future<void> addNotification({
    required String titleNotification,
    required String bodyNotification,
    required String donarEmail,
    required String typeOfNotification,
    required String userId,
  }) async {
    await notification.add({
      'titleNotification': titleNotification,
      'bodyNotification': bodyNotification,
      'userId': userId,
      'typeOfNotification': typeOfNotification,
      'acceptTime': DateTime.now().toString(),
      'donarEmail': donarEmail,
    });
  }

  Future<void> sendPushNotification({
    required String title,
    required String body,
    required String token,
    required BuildContext context,
    required String userId,
    required String typeOfNotification,
    required String donarEmail,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=${Constant.constantServerKey}',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': token,
          },
        ),
      );
      response;
      addNotification(
          titleNotification: title,
          bodyNotification: body,
          userId: userId,
          typeOfNotification: typeOfNotification,
          donarEmail: donarEmail);
    } catch (e) {
      e;
    }
  }
}
