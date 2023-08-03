part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesDeleted extends NotesState {}
class NotesNotDeleted extends NotesState {}
