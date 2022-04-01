import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserCreatePage extends StatefulHookConsumerWidget {
  const UserCreatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends ConsumerState<UserCreatePage> {
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autocorrect: false,
                      controller: nameTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "Name",
                      ),
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
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("CREATE USER"),
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
