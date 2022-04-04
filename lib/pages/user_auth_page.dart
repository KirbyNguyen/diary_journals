import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:diary_journals/controllers/journal_controller.dart';
import 'package:diary_journals/controllers/user_controller.dart';

class UserAuthPage extends HookConsumerWidget {
  const UserAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAuthFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final nameTextEditingController = useTextEditingController(text: "");
    final passwordTextEditingController = useTextEditingController(text: "");
    final passwordHidden = useState<bool>(true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Center(
              child: Image.asset(
                "assets/images/temp_logo.png",
                height: 200,
                width: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.085,
              ),
              child: Form(
                key: userAuthFormKey.value,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autocorrect: false,
                      controller: nameTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "Name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autocorrect: false,
                      obscureText: passwordHidden.value,
                      controller: passwordTextEditingController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              passwordHidden.value = !passwordHidden.value,
                          child: passwordHidden.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      child: const Text("ACCESS JOURNALS"),
                      onPressed: () {
                        if (userAuthFormKey.value.currentState!.validate()) {
                          List<int> encodedName =
                              utf8.encode(nameTextEditingController.text);
                          Digest hashedName = sha1.convert(encodedName);
                          List<int> encodedPassword =
                              utf8.encode(passwordTextEditingController.text);
                          Digest hashedPassword = sha1.convert(encodedPassword);
                          
                          ref.watch(userController.notifier).authUser(
                                hashedName.toString(),
                                hashedPassword.toString(),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed("/user/create"),
              child: const Text(
                "Create new user",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
