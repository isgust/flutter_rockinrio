import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        title: Text(
          'Fale conosco',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (_, int index) => ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(_messages[index]),
            ),
          ),
        ),
        Divider(height: 1.0),
        _buildTextComposer(),
      ],
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration.collapsed(
                hintText: 'Enviar mensagem',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmit(_textController.text),
          ),
        ],
      ),
    );
  }

  void _handleSubmit(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, text);
      });
      _textController.clear();
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatPage(),
  ));
}
