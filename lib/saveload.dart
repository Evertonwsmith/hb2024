// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:uxexplore/challengeModel.dart';
// import 'package:uxexplore/firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uxexplore/challengeModel.dart';
//
// class saveLoad {
//   Future<void> generalSave(
//       String collection, String document, Map<String, dynamic> data) async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     QuerySnapshot ref = await firestore.collection(collection).get();
//     DocumentReference newRef = firestore.collection(collection).doc(document);
//     await newRef.set(data);
//   }
//
//   Future<Map<String, dynamic>?> generalLoad(
//       String collection, String document, String identifier) async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     DocumentReference newRef = firestore.collection(collection).doc(document);
//     DocumentSnapshot snapshot = await newRef.get();
//
//     if (snapshot.exists) {
//       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//
//       print(data.toString());
//       newRef.set(data);
//       return data;
//     }
//
//     // Return null if the document does not exist
//     return null;
//   }}
//