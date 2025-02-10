import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_sir_pandi/components/profile_article_card.dart';
import 'package:task_sir_pandi/const/constant.dart';
import 'package:task_sir_pandi/pages/profile/edit_profile.dart';
import 'package:task_sir_pandi/pages/settings/settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> judul = [
    '10 Tips for Boosting Your Productivity and Life balance',
    '5 Tips To Set Your Freedom while moving far forward!',
    '10 Mind Tips To Help You While Working',
    '10 Plants Tips To Grow',
    '10 Plants Tips To Grow',
    '10 Plants Tips To Grow',
  ];

  final List<String> gambar = [
    'https://media.wired.com/photos/6517554f09807970da6567b8/master/pass/Tips-For-Remote-Work-Business-1441444285.jpg',
    'https://media.simplemindfulness.com/wp-content/uploads/2018/01/Purpose-of-Life-e1457292794941.jpg',
    'https://media.simplemindfulness.com/wp-content/uploads/2018/01/amazing-life-e1427392337331.jpg',
    'https://thumbs.dreamstime.com/b/new-life-concept-seedling-growing-sprout-tree-business-development-symbolic-new-life-concept-seedling-growing-sprout-99382606.jpg',
    'https://thumbs.dreamstime.com/b/new-life-concept-seedling-growing-sprout-tree-business-development-symbolic-new-life-concept-seedling-growing-sprout-99382606.jpg',
    'https://thumbs.dreamstime.com/b/new-life-concept-seedling-growing-sprout-tree-business-development-symbolic-new-life-concept-seedling-growing-sprout-99382606.jpg',
  ];

  final int jumlahart = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        title: Text(
          'Profile',
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ));
            },
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Container(
                height: tinggi(context) * 0.1,
                width: panjang(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: panjang(context) * 0.1,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Steward Moran',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown),
                              ),
                              Text(
                                '@steward_moran',
                                style: GoogleFonts.poppins(
                                    color: Colors.brown.shade700),
                              )
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ));
                        },
                        child: Container(
                          height: 40,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.brown),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                color: Colors.brown,
                                size: 15,
                              ),
                              Text(
                                'Edit',
                                style: GoogleFonts.poppins(
                                    color: Colors.brown, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: tinggi(context) * 0.1,
                width: panjang(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            gambar.length.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 20),
                          ),
                          Text(
                            'Article',
                            style: GoogleFonts.poppins(fontSize: 10),
                          )
                        ],
                      ),
                      VerticalDivider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '104',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 20),
                          ),
                          Text(
                            'Following',
                            style: GoogleFonts.poppins(fontSize: 10),
                          )
                        ],
                      ),
                      VerticalDivider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5.278',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 20),
                          ),
                          Text(
                            'Followers',
                            style: GoogleFonts.poppins(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Article',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                  Text(
                    'About',
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${gambar.length} Articles',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.note_sharp,
                        color: Colors.brown,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.now_widgets,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: gambar.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProfileArticleCard(
                    judul: judul[index],
                    urlgambar: gambar[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
