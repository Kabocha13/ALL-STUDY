import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      "現在設定できる項目はありません。実装をお楽しみに！",
      style: TextStyle(
        color: Colors.red,
      ),
    )));
  }
}
