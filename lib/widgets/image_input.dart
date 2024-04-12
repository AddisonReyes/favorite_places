import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.setImage});

  final void Function(File file) setImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  bool _imgSelected = false;

  void _takePicture(ImageSource imgSource) async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: imgSource, maxHeight: 600);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.setImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text('Take Picture'),
          onPressed: () => _takePicture(ImageSource.camera),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        TextButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text('Choose a Picture'),
          onPressed: () => _takePicture(ImageSource.gallery),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black.withOpacity(0.3),
            ),
          ),
        )
      ],
    );

    if (_selectedImage != null) {
      content = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );

      setState(() {
        _imgSelected = true;
      });
    }

    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        child: _imgSelected
            ? Stack(
                children: [
                  content,
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          icon: const Icon(Icons.camera),
                          label: const Text('Take Picture'),
                          onPressed: () => _takePicture(ImageSource.camera),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                        TextButton.icon(
                          icon: const Icon(Icons.camera),
                          label: const Text('Choose a Picture'),
                          onPressed: () => _takePicture(ImageSource.gallery),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.black.withOpacity(0.6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : content);
  }
}
