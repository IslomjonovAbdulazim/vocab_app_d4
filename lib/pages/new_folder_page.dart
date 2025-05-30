import 'package:flutter/material.dart';

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

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
