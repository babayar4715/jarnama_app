import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_text_field.dart';

class AppProductPage extends StatelessWidget {
  const AppProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final desc = TextEditingController();
    final dateTime = TextEditingController();
    final phone = TextEditingController();
    final userName = TextEditingController();
    final address = TextEditingController();
    final price = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppProductPage'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: title,
            hintText: "Title",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: desc,
            hintText: "Description",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: dateTime,
            hintText: "DateTime",
            focusNode: FocusNode(),
            onTap: () async {
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext builder) {
                    return Container(
                      height:
                          MediaQuery.of(context).copyWith().size.height * 0.25,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          dateTime.text = value.toString();
                        },
                        initialDateTime: DateTime.now(),
                        minimumYear: 2000,
                        maximumYear: 2100,
                      ),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: phone,
            hintText: "Phone Number",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: userName,
            hintText: "User Name ",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: address,
            hintText: " Address ",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: price,
            hintText: " Price ",
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.publish),
            label: const Text('Add to FireStore'),
          ),
        ],
      ),
    );
  }
}
