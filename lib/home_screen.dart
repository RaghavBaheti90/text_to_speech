import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_speech/GPT_CHAT.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController value = TextEditingController();
  FlutterTts flutterTts = FlutterTts();

  void speak() async {
    await flutterTts.speak(value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("enter your text in"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextField(
                  controller: value,
                  decoration: InputDecoration(hintText: "enter"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        speak();
                      },
                      child: Icon(Icons.volume_down_outlined)),
                  ElevatedButton(
                      onPressed: () {
                        flutterTts.stop();
                      },
                      child: Icon(Icons.stop)),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => gpt_chat()),
                    );
                  },
                  child: Text("GPT")),
            ],
          ),
        ),
      ),
    );
  }
}
