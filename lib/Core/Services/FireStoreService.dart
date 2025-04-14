import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';

class FirestoreService extends DataBaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
 Future<void> addData(String path, Map<String, dynamic> data, {String? id}) async {
  final collection = firebaseFirestore.collection(path);
  
  if (id != null) {
    await collection.doc(id).set(data);
  } else {
    await collection.add(data);
  }
}

  @override
  Future<void> updateData(
      String path, String id, Map<String, dynamic> data) async {
    await firebaseFirestore.collection(path).doc(id).update(data).then((value) {
      print('Data updated successfully');
    }).catchError((error) {
      print('Failed to update data: $error');
    });
  }

  @override
  Future<void> deleteData(String path, String id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getData(String path) async {
    var data = await firebaseFirestore.collection(path).get();

    return data.docs.map((e) => e.data()).toList();
  }

  @override
  Future<Map<String, dynamic>> getDocument(String path, String id) async {
    var data = await firebaseFirestore.collection(path).doc(id).get();
    return data.data() ?? {};
  }

  @override
  Future<UserData> getUserData(
      {required String path, required String uid}) async {
    log(uid);
    UserData userData =
        await firebaseFirestore.collection(path).doc(uid).get().then((value) {
      return UserData.fromJson(value.data()!);
    });
    return userData;
  }
}
