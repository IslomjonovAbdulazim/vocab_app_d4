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


