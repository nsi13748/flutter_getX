import 'package:ch2_reactive_state_manager/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({super.key});

  // MVC를 서로 연결 시켜줌
  // view에서 dependency injection 실행
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff89dad0),
              ),
              child: Center(
                child: GetX<Controller>(
                    builder: (_) => Text(
                          'Name: ${controller.person().name}', // person() 은 Rx 타입.
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff89dad0),
              ),
              child: Center(
                child: Obx(
                  () => Text(
                    'age: ${controller.person().age}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff89dad0),
              ),
              child: Center(
                child: GetX(
                  init: Controller(),
                  builder: (_) => Text(
                    'Age: ${Get.find<Controller>().person().age}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
