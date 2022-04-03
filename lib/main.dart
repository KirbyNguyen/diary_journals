import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:diary_journals/databases/database_helper.dart';

import 'package:diary_journals/pages/entry_info_page.dart';
import 'package:diary_journals/pages/entry_list_page.dart';
import 'package:diary_journals/pages/journal_info_page.dart';
import 'package:diary_journals/pages/journal_list_page.dart';
import 'package:diary_journals/pages/user_auth_page.dart';
import 'package:diary_journals/pages/user_create_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initDatabase();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Diary Entries",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/user",
        routes: {
          "/user": (context) => const UserAuthPage(),
          "/user/create": (context) => const UserCreatePage(),
          "/entry/list": (context) => const EntryListPage(),
          "/entry/info": (context) => const EntryInfoPage(),
          "/journal/list": (context) => const JournalListPage(),
          "/journal/info": (context) => const JournalInfoPage(),
        });
  }
}
