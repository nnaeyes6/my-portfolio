import 'package:flutter/material.dart';

class Aboutscreen extends StatelessWidget {
  const Aboutscreen({super.key});

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
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                const Text('ABOUT ME',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70)),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 350,
                    width: 350,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'images/myphoto.jpg',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Hi,\nMy name is Anya. I\'m a Software Developer. \nI build top-notch applications\nUsing Dart programming Language, \nFlutter Framework and Firebase.\nMy aim is to see that my clients\nGet the reward of what they pay for.\nIn collaboration, I contribute interestingly \nTo see that my team gets the best of me.\nI have contributed to open sources, \nLike Hacktoberfest, hackathons etc.\nWelcome to my portfolio.\nI look forward working with you.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
