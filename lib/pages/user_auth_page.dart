import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserAuthPage extends StatefulHookConsumerWidget {
  const UserAuthPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAuthPageState();
}

class _UserAuthPageState extends ConsumerState<UserAuthPage> {
  @override
  Widget build(BuildContext context) {
    final nameTextEditingController = useTextEditingController(text: "");
    final passwordTextEditingController = useTextEditingController(text: "");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                      controller: nameTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "Name",
                      ),
                    ),
                    TextFormField(
                      controller: passwordTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("ACCESS JOURNALS"),
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
