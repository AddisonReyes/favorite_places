import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/place.dart';

class YourPlacesNotifier extends StateNotifier<List<Place>> {
  YourPlacesNotifier() : super(const []);

  void addPlace(Place place) {
    state = [place, ...state];
  }
}

final yourPlacesProvider =
    StateNotifierProvider<YourPlacesNotifier, List<Place>>((ref) {
  return YourPlacesNotifier();
});
