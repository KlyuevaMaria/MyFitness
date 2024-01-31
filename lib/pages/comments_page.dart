import 'package:flutter/material.dart';
import 'package:example/pages/models/item_model.dart';
import 'package:flutter/cupertino.dart';

// void main() {
//   runApp(const Comments());
// }

List<Item> items = [
  Item(
    id: 1,
    name: "Вася",
    userLogo: "assets/images/user_logo_3.png",
    text: "Ну крутой",
    time: "17:03",
    value: true,
  ),
  Item(
    id: 2,
    name: "Аня",
    userLogo: "assets/images/user_logo_1.png",
    text: "Атлет",
    time: "17:04",
    value: false,
  ),
  Item(
    id: 3,
    name: "Маша",
    userLogo: "assets/images/user_logo_2.png",
    text: "Машина",
    time: "17:05",
    value: true,
  ),
];

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      home: const CommentsPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  TextEditingController textController = TextEditingController();

  void deleteComment(Item item) {
    setState(() {
      items.remove(item);
    });
  }

  int reactionCount = 0;

  void _incrementCounter() {
    setState(() {
      reactionCount++;
    });
  }

  Future<bool> _confirmDismiss(
      DismissDirection direction, Item item, BuildContext context) async {
    if (direction == DismissDirection.endToStart && item.id == 1) {
      bool confirmed = await showCupertinoModalPopup<bool>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: const Text(
              'Удалить комментарий?',
              style: TextStyle(fontSize: 22),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'Отмена',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Удалить'),
              ),
            ],
          );
        },
      ) as bool;
      if (confirmed) {
        deleteComment(item);
      }
      return confirmed;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/comments_img.jpeg', width: 500),
            SizedBox(
              width: 500,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                color: const Color.fromRGBO(26, 26, 26, 1),
                height: 60,
                child: const Row(
                  children: [
                    ReactionButton(text: '❤️  1'),
                    ReactionButton(text: '🤯  1'),
                    ReactionButton(text: '🔥  1'),
                    ReactionButton(text: '🎉  1'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 500,
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction:
                            items[index].id == 1 || items[index].value == false
                                ? DismissDirection.endToStart
                                : DismissDirection.startToEnd,
                        key: ValueKey<int>(items[index].id),
                        background: Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.centerLeft,
                          color: const Color.fromRGBO(30, 111, 254, 1),
                          height: 60,
                          child: const Column(
                            children: [
                              Icon(
                                Icons.reply,
                                color: Colors.black,
                                size: 40.0,
                              ),
                              Text(
                                "Ответить",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        confirmDismiss: (direction) =>
                            _confirmDismiss(direction, items[index], context),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: items[index].value ? 500 : 440,
                            child: CommentItem(
                              item: items[index],
                              onDelete: () {
                                deleteComment(items[index]);
                              },
                            ),
                          ),
                        ),
                        secondaryBackground: items[index].name == 'Вася'
                            ? Container(
                                alignment: Alignment.centerRight,
                                color: Colors.red,
                                padding: const EdgeInsets.all(10),
                                height: 60,
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.delete_sweep,
                                      color: Colors.black,
                                      size: 40.0,
                                    ),
                                    Text(
                                      "Удалить",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            : null,
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 70,
                width: 480,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          maxLength: 200,
                          enableSuggestions: true,
                          controller: textController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            hintText: 'Ваш комментарий',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 30,
                      splashRadius: 25,
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          setState(() {
                            items.add(
                              Item(
                                id: 1,
                                name: "Вася",
                                userLogo: "assets/images/user_logo_3.png",
                                text: textController.text,
                                time:
                                    DateTime.now().toString().substring(11, 16),
                                value: true,
                              ),
                            );
                            textController.clear();
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReactionButton extends StatelessWidget {
  final String text;

  const ReactionButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 2, color: const Color.fromRGBO(140, 140, 140, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 20),
      child: Text(text, style: const TextStyle(fontSize: 22)),
    );
  }
}

class CommentItem extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;

  const CommentItem({Key? key, required this.item, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(26, 26, 26, 1),
      ),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.userLogo, width: 50, height: 50),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                                color: Color.fromRGBO(30, 111, 254, 1)),
                          ),
                        ),
                        if (item.value != true) const Text("отвечает"),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.text,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(item.time),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
