import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/repositories/apod_repository.dart';
import 'package:get/get.dart';

class ApodController extends GetxController with StateMixin {
  final ApodRepository _repository;

  ApodController(
    this._repository,
  );

  final _apod = Rxn<Apod>();
  Apod? get apod => _apod.value;
  set apod(Apod? value) => _apod.value = value;

  final _favorite = false.obs;
  bool get favorite => _favorite.value;
  set favorite(bool value) => _favorite.value = value;

  @override
  void onInit() {
    super.onInit();
    getApod();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> managerFavorite() async {
    await _repository.saveFavorite(apod!);
  }

  Future<void> getApod({DateTime? date}) async {
    change(null, status: RxStatus.loading());

    try {
      var result = await _repository.getApod(date: date);
      result.fold(
        (l) => throw l,
        (r) {
          apod = r;
          change(null, status: RxStatus.success());
        },
      );
    } catch (err) {
      change(err, status: RxStatus.error());
    }
  }
}
