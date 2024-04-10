import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/place.dart';

class YourPlacesNotifier extends StateNotifier<List<Place>> {
  YourPlacesNotifier() : super([]);

  void addPlace(Place place) {
    state = [...state, place];
  }
}

final yourPlacesProvider =
    StateNotifierProvider<YourPlacesNotifier, List<Place>>((ref) {
  return YourPlacesNotifier();
});
