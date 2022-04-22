import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:diary_journals/app_wrapper.dart';

import 'package:diary_journals/pages/settings_page.dart';
import 'package:diary_journals/pages/journal_info_page.dart';
import 'package:diary_journals/pages/journal_list_page.dart';
import 'package:diary_journals/pages/user_auth_page.dart';
import 'package:diary_journals/pages/user_create_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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
        initialRoute: "/",
        routes: {
          "/": (context) => const AppWrapper(),
          "/settings": (context) => const SettingsPage(),
          "/user/auth": (context) => const UserAuthPage(),
          "/user/create": (context) => const UserCreatePage(),
          "/journal/list": (context) => const JournalListPage(),
          "/journal/info": (context) => const JournalInfoPage(),
        });
  }
}
