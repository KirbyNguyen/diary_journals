import 'package:diary_journals/pages/entry_info_page.dart';
import 'package:diary_journals/pages/entry_read_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:diary_journals/models/journal.dart';
import 'package:diary_journals/controllers/entry_controller.dart';
class EntryListPage extends HookConsumerWidget {
  final Journal journal;
  const EntryListPage({Key? key, required this.journal}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(journal.colorValue),
        title: Text(journal.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => EntryInfoPage(
                    entry: null,
                    journal: journal,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ref.watch(entryController).length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ref
                        .watch(entryController.notifier)
                        .deleteEntry(ref.watch(entryController)[index].id);
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: "Delete",
                ),
                SlidableAction(
                  onPressed: (context) {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => EntryInfoPage(
                          entry: ref.watch(entryController)[index],
                          journal: journal,
                        ),
                      ),
                    );
                  },
                  backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: "Edit",
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ref
                        .watch(entryController.notifier)
                        .deleteEntry(ref.watch(entryController)[index].id);
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: "Delete",
                ),
                SlidableAction(
                  onPressed: (context) {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => EntryInfoPage(
                          entry: ref.watch(entryController)[index],
                          journal: journal,
                        ),
                      ),
                    );
                  },
                  backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: "Edit",
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => EntryReadPage(
                      entry: ref.watch(entryController)[index],
                      journal: journal,
                    ),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  ref.watch(entryController)[index].title,
                ),
                trailing: Text(
                  ref
                      .watch(entryController)[index]
                      .dateTime
                      .toString()
                      .substring(0, 10),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
