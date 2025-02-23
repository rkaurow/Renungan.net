import 'package:flutter/material.dart';
import 'package:task_sir_pandi/const/constant.dart';
import 'package:task_sir_pandi/features/pages/dashboard.dart';
import 'package:task_sir_pandi/features/pages/main_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                OnboardingPage(
                  title: 'Read interesting articles every single day!',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                  imageUrl:
                      'assets/images/onboardingscreen1.png', // Example image
                ),
                OnboardingPage(
                  title: 'Boost your productivity with helpful tips',
                  description:
                      'Get articles that will guide you to work smarter and improve your day-to-day life.',
                  imageUrl:
                      'assets/images/onboardingscreen2.png', // Example image
                ),
                OnboardingPage(
                  title: 'Stay up to date with the latest trends!',
                  description:
                      'Discover trending topics and popular articles that interest you.',
                  imageUrl:
                      'assets/images/onboardingscreen3.png', // Example image
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.brown : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.brown.shade100,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                  },
                  child: Container(
                    height: tinggi(context) * 0.06,
                    width: panjang(context) * 0.40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Skip the onboarding and go to the home screen
                //     Navigator.pushReplacementNamed(context, '/home');
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.transparent,
                //     side: BorderSide(color: Colors.grey),
                //   ),
                //   child: Text(
                //     'Skip',
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),

                GestureDetector(
                  onTap: () {
                    if (_currentPage == 2) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ));
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    height: tinggi(context) * 0.06,
                    width: panjang(context) * 0.40,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontFamily: 'Urbanist',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     if (_currentPage == 2) {
                //       Navigator.pushReplacementNamed(context, '/home');
                //     } else {
                //       _pageController.nextPage(
                //         duration: Duration(milliseconds: 300),
                //         curve: Curves.easeIn,
                //       );
                //     }
                //   },
                //   child: Text('Next'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(children: [
          Image.asset(
            height: tinggi(context) * 0.6,
            imageUrl,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 30,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color.fromARGB(0, 255, 255, 255),
                    Colors.white,
                  ])),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
