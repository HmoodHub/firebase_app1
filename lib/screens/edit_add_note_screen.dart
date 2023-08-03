import 'package:firebase_app1/bloc/bloc_edit_add_note/edit_add_note_cubit.dart';
import 'package:firebase_app1/widget/wedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class EditAddNoteScreen extends StatelessWidget {
  const EditAddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditAddNoteCubit bloc = EditAddNoteCubit.get(context);
    return BlocConsumer<EditAddNoteCubit, EditAddNoteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final arguments = Get.arguments;
        final screenType = arguments != null ? arguments['Screen'] : 'ADD';
        return Scaffold(
          appBar: AppBar(
            title: Text(screenType == 'ADD' ? 'Create' : 'Update'),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              textFormFieldApp(
                  controller: bloc.titleController,
                  type: TextInputType.text,
                  hint: 'Title',
                  prefixIcon: Icons.title,
                  borderRedius: 20),
              const SizedBox(
                height: 10,
              ),
              textFormFieldApp(
                  controller: bloc.detailsController,
                  hint: 'Details',
                  type: TextInputType.text,
                  prefixIcon: Icons.details,
                  borderRedius: 20),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async => bloc.processNote(context),
                child: const Text(
                  'Save',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
