
import 'package:flutter/material.dart';
import 'package:ui_design/src/presentation/views/allcards.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Popular products",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () {},
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AllCards()));
                  },
                  child: const Text(
                    "See all",
                    style: TextStyle(
                        color: Color(0xfffe9ba1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
