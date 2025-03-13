abstract class DataBaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<void> updateData(String path, String id, Map<String, dynamic> data);
  Future<void> deleteData(String path, String id);
  Future<List<Map<String, dynamic>>> getData(String path);
  Future<Map<String, dynamic>> getDocument(String path, String id);
}