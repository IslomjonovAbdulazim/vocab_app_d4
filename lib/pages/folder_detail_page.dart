import 'package:budget_tracker_app_d4/models/folder_model.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
