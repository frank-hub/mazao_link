import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mazao_link/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mazaoCollection =
      FirebaseFirestore.instance.collection('mazaolinkusers');

  Future updateUserData(String name,String email, int phone, String gender, String county,
      String address, String location , bool buyer , bool seller) async {
    return await mazaoCollection.doc(uid).set({
      'Full Name': name,
      'Email Address':email,
      'Phone Number': phone,
      'Gender': gender,
      'City': county,
      'Address': address,
      'Location': location,
      'Buyer' : buyer,
      'Seller' : seller

    });
  }


  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['Full Name']??'',
        email: snapshot.data()['Email Address'],
        county: snapshot.data()['City'] ?? '',
        location: snapshot.data()['Location'] ?? '',
        gender: snapshot.data()['Gender'] ?? '',
        phone: snapshot.data()['Phone Number']?? 0,
        address: snapshot.data()['Address'] ?? '');
  }

  //get user doc stream
  Stream<UserData> get userData {
    return mazaoCollection
        .doc(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
