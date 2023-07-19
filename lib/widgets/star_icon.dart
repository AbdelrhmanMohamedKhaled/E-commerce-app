import 'package:flutter/material.dart';

class StarsIcons extends StatelessWidget {
  const StarsIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          size: 30,
          color: Color.fromARGB(255, 255, 191, 0),
        ),
        Icon(
          Icons.star,
          size: 30,
          color: Color.fromARGB(255, 255, 191, 0),
        ),
        Icon(
          Icons.star,
          size: 30,
          color: Color.fromARGB(255, 255, 191, 0),
        ),
        Icon(
          Icons.star,
          size: 30,
          color: Color.fromARGB(255, 255, 191, 0),
        ),
        Icon(
          Icons.star_half,
          size: 30,
          color: Color.fromARGB(255, 255, 191, 0),
        ),
      ],
    );
  }
}
