import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/dependence_controller.dart';
import 'package:flutter_getx/src/dependence/get_lazyput.dart';
import 'package:flutter_getx/src/dependence/get_put.dart';
import 'package:get/get.dart';

class DependencyManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성 주입'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  //page 안에서 get put 을 썻다면 이건 page 이동할때 안고 간다
                  Get.put(
                      DependenceController()); //들어가는동시에 메모리 올리고 나갈때 메모리에 컨트롤러를 즉시 내려버린다
                }));
              },
              child: Text('Getput'),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(GetLazyPut(), binding: BindingsBuilder(() {
                  Get.lazyPut<DependenceController>(
                      () => //lazy put 은 빌더를 사용한다 시작할대 메모리 올리지않고
                          //컨트롤러를 사용할때 메모리에 올라가고 나갈때 즉시 메모리에서 내린다
                          DependenceController());
                }));
              },
              child: Text('get lazyput'),
            ),
            RaisedButton(
              child: Text('get async'),
              onPressed: () {
                Get.to(
                  GetPut(),
                  binding: BindingsBuilder(() {
                    Get.putAsync<DependenceController>(() async {
                      await Future.delayed(Duration(seconds: 5));
                      // put 과는 차이가 없지만 데이터를 받을때 즉 딜레이가 됬을때 메모리에 올린다
                      return DependenceController();
                    });
                  }),
                );
              },
            ),
            RaisedButton(
              onPressed: () {},
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
