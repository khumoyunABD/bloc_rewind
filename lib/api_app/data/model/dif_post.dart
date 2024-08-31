// // To parse this JSON data, do
// //
// //     final post = postFromJson(jsonString);

// import 'dart:convert';

// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Post {
//   int userId;
//   int id;
//   String title;
//   String body;
//   String link;
//   int commentCount;

//   Post({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.link,
//     required this.commentCount,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//         link: json["link"],
//         commentCount: json["comment_count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//         "link": link,
//         "comment_count": commentCount,
//       };
// }
