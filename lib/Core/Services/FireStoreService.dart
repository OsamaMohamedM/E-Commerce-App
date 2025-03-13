import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Core/Services/DataBaseService.dart';


class FirestoreService extends DataBaseService {


   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 
  @override
  Future<void> addData(String path, Map<String, dynamic> data)async 
  => await firebaseFirestore.collection(path).add(data);
  

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
  
}