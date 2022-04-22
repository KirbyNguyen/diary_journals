import 'package:diary_journals/databases/entry_database.dart';
import 'package:diary_journals/models/entry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final entryController = StateNotifierProvider<EntryProvider, List<Entry>>(
  (ref) => EntryProvider(ref: ref),
);

class EntryProvider extends StateNotifier<List<Entry>> {
  Ref ref;
  EntryProvider({required this.ref}) : super([]);

  void entryInit(String journalId) async {
    try {
      List<Map<String, Object?>> result =
          await ref.read(entryDatabaseProvider).getAllJournalEntry(journalId);
      state = [];
      for (var temp in result) {
        Entry tempEntry = Entry.fromJson(temp);
        state = [...state, tempEntry];
      }
    } catch (error) {
      // print(error);
    }
  }

  void entryDispose(String journalId) async {
    try {
      await ref.read(entryDatabaseProvider).deleteAllJournalEntry(journalId);
      state = [];
    } catch (error) {
      // print(error);
    }
  }

  void addEntry(Entry entry) async {
    try {
      int result = await ref.read(entryDatabaseProvider).insertEntry(entry);
      if (result != 0) {
        state = [...state, entry];
      }
    } catch (error) {
      // print(error);
    }
  }

  void updateEntry(Entry entry) async {
    try {
      await ref.read(entryDatabaseProvider).updateEntry(entry);
      int index = state.indexWhere((element) => element.id == entry.id);
      state[index] = entry;
    } catch (error) {
      // print(error);
    }
  }

  void deleteEntry(String id) async {
    try {
      await ref.read(entryDatabaseProvider).deleteEntry(id);
      state = [
        for (final entry in state)
          if (entry.id != id) entry,
      ];
    } catch (error) {
      // print(error);
    }
  }
}
