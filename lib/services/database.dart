import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ninja_brew_crew/models/brew.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brew');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({"sugars": sugars, "name": name, "strength": strength});
  }

  // Brew List from Snapshot

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((d) {
      return Brew(
        name: d.data['name'] ?? '',
        sugars: d.data['sugars'] ?? '',
        strength: d.data['strength'] ?? 0,
      );
    }).toList();
  }

  // Get brew Stream

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
