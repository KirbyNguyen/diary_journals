import 'package:diary_journals/pages/journal_info_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:diary_journals/controllers/journal_controller.dart';

class JournalListPage extends ConsumerWidget {
  const JournalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed("/journal/info");
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: ref.watch(journalController).length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ref
                        .watch(journalController.notifier)
                        .deleteJournal(ref.watch(journalController)[index].id);
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
                        builder: (BuildContext context) => JournalInfoPage(
                          journal: ref.watch(journalController)[index],
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
                        .watch(journalController.notifier)
                        .deleteJournal(ref.watch(journalController)[index].id);
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
                        builder: (BuildContext context) => JournalInfoPage(
                          journal: ref.watch(journalController)[index],
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
              onTap: () {},
              child: ListTile(
                trailing: ref.watch(journalController)[index].isPrivate == 1
                    ? Icon(
                        Icons.lock,
                        color: Color(
                            ref.watch(journalController)[index].colorValue),
                      )
                    : Icon(
                        Icons.lock_open,
                        color: Color(
                            ref.watch(journalController)[index].colorValue),
                      ),
                title: Text(
                  ref.watch(journalController)[index].name,
                  style: TextStyle(
                    color:
                        Color(ref.watch(journalController)[index].colorValue),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
