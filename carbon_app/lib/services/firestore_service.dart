import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carbon_app/person.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String getID() {
    FirestoreService firestoreService = FirestoreService();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Access the UI
      return user.uid;
    } else {
      return ("");
    }
  }

  Future<void> addUserData(Person user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set({'money': user.money, 'co2': user.co2, 'name': user.name});
  }

  Future<void> addNewUser(String userId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .set({'money': 0, 'co2': 0, 'name': "default"});
  }

  Future<void> updateMoney(String userId, int newMoney) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .update({'money': newMoney});
  }

  Future<void> updateName(String userId, String name) async {
    await _firestore.collection('users').doc(userId).update({'name': name});
  }

  Future<void> updateCo2(String userId, int co2) async {
    await _firestore.collection('users').doc(userId).update({'co2': co2});
  }

  Future<List<Person>> getUsersSortedByCo2() async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();

    List<Person> users = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Person(
        uid: doc.id,
        money: data['money'] ?? 0,
        co2: data['co2'] ?? 0,
        name: data['name'] ?? 'default',
      );
    }).toList();

    // Sort the users based on co2 attribute
    users.sort((a, b) => b.co2.compareTo(a.co2));

    return users;
  }

  Future<Person?> getCurrentUser() async {
    User user = FirebaseAuth.instance.currentUser!;

    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        return Person(
          uid: user.uid,
          money: userData['money'] ?? 0,
          co2: userData['co2'] ?? 0,
          name: userData['name'] ?? 'default',
        );
      }
    }
    return null;
  }
}
