import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app1/bloc/bloc_notes/notes_cubit.dart';
import 'package:firebase_app1/bloc/bloc_notes/notes_cubit.dart';
import 'package:firebase_app1/firebase/auth/FB_auth.dart';
import 'package:firebase_app1/firebase/firestor/fb_firestore.dart';
import 'package:firebase_app1/screens/auth/login_screen.dart';
import 'package:firebase_app1/screens/edit_add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotesCubit bloc = NotesCubit.get(context);
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  FBAuth.signOut();
                  Get.off(LoginScreen());
                },
                icon: const Icon(Icons.logout),
              ),
              IconButton(
                onPressed: () {
                  Get.to(const EditAddNoteScreen(),
                      arguments: {'Screen': 'ADD'});
                },
                icon: const Icon(Icons.note_add),
              ),
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FBFireStore.read(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                List<QueryDocumentSnapshot> data = snapshot.data!.docs;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Get.to(const EditAddNoteScreen(),arguments: {
                        'Screen' : 'UPDATE',
                        'Note' : bloc.note(data[index]),
                      });
                    },
                    title: Text(
                      data[index].get('title'),
                    ),
                    subtitle: Text(
                      data[index].get('details'),
                    ),
                    trailing: InkWell(
                      onTap: () async => bloc.delete(data[index].id, context),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red.shade400,
                      ),
                    ),
                  ),
                  itemCount: data.length,
                );
              } else {
                return const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        size: 150,
                        color: Colors.grey,
                      ),
                      Text(
                        'No Data',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
