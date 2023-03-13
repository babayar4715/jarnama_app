import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:jarnama_app/loading_serivice.dart';
import 'package:jarnama_app/model/product_model.dart';
import 'package:jarnama_app/services/storages_service.dart';
import 'package:jarnama_app/services/store_service.dart';

import '../../components/image_container.dart';
import '../../services/date_time_servise.dart';

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
    List<XFile> images = [];

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
          Imagecontainer(
            images: images,
            onPicked: (value) => images = value,
            onDelete: (v) => images.remove(v),
          ),
          const SizedBox(
            height: 12,
          ),
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
            onPressed: () async {
              LoadingService().showLoading(context);
              final urls = await StorageService().uploadImage(images);
              final product = Product(
                title: title.text,
                description: desc.text,
                dataTime: dateTime.text,
                phoneNumber: phone.text,
                userName: userName.text,
                address: address.text,
                images: urls,
                prices: price.text,
              );

              await StoreService().saveProduct(product);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.publish),
            label: const Text('Add to FireStore'),
          ),
        ],
      ),
    );
  }
}
