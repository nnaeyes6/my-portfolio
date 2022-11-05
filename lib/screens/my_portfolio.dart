import 'dart:async';
import 'package:circle_list/circle_list.dart';
import 'package:folding_menu/folding_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:my_portfolio/screens/about_screen.dart';
import 'package:my_portfolio/screens/contact.dart';
import 'package:my_portfolio/screens/products.dart';

class MyPortfolioScreen extends StatefulWidget {
  const MyPortfolioScreen({Key? key}) : super(key: key);

  @override
  State<MyPortfolioScreen> createState() => _MyPortfolioScreenState();
}

bool openMenu = false;

bool isClicked = false;

class _MyPortfolioScreenState extends State<MyPortfolioScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  onMenuOpen() {
    setState(() {
      openMenu = !openMenu;
    });
  }

  onThemeModeSwitch() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri launchUri = Uri(scheme: "https", path: url);
    if (await launchUrl(
      launchUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Can not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isClicked
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).primaryColorLight,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [sliverAppBar()];
        },
        body: portfolioBody(context),
      ),
    );
  }

  Center portfolioBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              resumeText(animationController: _animationController),
              const SizedBox(
                height: 5,
              ),
              imageRowText(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'SKILLS',
                style: TextStyle(
                    fontSize: 30,
                    color: isClicked ? Colors.white70 : Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: RotationTransition(
                  alignment: Alignment.center,
                  turns: _animationController,
                  child: CircleList(
                    innerCircleColor: Colors.blueGrey,
                    outerCircleColor: Colors.white30,
                    rotateMode: RotateMode.allRotate,
                    origin: const Offset(0, 0),
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURL(
                            'www.javascript.com/',
                          );
                        },
                        child: Image.asset(
                          'images/js.png',
                          height: 100,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                            'www.github.com/',
                          );
                        },
                        child: Image.asset(
                          'images/git_logo.png',
                          height: 100,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                            'www.notion.so/',
                          );
                        },
                        child: Image.asset(
                          'images/notion.png',
                          height: 80,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                            'www.firebase.google.com/',
                          );
                        },
                        child: Image.asset(
                          'images/firebase.png',
                          height: 100,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                            'www.dart.dev/',
                          );
                        },
                        child: Image.asset(
                          'images/dart.png',
                          height: 100,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                            'www.flutter.dev/',
                          );
                        },
                        child: Image.asset(
                          'images/flutter-icon.png',
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              projectsGit(context),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: ((context) => const ContactScreen())),
                    ),
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 16,
                        color: isClicked ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: ((context) => const Aboutscreen())),
                    ),
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 16,
                        color: isClicked ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: ((context) => const ProductScreen())),
                    ),
                    child: Text(
                      'Products',
                      style: TextStyle(
                        fontSize: 16,
                        color: isClicked ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '©2021 ANYA PORTFORLIO. All rights reserved',
                style: TextStyle(
                  fontSize: 18,
                  color: isClicked ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          AnimatedOpacity(
            opacity: openMenu ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Container(
              color: isClicked ? Colors.black : Colors.grey,
              child: const Center(child: Text("")),
            ),
          ),
          FoldingMenu(
            duration: const Duration(milliseconds: 800),
            shadowColor: Colors.blue.shade900,
            animationCurve: Curves.decelerate,
            folded: openMenu,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: isClicked ? Colors.black : Colors.grey,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: ((context) => const ProductScreen())));
                  },
                  title: const Text(
                    "Products",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  tileColor: Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: isClicked ? Colors.black : Colors.grey,
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    "Select Language",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  tileColor: Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: isClicked ? Colors.black : Colors.grey,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Aboutscreen()),
                    );
                  },
                  title: const Text(
                    "About",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  tileColor: Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: isClicked ? Colors.black : Colors.grey,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: ((context) => ContactScreen()),
                      ),
                    );
                  },
                  title: const Text(
                    "Contact",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  tileColor: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50),
                color: isClicked ? Colors.black : Colors.grey,
                child: ListTileSwitch(
                  value: isClicked,
                  onChanged: (value) {
                    onThemeModeSwitch();
                  },
                  visualDensity: VisualDensity.comfortable,
                  switchType: SwitchType.cupertino,
                  switchActiveColor: Colors.black,
                  title: const Text(
                    "Switch Mode",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Container projectsGit(BuildContext context) {
    return Container(
      height: 1460,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Give us the opportunity to make your apps scalable and maintenable with flutter and dart.',
                    style: TextStyle(
                        color: isClicked ? Colors.white : Color(0xFF0D0D2B),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 0.1),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _launchURL(
                'www.github.com/nnaeyes6/whatsapp_clone',
              );
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 380,
              width: 370,
              decoration: BoxDecoration(
                  color: isClicked ? Colors.blueGrey : Colors.white38,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'images/whatsapp3.png',
                          height: 300,
                          width: 170,
                        ),
                      ),
                      ClipRRect(
                        child: Image.asset(
                          'images/whatsapp4.png',
                          height: 300,
                          width: 170,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Whatsapp Clone",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: isClicked ? Colors.white70 : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              _launchURL(
                'www.github.com/nnaeyes6/wordle_game',
              );
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 380,
              width: 370,
              decoration: BoxDecoration(
                  color: isClicked ? Colors.blueGrey : Colors.white38,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'images/wordle2.png',
                          height: 300,
                          width: 170,
                        ),
                      ),
                      ClipRRect(
                        child: Image.asset(
                          'images/wordle1.png',
                          height: 300,
                          width: 170,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Wordle Game",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: isClicked ? Colors.white70 : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              _launchURL(
                'www.github.com/nnaeyes6/music_player_app',
              );
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 380,
              width: 370,
              decoration: BoxDecoration(
                  color: isClicked ? Colors.blueGrey : Colors.white38,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'images/music2.png',
                          height: 300,
                          width: 170,
                        ),
                      ),
                      ClipRRect(
                        child: Image.asset(
                          'images/music1.png',
                          height: 300,
                          width: 170,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Music Player",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: isClicked ? Colors.white70 : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchURL(
                      'www.twitter.com/EyesNna',
                    );
                  },
                  child: Image.asset(
                    'images/twitter_icon.png',
                    height: 100,
                    color: isClicked ? Colors.white : Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                      'www.instagram.com/mbahnnaeyes',
                    );
                  },
                  child: Image.asset(
                    'images/ig_icon.png',
                    color: isClicked ? Colors.white : Colors.black,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                      'www.facebook.com/mbahnnaeyes/',
                    );
                  },
                  child: Image.asset(
                    'images/fb_icon.png',
                    color: isClicked ? Colors.white : Colors.black,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                      'www.github.com/nnaeyes6',
                    );
                  },
                  child: Image.asset(
                    'images/git_logo.png',
                    color: isClicked ? Colors.white : Colors.black,
                    height: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row imageRowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _animation,
          child: FadeTransition(
            opacity: _animationController,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(
                            -4,
                            0,
                          ),
                          end: Offset.zero)
                      .animate(_animationController),
                  child: SizedBox(
                    height: 350,
                    width: 350,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'images/myphoto.jpg',
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container resumeText({required AnimationController animationController}) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SlideTransition(
        position: Tween<Offset>(
                begin: const Offset(
                  0,
                  1,
                ),
                end: Offset.zero)
            .animate(animationController),
        child: FadeTransition(
          opacity: _animationController,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hire me for\nyour Applications',
                style: TextStyle(
                    color: isClicked ? Colors.white70 : Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.1),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      shadowColor: const Color(0xff0d0d2b),
      leading: IconButton(
        onPressed: () {
          onMenuOpen();
        },
        icon: const Icon(
          Icons.menu,
        ),
      ),
      title: const Text(
        'Portfolio',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/git_logo.png',
                height: 29,
              ),
            ),
          ],
        ),
      ],
      elevation: 0,
      automaticallyImplyLeading: false,
      expandedHeight: 50,
      floating: true,
      snap: true,
      backgroundColor: isClicked ? Colors.black12 : Colors.grey,
    );
  }
}
