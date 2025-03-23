import 'package:flutter/material.dart';

class ForgetButtonWidget extends StatelessWidget {
  const ForgetButtonWidget({super.key,required this.onTap});
  
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
          child: Text('Forgot password?',style: TextStyle(color: Color(0xFF1A5CFF),fontSize: 14,fontWeight: FontWeight.w400,),)),
    );
  }
}
