import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  //todo : get instance of firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // todo : get user stream
  /*<List<Map<String, dynamic>>>
  * {
  * 'email' : 'hamoud@gmail.com',
  * 'id ': '1',
  * } */
  Stream<List<Map<String, dynamic>>> getUserMessages() {
    return firestore.collection('users').snapshots().map((snapshots) {
      return snapshots.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

// todo : send message

// todo : get message
}
