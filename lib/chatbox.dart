import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text(
          "Chat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              shrinkWrap: false,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: (_chatHistory[index]["isSender"]
                        ? Alignment.topRight
                        : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: (_chatHistory[index]["isSender"]
                            ? Color(0xFFF69170)
                            : Colors.white),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        _chatHistory[index]["message"],
                        style: TextStyle(
                            fontSize: 15,
                            color: _chatHistory[index]["isSender"]
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFF69170),
                              Color(0xFF7D96E6),
                            ],
                          ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          controller: _chatController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        if (_chatController.text.isNotEmpty) {
                          _sendMessage(_chatController.text);
                          _chatController.clear();
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFF69170),
                            Color(0xFF7D96E6),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            minWidth: 88.0, minHeight: 36.0),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _sendMessage(String message) {
    String response = _generateResponse(message);
    _addMessage(message, true);
    _addMessage(response, false);
    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
    );
  }

  void _addMessage(String message, bool isSender) {
    setState(() {
      _chatHistory.add({
        "time": DateTime.now(),
        "message": message,
        "isSender": isSender,
      });
    });
  }

  String _generateResponse(String message) {
    String lowerCaseMessage = message.toLowerCase();

    if (lowerCaseMessage == "hello" || lowerCaseMessage == "hi") {
      return "Hi there! How can I help you?";
    } else if (lowerCaseMessage == "how are you") {
      return "I'm doing well, thank you! how about you ?";
    } else if (lowerCaseMessage == "i'm good, thanks. did you do anything interesting today?") {
      return "Just the usual. Went to work, grabbed some lunch. What about you?";
    } else if (lowerCaseMessage == "same here. work, lunch, you know the drill. anything exciting happening this weekend?") {
      return "Not really. Probably just relaxing at home. How about you?";
    } else if (lowerCaseMessage == "i might catch a movie or go for a hike. haven't decided yet. any movie recommendations?") {
      return "Inception is always a good choice. Or if you're in the mood for a comedy, The Grand Budapest Hotel is hilarious.";
    } else if (lowerCaseMessage == "nice, i'll consider those. thanks!") {
      return "No problem. Let me know what you decide. Enjoy your weekend!";
    } else if (lowerCaseMessage == "will do. have a great day!") {
      return "You too!";
    } else if (lowerCaseMessage == "bye") {
      return "Goodbye! Take care.";
    } else {
      return "I'm sorry, I didn't understand. Can you please clarify?";
    }
  }

}