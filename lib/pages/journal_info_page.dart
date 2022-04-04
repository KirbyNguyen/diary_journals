import 'package:diary_journals/models/journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JournalInfoPage extends HookConsumerWidget {
  final Journal? journal;
  const JournalInfoPage({Key? key, this.journal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalInfoKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final nameTextEditingController =
        useTextEditingController(text: journal != null ? journal!.name : "");
    final isPrivate =
        useState<bool>(journal != null ? journal!.isPrivate : false);
    final passwordTextEditingController = useTextEditingController(
        text: journal != null ? journal!.password : "");
    final passwordHidden = useState<bool>(true);
    final currentColor = useState<Color>(
      journal != null ? Color(journal!.colorValue) : Colors.blue,
    );
    final pickerColor = useState<Color>(
      journal != null ? Color(journal!.colorValue) : Colors.blue,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(journal != null ? journal!.name : "Create Journal"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
        child: SingleChildScrollView(
          child: Form(
            key: journalInfoKey.value,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  controller: nameTextEditingController,
                  decoration: const InputDecoration(
                    hintText: "Name",
                    icon: Icon(Icons.text_fields),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Row(
                  children: <Widget>[
                    const Text("Require password?"),
                    Radio<bool>(
                      value: true,
                      groupValue: isPrivate.value,
                      onChanged: (value) => isPrivate.value = value!,
                    ),
                    const Text("True"),
                    Radio<bool>(
                      value: false,
                      groupValue: isPrivate.value,
                      onChanged: (value) => isPrivate.value = value!,
                    ),
                    const Text("False"),
                  ],
                ),
                TextFormField(
                  autocorrect: false,
                  enabled: isPrivate.value,
                  obscureText: passwordHidden.value,
                  controller: passwordTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () => passwordHidden.value = !passwordHidden.value,
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
                ElevatedButton(
                  child: const Text("PICK COLOR"),
                  style: ElevatedButton.styleFrom(
                    primary: currentColor.value,
                  ),
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Pick a color!"),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: pickerColor.value,
                              onColorChanged: (Color color) {
                                pickerColor.value = color;
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text("CHOOSE"),
                              onPressed: () {
                                currentColor.value = pickerColor.value;
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ElevatedButton(
                  child: Text(journal != null ? "EDIT" : "CREATE"),
                  style: ElevatedButton.styleFrom(
                    primary: journal != null ? Colors.orange : Colors.blue,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
