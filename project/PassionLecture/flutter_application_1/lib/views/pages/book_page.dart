import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool isSwitched = false;
  bool? isCheck = false;
  String? menuItem;
  double slidervalue = 0.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton(
              value: menuItem,
              items: [
                DropdownMenuItem(
                  value: 'e1',
                  child: Text('Element 1'),
                ),
                DropdownMenuItem(
                  value: 'e2',
                  child: Text('Element 2'),
                ),
                DropdownMenuItem(
                  value: 'e3',
                  child: Text('Element 3'),
                ),
                DropdownMenuItem(
                  value: 'e4',
                  child: Text('Element 4'),
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  menuItem = value;
                });
              },
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () {
                setState(() {});
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
              },
            ),
            CheckboxListTile(
              tristate: true,
              title: Text("click here"),
              value: isCheck,
              onChanged: (bool? value) {
                setState(() {
                  isCheck = value;
                });
              },
            ),
            Switch(
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            SwitchListTile.adaptive(
              title: Text("Switch here"),
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            Slider(
              value: slidervalue,
              max: 100.0,
              divisions: 100,
              onChanged: (double value) {
                setState(() {
                  slidervalue = value;
                });
                print(slidervalue);
              },
            ),
            InkWell(
              splashColor: Colors.red,
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.white12,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text("Clic Me"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Clic Me"),
            ),
            FilledButton(
              onPressed: () {},
              child: Text("Clic Me"),
            ),
          ],
        ),
      ),
    );
  }
}
