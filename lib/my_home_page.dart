import 'package:flutter/material.dart';
import 'package:focus_node/utils/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus Node"),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value){
              MyUtils.fieldFocusChange(context,focusNode1,focusNode2);
            },
            focusNode: focusNode1,
          ),
          TextField(
            onSubmitted: (v){
              MyUtils.fieldFocusChange(context,focusNode2,focusNode3);
            },
            focusNode: focusNode2,
          ),
          TextField(
            onSubmitted: (v){
              MyUtils.fieldFocusChange(context,focusNode3,focusNode4);
            },
            focusNode: focusNode3,
          ),
          TextField(
            onSubmitted: (v){
              focusNode4.unfocus();
            },
            focusNode: focusNode4,
          ),
        ],
      ),
    );
  }



}
