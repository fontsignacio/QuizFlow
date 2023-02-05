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

  Future<void> updateStadistics(int points, int hits, int fails) async {
    await db.collection("stadistics")
      .doc('1h01pKqWOMxuyvgpGFjP').update({
        "points": points,
        "hits" : hits,
        "fails" : fails
      }
    );
  }

}

/*

/*
Stream<List<Stadistics>> readStadistics() => FirebaseFirestore.instance
      .collection('stadistics')
      .snapshots()
      .map((snapshot) => 
          snapshot.docs.map((doc) => Stadistics.fromJson(doc.data())).toList());   
*/

// Update
Future<void> updateStadistics(String points, String hits, String fails) async {
  await db.collection("Stadistics").doc(hits).set({"points": points});
}




// Read
Future<List> getStadistics() async {
  List stadistics = [];
  QuerySnapshot querySnapshot = await db.collection('Stadistics').get();
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map stadistic = {
      "points": data["points"],
      "hits": data["hits"],
      "fails": data["fails"],
    };

    stadistics.add(stadistic);
  }
  return stadistics;
}*/
