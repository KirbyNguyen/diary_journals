import 'package:diary_journals/databases/user_database.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:diary_journals/models/user.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserCreatePage extends HookConsumerWidget {
  const UserCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCreateFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final nameTextEditingController = useTextEditingController(text: "");
    final passwordTextEditingController = useTextEditingController(text: "");
    final confirmPasswordTextEditingController =
        useTextEditingController(text: "");
    final passwordHidden = useState<bool>(true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create User"),
      ),
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
                key: userCreateFormKey.value,
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
                    TextFormField(
                      autocorrect: false,
                      obscureText: passwordHidden.value,
                      controller: confirmPasswordTextEditingController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        hintText: "Confirm Password",
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
                        if (value != passwordTextEditingController.text) {
                          return 'Please make sure this field is the same as password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      child: const Text("CREATE USER"),
                      onPressed: () async {
                        if (userCreateFormKey.value.currentState!.validate()) {
                          User newUser = User(
                            id: const Uuid().v4(),
                            name: nameTextEditingController.text,
                            password: passwordTextEditingController.text,
                          );

                          try {
                            int result = await ref
                                .read(userdatabaseProvider)
                                .insertUser(newUser);
                            print(result);
                          } catch (error) {
                            print(error);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
