import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_sir_pandi/const/constant.dart';
import 'package:task_sir_pandi/util/html_helper.dart';

class DetailArticle extends StatefulWidget {
  final String urlgambar;
  final String assetavatar;
  final String judulArticle;
  final String namaPenulis;
  final String kontenArtikel;
  final String kategori;
  final String hari;
  final String excerpt;
  const DetailArticle({
    super.key,
    required this.urlgambar,
    required this.assetavatar,
    required this.judulArticle,
    required this.namaPenulis,
    required this.kontenArtikel,
    required this.kategori,
    required this.hari,
    required this.excerpt,
  });

  @override
  State<DetailArticle> createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Bagian gambar dengan header
          Stack(
            children: [
              Image.network(
                widget.urlgambar, // Ganti dengan gambar yang sesuai
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/svg/notification_icon_light.svg',
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.share, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Bagian konten artikel
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul artikel
                    Text(
                      maxLines: 3,
                      widget.judulArticle,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Divider(),

                    // Nama penulis dan akun media sosial
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget
                              .assetavatar), // Ganti dengan avatar penulis
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              widget.namaPenulis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Divider(),

                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.brown)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.kategori,
                              style: TextStyle(fontFamily: 'Urbanist'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: panjang(context) * 0.1,
                        ),
                        Text(
                          widget.hari,
                        )
                      ],
                    ),
                    SizedBox(
                      height: tinggi(context) * 0.03,
                    ),
                    Text(
                      parseHtmlString(widget.excerpt),
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          height: 1.5),
                    ),
                    Divider(),
                    SizedBox(
                      height: tinggi(context) * 0.05,
                    ),

                    Text(
                      parseHtmlString(widget.kontenArtikel),
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Tambahkan lebih banyak teks atau konten lainnya di sini
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
