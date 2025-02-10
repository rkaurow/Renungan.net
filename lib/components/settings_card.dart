import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_sir_pandi/const/constant.dart';

class SettingsCard extends StatelessWidget {
  final String namapengaturan;
  final IconData iconData;
  final Color colordata;
  const SettingsCard(
      {super.key,
      required this.namapengaturan,
      required this.iconData,
      required this.colordata});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tinggi(context) * 0.08,
      width: panjang(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  iconData,
                  color: colordata,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                namapengaturan,
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 15,
          )
        ],
      ),
    );
  }
}
