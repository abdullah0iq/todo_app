import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app3/view/screen/my_day_screen.dart';

class MainLists extends StatelessWidget {
  const MainLists(
      {required this.icon,
      required this.iconColor,
      required this.title,
      required this.tasksCounter,
      super.key});

  final IconData icon;
  final String title;
  final Color iconColor;
  final int tasksCounter;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      onPressed: () {
        Get.to(() => const MyDayScreen());
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
            Text(
              '$tasksCounter',
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
