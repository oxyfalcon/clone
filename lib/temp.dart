import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

void main() async{
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
  await api("https://media.acponline.org/feeds/annals-latest-rss.xml");
}

Future api(String url) async{
  final response = await http.get(Uri.parse(url));
  final body = response.body;
  // print(body);
  final myTransformer = Xml2Json();
  myTransformer.parse(body);
  var json = myTransformer.toGData();
  print(json);
}