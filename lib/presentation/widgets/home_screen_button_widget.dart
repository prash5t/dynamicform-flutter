import 'package:flutter/material.dart';

class HomeScreenButtonWidget extends StatelessWidget {
  final String title;
  final String route;
  final dynamic dataToInject;

  const HomeScreenButtonWidget(
      {super.key, required this.title, required this.route, this.dataToInject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(route, arguments: dataToInject),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
