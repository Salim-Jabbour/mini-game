import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton(
      {required this.text, required this.routeFunction, super.key});

  final Function routeFunction;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeumorphicButton(
          onPressed: () => routeFunction(),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(60),
            ),
            shape: NeumorphicShape.concave,
            surfaceIntensity: 0.2,
            depth: 3,
            intensity: 0.5,
            shadowDarkColor: Colors.white70,
            disableDepth: false,
            lightSource: LightSource.bottom,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Color(0xff00ADB5), fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
