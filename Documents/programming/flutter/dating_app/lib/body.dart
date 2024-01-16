import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Body> {
  bool yes = false;
  String ask = "こんしゅうのきゅうじつにひまですか。ひまなら　どこかへ　出かけましょう";
  String blur = '';
  String answer = "";
  String _setImage() {
    if (yes == true) {
      answer = "ありがとうございます。じゃ、きゅうじつにあいましょう。";
      return 'images/hap.gif';
    } else {
      return 'images/data.jpg'; // Provide a default image or handle this case
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(ask,
              style: const TextStyle(
                  color: Colors.lightBlue, fontSize: 20, height: 1)),
          Image(
            image: AssetImage(_setImage()),
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(
              height: 10), // Add some space between the image and checkbox
          Checkbox(
            value: yes,
            activeColor: Colors.red,
            focusColor: Colors.lightBlue,
            hoverColor: Colors.amber,
            onChanged: (bool? value) {
              setState(() {
                yes = value!;
                ask = blur;
                answer = blur;
              });
            },
          ),
          const SizedBox(height: 10),
          Text(answer, style: const TextStyle(color: Colors.red, fontSize: 20)),
        ],
      ),
    );
  }
}
