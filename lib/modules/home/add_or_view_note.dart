import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creats/core/constants/my_constants.dart';
import 'package:creats/core/themes/my_colors.dart';
import 'package:creats/core/themes/my_textstyles.dart';
import 'package:creats/core/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddOrViewNote extends StatefulWidget {
  const AddOrViewNote({this.noteData, super.key});
  final Map? noteData;

  @override
  State<AddOrViewNote> createState() => _AddOrViewNoteState();
}

class _AddOrViewNoteState extends State<AddOrViewNote> {
  //
  final _titleCntrlr = TextEditingController().obs;
  final _bodyCntrlr = TextEditingController().obs;

  @override
  void initState() {
    if (widget.noteData != null) {
      _titleCntrlr().text = widget.noteData!['title'];
      _bodyCntrlr().text = widget.noteData!['body'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(widget.noteData == null
                ? 'Add New Note'
                : widget.noteData!['title']),
            actions: [
              if (widget.noteData != null)
                IconButton(
                  icon: const Icon(Icons.delete_forever),
                  onPressed: () => Utils.confirmDialogBox(
                    'Oops!',
                    'do you wanna delete this note?',
                    yesFun: () => deleteNote(),
                  ),
                ),
              IconButton(
                icon: const Icon(Icons.copy_rounded),
                onPressed: () => Utils.copy(_bodyCntrlr().text),
              ),
              const SizedBox(width: 10)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              children: [
                CustomTextfield('title...', _titleCntrlr(), maxLines: 2),
                const SizedBox(height: 10),
                Expanded(
                  child: CustomTextfield(
                    'your body goes here...',
                    _bodyCntrlr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if (_titleCntrlr().text.trim() == '' && _bodyCntrlr().text.trim() == '') {
      Utils.showSnackBar('Note not saved!', status: false);
      return true;
    }

    const uuid = Uuid();
    final id = widget.noteData == null ? uuid.v4() : widget.noteData!['id'];

    try {
      fire.collection('text_snippets').doc(id).set({
        'id': id,
        'title': _titleCntrlr().text.trim(),
        'body': _bodyCntrlr().text.trim(),
        'createdAt': Timestamp.now(),
      });

      Utils.showSnackBar('Note saved!', status: true);
    } on FirebaseException catch (e) {
      Utils.showAlert('Oops', e.toString());
    } catch (_) {
      Utils.normalDialog();
    }
    return true;
  }

  deleteNote() async {
    try {
      await fire
          .collection('text_snippets')
          .doc(widget.noteData!['id'])
          .delete();

      Get.back();
      Utils.showSnackBar('Note Deleted!');
    } catch (e) {
      Utils.normalDialog();
    }
  }
}

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(this.label, this.controller,
      {this.maxLines, super.key});

  final String label;
  final int? maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      expands: maxLines == null ? true : false,
      maxLines: maxLines,
      style: label == 'title...'
          ? MyTStyles.kTS18Medium
          : const TextStyle(fontSize: 17),
      textInputAction: TextInputAction.newline,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        hintText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.primary(100)),
        ),
      ),
    );
  }
}

// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but Ixxxxxxxxxxxxggg the
// b b church's with b but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I don't know what to do with it but I