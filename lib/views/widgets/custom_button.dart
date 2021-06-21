import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CustomButton extends StatefulWidget {
  final String btnText ;
  final  Function onPress;
  final EdgeInsetsGeometry padding;
  final Color bgColor;
  final Color txtColor;

  const CustomButton({Key key, this.btnText, this.onPress, this.padding, this.bgColor, this.txtColor}) : super(key: key);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
        padding: widget.padding ?? EdgeInsets.all(2.0.h),
        color: widget.bgColor ?? Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0.w)
        ),
        child: Text(widget.btnText.toUpperCase(),
          style: TextStyle(fontSize: 13.0.sp, color: widget.txtColor ?? Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed:  widget.onPress

    );
  }
}
