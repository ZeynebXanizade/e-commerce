import 'package:flutter/material.dart';
import 'package:ui_design/src/presentation/widgets/buttons.dart';
import 'package:ui_design/src/presentation/widgets/homecard.dart';
import 'package:ui_design/src/presentation/widgets/newcard.dart';
import 'package:ui_design/src/presentation/widgets/textwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 226, 226),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text("Hello" "\n" "Zeyneb",
                          style: TextStyle(
                              color: Color(0xfffe9ba1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notification_add,
                              color: Color(0xfffe9ba1),
                            )))
                  ],
                ),
              ),
              const ElevatedButtons(),
              const NewCard(),
              const TextWidget(),
              const Cards(),
            ],
          ),
        ),
      ),
    );
  }
}
