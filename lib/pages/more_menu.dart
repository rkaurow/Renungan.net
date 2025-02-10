import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_sir_pandi/components/article_width_card.dart';
import 'package:task_sir_pandi/components/profile_article_card.dart';
import 'package:task_sir_pandi/const/constant.dart';
import 'package:task_sir_pandi/pages/detail_article.dart';
import 'package:task_sir_pandi/services/datasources/data_renungan_remote_datasources.dart';
import 'package:task_sir_pandi/services/datasources/data_renungan_response_models.dart';

class MoreMenu extends StatefulWidget {
  final String jenismenu;
  const MoreMenu({super.key, required this.jenismenu});

  @override
  State<MoreMenu> createState() => _MoreMenuState();
}

class _MoreMenuState extends State<MoreMenu> {
  late Future<List<DataRenunganModels>> postfuture;
  final DataRenunganRemoteDatasources dataRenunganRemoteDatasources =
      DataRenunganRemoteDatasources();

  @override
  void initState() {
    postfuture = dataRenunganRemoteDatasources.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        title: Text(
          widget.jenismenu,
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: postfuture,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var posts = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    var isi = posts[index];
                    var judul = isi.title;
                    var pict = isi.featuredImage;
                    var author = isi.author;
                    return ArticleWidthCard(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailArticle(
                                excerpt: isi.excerpt,
                                kategori: isi.categories[0],
                                hari: isi.date.toString(),
                                kontenArtikel: isi.content,
                                namaPenulis: author.name,
                                judulArticle: isi.title,
                                assetavatar: author.avatar,
                                urlgambar: isi.featuredImage,
                              ),
                            ));
                      },
                      judul: judul,
                      linkgambar: pict,
                      author: author.name,
                      date: isi.date,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
