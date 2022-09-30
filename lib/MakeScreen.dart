import 'package:flutter/material.dart';

class MakeScreen extends StatefulWidget {
  const MakeScreen({Key? key}) : super(key: key);

  @override
  State<MakeScreen> createState() => _MakeScreenState();
}

class _MakeScreenState extends State<MakeScreen> {
  List<String> titleList = ["数学", "情報", "英語"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index2) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text(titleList[index2]),
                ),
              ],
            );
          }),
    );
  }
}
