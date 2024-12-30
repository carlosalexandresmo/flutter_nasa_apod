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

  final _favorite = true.obs;
  bool get favorite => _favorite.value;
  set favorite(bool value) => _favorite.value = value;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void dispose() {
    _favorite.close();
    super.dispose();
  }

  void setFavorite() {}

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    Future.wait([
      _getApod(),
    ])
        .then((value) => change(null, status: RxStatus.success()))
        .catchError((err) => change(err, status: RxStatus.error()));
  }

  Future<void> _getApod() async {
    change(null, status: RxStatus.loading());

    try {
      var result = await _repository.getApod();
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

    // final result = await _repository.getApod();
    // (l) {
    //   change(l, status: RxStatus.error());
    // };
    // (r) {
    //   apod = r;
    //   change(null, status: RxStatus.success());
    // };

    // final response = await _repository.;

    // await RequestUtils.load(action: () async {
    //   final response = await _repository.orders();
    //   _orders.assignAll(response);
    // }, onError: (err) {
    //   change(err, status: RxStatus.error());
    //   AppSnackBar.error('Erro:', err.message!);
    // }, onFinally: () {
    //   change(null, status: RxStatus.success());
    // });
  }
}
