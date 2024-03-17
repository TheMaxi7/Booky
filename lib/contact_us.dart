import 'package:flutter/material.dart';
import 'package:text_area/text_area.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController mailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void resetFields() {
    setState(() {
      mailController.clear();
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text(
            "Contact us",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
              onPressed: resetFields,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      labelText: 'Your e-mail',
                      hintText: 'Enter e-mail',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58595B)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          mailController.text = '';
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      "Message",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      right: 8,
                    ),
                    child: TextArea(
                      borderRadius: 10,
                      borderColor: const Color(0xFFCFD6FF),
                      textEditingController: messageController,
                      onSuffixIconPressed: () => {},
                      validation: true,
                    ),
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
                  backgroundColor: const Color(0xFF141d29),
                ),
                child: Text(
                  'Send',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFFDCE2EB),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
