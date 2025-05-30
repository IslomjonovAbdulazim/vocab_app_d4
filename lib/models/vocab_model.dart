import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'folder_model.dart';

class VocabModel {
  late String title;
  late String description;
  late DateTime createdAt;
  late DateTime folderId;
  late int corrects;
  late int wrongs;

  VocabModel({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.folderId,
    required this.corrects,
    required this.wrongs,
  });

  VocabModel.fromJson(Map json) {
    title = json["title"];
    description = json["description"];
    createdAt = DateTime.parse(json["createdAt"]);
    folderId = json["folderId"];
    corrects = json["corrects"];
    wrongs = json["wrongs"];
  }

  Map toJson() => {
        "title": title,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "folderId": folderId,
        "corrects": corrects,
        "wrongs": wrongs,
      };
}

Future<void> saveAllVocabs(List<VocabModel> vocabs) async {
  final jsonList = vocabs.map((model) => model.toJson()).toList();
  final data = jsonEncode(jsonList);
  final db = await SharedPreferences.getInstance();
  await db.setString("vocabs", data);
}

Future<List<VocabModel>> getAllVocabs() async {
  final db = await SharedPreferences.getInstance();
  final data = db.getString("vocabs") ?? "[]";
  final jsonList = List.from(jsonDecode(data));
  final result = jsonList.map((json) => VocabModel.fromJson(json)).toList();
  result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return result;
}

Future<void> addNewVocab(VocabModel vocab, FolderModel folder) async {
  final allVocabs = await getAllVocabs();
  allVocabs.add(vocab);
  await saveAllVocabs(allVocabs);
  final allFolders = await getAllFolders();
  folder.totalWords++;
  allFolders.removeWhere((model) => folder.createdAt == model.createdAt);
  allFolders.add(folder);
  await saveAllFolders(allFolders);
}

Future<void> deleteVocab(VocabModel vocab, FolderModel folder) async {
  final allVocabs = await getAllVocabs();
  allVocabs.removeWhere((model) => model.createdAt == vocab.createdAt);
  await saveAllVocabs(allVocabs);
  final allFolders = await getAllFolders();
  folder.totalWords--;
  allFolders.removeWhere((model) => folder.createdAt == model.createdAt);
  allFolders.add(folder);
  await saveAllFolders(allFolders);
}
