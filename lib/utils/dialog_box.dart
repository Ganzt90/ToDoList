import 'package:flutter/material.dart';
import 'package:to_do_list/utils/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSaved,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text:"Save",  onPressed: onSaved,),
                const SizedBox(width: 10,),
                MyButtons(text:"Cancel",  onPressed: onCancel,),
              ],
            )
          ],
        ),
      ),
    );
  }
}