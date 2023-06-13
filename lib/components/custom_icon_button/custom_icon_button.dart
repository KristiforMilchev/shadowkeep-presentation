import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_button/custom_button.dart';

//ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  final Widget? icon;
  final String label;
  final Function callback;
  late Color c1;
  late Color c2;
  late Color borderColor;
  late Color solidColor;
  late Color fontColor;
  bool disableGradient;
  List<double> stops;
  bool enabled;
  double? height;
  CustomIconButton({
    super.key,
    required this.label,
    this.icon,
    required this.callback,
    this.c1 = const Color.fromRGBO(0, 0, 0, 0.2),
    this.c2 = const Color.fromRGBO(0, 0, 0, 0),
    this.stops = const [0.2, 1.2],
    this.borderColor = Colors.white,
    this.solidColor = ThemeStyles.actionColor,
    this.disableGradient = false,
    this.fontColor = const Color.fromRGBO(255, 255, 255, 0.9),
    this.enabled = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      enabled: enabled,
      callback: () => enabled ? callback.call() : {},
      widget: Container(
        color: solidColor,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(visible: icon != null, child: icon ?? const Text("")),
            if (icon != null && label.isNotEmpty)
              const SizedBox(
                width: 4,
              ),
            if (label.isNotEmpty)
              Text(
                label,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Loto",
                ),
              )
          ],
        ),
      ),
    );
  }
}
