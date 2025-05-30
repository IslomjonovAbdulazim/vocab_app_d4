import 'package:flutter/material.dart';

class FolderDetailPage extends StatefulWidget {
  const FolderDetailPage({super.key});

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
