import 'package:creats/core/constants/my_constants.dart';
import 'package:creats/core/themes/my_colors.dart';
import 'package:creats/core/themes/theme_controller.dart';
import 'package:creats/modules/home/add_or_view_note.dart';
import 'package:creats/modules/home/widgets/home_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/helpers/my_helper.dart';
import '../../core/utilities/utils.dart';
import 'widgets/note_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //
  String get imageUrl => auth.currentUser!.photoURL ?? MyHelper.profilePic;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (cntrlr) => Scaffold(
        backgroundColor: cntrlr.isDark()
            ? MyColors.darkScaffoldBG
            : MyColors.lightScaffoldBG,
        appBar: AppBar(
          title: HomeProfileHeader(imageUrl: imageUrl),
          toolbarHeight: 90,
        ),
        body: StreamBuilder(
          stream:
              fire.collection('text_snippets').orderBy('createdAt').snapshots(),
          builder: (context, snapshot) {
            final snapData = snapshot.data;

            if (snapshot.data == null || snapData!.docs.isEmpty) {
              return Utils.emptyList('no text snippets here!\nadd some');
            }

            return ListView.builder(
              itemCount: snapData.docs.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final data = snapData.docs[index].data();

                return NoteTile(data, cntrlr.primary());
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddOrViewNote()),
          child: const Icon(Icons.add_circle_rounded,
              size: 40, color: Colors.white),
        ),
      ),
    );
  }
}
