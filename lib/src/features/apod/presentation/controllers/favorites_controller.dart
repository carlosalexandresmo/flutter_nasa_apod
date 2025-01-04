import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/repositories/apod_repository.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController with StateMixin {
  final ApodRepository _repository;

  FavoritesController(
    this._repository,
  );

  final RxList<Apod> _apods = RxList<Apod>();
  List<Apod> get apods => _apods.toList();

  // final RxList<Category> _selecteds = RxList<Category>();
  // set selecteds(List<Category> value) => _selecteds.value = value;
  // List<Category> get selecteds => _selecteds.toList();

  // final _apod = Rxn<Apod>();
  // Apod? get apod => _apod.value;
  // set apod(Apod? value) => _apod.value = value;

  // final _favorite = true.obs;
  // bool get favorite => _favorite.value;
  // set favorite(bool value) => _favorite.value = value;

  @override
  void onInit() {
    super.onInit();
    getApods();
  }

  @override
  void dispose() {
    _apods.close();
    super.dispose();
  }

  Future<void> getApods() async {
    change(null, status: RxStatus.loading());

    try {
      var result = await _repository.getFavorites();
      result.fold(
        (l) => throw l,
        (r) {
          _apods.assignAll(r);
          if (_apods.isNotEmpty) {
            change(null, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        },
      );
    } catch (err) {
      change(err, status: RxStatus.error());
    }
  }
}
