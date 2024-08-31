import 'package:bloc_rewind/api_app/data/model/post.dart';
import 'package:dio/dio.dart';

class PostProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api/"));
  Future<Post> getPosts() async {
    try {
      final response = await _dio.get("users");
      return postFromJson(response.toString());
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
