// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/category.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static var credntial = FirebaseAuth.instance;
  static Future<bool> register(String email, String password) async {
    try {
      await credntial.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      } else
        return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      await credntial.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      } else
        return false;
    }
  }

  static CollectionReference<EventModel> getCollectionRef() =>
      FirebaseFirestore.instance.collection("events").withConverter(
          fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
          toFirestore: (event, _) => event.toJson());

  static Future<void> addEventToFirestore(EventModel event) async {
    CollectionReference<EventModel> collectionref = getCollectionRef();
    DocumentReference<EventModel> doc = collectionref.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<EventModel>> getEventFromFireStore(
      String? categoryId) async {
    CollectionReference<EventModel> eventsCollection = getCollectionRef();
    QuerySnapshot<EventModel> query;
    if (categoryId == null) {
      query = await eventsCollection.orderBy("dateTime").get();
    } else {
      query = await eventsCollection
          .where("categoryId", isEqualTo: categoryId)
          .orderBy("dateTime")
          .get();
    }
    return query.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
}
