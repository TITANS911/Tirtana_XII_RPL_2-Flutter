import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setelah_get_x/Home_Controller.dart';
import 'package:project_setelah_get_x/Second_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  color: Colors.white,
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/indec');
                          },
                          child: Text('Increase/Decrease')),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/listsc');
                          },
                          child: Text('List Screen'))
                    ],
                  ),
                ));
              },
              icon: Icon(Icons.edit_note_outlined))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: hc.namacontroller,
              decoration: InputDecoration(
                hintText: "Nama Anda",
                labelText: "Nama",
              ),
              onSubmitted: (value) {
                hc.gantiNilai(hc.namacontroller.text);
                // Get.defaultDialog(
                //     title: "Nama yang diinput",
                //     middleText: hc.namacontroller.text,`
                //     onConfirm: () {
                //       Get.to(SecondScreen(), arguments: hc.namacontroller.text);
                //     });
                Get.snackbar(
                    'nilai dari variabel nama adalah:', hc.namacontroller.text,
                    snackPosition: SnackPosition.TOP,
                    duration: Duration(seconds: 3));
              },
            ),
            SizedBox(
              height: 10,
            ),
            // Obx(() => Text(hc.nama.value)),
            GetBuilder<HomeController>(builder: (hc) {
              return Text(hc.nama);
            }),
            Obx(() => Row(
                  children: [
                    Text(hc.isOpen.value ? 'Open' : 'Close'),
                    Spacer(),
                    Switch(
                        value: hc.isOpen.value,
                        inactiveThumbColor: Colors.red,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          hc.setIsOpen(value);
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}