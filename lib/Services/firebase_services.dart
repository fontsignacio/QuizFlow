import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class FireStoreDataBase {
  List stadisticsList = [];
  final CollectionReference collectionRef = db.collection("stadistics");

   Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          stadisticsList.add(result.data());
        }
      });
      return stadisticsList;
    } catch (e) {
      return null;
    }
  }
}