

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/ui/welcome/welcome_page.dart';
import 'package:todo_list_app/ultils.enums/onboarding_page_position.dart';
import 'onboarding_child_page.dart';


class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        // không cho vuốt mà phải bấm nút để di chuyển pgae
        children: [
          // truyen vao cac widget con ma muon pageview hien thi
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPerssed: () {
              _pageController.jumpToPage(1); // đi đến page 2
            }, backOnPerssed: () {
            // nothing : khong thuc hien gi ca
          },
            skipOnPerssed: () {
              _markOnboardingCompleted();
              _goToWelcomePage();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
            nextOnPerssed: () {
              _pageController.jumpToPage(2); // đi đến page 3
            },
            backOnPerssed: () {
              _pageController.jumpToPage(0); // đi đến page 1
            },
            skipOnPerssed: () {
              _markOnboardingCompleted();
              _goToWelcomePage();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPerssed: () {
              _markOnboardingCompleted();
              _goToWelcomePage();
            },
            backOnPerssed: () {
              _pageController.jumpToPage(1); // đi đến page 2
            },
            skipOnPerssed: () {
              _markOnboardingCompleted();
              _goToWelcomePage();
            },
          ),
        ],
      ),
    );
  }

  void _goToWelcomePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const WelcomePage(
                isFirstTimeInstallApp:true),
        ),
    );
  }

  Future<void> _markOnboardingCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("kOnboardingComplete", true);
    }
    catch (e) {
      print(e);
      return;
    }
  }
}
