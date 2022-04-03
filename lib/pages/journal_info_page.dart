import 'package:diary_journals/models/journal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JournalInfoPage extends HookConsumerWidget {
  final Journal? journal;
  const JournalInfoPage({Key? key, this.journal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
