import '../../features/Auth/Data/entity/User.dart';

abstract class DataBaseService {
  Future<void> addData(String path, Map<String, dynamic> data , {String? id});
  Future<void> updateData(String path, String id, Map<String, dynamic> data);
  Future<void> deleteData(String path, String id);
  Future<List<Map<String, dynamic>>> getData(String path);
  Future<Map<String, dynamic>> getDocument(String path, String id);
  Future<UserData> getUserData({required String path, required String uid});
}
