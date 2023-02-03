import 'dart:convert';
import 'package:http/http.dart' as http;

String getLink(String category, String difficulty){
 var link = "https://opentdb.com/api.php?amount=10&category=$category&difficulty=$difficulty";
 return link;
}

getQuiz(String category, String difficulty) async {
  var res = await http.get(Uri.parse(getLink(category, difficulty)));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    return data;
  }
}
