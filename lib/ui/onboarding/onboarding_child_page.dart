// dong vai tro la giao dien man hinh chinh
import 'package:flutter/material.dart';
import 'package:todo_list_app/ultils.enums/onboarding_page_position.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  final VoidCallback nextOnPerssed;
  final VoidCallback backOnPerssed;
  final VoidCallback skipOnPerssed;
  const OnboardingChildPage({super.key,
    required this.onboardingPagePosition ,
    required this.nextOnPerssed,
    required this.backOnPerssed,
    required this.skipOnPerssed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // start thi o dau . center thi o giua , and la cuoi
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSkipButton(),
              _buildOnboardingImage(),
              _buildOnboardingPageControl(),
              _buildOnboardingTitleAndContent(),
              _buildOnboardingNextAndBackButton(),

            ],
          ),
        ),
      ),
    );
  }
  Widget  _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
          onPressed: (){
            skipOnPerssed();
          },
          child: Text(
            "SKIP",
              style: TextStyle(fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.44), // 44% tuong duong voi 0.44
              ),
          ),
      ),
    );
  }

  Widget   _buildOnboardingImage() {
    return Image.asset(
      onboardingPagePosition.onboardingPageImage(),
    width: 271,
    height: 296,
    fit: BoxFit.contain,
    );
  }

  Widget _buildOnboardingPageControl() {
    // Ở page 1 thì sáng ở vị trí 1 và xám ở vị trí 2 -3
    //  và ngược lại
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,// cho ra giua
        children: [
          // vi tri 1
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page1
                  ? Colors.white
                  : Colors.white.withOpacity(0.44),
              borderRadius: BorderRadius.circular(56),
            ),
          ),
          // vị trí 2
          Container(
            height: 4,
            width: 26,
            margin: const EdgeInsets.symmetric(horizontal: 8),// cach ca trai vs phai
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page2
                  ? Colors.white
                  : Colors.white.withOpacity(0.44),
              borderRadius: BorderRadius.circular(56),
            ),
          ),
          // vị trí 3
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page3
                    ? Colors.white
                    : Colors.white.withOpacity(0.44),
              borderRadius: BorderRadius.circular(56),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
         margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            onboardingPagePosition.onboardingPageTitle(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.87),
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",

            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 42,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            onboardingPagePosition.onboardingPageContent(),
            style: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontSize: 16,
            fontFamily: "Lato",
          ),
            textAlign: TextAlign.center,
          ),
        ),

      ],
    );
  }

  Widget _buildOnboardingNextAndBackButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 107,bottom: 24),
      child: Row(
        children: [
          TextButton(
              onPressed: (){
                backOnPerssed();
              },
              child: Text(
                "BACK",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Lato",
                color: Colors.white.withOpacity(0.44),
              ),
              ),
          ),
           const Spacer(),
          ElevatedButton(
              onPressed: (){
                nextOnPerssed.call();
              },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8875FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              )
            ),
              child:  Text(
                 onboardingPagePosition == OnboardingPagePosition.page3
                    ? "GET STARTED"
                    : "NEXT",
               style: const TextStyle(
               fontSize: 16,
                 fontFamily: "Lato",
                 color: Colors.white
                 ),
               ),
          ),
        ],
      ),
    );
  }
}

