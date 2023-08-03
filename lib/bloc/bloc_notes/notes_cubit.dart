import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app1/firebase/firestor/fb_firestore.dart';
import 'package:firebase_app1/model/note_model.dart';
import 'package:firebase_app1/widget/wedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:toast/toast.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of<NotesCubit>(context);

  void delete(String path, context)async{
    ToastContext().init(context);
   bool deleted =  await FBFireStore.delete(path: path);
   if (deleted) {
     ShowToast(msg: 'Note Deleted Successfully', state: Colors.green );
     emit(NotesDeleted());
   } else{
     ShowToast(msg: 'Delete failed', state:Colors.red);
     emit(NotesNotDeleted());
   }
  }

  Note note(QueryDocumentSnapshot documentSnapshot){
    Note note = Note();
    note.id = documentSnapshot.id;
    note.title = documentSnapshot.get('title');
    note.details = documentSnapshot.get('details');
    return note;
  }
}
