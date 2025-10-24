import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onClickImage});
  final void Function(File image) onClickImage;

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _takenImage;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final clickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (clickedImage == null) return;
    setState(() {
      _takenImage = File(clickedImage.path);
    });
    widget.onClickImage(_takenImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: const Text('Take Picture'),
      icon: const Icon(Icons.camera),
    );
    if (_takenImage != null) {
      content = Container(
        height: 350,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.1,
            color: Theme.of(context).colorScheme.primary.withAlpha(40),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.file(
                _takenImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            TextButton.icon(
              onPressed: _takePicture,
              label: const Text('Click again'),
              icon: const Icon(Icons.camera),
            ),
          ],
        ),
      );
    }
    return content;
  }
}
