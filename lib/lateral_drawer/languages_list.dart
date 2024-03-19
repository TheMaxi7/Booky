import 'package:flutter/material.dart';

class LanguagesList extends StatefulWidget {
  const LanguagesList({super.key});

  @override
  State<LanguagesList> createState() => _LanguagesListState();
}

class _LanguagesListState extends State<LanguagesList> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Language settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/flags/brit_flag.png',
                    width: 32,
                    height: 32,
                  ),
                  title: const Text('English'),
                  onTap: () {
                    setState(() {
                      _selectedLanguage = 'English';
                    });
                  },
                  trailing: Radio(
                    value: 'English',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/flags/spain_flag.png',
                    width: 32,
                    height: 32,
                  ),
                  title: const Text('Spanish'),
                  onTap: () {
                    setState(() {
                      _selectedLanguage = 'Spanish';
                    });
                  },
                  trailing: Radio(
                    value: 'Spanish',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/flags/france_flag.png',
                    width: 32,
                    height: 32,
                  ),
                  title: const Text('French'),
                  onTap: () {
                    setState(() {
                      _selectedLanguage = 'French';
                    });
                  },
                  trailing: Radio(
                    value: 'French',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/flags/italian_flag.png',
                    width: 32,
                    height: 32,
                  ),
                  title: const Text('Italian'),
                  onTap: () {
                    setState(() {
                      _selectedLanguage = 'Italian';
                    });
                  },
                  trailing: Radio(
                    value: 'Italian',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value.toString();
                      });
                    },
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
                'Apply',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFFDCE2EB),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
