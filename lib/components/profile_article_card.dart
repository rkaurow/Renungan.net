import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_sir_pandi/const/constant.dart';

class ProfileArticleCard extends StatelessWidget {
  final String urlgambar;
  final String judul;
  const ProfileArticleCard(
      {super.key, required this.urlgambar, required this.judul});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tinggi(context) * 0.15,
      width: panjang(context),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: tinggi(context) * 0.12,
              width: panjang(context) * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  urlgambar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: panjang(context) * 0.5,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  judul,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: panjang(context) * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today',
                      style: GoogleFonts.poppins(fontSize: 10),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.note_add_outlined,
                          size: 15,
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
