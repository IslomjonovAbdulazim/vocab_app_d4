import 'package:flutter/material.dart';

class NewVocabPage extends StatefulWidget {
  const NewVocabPage({super.key});

  @override
  State<NewVocabPage> createState() => _NewVocabPageState();
}

class _NewVocabPageState extends State<NewVocabPage> {
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
