import 'package:favorite_places/screens/add_new_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class YourPlaces extends StatelessWidget {
  const YourPlaces({super.key});

  void _addPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const AddNewPlace();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Places',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _addPlace(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: PlacesList(),
        ));
  }
}
