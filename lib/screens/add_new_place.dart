import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends ConsumerState<AddNewPlace> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
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
                  title = value;
                },
              ),
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(yourPlacesProvider.notifier).addPlace(Place(title));
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
