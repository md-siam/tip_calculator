import 'package:flutter/material.dart';

import 'widget/amount_text.dart';
import 'widget/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _bill = 0;
  int _tipPercentage = 0;
  int _numberOfPeople = 1;
  final ScrollController _scrollController = ScrollController();
  // This is the default Number Of People
  static const defaultNumberOfPeople = 1;
  final _billAmountController = TextEditingController();
  final _tipPercentageController = TextEditingController();
  final _numberOfPeopleController =
      TextEditingController(text: defaultNumberOfPeople.toString());
  // For custom toggle button
  List<String> selectedCategory = [];
  String category1 = '5';
  String category2 = '10';
  String category3 = '15';
  String category4 = '25';
  String category5 = '50';

  @override
  void initState() {
    /// This is the `event listeners` of the TextEditingControllers
    /// implemented using the [addListener] method
    ///
    _billAmountController.addListener(_onBillAmountChanged);
    _tipPercentageController.addListener(_onTipAmountChanged);
    _numberOfPeopleController.addListener(_numberOfPeopleChanged);
    super.initState();
  }

  _onBillAmountChanged() {
    setState(() {
      /// If the TextEditingController is `null`,
      /// then it will assign `0`
      _bill = double.tryParse(_billAmountController.text) ?? 0;
    });
  }

  _onTipAmountChanged() {
    setState(() {
      /// If the TextEditingController is `null`,
      /// then it will assign `0`
      _tipPercentage = int.tryParse(_tipPercentageController.text) ?? 0;
    });
  }

  _numberOfPeopleChanged() {
    setState(() {
      /// If the TextEditingController is `null`,
      /// then it will assign `1`
      _numberOfPeople = int.tryParse(_numberOfPeopleController.text) ?? 1;
    });
  }

  // Tip-per-person calculation
  _getTipAmount() => ((_bill * _tipPercentage) / 100) / _numberOfPeople;
  // Total-amount-per-person calculation
  _getTotalAmount() =>
      (((_bill * _tipPercentage) / 100) + _bill) / _numberOfPeople;

  _resetButtonAction() {
    setState(() {
      selectedCategory = [];
      _bill = 0;
      _tipPercentage = 0;
      _numberOfPeople = 1;
      _billAmountController.clear();
      _tipPercentageController.clear();
      _numberOfPeopleController.clear();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _billAmountController.dispose();
    _tipPercentageController.dispose();
    _numberOfPeopleController.dispose();
    _billAmountController.removeListener(_onBillAmountChanged);
    _tipPercentageController.removeListener(_onTipAmountChanged);
    _numberOfPeopleController.removeListener(_numberOfPeopleChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// toggle button & custom input
    /// width
    ///
    double width = MediaQuery.of(context).size.width * (.41);

    /// `reset` button action
    ///

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            background(),
            SingleChildScrollView(
              controller: _scrollController,
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
                                  selectTipPercentageInfo(width),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          numberOfPeopleInputInfo(),
                          const SizedBox(height: 30.0),
                          outputCardInfo(),
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

  /// This is for taking user input of `billing information`
  ///
  Widget billingInputInfo() {
    return Column(
      children: [
        Row(children: [Text('Bill', style: labelText)]),
        const SizedBox(height: 10),
        Container(
          height: 46,
          padding: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: TextFormField(
            controller: _billAmountController,
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF00494D),
              fontWeight: FontWeight.bold,
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textDirection: TextDirection.rtl,
            decoration: const InputDecoration(
              icon: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.attach_money_outlined,
                  color: Colors.grey,
                ),
              ),
              hintText: 'Bill',
              hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              hintTextDirection: TextDirection.rtl,
              border: InputBorder.none,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  /// This is for taking user input of `select tip %`
  ///
  Widget selectTipPercentageInfo(double width) {
    return Container(
      width: width,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: TextFormField(
        controller: _tipPercentageController,
        onTap: () => selectedCategory = [],
        style: const TextStyle(
          fontSize: 24,
          color: Color(0xFF00494D),
          fontWeight: FontWeight.bold,
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: false),
        textDirection: TextDirection.rtl,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.percent, color: Colors.grey),
          hintText: 'Custom',
          hintStyle: TextStyle(
            fontSize: 21,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          hintTextDirection: TextDirection.rtl,
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  /// This is for taking user input of `number of people`
  ///
  Widget numberOfPeopleInputInfo() {
    return Column(
      children: [
        Row(children: [Text('Number of People', style: labelText)]),
        const SizedBox(height: 10),
        Container(
          height: 46,
          padding: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: TextFormField(
            controller: _numberOfPeopleController,
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF00494D),
              fontWeight: FontWeight.bold,
            ),
            //keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textDirection: TextDirection.rtl,
            decoration: const InputDecoration(
              icon: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
              hintText: 'Number of People',
              hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              hintTextDirection: TextDirection.rtl,
              border: InputBorder.none,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector toggleButton(String category, double width) {
    return GestureDetector(
      onTap: () {
        _tipPercentageController.clear();
        selectedCategory = [];
        selectedCategory.add(category);
        //debugPrint(selectedCategory.toString());
        /// `Converting` selectedCategory from STRING to INT
        ///
        int selectedTip = int.parse(selectedCategory[0]);
        //debugPrint(selectedTip.toString());
        setState(() {
          _tipPercentage = selectedTip;
        });
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
          '$category%',
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

  /// This is for displaying output `information`
  ///
  Widget outputCardInfo() {
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
                AmountText(
                  text: '${_getTipAmount().toStringAsFixed(2)}',
                  key: const Key('tipAmount'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleDesc('Total', '/ person'),
                AmountText(
                  text: '${_getTotalAmount().toStringAsFixed(2)}',
                  key: const Key('totalAmount'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xFF26c0ab)),
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 92.0,
                  right: 92.0,
                ),
                child: Text(
                  'RESET',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF00494D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () {
                //debugPrint('Reset button pressed');
                _resetButtonAction();
              },
            ),
          ],
        ),
      ),
    );
  }
}
