import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends ConsumerState<AddNewPlace> {
  String _enteredtitle = '';
  File? _selectedImage;

  void setImage(File file) {
    setState(() {
      _selectedImage = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            children: [
              TextFormField(
                maxLength: 60,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                onChanged: (value) {
                  _enteredtitle = value;
                },
              ),
              const SizedBox(height: 10),
              ImageInput(
                setImage: setImage,
              ),
              const SizedBox(height: 10),
              const LocationInput(),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (_enteredtitle.isEmpty || _selectedImage == null) {
                    return;
                  }

                  ref.read(yourPlacesProvider.notifier).addPlace(
                      Place(title: _enteredtitle, image: _selectedImage!));
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
