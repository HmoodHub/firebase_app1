import 'package:bloc/bloc.dart';
import 'package:firebase_app1/firebase/firestor/fb_firestore.dart';
import 'package:firebase_app1/model/note_model.dart';
import 'package:firebase_app1/widget/wedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:toast/toast.dart';

part 'edit_add_note_state.dart';

class EditAddNoteCubit extends Cubit<EditAddNoteState> {
  EditAddNoteCubit() : super(EditAddNoteInitial());

  static EditAddNoteCubit get(context) =>
      BlocProvider.of<EditAddNoteCubit>(context);
  late TextEditingController titleController;
  late TextEditingController detailsController;
  Note? noteApp;

  void initEditAddNoteScreen() {
    if (Get.arguments['Note'] != null) {
      noteApp = Get.arguments['Note'];
    }
    titleController = TextEditingController(text: noteApp?.title ?? '');
    detailsController = TextEditingController( text: noteApp?.details ?? '');
    emit(EditAddNoteInitial());
  }

  Note get note {
    Note note = noteApp == null ? Note() : noteApp!;
    note.title = titleController.text;
    note.details = detailsController.text;
    return note;
  }

  void processNote(context) async {
    ToastContext().init(context);
    bool status = noteApp == null
        ? await FBFireStore.create(note: note)
        : await FBFireStore.update(note: note);
    if (status) {
      if (noteApp != null) {
        Get.back();
      } else {
        titleController.text = '';
        detailsController.text = '';
      }
      emit(EditAddNoteSuccess());
    }
    ShowToast(
      msg: status ? 'Process Success' : 'Process failed!!',
      state: status ? Colors.green : Colors.red,
    );
  }
}
