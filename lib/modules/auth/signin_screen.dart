import 'package:creats/core/constants/my_images.dart';
import 'package:creats/core/themes/my_colors.dart';
import 'package:creats/core/themes/my_textstyles.dart';
import 'package:creats/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pinkkinlin',
              style: GoogleFonts.berkshireSwash(
                textStyle: MyTStyles.kTS30Medium.copyWith(
                  color: ThemeColors.prim1,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width,
              child: Image.asset(MyImages.login),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => authController.signInWithGoogle(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 5, bottom: 5, left: 8),
                textStyle: MyTStyles.kTS16Medium,
                backgroundColor: ThemeColors.prim1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_circle, size: 30),
                  SizedBox(width: 30),
                  Text('Sign up with Google'),
                  SizedBox(width: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
