import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:diary_journals/controllers/user_provider.dart';
import 'package:diary_journals/pages/entry_list_page.dart';
import 'package:diary_journals/pages/user_auth_page.dart';

class AppWrapper extends HookConsumerWidget {
  const AppWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    if (user != null) {
      return const EntryListPage();
    } else {
      return const UserAuthPage();
    }
  }
}
