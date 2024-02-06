import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class saveLoad {
  final databaseReference2 = FirebaseDatabase.instance.reference();
  Future<void> generalSave(
      String collection, String document, Map<String, dynamic> data) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    print('generalSave');
    QuerySnapshot ref = await firestore.collection(collection).get();
    DocumentReference newRef = firestore.collection(collection).doc(document);
    await newRef.set(data);
  }

  Future<Map<String, dynamic>?> generalLoad(
      String collection, String document, String identifier) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference newRef = firestore.collection(collection).doc(document);
    DocumentSnapshot snapshot = await newRef.get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      print(data.toString());
      newRef.set(data);
      return data;
    }

    // Return null if the document does not exist
    return null;
  }

  void writeToHomeNotes(String notes) {
    databaseReference2.child('homeId').set({'notes': notes});
  }
  Future<String> readFromHomeNotes(homeId) async {
    String ret = '';

    var databaseReference = FirebaseDatabase.instance.reference().child('homes').child(homeId).child('notes');

    // Get the data snapshot asynchronously
    DatabaseEvent dbEvent = await databaseReference.once();
    if(dbEvent.snapshot != null){
      ret = dbEvent.snapshot.value.toString();
    }
    return ret;
  }


  Future<String> listenToHomeNotes(String homeId) async {
    databaseReference2.child(homeId).onValue.listen((event) {});
    return databaseReference2.child('homeId').child('notes').toString();
  }
}
