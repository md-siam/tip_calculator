import 'package:flutter/material.dart';

import 'widget/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? scrollController;
  double? bill = 142.55;
  int? numberOfPeople = 5;
  double? tipAmount = 4.27;
  double? totalAmount = 32.79;
  // for custom toggle button
  List<String> selectedCategory = [];
  String category1 = '5%';
  String category2 = '10%';
  String category3 = '15%';
  String category4 = '25%';
  String category5 = '50%';

  @override
  Widget build(BuildContext context) {
    /// toggle button & custom input
    /// width
    ///
    double width = MediaQuery.of(context).size.width * (.41);

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
                          billingInputInfo(),
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
                                  toggleButton(category1, width),
                                  toggleButton(category2, width),
                                  toggleButton(category3, width),
                                  toggleButton(category4, width),
                                  toggleButton(category5, width),
                                  Container(
                                    width: width,
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
                          numberOfPeopleInputInfo(),
                          const SizedBox(height: 30.0),
                          outputCardInfo(resetButtonAction),
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

  Widget billingInputInfo() {
    return Column(
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
          child: Text(
            '$bill ',
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF00494D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget numberOfPeopleInputInfo() {
    return Column(
      children: [
        Row(children: [Text('Number of People', style: labelText)]),
        const SizedBox(height: 10),
        Container(
          width: 356,
          height: 46,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Text(
            '$numberOfPeople ',
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF00494D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector toggleButton(String category, double width) {
    return GestureDetector(
      onTap: () {
        selectedCategory = [];
        selectedCategory.add(category);
        debugPrint(selectedCategory.toString());
        setState(() {});
      },
      child: Container(
        width: width,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedCategory.contains(category)
              ? const Color(0xff26C0AB)
              : const Color(0xff00494d),
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 24,
            color: selectedCategory.contains(category)
                ? const Color(0xff00494d)
                : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget outputCardInfo(void Function() resetButtonAction) {
    return Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleDesc('Tip Amount', '/ person'),
                Text('\$$tipAmount', style: outputText),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleDesc('Total', '/ person'),
                Text('\$$totalAmount', style: outputText),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
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
                debugPrint('Reset button pressed');
                resetButtonAction();
              },
            ),
          ],
        ),
      ),
    );
  }
}
