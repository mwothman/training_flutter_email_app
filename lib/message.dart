import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message({
    required this.subject,
    required this.body,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    http.Response response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/62fa1bb0-3ef2-42b3-bd08-aaa954773696'));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
    return _messages;
  }
}
