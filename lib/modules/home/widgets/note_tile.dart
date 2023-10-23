import 'package:creats/core/themes/my_textstyles.dart';
import 'package:creats/core/utilities/utils.dart';
import 'package:creats/core/widgets/my_buttons.dart';
import 'package:creats/modules/home/add_or_view_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteTile extends StatelessWidget {
  NoteTile(this.data, this.color, {super.key});

  final Color color;
  final Map data;

  final isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.all(10),
          tilePadding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
          expandedAlignment: Alignment.centerLeft,
          onExpansionChanged: (val) => isExpanded(val),
          title: Text(data['title'], style: MyTStyles.kTS18Medium),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyIconBtn(
                Icons.drive_file_rename_outline_rounded,
                () => Get.to(() => AddOrViewNote(noteData: data)),
                size: 35,
              ),
              const SizedBox(width: 7),
              MyIconBtn(
                Icons.copy_rounded,
                () => Utils.copy(data['body']),
                size: 35,
              ),
            ],
          ),
          children: [
            Text(data['body'], style: const TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
