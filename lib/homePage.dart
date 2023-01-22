import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () {},
        ),
        const Text('00:37'),
        Slider(
          value: 0,
          onChanged: (double value) {},
        ),
        const Text('01:15'),
        // ...
      ],
    );
  }
}
