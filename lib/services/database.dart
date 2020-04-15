import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ninja_brew_crew/models/brew.dart';
import 'package:ninja_brew_crew/models/user.dart';

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

  // User data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  // Get brew Stream

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // Get user doc Stream

  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
 