// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:game2/data.dart';
import 'package:game2/screens/mainMenu.dart';
import 'package:velocity_x/velocity_x.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const About(),
              ));
            },
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 800,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/head.png"),
                  )),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "King of Pop",
                              style:
                                  TextStyle(fontSize: 80, color: Colors.white),
                            ),
                            Icon(
                              Icons.music_note,
                              size: 70,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Text(
                          "(August 29, 1958 – June 25, 2009)",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ).pSymmetric(h: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 800,
                      child: Column(
                        children: [
                          Text(
                            "Michael Joseph Jackson (August 29, 1958 – June 25, 2009) was an American singer, songwriter, dancer, and philanthropist. Dubbed the King of Pop, he is regarded as one of the most significant cultural figures of the 20th century. Over a four-decade career, his contributions to music, dance, and fashion, along with his publicized personal life, made him a global figure in popular culture. Jackson influenced artists across many music genres; through stage and video performances, he popularized complicated dance moves such as the moonwalk, to which he gave the name, as well as the robot. He is the most awarded individual music artist in history.",
                            style: TextStyle(color: Colors.white),
                          ).pOnly(bottom: 20),
                          Text(
                            "The eighth child of the Jackson family, Jackson made his professional debut in 1964 with his older brothers Jackie, Tito, Jermaine, and Marlon as a member of the Jackson 5 (later known as the Jacksons). Jackson began his solo career in 1971 while at Motown Records. He became a solo star with his 1979 album Off the Wall. His music videos, including those for Beat It, Billie Jean, and Thriller from his 1982 album Thriller, are credited with breaking racial barriers and transforming the medium into an artform and promotional tool. He helped propel the success of MTV and continued to innovate with videos for the albums Bad (1987), Dangerous (1991), and HIStory: Past, Present and Future, Book I (1995). Thriller became the best-selling album of all time, while Bad was the first album to produce five U.S. Billboard Hot 100 number-one singles",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ).pOnly(bottom: 0),
                    ),
                    VerticalDivider(width: 1.0),
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/mj.jpg"),
                        ),
                      ),
                    ).pOnly(bottom: 15),
                  ],
                ).pSymmetric(h: 50),
                10.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Table(
                      defaultColumnWidth: FixedColumnWidth(390.0),
                      border: TableBorder.all(color: Colors.grey, width: 0.5),
                      children: [
                        TableRow(children: [
                          Text(
                            "Also Known As	",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                          Text(
                            "King of Pop • Michael Joseph Jackson • Michael Joe Jackson",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Born",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                          Text(
                            "August 29, 1958 • Gary • Indiana",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Died",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                          Text(
                            "June 25, 2009 (aged 50) • Los Angeles • California",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Awards And Honors	",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                          Text(
                            "Rock and Roll Hall of Fame and Museum (2001) • Rock and Roll Hall of Fame and Museum (1997) • Grammy Award (1995) • Grammy Award (1989) • Grammy Award (1985) • Grammy Award (1984) • Grammy Award (1983) • Grammy Award (1979)",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Notable Works	",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                          Text(
                            "“We Are the World”",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Notable Family Members",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                          Text(
                            "sister Janet Jackson",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                        ]),
                        TableRow(children: [
                          Text(
                            "Subject of Study",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                          Text(
                            "“Leaving Neverland”",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ).p(10),
                        ]),
                      ],
                    ).pSymmetric(h: 50),
                  ],
                ),
                50.heightBox,
                Text(
                  " Facts about Michael Jackson",
                  style: TextStyle(fontSize: 80, color: Colors.white),
                ).pSymmetric(h: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: _screen.width * 0.50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  50.heightBox,
                                  Text(
                                    "He is the most awarded music artist in history",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ).pOnly(bottom: 20),
                                  Text(
                                    "All through his career, 13 Grammy awards inclusive of a Grammy Legend Award and Grammy Lifetime Achievement Award were awarded to him. He was also awarded 6 Brit awards, 5 billboard music awards, 24 American Music Awards. By the year 2006, he was holding 20 Guinness World Records and was also recognized as the world’s most successful entertainer. He was a member of the Rock and Roll Hall of Fame, becoming one of the few artists to be inducted twice. The first time was in 1997 when he was still a member of the Jackson 5 and then the second time was in 2001 as a solo artist.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                          VerticalDivider(width: 1.0),
                          Container(
                            width: _screen.width * 0.35,
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/awar.jpg"),
                              )),
                            ),
                          ),
                        ]),
                    80.heightBox,
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: _screen.width * 0.35,
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/perform.jpg"),
                              )),
                            ),
                          ),
                          VerticalDivider(width: 1.0),
                          Container(
                              width: _screen.width * 0.50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  50.heightBox,
                                  Text(
                                    "Michael Jackson had his first performance when he was 5 years old",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ).pOnly(bottom: 20),
                                  Text(
                                    "With a father who was a guitarist and vested in the music scene, it is natural that his children were mentored into going the same direction.He felt that his children were very talented. In 1964 therefore, Michael joined his brothers who had formed a band by the name,’ Jackson Brothers.’ When he and his other brother, Marlon joined in, it was renamed ‘The Jackson 5.’ It was realized by the family that Michael was very talented in singing and dancing. Thus at just age 5, Jackson’s career began and by the time he was 8 years old, he was the lead vocalist alongside his older brother, Jermaine.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                        ]),
                    80.heightBox,
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: _screen.width * 0.50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  50.heightBox,
                                  Text(
                                    "He was one of the most influential Cultural Figures of the 20th Century",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ).pOnly(bottom: 20),
                                  Text(
                                    "Apart from making phenomenal music, Jackson’s stage presence and charisma made him unique. Given he was the first great televisual entertainer, his creation brought about a different video screen presence. Adding that to how he would electrify a live audience, the Michael Jackson brand became so big within no time.As retold by fellow artists he worked with, Jackson had a new art form of turning low-budget promotional clips into projects that would always blow up. His creativity as showcased by the videos for “thriller,” “Billie Jean” and “Beat it” brought a new genre that combined every form of the 20th-century mass media: the music video. His projects were both cinematic and had elements of live performance. His videos made MTV (Music Television) and ultimately changed the music industry.The music industry had to do better and expand in order to accommodate Jackson’s talent. This shows how big of a deal his creations were in the music scene.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )).pOnly(right: 60),
                          VerticalDivider(width: 1.0),
                          Container(
                            width: _screen.width * 0.35,
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/fig.jpg"),
                              )),
                            ),
                          ),
                        ]),
                    80.heightBox,
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: _screen.width * 0.35,
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/help.jpg"),
                              )),
                            ),
                          ),
                          VerticalDivider(width: 1.0),
                          Container(
                              width: _screen.width * 0.50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  50.heightBox,
                                  Text(
                                    "Michael loved helping Underprivileged Children",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ).pOnly(bottom: 20),
                                  Text(
                                    "Other than the monetary donations he often made, Jackson also had a habit of performing in benefit concerts. He would give away tickets for regular concerts performances to groups specializing in aiding underprivileged children. He often made hospital visits to sick children and opened his home for visits. He paid much attention to ensuring the provision of special facilities and nurses if the children needed that level of care.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )).pOnly(left: 30),
                        ]),
                    80.heightBox,
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: _screen.width * 0.50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  50.heightBox,
                                  Text(
                                    "Recognized by Forbes",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ).pOnly(bottom: 20),
                                  Text(
                                    "Given how his net worth shot up after his death and continues to, in 2018, Forbes Magazine ranked Michael as the highest-paid deceased celebrity in the world. His earnings rose to 400 million Dollars posthumously and continued to hold the top spot on the list until the year 2020. By this time the earnings he made had reached over 48 million Dollars. His net worth is considered even higher than other deceased icons like Frank Mercury, Kobe Bryant among others.His retaining the number one spot since his death in 2009, shows how much of an impact he left behind",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )).pOnly(right: 30),
                          VerticalDivider(width: 1.0),
                          Container(
                            width: _screen.width * 0.35,
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/forbes.jpg"),
                              )),
                            ),
                          ),
                        ]),
                  ],
                ).pSymmetric(h: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemShow extends StatelessWidget {
  final Item item;

  const ItemShow({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topLeft, children: [
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      Container(
        height: 300,
        child: Column(
          children: [
            Image(
              fit: BoxFit.cover,
              width: 400,
              height: 300,
              image: AssetImage(item.image),
            ),
          ],
        ),
      ),
    ]);
  }
}
