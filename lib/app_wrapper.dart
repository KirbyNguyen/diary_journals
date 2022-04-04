import 'package:diary_journals/controllers/journal_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:diary_journals/controllers/user_controller.dart';
import 'package:diary_journals/pages/entry_list_page.dart';
import 'package:diary_journals/pages/user_auth_page.dart';

class AppWrapper extends HookConsumerWidget {
  const AppWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userController);

    if (user != null) {
      ref.watch(journalController.notifier).journalInit(user.id);
      return const EntryListPage();
    } else {
      return const UserAuthPage();
    }
  }
}
