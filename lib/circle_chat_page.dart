import 'package:flutter/material.dart';

class CircleChatPage extends StatefulWidget {
  final String circleTitle;

  CircleChatPage({Key? key, required this.circleTitle}) : super(key: key);

  @override
  _CircleChatPageState createState() => _CircleChatPageState();
}

class _CircleChatPageState extends State<CircleChatPage> {
  final List<Map<String, String>> messages = [
    {
      "user": "Sulis wati",
      "text": "HALO !!, ada ide untuk membuat kue rendah gula ngak ?"
    },
    {"user": "Rudi_Handal", "text": "G"},
    {
      "user": "Ridwan toho",
      "text": "Halo mba, kebetulan saya ada buka usaha kue juga"
    },
    {
      "user": "Sulis Wati",
      "text": "Owh semangat mas ridwan, bagi tips dong hehe"
    },
    {
      "user": "Ridwan toho",
      "text":
          "Yang kamu butuhkan adalah 3 buah pisang matang. 1 butir telur. 2 sdm minyak kelapa. 1/2 sdt vanili bubuk, baking powder, soda kue. 150 gram tepung gandum utuh. 30 gram bubuk kakao tanpa pemanis. 2 - 4 tetes stevia cair (opsional). 50 gram dark chocolate, potong kecil-kecil."
    },
    {
      "user": "Tara puspa",
      "text": "Oh kalau boleh tau proses pembuatannya berapa lama ya?"
    }
  ];

  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"user": "You", "text": text});
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.circleTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                reverse: false,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${message['user']} : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          TextSpan(
                            text: message['text'],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    GestureDetector(
                      onTap: _sendMessage,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.greenAccent.shade700,
                        ),
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
