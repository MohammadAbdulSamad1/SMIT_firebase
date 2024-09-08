import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_button extends StatelessWidget {
  Custom_button(
      {super.key,
      this.width,
      this.height,
      this.onPressed,
      this.text,
      this.isloading});
  final width;
  final height;
  final onPressed;
  final text;
  final isloading;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.teal, Colors.teal.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: isloading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
        ),
      ),
    );
  }
}
