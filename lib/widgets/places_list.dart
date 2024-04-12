import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/widgets/place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yourPlacesList = ref.watch(yourPlacesProvider);
    if (yourPlacesList.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: yourPlacesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(yourPlacesList[index].image),
            ),
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
  }
}
