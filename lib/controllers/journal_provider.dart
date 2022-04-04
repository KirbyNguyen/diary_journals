import 'package:diary_journals/databases/journal_database.dart';
import 'package:diary_journals/models/journal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final journalProvider = StateNotifierProvider<JournalProvider, List<Journal>>(
  (ref) => JournalProvider(ref: ref),
);

class JournalProvider extends StateNotifier<List<Journal>> {
  Ref ref;
  JournalProvider({required this.ref}) : super([]);

  void journalInit(String uid) async {
    try {
      List<Map<String, Object?>> result =
          await ref.watch(journalDatabaseProvider).getAllUserJournal(uid);

      for (var temp in result) {
        Journal tempJournal = Journal.fromJson(temp);
        state = [...state, tempJournal];
      }
    } catch (error) {
      // print(error);
    }
  }

  void journalDispose(String uid) async {
    try {
      await ref.watch(journalDatabaseProvider).deleteAllUserJournal(uid);
      state = [];
    } catch (error) {
      // print(error);
    }
  }

  void addJournal(Journal journal) async {
    try {
      int result =
          await ref.watch(journalDatabaseProvider).insertJournal(journal);
      if (result != 0) {
        state = [...state, journal];
      }
    } catch (error) {
      // print(error);
    }
  }

  void updateJournal(Journal journal) async {
    try {
      await ref.watch(journalDatabaseProvider).updateJournal(journal);
      int index = state.indexWhere((element) => element.id == journal.id);
      state[index] = journal;
    } catch (error) {
      // print(error);
    }
  }

  void deleteJournal(String id) async {
    try {
      await ref.watch(journalDatabaseProvider).deleteJournal(id);
      state.removeWhere((element) => element.id == id);
    } catch (error) {
      // print(error);
    }
  }
}
