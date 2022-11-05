import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: "tel", path: phoneNumber);
    if (await launchUrl(
      launchUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Can not launch';
    }
  }

  Future<void> _sendEmail(String email) async {
    final Uri launchUri = Uri(scheme: "mailto", path: email);
    if (await launchUrl(
      launchUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Can not launch';
    }
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
      appBar: AppBar(
        backgroundColor: const Color(0xff0d0d2b),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: const Color(0xff0d0d2b),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
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
                  height: 50,
                ),
                const Text('CONTACT',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                'www.twitter.com/EyesNna',
                              );
                            },
                            child: Image.asset(
                              'images/twitter_icon.png',
                              height: 40,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Twitter',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60)),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                'www.instagram.com/mbahnnaeyes',
                              );
                            },
                            child: Image.asset(
                              'images/ig_icon.png',
                              color: Colors.white70,
                              height: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Instagram',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60)),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                'www.facebook.com/mbahnnaeyes/',
                              );
                            },
                            child: Image.asset(
                              'images/fb_icon.png',
                              color: Colors.white70,
                              height: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Facebook',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60)),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                'www.github.com/nnaeyes6',
                              );
                            },
                            child: Image.asset(
                              'images/git_logo.png',
                              color: Colors.white70,
                              height: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Github',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('EMAIL:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white70)),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _sendEmail(
                                'nnaeyesworld@gmail.com',
                              );
                            },
                            child: const Text('nnaeyesworld@gmail.com',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white60)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('PHONE:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white70)),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              _makePhoneCall(
                                '+2348065079608',
                              );
                            },
                            child: const Text('+2348065079608',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white60)),
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
    );
  }
}
