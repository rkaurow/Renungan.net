import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_sir_pandi/const/constant.dart';

class ArticleWidthCard extends StatelessWidget {
  final String linkgambar;
  final String judul;
  final String author;
  final DateTime date;
  final void Function() ontap;
  const ArticleWidthCard(
      {super.key,
      required this.linkgambar,
      required this.judul,
      required this.author,
      required this.date,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: tinggi(context) * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: tinggi(context) * 0.15,
            width: panjang(context),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: tinggi(context) * 0.13,
                  width: panjang(context) * 0.27,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      linkgambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: panjang(context) * 0.55,
                      child: Text(
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          judul),
                    ),
                    SizedBox(
                      width: panjang(context) * 0.55,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            child: Icon(
                              Icons.person,
                              size: 10,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 12,
                                color: Colors.brown,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              author),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: panjang(context) * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            '33 days ago',
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  height: 20,
                                  'assets/svg/bookmark_icon_light.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                  height: 20, 'assets/svg/three_dot_icon.svg'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
