import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FolderModel {
  late String title;
  late DateTime createdAt;
  late int totalWords;

  FolderModel({
    required this.title,
    required this.createdAt,
    required this.totalWords,
  });

  FolderModel.fromJson(Map json) {
    title = json["title"];
    createdAt = DateTime.parse(json["createdAt"]);
    totalWords = json["totalWords"];
  }

  Map toJson() => {
    "title": title,
    "createdAt": createdAt.toIso8601String(),
    "totalWords": totalWords,
  };
}

Future<List<FolderModel>> getAllFolders() async {
  final db = await SharedPreferences.getInstance();
  final data = db.getString("folders") ?? "[]";
  final jsonList = List.from(jsonDecode(data));
  final result = jsonList.map((json) => FolderModel.fromJson(json)).toList();
  return result;
}











