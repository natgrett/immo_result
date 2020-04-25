import 'package:flutter/material.dart';
import '../viewStates.dart';

class DestinationTitleContent extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextOverflow overflow;
  final bool isOverflow;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const DestinationTitleContent({
    Key key,
    this.text,
    this.fontSize,
    this.overflow,
    this.isOverflow,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : super(key: key);

  Widget _buildTitleText() => Text(
        text,
        overflow: overflow,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: 'MakeItSans',
          fontStyle: fontStyle,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: isOverflow
          ? OverflowBox(
              alignment: Alignment.topLeft,
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: _buildTitleText(),
            )
          : _buildTitleText(),
    );
  }
}

class DestinationTitle extends StatefulWidget {
  final String title;
  final ViewState viewState;
  final double smallFontSize;
  final double largeFontSize;
  final TextOverflow textOverflow;
  final bool isOverflow;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const DestinationTitle({
    Key key,
    @required this.title,
    @required this.viewState,
    this.smallFontSize = 15.0,
    this.largeFontSize = 25.0,
    this.textOverflow = TextOverflow.ellipsis,
    this.isOverflow = false,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  _DestinationTitleState createState() => _DestinationTitleState();
}

class _DestinationTitleState extends State<DestinationTitle>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _fontSizeTween;

  double fontSize;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {
          fontSize = _fontSizeTween.value;
        });
      });

    switch (widget.viewState) {
      case ViewState.enlarge:
        _fontSizeTween = Tween<double>(
          begin: widget.smallFontSize,
          end: widget.largeFontSize,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

        _animationController.forward(from: 0.0);
        break;

      case ViewState.enlarged:
        fontSize = widget.largeFontSize;
        break;

      case ViewState.shrink:
        _fontSizeTween = Tween<double>(
          begin: widget.largeFontSize,
          end: widget.smallFontSize,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

        _animationController.forward(from: 0.0);
        break;

      case ViewState.shrunk:
        fontSize = widget.smallFontSize;
        break;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DestinationTitleContent(
      text: widget.title,
      fontSize: fontSize,
      overflow: widget.textOverflow,
      isOverflow: widget.isOverflow,
      color: widget.color,
      fontWeight: widget.fontWeight,
      fontStyle: widget.fontStyle,
    );
  }
}
