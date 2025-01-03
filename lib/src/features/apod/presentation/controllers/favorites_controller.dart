import 'package:get/get.dart';

class FavoritesController extends GetxController with StateMixin {
  // final ApodRepository _repository;

  // final _apod = Rxn<Apod>();
  // Apod? get apod => _apod.value;
  // set apod(Apod? value) => _apod.value = value;

  // final _favorite = true.obs;
  // bool get favorite => _favorite.value;
  // set favorite(bool value) => _favorite.value = value;

  @override
  void onInit() {
    super.onInit();
    // getApod();
  }

  @override
  void dispose() {
    // _favorite.close();
    super.dispose();
  }
}
