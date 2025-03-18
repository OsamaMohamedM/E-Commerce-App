import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';

class FirestoreService extends DataBaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(String path, Map<String, dynamic> data) async =>
      await firebaseFirestore.collection(path).add(data);

  @override
Future<void> updateData(String path, String id, Map<String, dynamic> data) {
  // TODO: implement updateData
  throw UnimplementedError();
}

  @override
  Future<void> deleteData(String path, String id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getData(String path) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getDocument(String path, String id) {
    // TODO: implement getDocument
    throw UnimplementedError();
  }

  @override
  Future<UserData> getUserData({required String path, required String uid})async {
    UserData userData =await firebaseFirestore.collection(path).doc(uid).get().then((value) {
      return UserData.fromJson(value.data()!);
    });
    return userData;
  }
}
