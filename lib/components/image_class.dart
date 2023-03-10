import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesCard extends StatelessWidget {
  ImagesCard({
    super.key,
    required this.file,
    required this.delete,
  });

  final XFile file;

  final void Function(XFile) delete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        children: [
          Image.file(
            File(file.path),
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: () => delete(file),
              child: const Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
