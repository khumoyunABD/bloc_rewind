import 'package:bloc_rewind/api_app/data/model/post.dart';
import 'package:bloc_rewind/api_app/data/provider/post_provider.dart';

abstract class IPostRepository {
  Future<Post> getPosts();
}

class PostRepository implements IPostRepository {
  final PostProvider postProvider;
  PostRepository(this.postProvider);

  @override
  Future<Post> getPosts() {
    return postProvider.getPosts();
  }
}
