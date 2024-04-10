import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/screens/add_new_place.dart';
import 'package:favorite_places/screens/place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YourPlaces extends ConsumerStatefulWidget {
  const YourPlaces({super.key});

  @override
  ConsumerState<YourPlaces> createState() => _YourPlacesState();
}

class _YourPlacesState extends ConsumerState<YourPlaces> {
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
    final yourPlacesList = ref.watch(yourPlacesProvider);
    Widget content = Center(
      child: Text(
        'No places added yet.',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (yourPlacesList.isNotEmpty) {
      content = ListView.builder(
        itemCount: yourPlacesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              yourPlacesList[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PlaceDetails(yourPlacesList[index]),
                ),
              );
            },
          );
        },
      );
    }

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
        body: content);
  }
}
