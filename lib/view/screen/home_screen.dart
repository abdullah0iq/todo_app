import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app3/controller/db_controller.dart';
import 'package:to_do_app3/model/task.dart';
import 'package:to_do_app3/view/widget/main_lists.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DbController tasksController = Get.put(DbController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            SizedBox(
              // width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    enableFeedback: false,
                    animationDuration: Duration.zero,
                    onPressed: () {},
                    child: const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: CupertinoColors.activeBlue,
                          child: Text(
                            "Az",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Abdullah zaid',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () async {
                        List<Task> tasks = await tasksController.tasks;
                        for (var element in tasks) {
                          debugPrint('${element.toMap()}');
                        }
                      },
                      icon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  tasksController.addTask(Task(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: "Test Task",
                      note: "this is a note for the first test task i made",
                      dueDate: null,
                      reminder: null,
                      isImportant: false));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                    future: tasksController.tasks,
                    builder: (context, tasks) {
                      return tasks.hasData
                          ? Column(
                              children: [
                                MainLists(
                                    icon: CupertinoIcons.sun_max,
                                    iconColor: Colors.grey,
                                    title: "My Day",
                                    tasksCounter: tasks.data?.length ?? 0),
                                // MainLists(
                                //     icon: CupertinoIcons.star,
                                //     iconColor: Colors.pinkAccent,
                                //     title: "Important"),
                                // MainLists(
                                //     icon: CupertinoIcons.calendar,
                                //     iconColor: Colors.lightBlueAccent,
                                //     title: "Planned"),
                                // MainLists(
                                //     icon: CupertinoIcons.person,
                                //     iconColor: Colors.greenAccent,
                                //     title: "Assigned to me"),
                                // MainLists(
                                //     icon: CupertinoIcons.flag,
                                //     iconColor: Colors.deepOrange,
                                //     title: "Flagged email"),
                                // MainLists(
                                //     icon: CupertinoIcons.house,
                                //     iconColor: Colors.green,
                                //     title: "Tasks"),
                                const Divider(thickness: 0.3),
                              ],
                            )
                          : Card();
                    }),
              )),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.add,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "New List",
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                    highlightColor: Colors.transparent,
                    color: Colors.grey,
                    onPressed: () {},
                    icon:
                        const Icon(CupertinoIcons.list_bullet_below_rectangle))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
