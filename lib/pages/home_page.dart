import 'package:budget_tracker_app_d4/models/folder_model.dart';
import 'package:budget_tracker_app_d4/pages/folder_detail_page.dart';
import 'package:budget_tracker_app_d4/pages/new_folder_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FolderModel> folders = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    folders = await getAllFolders();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Folders"),
        actions: [
          CupertinoButton(
            onPressed: () async {
              await Get.to(NewFolderPage());
              load();
            },
            child: Icon(Icons.add, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ListView.builder(
              itemCount: folders.length,
              itemBuilder: (context, index) {
                final model = folders[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: CupertinoButton(
                    color: Colors.yellow,
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      await Get.to(FolderDetailPage(folder: model));
                      load();
                    },
                    child: ListTile(
                      title: Text(model.title),
                      subtitle: Row(
                        children: [
                          Text(DateFormat.yMMMMd().format(model.createdAt)),
                          Text(" at "),
                          Text(DateFormat.Hm().format(model.createdAt)),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${model.totalWords}",
                            style: TextStyle(fontSize: 18, height: 1),
                          ),
                          Text("Words"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
