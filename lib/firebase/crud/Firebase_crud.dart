import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:provider/provider.dart';

import '../../provider/customer_admin_provider.dart';

class FirebaseCrud {
  String? _parentId;
  String? get parentId => _parentId;
  void setParentId(value) {
    _parentId = value;
  }

  String? _stdId;
  String? get stdId => _stdId;
  void setStudentId(value) {
    _stdId = value;
  }

  var _fireStoreCollection = FirebaseFirestore.instance;
  Future setDocumentData(Map<String, dynamic> data, String collectionPath, id) async {
    _fireStoreCollection.collection(collectionPath).doc(id).set(data);
  }

  Future regesterUserInFireAuth(
      TextEditingController stdEmailController, TextEditingController stdPasswordController, context) async {
    try {
      var studentProvider = Provider.of<CustomerAdminProvider>(context, listen: false);
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: stdEmailController.text.toString(), password: stdPasswordController.text.toString());
      String userId = userCredential.user!.uid.toString();
      studentProvider.setUserUUId(userId);

      // ignore: use_build_context_synchronously
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
      // ignore: empty_catches
    } catch (e) {}
  }

  Future regesterParent(
      TextEditingController parentEmailController, TextEditingController parentPasswordController) async {
    try {
      // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: stdEmailController.text.toString(), password: stdPasswordController.text.toString());
      // String userId = userCredential.user!.uid.toString();
      // setParentId(userId);
      // ignore: use_build_context_synchronously
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
      // ignore: empty_catches
    } catch (e) {}
  }

  static Future<bool> checkDuplicateData(String fieldName, String value, String collection) async {
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection(collection);

    final QuerySnapshot snapshot = await collectionReference.where(fieldName, isEqualTo: value).get();
    return snapshot.docs.isNotEmpty; // Returns true if any documents match the query
  }

  static Future<String> getNameById(String docId, String collection, String fieldName) async {
    //  var userProvider = Provider.of<AddUserProvider>(context, listen: false);
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection(collection);
    String name = '';
    await collectionReference.doc(docId).get().then((DocumentSnapshot docs) {
      final data = docs.data() as Map<String, dynamic>;
      name = data[fieldName].toString();
    });

    return name;
  }


}
