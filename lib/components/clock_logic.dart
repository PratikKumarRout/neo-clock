import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:math_time/components/center_point.dart';
import 'package:math_time/components/hour_hand.dart';
import 'package:math_time/components/minute_hand.dart';
import 'package:math_time/components/round_face.dart';
import 'package:math_time/components/second_hand.dart';
import 'package:math_time/neodesign/neodesign.dart';
import 'package:math_time/providers/themes_provider.dart';
import 'package:provider/provider.dart';

class ClockLogic extends StatefulWidget {
  const ClockLogic({super.key});

  @override
  State<ClockLogic> createState() => _ClockLogicState();
}

class _ClockLogicState extends State<ClockLogic> {
  late final Ticker _ticker;
  double _secondAngle = 0.0;
  double _minuteAngle = 0.0;
  double _hourAngle = 0.0;

  @override
  void initState() {
    super.initState();

    //initialize the ticker to update the angles continuously
    _ticker = Ticker((elapsed) {
      setState(() {
        final now = DateTime.now();
        final seconds = now.second + (now.millisecond / 1000);
        final minutes = now.minute.toDouble();
        final hours = (now.hour % 12) + (minutes / 60);

        //calculate angles for each hand
        _secondAngle = (seconds * 2 * pi) / 60;
        _minuteAngle = (minutes / 60) * 2 * pi;
        _hourAngle = (hours / 12) * 2 * pi;
      });
    });

    _ticker.start();
  }

  @override
  void dispose() {
    super.dispose();
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double smallerSide =
            constraints.maxWidth < constraints.maxHeight
                ? constraints.maxWidth
                : constraints.maxHeight;

        final double minSize = 160.0;

        final double containerSize = max(smallerSide / 1.45, minSize);

        final Size sizeOff = Size(containerSize, containerSize);

        return Center(
          child: SizedBox(
            height: containerSize,
            width: containerSize,
            child: Neodesign(
              borderRadius: containerSize / 2,
              child: GestureDetector(
                onDoubleTap: () {
                  Provider.of<ThemesProvider>(context, listen: false).toggleTheme();
                },
                child: Stack(
                  children: [
                    RoundFace(size: sizeOff),
                    HourHand(size: sizeOff, hourAngle: _hourAngle),
                    MinuteHand(size: sizeOff, minuteAngle: _minuteAngle),
                    SecondHand(size: sizeOff, angle: _secondAngle),
                    CenterPoint(size: sizeOff),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
