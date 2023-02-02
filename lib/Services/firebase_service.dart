import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUser() async {
  List user = [];
  CollectionReference collectionReferenceUser = db.collection('user');

  QuerySnapshot queryUser = await collectionReferenceUser.get();
  for (var element in queryUser.docs) { 
    user.add(element.data());
  }
  return user;
}
