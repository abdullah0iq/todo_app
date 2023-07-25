import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app3/view/widget/task_widget.dart';

class MyDayScreen extends StatelessWidget {
  const MyDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              size: 30,
              color: Color.fromRGBO(123, 139, 215, 1),
            ),
          )
        ],
        leadingWidth: 80,
        leading: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 1),
          onPressed: () {
            Get.back();
          },
          child: const Row(
            children: [
              Icon(
                CupertinoIcons.back,
                color: Color.fromRGBO(123, 139, 215, 1),
                semanticLabel: 'Lists',
              ),
              Text(
                'Lists',
                style: TextStyle(
                  color: Color.fromRGBO(123, 139, 215, 1),
                  fontSize: 17,
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 250,
                color: Colors.black,
                child: const SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [TaskWidget()],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Card(
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  color: Color.fromRGBO(33, 33, 33, 1),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.add,
                          color: Color.fromRGBO(123, 139, 215, 1),
                          size: 30,
                        ),
                        Text(
                          "Add a Task",
                          style: TextStyle(
                              color: Color.fromRGBO(123, 139, 215, 1),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
