import 'package:flutter/material.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "FAQs",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: Text("Does the app store my personal data?"),
            iconColor: Color(0xFFFF4713), // Change the icon color when expanded

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide.none, // Hide the border
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "No, your personal data is not stored on our servers. All data generated or entered within the app is saved locally on your device. We do not manage or store users' data on our servers. Rest assured, your information remains within your control and is not accessible to us or any third parties.",
                ),
              ),
            ], // Change the divider color when expanded
          ),
          ExpansionTile(
            title: Text("How can I contact customer support if I have questions or issues?"),
            iconColor: Color(0xFFFF4713), // Change the icon color when expanded
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide.none, // Hide the border
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "If you have any inquiries or encounter any issues while using the app, you can contact our customer support team by filling out the \"Contact Us\" form available within the app. Simply navigate to the drawer menu, and you'll find the option to submit your query. Our support team will promptly respond to your message and assist you with any concerns you may have.",
                ),
              ),
            ], // Change the divider color when expanded
          ),
        ],
      ),
    );
  }
}
