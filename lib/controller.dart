import 'package:ch2_reactive_state_manager/model.dart';
import 'package:get/get.dart';

/// 실제적인 state management는 여기에서 이루어진다.
/// Reactive_state_manager방식에서는 GetX 와 Obx를 사용해서 observable(데이터 스트림)을 listen한다.

/// Controller에서 model객체 생성
class Controller extends GetxController{
  final person = Person().obs;    // obs는 Rx<T> return. Person객체를 observable상태로 만듬.
                                  // GetxController안에서 obs.객체로 만들었기 때문에 GetX와 Obx는 이것을 listen 하고잇음

  // person.update()와 update()는 다르다.
  void updateInfo() {
    person.update((val) {     // person.update는 person의 state 현재 값을 불러오는 메서드. -> person 객체의 state를 update하겠다는 의미
      val?.age++;     // updateInfo 메서드가 호출될때마다 나이를 1씩 증가 시키도록 함.
      val?.name = 'Coding Chef';
    });
  }
}