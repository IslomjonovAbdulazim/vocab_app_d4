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
  result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return result;
}

Future<void> saveAllFolders(List<FolderModel> folders) async {
  final jsonList = folders.map((model) => model.toJson()).toList();
  final data = jsonEncode(jsonList);
  final db = await SharedPreferences.getInstance();
  await db.setString("folders", data);
}

Future<void> createFolder(FolderModel folder) async {
  final allFolders = await getAllFolders();
  allFolders.add(folder);
  await saveAllFolders(allFolders);
}

Future<void> deleteFolder(FolderModel folder) async {
  final allFolders = await getAllFolders();
  allFolders.removeWhere((model) => model.createdAt == folder.createdAt);
  await saveAllFolders(allFolders);
}
