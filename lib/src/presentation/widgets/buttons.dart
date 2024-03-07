import 'package:flutter/material.dart';

class ElevatedButtons extends StatefulWidget {
  const ElevatedButtons({
    super.key,
  });

  @override
  State<ElevatedButtons> createState() => _ElevatedButtonsState();
}

class _ElevatedButtonsState extends State<ElevatedButtons> {
  String buttontext = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttontext = "bags";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    "Bags",
                    style: TextStyle(color: Color(0xfffe9ba1)),
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttontext = "disk";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    "Disk",
                    style: TextStyle(color: Color(0xfffe9ba1)),
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttontext = "tshirt";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    "T-Shirt",
                    style: TextStyle(color: Color(0xfffe9ba1)),
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttontext = "sweat";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    "Sweat",
                    style: TextStyle(color: Color(0xfffe9ba1)),
                  )),
            ],
          ),
          Text(buttontext),
        ],
      ),
    );
  }
}
