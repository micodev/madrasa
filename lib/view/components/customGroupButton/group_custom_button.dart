import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
    this.height,
    this.disabled = false,
    this.width,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final bool isSelected;
  final bool disabled;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: isSelected ? selectedShadow : unselectedShadow,
      ),
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: disabled
              ? MaterialStateProperty.all<Color?>(Colors.grey)
              : _getBackGroundColor(theme),
          shape: _buildShape(),
        ),
        child: Text(
          text,
          style: isSelected ? selectedTextStyle : unselectedTextStyle,
        ),
      ),
    );
  }

  MaterialStateProperty<Color?> _getBackGroundColor(ThemeData theme) {
    final themePrimaryColor = theme.buttonTheme.colorScheme?.primary;
    //TODO: implement
    // final themeSecondaryColor = theme.buttonTheme.colorScheme?.secondary;

    Color? selectedColorBuffer = selectedColor;
    Color? unselectedColorBuffer = unselectedColor;

    selectedColorBuffer ??= themePrimaryColor;
    selectedColorBuffer ??= Colors.black;

    unselectedColorBuffer ??= Colors.white;

    final color = isSelected ? selectedColorBuffer : unselectedColorBuffer;
    return MaterialStateProperty.all<Color?>(color);
  }

  MaterialStateProperty<OutlinedBorder>? _buildShape() {
    final color = isSelected
        ? selectedBorderColor ?? unselectedBorderColor
        : unselectedBorderColor;
    if (borderRadius != null) {
      return MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius!,
          side: buildBorderSide(color),
        ),
      );
    } else {
      return MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: buildBorderSide(color),
        ),
      );
    }
  }

  BorderSide buildBorderSide(Color? color) {
    if (color != null) {
      return BorderSide(
        color: color,
      );
    }
    return BorderSide.none;
  }
}
