import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;

  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brew');


  Future updateUserData(String sugars,String name, int strength) async{
    return await brewCollection.document(uid).setData({
        "sugars" : sugars,
        "name" : name,
        "strength" : strength
    }); 
  }

  // Get brew Stream

  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }

}