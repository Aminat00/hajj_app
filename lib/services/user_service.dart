import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hajj_app/models/agenda_task.dart';

class UserService {
  static Future<List<AgendaTask>> fetchAgenda(String userId) async {
    await Future.delayed(Duration(seconds: 2));
    List<AgendaTask> taskList = [];
    final ref = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
        .ref();
    final snapshot = await ref.child('user_data/$userId/agenda').get();
    if (snapshot.exists) {
      final json = jsonEncode(snapshot.value);
      final response = jsonDecode(json);
      if (response is List) {
        final json = response as List<Object?>;
        json.forEach((element) {
          if (element != null) taskList.add(AgendaTask.fromJson(element as Map<String, dynamic>));
        });
      }
    } else {
      print('No data available.');
    }

    return taskList;
  }

  static void removeTask(String userId, int index) async {
    final ref = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
        .ref();

    ref.child('user_data/$userId/agenda/$index').remove();

    await Future.delayed(Duration(seconds: 2));
    final snapshot = await ref.child('user_data/$userId/agenda').get();
    if (snapshot.exists) {
      final json = jsonEncode(snapshot.value);
      final response = jsonDecode(json);
      if (response is List) {
        final json = response;
        json.removeWhere((element) => element == null);
        ref.child('user_data/$userId/agenda').set(json);
      }
    }
  }

  static void addTask(String userId, String header, String body) async {
    final postData = {
      'body': body,
      'header': header,
      'done': false,
      'favourite': false,
    };

    final ref = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
        .ref();

    int? newIndex;
    final snapshot = await ref.child('user_data/$userId/agenda').get();
    if (snapshot.exists) {
      final json = jsonEncode(snapshot.value);
      final response = jsonDecode(json);
      if (response is List) {
        final json = response as List<Object?>;
        newIndex = json.length;
      }
    }

    if (newIndex == null) return;

    final Map<String, Map> updates = {};
    updates['/user_data/$userId/agenda/$newIndex'] = postData;

    ref.update(updates);
  }

  static void updateTask({
    required String userId,
    required int index,
    required AgendaTask task,
  }) {
    final postData = {
      'body': task.body,
      'header': task.header,
      'done': task.done,
      'favourite': task.favourite,
    };

    final Map<String, Map> updates = {};
    updates['/user_data/$userId/agenda/$index'] = postData;

    final ref = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL: 'https://tawaf-9d0c4-default-rtdb.europe-west1.firebasedatabase.app')
        .ref();

    ref.update(updates);
  }
}
