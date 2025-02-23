import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_sir_pandi/const/constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
              color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: tinggi(context) * 0.1,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: tinggi(context) * 0.1,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Display Name',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        hintStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder()),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                        hintText: 'Enter Username',
                        hintStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder()),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        hintStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder()),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Whatsapp',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                        hintText: 'Input Whatsapp Number',
                        hintStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: tinggi(context) * 0.07,
                width: panjang(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown,
                ),
                child: Center(
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
