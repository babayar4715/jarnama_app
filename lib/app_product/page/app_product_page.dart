import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/custom_text_field.dart';
import '../../services/date_time_servise.dart';

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
            maxLines: 4,
            controller: desc,
            hintText: "Descriptionnn",
          ),
          const SizedBox(
            height: 12,
          ),
          Container(width: double.infinity, decoration: BoxDecoration()),
          CustomTextField(
            controller: dateTime,
            hintText: "DateTime",
            focusNode: FocusNode(),
            onTap: () async {
              await DateTimeService.showDateTimePicker(
                context,
                (value) => dateTime.text = DateFormat("d MMM, y").format(value),
              );
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
