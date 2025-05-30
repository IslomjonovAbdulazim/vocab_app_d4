import 'package:budget_tracker_app_d4/models/folder_model.dart';
import 'package:budget_tracker_app_d4/models/vocab_model.dart';
import 'package:budget_tracker_app_d4/pages/new_vocab_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FolderDetailPage extends StatefulWidget {
  final FolderModel folder;

  const FolderDetailPage({super.key, required this.folder});

  @override
  State<FolderDetailPage> createState() => _FolderDetailPageState();
}

class _FolderDetailPageState extends State<FolderDetailPage> {
  List<VocabModel> vocabs = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    vocabs = await getAllVocabs();
    vocabs.removeWhere((model) => model.folderId != widget.folder.createdAt);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vocabs"),
        actions: [
          CupertinoButton(
            onPressed: () async {
              await deleteFolder(widget.folder);
              Get.back();
            },
            child: Icon(CupertinoIcons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text(
                  widget.folder.title,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      DateFormat.yMMMMd().format(widget.folder.createdAt),
                    ),
                    Text(" at "),
                    Text(DateFormat.Hm().format(widget.folder.createdAt)),
                  ],
                ),
                SizedBox(height: 8),
                CupertinoButton(
                  color: Colors.yellow,
                  onPressed: () async {
                    await Get.to(NewVocabPage());
                    load();
                  },
                  child: Center(child: Text("New Vocab")),
                ),
                Divider(),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: vocabs.length,
                    itemBuilder: (context, index) {
                      final model = vocabs[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CupertinoButton(
                          color: Colors.yellow,
                          onPressed: () {},
                          child: ListTile(
                            title: Text(model.title),
                            subtitle: Text(model.description),
                            // todo continue
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
