import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen2(),
    );
  }
}

class MyScreen2 extends StatefulWidget {
  const MyScreen2({Key? key}) : super(key: key);

  @override
  State<MyScreen2> createState() => _MyScreen2State();
}

class _MyScreen2State extends State<MyScreen2> {
  var subjectname;
  List<String> subjectlist = [];
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: subjectlist.length,
          itemBuilder: (context, index3) {
            return ListTile(
              leading: Icon(Icons.edit),
              title: Text(subjectlist[index3]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await DialogUtils.showEditingDialog(context, subjectname);
          setState(() {
            subjectname = result ?? subjectname;
            subjectlist.add(subjectname);
          });
        },
        child: Text("追加"),
      ),
    );
  }
}

class DialogUtils {
  DialogUtils._();

  static Future<void> showOnlyTitleDialog(
    BuildContext context,
    String title,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
        );
      },
    );
  }

  static Future<String?> showEditingDialog(
    BuildContext context,
    String text,
  ) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return TextEditingDialog(text: text);
      },
    );
  }
}

class TextEditingDialog extends StatefulWidget {
  const TextEditingDialog({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  State<TextEditingDialog> createState() => _TextEditingDialogState();
}

class _TextEditingDialogState extends State<TextEditingDialog> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.text = widget.text ?? '';
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          controller.selection = TextSelection(
              baseOffset: 0, extentOffset: controller.text.length);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextFormField(
        autofocus: true,
        focusNode: focusNode,
        controller: controller,
        onFieldSubmitted: (_) {
          Navigator.of(context).pop(controller.text);
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
          child: const Text('完了'),
        )
      ],
    );
  }
}
