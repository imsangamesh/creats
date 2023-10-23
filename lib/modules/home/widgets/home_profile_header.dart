import 'package:creats/core/constants/my_constants.dart';
import 'package:creats/core/themes/theme_controller.dart';
import 'package:creats/core/utilities/utils.dart';
import 'package:creats/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/my_textstyles.dart';

class HomeProfileHeader extends StatelessWidget {
  HomeProfileHeader({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  final themeCntrlr = Get.put(ThemeController());
  final authCntrlr = Get.put(AuthController());

  String greetingText() {
    final time = DateTime.now();

    if (time.hour >= 12 && time.hour <= 16) {
      return 'Good Afternoon bae!';
    } else if (time.hour > 16 && time.hour <= 21) {
      return 'Pleasant Evening bae!';
    } else if (time.hour > 21 || time.hour < 5) {
      return 'Nightly Nights bae!';
    }
    return 'Good Morning bae!';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ----------------------- `Greeting Text`
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greetingText(),
                style: GoogleFonts.quicksand(textStyle: MyTStyles.kTS18Medium),
              ),
              SizedBox(
                width: size.width * 0.6,
                child: Text(
                  auth.currentUser!.displayName!.split(' ')[0].toString(),
                  style:
                      GoogleFonts.quicksand(textStyle: MyTStyles.kTS30Medium),
                  maxLines: 1,
                ),
              ),
            ],
          ),

          /// ----------------------- `Profile Icon`
          SizedBox(
            height: 45,
            width: 45,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => themeCntrlr.toggleThemeMode(),
                onLongPress: () => Utils.confirmDialogBox(
                  'Hey!',
                  'you wanna logout?',
                  yesFun: () => authCntrlr.logout(),
                ),
                child: Ink.image(
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
