import 'package:email_app/message_compose.dart';
import 'package:email_app/message_details.dart';
import 'package:flutter/material.dart';
import 'message.dart';

// ignore: must_be_immutable
class MessagePage extends StatefulWidget {
  final String title;

  const MessagePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late Future<List<Message>> messages;

  @override
  void initState() {
    super.initState();

    messages = Message.browse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                var _messages = Message.browse();
                setState(() {
                  messages = _messages;
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
          future: messages,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text("there was an error: ${snapshot.error} ");
                }

                var messages = snapshot.data;
                return ListView.separated(
                    itemCount: messages!.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      Message message = messages[index];
                      return ListTile(
                        title: Text(message.subject),
                        leading: const CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Text('PJ'),
                        ),
                        isThreeLine: true,
                        subtitle: Text(
                          message.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MessageDetailsPage(
                                body: message.body,
                                subject: message.subject,
                              );
                            },
                          ));
                        },
                      );
                    });
            }
          }),
      floatingActionButton: const ComposeButton(),
    );
  }
}

class ComposeButton extends StatelessWidget {
  const ComposeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        Message message =
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MessageCompose();
        }));

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.subject)));
      },
      child: const Icon(Icons.add),
    );
  }
}
