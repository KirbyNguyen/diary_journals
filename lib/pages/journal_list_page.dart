import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:diary_journals/models/journal.dart';
import 'package:diary_journals/pages/entry_list_page.dart';
import 'package:diary_journals/pages/journal_info_page.dart';
import 'package:diary_journals/controllers/entry_controller.dart';
import 'package:diary_journals/controllers/journal_controller.dart';

class JournalListPage extends HookConsumerWidget {
  const JournalListPage({Key? key}) : super(key: key);

  Future<void> showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    Journal journal,
  ) async {
    final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();

    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: passwordKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter the password"),
                    TextFormField(
                      obscureText: true,
                      controller: controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
              title: const Text("Password require"),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "CANCEL",
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFE4A49),
                  ),
                  onPressed: () {
                    if (passwordKey.currentState!.validate()) {
                      if (controller.text == journal.password) {
                        ref.watch(journalController.notifier).deleteJournal(
                              journal.id,
                            );
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text(
                    "DELETE",
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> showEditDialog(
    BuildContext context,
    WidgetRef ref,
    Journal journal,
  ) async {
    final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();

    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: passwordKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter the password"),
                    TextFormField(
                      controller: controller,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
              title: const Text("Password require"),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "CANCEL",
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 196, 0),
                  ),
                  onPressed: () {
                    if (passwordKey.currentState!.validate()) {
                      if (controller.text == journal.password) {
                        Navigator.of(context).pop();
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => JournalInfoPage(
                              journal: journal,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "EDIT",
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> showConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    Journal journal,
  ) async {
    final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();

    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: passwordKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter the password"),
                    TextFormField(
                      controller: controller,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
              title: const Text("Password require"),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "CANCEL",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (passwordKey.currentState!.validate()) {
                      if (controller.text == journal.password) {
                        ref
                            .watch(entryController.notifier)
                            .entryInit(journal.id);
                        Navigator.of(context).pop();
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => EntryListPage(
                              journal: journal,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "CONFIRM",
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

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
                  onPressed: (context) async {
                    if (ref.read(journalController)[index].isPrivate != 0) {
                      showDeleteDialog(
                          context, ref, ref.read(journalController)[index]);
                    } else {
                      ref.watch(journalController.notifier).deleteJournal(
                            ref.read(journalController)[index].id,
                          );
                    }
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: "Delete",
                ),
                SlidableAction(
                  onPressed: (context) {
                    if (ref.read(journalController)[index].isPrivate != 0) {
                      showEditDialog(
                          context, ref, ref.read(journalController)[index]);
                    } else {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => JournalInfoPage(
                            journal: ref.watch(journalController)[index],
                          ),
                        ),
                      );
                    }
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
                  onPressed: (context) async {
                    if (ref.read(journalController)[index].isPrivate != 0) {
                      showDeleteDialog(
                          context, ref, ref.read(journalController)[index]);
                    } else {
                      ref.watch(journalController.notifier).deleteJournal(
                            ref.read(journalController)[index].id,
                          );
                    }
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: "Delete",
                ),
                SlidableAction(
                  onPressed: (context) {
                    if (ref.read(journalController)[index].isPrivate != 0) {
                      showEditDialog(
                          context, ref, ref.read(journalController)[index]);
                    } else {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => JournalInfoPage(
                            journal: ref.watch(journalController)[index],
                          ),
                        ),
                      );
                    }
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
                if (ref.read(journalController)[index].isPrivate != 0) {
                  showConfirmDialog(
                      context, ref, ref.read(journalController)[index]);
                } else {
                  ref
                      .watch(entryController.notifier)
                      .entryInit(ref.watch(journalController)[index].id);
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => EntryListPage(
                        journal: ref.watch(journalController)[index],
                      ),
                    ),
                  );
                }
              },
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
