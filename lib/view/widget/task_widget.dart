import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(
              Icons.circle_outlined,
              color: Colors.grey,
            ),
          )),
        ),
      ),
    );
  }
}
// Row(
// children: [
// IconButton(
// onPressed: () {},
// icon: const Icon(
// Icons.circle_outlined,
// color: Colors.grey,
// ),
// hoverColor: Colors.transparent,
// )
// ],
// )
