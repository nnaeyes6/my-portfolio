import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0d0d2b),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: const Color(0xff0d0d2b),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Column(
                children: [
                  const Text('PRODUCT',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: 380,
                    width: 370,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          children: const [
                            Text(
                              "Whatsapp Clone",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700
                                  // color: AppColor.primaryColor
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: 380,
                    width: 370,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          children: const [
                            Text(
                              "Wordle Game",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700
                                  // color: AppColor.primaryColor
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: 380,
                    width: 370,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          children: const [
                            Text(
                              "Music Player",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700
                                  // color: AppColor.primaryColor
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
