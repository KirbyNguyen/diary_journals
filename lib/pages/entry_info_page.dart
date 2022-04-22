import 'package:diary_journals/controllers/entry_controller.dart';
import 'package:diary_journals/models/entry.dart';
import 'package:diary_journals/models/journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class EntryInfoPage extends HookConsumerWidget {
  final Entry? entry;
  final Journal journal;
  const EntryInfoPage({Key? key, this.entry, required this.journal})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryInfoKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final titleTextEditingController =
        useTextEditingController(text: entry != null ? entry!.title : "");
    final contentTextEditingController =
        useTextEditingController(text: entry != null ? entry!.content : "");
    final currentDate = useState<DateTime>(entry?.dateTime ?? DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(journal.colorValue),
        title: const Text("Write an entry"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
        child: SingleChildScrollView(
          child: Form(
            key: entryInfoKey.value,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  controller: titleTextEditingController,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
                  child: GestureDetector(
                    child: Text(
                      currentDate.value.toString().substring(0, 10),
                    ),
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: currentDate.value,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      currentDate.value = date ?? currentDate.value;
                    },
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: contentTextEditingController,
                  decoration: const InputDecoration(
                    hintText: "Content",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: Text(entry != null ? "EDIT" : "CREATE"),
                  style: ElevatedButton.styleFrom(
                    primary: entry != null ? Colors.orange : Colors.blue,
                  ),
                  onPressed: () async {
                    if (entryInfoKey.value.currentState!.validate()) {
                      if (entry != null) {
                        Entry newEntry = entry!.copyWith(
                          title: titleTextEditingController.text,
                          content: contentTextEditingController.text,
                          dateTime: currentDate.value,
                        );
                        ref
                            .watch(entryController.notifier)
                            .updateEntry(newEntry);
                      } else {
                        Entry newEntry = Entry(
                          id: const Uuid().v4(),
                          journalId: journal.id,
                          title: titleTextEditingController.text,
                          content: contentTextEditingController.text,
                          dateTime: currentDate.value,
                        );
                        ref.watch(entryController.notifier).addEntry(newEntry);
                      }
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
