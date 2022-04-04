import 'package:diary_journals/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 15.0,
                  ),
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.logout, color: Colors.red),
                      Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  ref.watch(userController.notifier).logoutUser();
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
