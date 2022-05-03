import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScrollController? scrollController;

    /// default textStyle for `labels`
    ///
    TextStyle labelText = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF5E7A7D),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFC5E4E7),
      body: SafeArea(
        child: Stack(
          children: [
            background(),
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                  Container(
                    height: 700,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(children: [Text('Bill', style: labelText)]),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Column(
                            children: [
                              Row(children: [
                                Text('Select Tip %', style: labelText)
                              ]),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Column(
                            children: [
                              Row(children: [
                                Text('Number of People', style: labelText)
                              ]),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          const SizedBox(height: 30.0),
                          Container(
                            height: 260,
                            decoration: BoxDecoration(
                              color: const Color(0xff00494d),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: const [
                                          Text(
                                            'Tip Amount',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '/ person',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      const Text(
                                        '\$4.27',
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Column(
                                        children: const [
                                          Text(
                                            'Total',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '/ person',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      const Text(
                                        '\$32.79',
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'RESET',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget background() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Center(child: SvgPicture.asset('assets/images/logo.svg')),
        ),
        const Expanded(flex: 4, child: SizedBox())
      ],
    );
