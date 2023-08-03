import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app1/model/note_model.dart';

class FBFireStore {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  // CRUD
  static Future<bool> create({required Note note}) async {
    return _firebaseFirestore
        .collection('Notes')
        .add(note.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  static Stream<QuerySnapshot> read() async* {
    yield* _firebaseFirestore.collection('Notes').snapshots();
  }

  static Future<bool> update({required Note note}) async {
    return _firebaseFirestore
        .collection('Notes')
        .doc(note.id)
        .update(note.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  static Future<bool> delete({required String path}) async {
    return _firebaseFirestore
        .collection('Notes')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }
}
