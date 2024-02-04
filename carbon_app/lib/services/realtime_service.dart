import 'package:firebase_database/firebase_database.dart';
import 'package:carbon_app/user.dart';

class FirebaseDatabaseService {
  final DatabaseReference usersReference =
      FirebaseDatabase.instance.reference().child('users');

  Future<void> addUser(User user) async {
    try {
      await usersReference.child(user.uid).set({
        'name': user.name,
        'uid': user.uid,
        'money': user.money,
        'co2': user.co2,
      });
      print('User added successfully');
    } catch (e) {
      print('Error adding user: $e');
      throw e;
    }
  }

  Future<void> addNewUser(String uid) async {
    try {
      await usersReference.child(uid).set({
        'name': "default",
        'uid': uid,
        'money': 0,
        'co2': 0,
      });
      print('User added successfully');
    } catch (e) {
      print('Error adding user: $e');
      throw e;
    }
  }

  Future<void> updateMoney(String userId, double newMoney) async {
    try {
      await usersReference.child(userId).update({'money': newMoney});
      print('Money updated successfully');
    } catch (e) {
      print('Error updating money: $e');
      throw e;
    }
  }

  Future<void> updateCO2(String userId, double newCo2) async {
    try {
      await usersReference.child(userId).update({'co2': newCo2});
      print('CO2 updated successfully');
    } catch (e) {
      print('Error updating CO2: $e');
      throw e;
    }
  }
}
