import 'package:flutter/material.dart';

import 'package:task_sir_pandi/const/constant.dart';

class ArticleCard extends StatelessWidget {
  final String linkgambar;
  final String judul;
  final String author;
  final DateTime date;
  final void Function() ontap;
  const ArticleCard({
    super.key,
    required this.linkgambar,
    required this.judul,
    required this.author,
    required this.date,
    required this.ontap, // Menambahkan parameter 'date'
  });

  // Fungsi untuk mengonversi tanggal menjadi format "today" atau "x days ago"
  String getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: tinggi(context) * 0.2,
              width: panjang(context) * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrangeAccent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  fit: BoxFit.cover,
                  linkgambar,
                ),
              ),
            ),
            SizedBox(
              width: panjang(context) * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    judul,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        author,
                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 10),
                      ),
                      Text(
                        getTimeAgo(
                            date), // Menampilkan tanggal dalam format yang sesuai
                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
