import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_sir_pandi/components/settings_card.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> judulPengaturan = [
    'Personal Info',
    'Notification',
    'Security',
    'Language',
    'Dark Mode',
    'Invite Friends',
    'Help Center',
    'About Apps',
    'Logout'
  ];

  final List<IconData> iconData = [
    Icons.person,
    Icons.notifications,
    Icons.security,
    Icons.language,
    Icons.remove_red_eye,
    Icons.person_add,
    Icons.help,
    Icons.abc_outlined,
    Icons.logout
  ];

  final List<Color> colordata = [
    Colors.red,
    Colors.deepOrange,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.deepOrange,
    Colors.greenAccent,
    Colors.brown,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: judulPengaturan.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SettingsCard(
                    namapengaturan: judulPengaturan[index],
                    iconData: iconData[index],
                    colordata: colordata[index]);
              },
            )),
      ),
    );
  }
}
