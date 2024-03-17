import 'package:flutter/material.dart';

class SetPriceAlert extends StatefulWidget {
  const SetPriceAlert({Key? key}) : super(key: key);

  @override
  State<SetPriceAlert> createState() => _SetPriceAlertState();
}

class _SetPriceAlertState extends State<SetPriceAlert> {

  TextEditingController priceController = TextEditingController();

  void resetFields() {
    setState(() {
      priceController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Add price alert",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF141D29)),
                    ),
                    labelText: 'Price threshold',
                    hintText: 'Enter price goal',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF58595B)),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        priceController.text = '';
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF58595B)),
                backgroundColor: const Color(
                  0xFF141d29,
                ),
              ),
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFDCE2EB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



