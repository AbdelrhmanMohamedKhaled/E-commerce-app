import 'package:ecommerce_app/widgets/star_icon.dart';
import 'package:flutter/material.dart';

class NewAndLocationIcon extends StatelessWidget {
  const NewAndLocationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color.fromARGB(255, 255, 129, 129),
          ),
          child: Text(
            'new'.toUpperCase(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const StarsIcons(),
        const SizedBox(
          width: 80,
        ),
        const Row(
          children: [
            Icon(
              Icons.edit_location,
              size: 35,
              color: Color.fromARGB(168, 3, 65, 27),
            ),
            Text('Flower Shop'),
          ],
        ),
      ],
    );
  }
}

