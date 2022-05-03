import 'package:flutter/material.dart';

import 'widget/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? scrollController;
  double tipAmount = 4.27;
  double totalAmount = 32.79;

  @override
  Widget build(BuildContext context) {
    /// `reset` button action
    ///
    void resetButtonAction() {
      setState(() {
        tipAmount = 0;
        totalAmount = 0;
      });
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            background(),
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  transparentContainer(140),
                  Container(
                    height: 770,
                    width: double.infinity,
                    decoration: containerDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(children: [Text('Bill', style: labelText)]),
                              const SizedBox(height: 10),
                              Container(
                                width: 356,
                                height: 46,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: const Text(
                                  '142.55 ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF00494D),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Column(
                            children: [
                              Row(children: [
                                Text('Select Tip %', style: labelText)
                              ]),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 13,
                                runSpacing: 13,
                                children: [
                                  Container(
                                    width: 156,
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff00494d),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: const Text(
                                      '5%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 156,
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff00494d),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: const Text(
                                      '10%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 156,
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff00494d),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: const Text(
                                      '15%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 156,
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff00494d),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: const Text(
                                      '25%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 156,
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff00494d),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: const Text(
                                      '50%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 156,
                                    height: 46,
                                    alignment: Alignment.centerRight,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: const Text(
                                      'Custom ',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Column(
                            children: [
                              Row(children: [
                                Text('Number of People', style: labelText)
                              ]),
                              const SizedBox(height: 10),
                              Container(
                                width: 356,
                                height: 46,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: const Text(
                                  '5 ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF00494D),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Container(
                            height: 260,
                            decoration: BoxDecoration(
                              color: const Color(0xFF00494D),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleDesc('Tip Amount', '/ person'),
                                      Text('\$$tipAmount', style: outputText),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleDesc('Total', '/ person'),
                                      Text('\$$totalAmount', style: outputText),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  resetButton(resetButtonAction),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton resetButton(void Function() resetButtonAction) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: const Color(0xFF26c0ab)),
      child: const Padding(
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 100.0,
          right: 100.0,
        ),
        child: Text(
          'RESET',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF00494D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () {
        print('Reset button pressed');
        resetButtonAction();
      },
    );
  }
}
