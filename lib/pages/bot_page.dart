import 'package:flutter/material.dart';

void main() {
  runApp(const Bot());
}

List<String> botList = [
  "Скоро увидимся 😜",
  "Привет! Надеюсь, ты готов к настоящей космической гонке 🚀",
  "Хорошо, обязательно сообщи мне, как будешь готов",
  "Отлично, выбери категорию соревнований",
  "Чудно, я уже вижу тебя среди лидеров в этой категории",
];

List<String> oneUser = ["Готов 👍🏻", "Не готов 👎🏻"];
List<String> twoUser = ["Отжимания", "Бег", "Жим штанги", "Приседания"];
List<String> threeUser = ["До скорого 👋"];
List<String> messages = [
  "Привет! Надеюсь, ты готов к настоящей космической гонке 🚀"
];
List<String> nullUser = [];
List<String> currentList = oneUser;

class Bot extends StatelessWidget {
  const Bot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const BotPage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BotPage extends StatefulWidget {
  const BotPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BotPage> createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                Image.asset("assets/images/logo_bot.png"),
                const Text(
                  "Космическая гонка🚀",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(26, 26, 26, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 100,
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    children: [
                      if (botList.contains(messages[index]))
                        Image.asset("assets/images/logo_bot.png", width: 50),
                      Expanded(
                        child: Text(messages[index],
                            style: const TextStyle(fontSize: 20)),
                      ),
                      if (!botList.contains(messages[index]))
                        Image.asset("assets/images/logo_user.png", width: 50),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(26, 26, 26, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SizedBox(
              height: currentList.isEmpty ? 0 : 60,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                itemCount: currentList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(30, 111, 254, 1)),
                      ),
                      onPressed: () {
                        if ((currentList == oneUser) &&
                            (currentList[index] == "Готов 👍🏻")) {
                          setState(() {
                            messages.add(currentList[index]);
                            currentList = twoUser;
                            messages.add(botList[3]);
                            print(botList[3]);
                          });
                        } else if ((currentList == oneUser) &&
                            (currentList[index] == "Не готов 👎🏻")) {
                          setState(() {
                            messages.add(currentList[index]);
                            messages.add(botList[2]);
                            print(botList[2]);
                          });
                        } else if ((currentList == twoUser) &&
                            (currentList[index] == "Отжимания" ||
                                currentList[index] == "Бег" ||
                                currentList[index] == "Жим штанги" ||
                                currentList[index] == "Приседания")) {
                          setState(() {
                            messages.add(currentList[index]);
                            currentList = threeUser;
                            messages.add(botList[4]);
                            print(botList[4]);
                          });
                        } else if ((currentList == threeUser) &&
                            (currentList[index] == "До скорого 👋")) {
                          setState(() {
                            messages.add(currentList[index]);
                            currentList = nullUser;
                            messages.add(botList[0]);
                            print(botList[0]);
                          });
                        }
                      },
                      child: Text(
                        currentList[index],
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
