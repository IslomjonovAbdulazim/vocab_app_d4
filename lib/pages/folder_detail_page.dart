import 'package:budget_tracker_app_d4/models/folder_model.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
