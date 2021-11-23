import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: PreferencePage([
        PreferenceTitle('General'),
        DropdownPreference(
          'Country',
          'country_page',
          defaultVal: 'afganistan',
          values: ['afganistan', 'iran', 'pakistan'],
        ),
        DropdownPreference<int>(
          'Number of items',
          'items_count',
          defaultVal: 2,
          displayValues: ['One', 'Two', 'Three', 'Four'],
          values: [1, 2, 3, 4],
        ),
        PreferenceTitle('Bill Generating'),
        TextFieldPreference(
          'Start Rang',
          'bill_start',
          defaultVal: 'Bill-2020 ',
        ),
      ]),
    );
  }
}
