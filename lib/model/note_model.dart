class Note {
  late String id, title, details;

  Note();

  Map<String , dynamic> toMap(){
    Map<String , dynamic> myMap = {};
    myMap['title'] = title;
    myMap['details'] = details;
    return myMap;
  }

  Note.fromMap(Map<String , dynamic> myMap){
    title = myMap['title'];
    details = myMap['details'];
  }
}
