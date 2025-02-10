import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_sir_pandi/components/article_card.dart';
import 'package:task_sir_pandi/const/constant.dart';
import 'package:task_sir_pandi/pages/detail_article.dart';
import 'package:task_sir_pandi/pages/more_menu.dart';
import 'package:task_sir_pandi/services/datasources/data_renungan_remote_datasources.dart';
import 'package:task_sir_pandi/services/datasources/data_renungan_response_models.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<List<DataRenunganModels>> postfuture;
  final DataRenunganRemoteDatasources dataRenunganRemoteDatasources =
      DataRenunganRemoteDatasources();

  final List<String> gambar = [
    'https://media.wired.com/photos/6517554f09807970da6567b8/master/pass/Tips-For-Remote-Work-Business-1441444285.jpg',
    'https://media.simplemindfulness.com/wp-content/uploads/2018/01/Purpose-of-Life-e1457292794941.jpg',
    'https://media.simplemindfulness.com/wp-content/uploads/2018/01/amazing-life-e1427392337331.jpg',
    'https://thumbs.dreamstime.com/b/new-life-concept-seedling-growing-sprout-tree-business-development-symbolic-new-life-concept-seedling-growing-sprout-99382606.jpg',
  ];

  final List<String> judul = [
    '10 Tips for Boosting Your Productivity and Life balance',
    '5 Tips To Set Your Freedom while moving far forward!',
    '10 Mind Tips To Help You While Working',
    '10 Plants Tips To Grow',
  ];

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
        foregroundColor: Colors.brown,
        title: Image.asset(
          'assets/logo_brown.png',
          height: tinggi(context) * 0.03,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/notification_icon_light.svg')),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/bookmark_icon_light.svg')),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: tinggi(context) * 0.15,
                width: panjang(context),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                          141, 0, 0, 0), // Warna bayangan (dengan transparansi)
                      offset: Offset(0, 5), // Posisi bayangan (x, y)
                      blurRadius: 10, // Efek blur pada bayangan
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/bg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Articles',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MoreMenu(jenismenu: 'Recent Articles'),
                          ));
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                  return SizedBox(
                    height: tinggi(context) * 0.3,
                    width: panjang(context),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        var isi = posts[index];
                        var judul = isi.title;
                        var pict = isi.featuredImage;
                        var author = isi.author;
                        return ArticleCard(
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
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Articles',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.brown,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: tinggi(context) * 0.3,
                width: panjang(context),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: gambar.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(
                      ontap: () {},
                      judul: judul[index],
                      linkgambar: gambar[index],
                      author: 'user1',
                      date: DateTime.now(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
