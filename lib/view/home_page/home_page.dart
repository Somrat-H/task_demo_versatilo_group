import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Homepage"),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DecoratedBox(
                decoration:
                    const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      if (value > 0) {
                        value--;
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ))),
            const SizedBox(
              width: 20,
            ),
            Text(value.toString()),
            const SizedBox(
              width: 20,
            ),
            DecoratedBox(
                decoration:
                    const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        value++;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))),
          ],
        ),
      ],
    );
  }
}
