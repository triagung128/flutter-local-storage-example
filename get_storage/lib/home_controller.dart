import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  RxInt _counter = 0.obs;

  final box = GetStorage();

  static const String counterKey = 'COUNTER KEY';

  void _saveCounter() {
    if (box.read(counterKey) != null) box.remove(counterKey);
    box.write(counterKey, _counter.value);
  }

  void increment() {
    _counter++;
    _saveCounter();
  }

  void decrement() {
    _counter--;
    _saveCounter();
  }

  void reset() {
    _counter.value = 0;
    _saveCounter();
  }

  RxInt loadCounter() {
    if (box.read(counterKey) != null) {
      _counter.value = box.read(counterKey) as int;
    } else {
      _counter.value = 0;
    }

    return _counter;
  }
}
