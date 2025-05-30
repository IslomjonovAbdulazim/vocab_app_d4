import 'package:budget_tracker_app_d4/models/folder_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFolderPage extends StatefulWidget {
  const NewFolderPage({super.key});

  @override
  State<NewFolderPage> createState() => _NewFolderPageState();
}

class _NewFolderPageState extends State<NewFolderPage> {
  final nameController = TextEditingController();
  final nameFocus = FocusNode();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Folder Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    focusNode: nameFocus,
                    maxLength: 40,
                    onTapOutside: (value) => nameFocus.unfocus(),
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Folder Name...",
                    ),
                    validator: (value) {
                      final txt = value?.trim() ?? "";
                      if (txt.length < 3) {
                        return "Enter Folder Name";
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  CupertinoButton(
                    color: Colors.yellow,
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        final model = FolderModel(
                          title: nameController.text.trim(),
                          createdAt: DateTime.now(),
                          totalWords: 0,
                        );
                        await createFolder(model);
                        Get.back();
                      }
                    },
                    child: Center(child: Text("Save")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
