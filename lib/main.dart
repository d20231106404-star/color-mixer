import 'package:flutter/material.dart';
import 'color_circle.dart';
import 'color_value_changer.dart' hide ColorCircle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Mixer',
      home: ColorMixerPage(),
    );
  }
}

class ColorMixerPage extends StatefulWidget {
  @override
  _ColorMixerPageState createState() => _ColorMixerPageState();
}

class _ColorMixerPageState extends State<ColorMixerPage> {
  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;

  void updateColor(String channel, double value) {
    setState(() {
      if (channel == 'red') redValue = value;
      if (channel == 'green') greenValue = value;
      if (channel == 'blue') blueValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Mixer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ColorCircle(
              color: Color.fromRGBO(
                redValue.toInt(),
                greenValue.toInt(),
                blueValue.toInt(),
                1,
              ),
              size: 150,
            ),
            SizedBox(height: 30),
            ColorValueChanger(
              label: 'Red',
              value: redValue,
              activeColor: Colors.red,
              onChanged: (value) => updateColor('red', value),
            ),
            ColorValueChanger(
              label: 'Green',
              value: greenValue,
              activeColor: Colors.green,
              onChanged: (value) => updateColor('green', value),
            ),
            ColorValueChanger(
              label: 'Blue',
              value: blueValue,
              activeColor: Colors.blue,
              onChanged: (value) => updateColor('blue', value),
            ),
          ],
        ),
      ),
    );
  }
}
