import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  TextEditingController controller = TextEditingController();
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            onEditingComplete: () {
              setState(() {
                
              });
            },
          ),
          Text(controller.text),
          Checkbox(
            tristate: true,
            value: isCheck,
            onChanged: (bool? value) {
            setState(() {
              isCheck = value;
            });
          },),
          CheckboxListTile(
            tristate: true,
            title: Text("click here"),
            value: isCheck, 
            onChanged: (bool? value) {
            setState(() {
              isCheck = value;
            });},
            )
        ],
        
      ),
    );
  }
}