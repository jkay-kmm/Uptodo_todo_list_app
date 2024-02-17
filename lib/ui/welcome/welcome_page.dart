
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final bool isFirstTimeInstallApp;
  const WelcomePage({super.key,
  required this.isFirstTimeInstallApp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:isFirstTimeInstallApp ? IconButton(
          onPressed: (){
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: Colors.white,),
        ):null
      ),
      body: Column(
        children: [
          _buildTitleAndDesc(),
          const Spacer(),
          _buildButtonChangeLanguage(context),
          _buildButtonLogin(),
          _buildButtonRegister(),
        ],
      ),
    );
  }
  Widget _buildTitleAndDesc(){
    return Container(
      margin:  const EdgeInsets.only(top: 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "welcome_title".tr(),
              style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato",

              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 26,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "welcome_desc".tr(),
              style: TextStyle(
                color: Colors.white.withOpacity(0.67),
                fontSize: 16,
                fontFamily: "Lato",
              ),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildButtonChangeLanguage(BuildContext context){
    return Container(
      width: double.infinity,
      height: 48,
      padding:const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: (){
          //lay ra locale hien tai
          final  currentLocale = context.locale.toString();
          if(currentLocale == "en"){
            context.setLocale(const Locale("vi"));
          }else {
            context.setLocale(const Locale("en"));
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8875FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )
        ),
        child:  const  Text(
          "Đổi ngôn ngữ",
          style:  TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              color: Colors.white
          ),
        ),
      ),
    );
  }
  Widget _buildButtonLogin(){
    return Container(
      width: double.infinity,
      height: 48,
      padding:const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.symmetric(vertical: 28),
      child: ElevatedButton(
        onPressed: (){
          // TODO : Xu ly sau
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8875FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )
        ),
        child:  const  Text(
          "LOGIN",
          style:  TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRegister(){
    return Container(
      width: double.infinity,
      height: 48,
      padding:const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
          onPressed: (){
            //TODO : xu ly sau
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
              side: const BorderSide(
                width: 1,
                color: Color(0xFF121212) ,
              )
          ),
          child: const Text(
            "CREATE ACCOUNT",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              color: Colors.white,
            ),
          ),
      ),
    );
  }
}
