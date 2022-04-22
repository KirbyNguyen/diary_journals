import 'package:diary_journals/models/entry.dart';
import 'package:diary_journals/models/journal.dart';
import 'package:flutter/material.dart';

class EntryReadPage extends StatelessWidget {
  final Entry entry;
  final Journal journal;
  const EntryReadPage({Key? key, required this.entry, required this.journal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(journal.colorValue),
        title: Text(entry.title),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                entry.dateTime.toString().substring(0, 10),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Content",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                entry.content,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
