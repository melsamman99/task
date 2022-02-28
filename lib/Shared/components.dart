import 'package:flutter/material.dart';
import 'package:task/AppUtilities/utilities.dart';

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class CircleBackground extends StatelessWidget {
  IconData icon;
  Color? iconColor,backColor;
  CircleBackground({Key? key,required this.icon,this.iconColor,this.backColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: backColor??Utilities.secondColor.withOpacity(0.5)
      ),
      child: Icon(icon,size: 17,color: iconColor??Utilities.iconColor,),
    );
  }
}



class CustomInput extends StatelessWidget {
  String hint;
  TextEditingController controller;
  TextInputType textInputType;
  Function()? onTap;
  Function(String v)? onChange;
  bool? obscureText,readOnly,autofocus,validation;
  Widget? suffixIcon;
  Widget? prefixIcon;
  int? maxLines , maxLength;
  double radius;
  TextAlign? textAlign;
  var inputFormatters;
  CustomInput({Key? key,required this.controller,required this.hint,required this.textInputType,this.obscureText = false,this.prefixIcon,this.suffixIcon,this.onTap,this.onChange,this.maxLines,this.textAlign,this.readOnly = false,this.autofocus = false,this.radius = 25.0,this.maxLength,this.validation=true,this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      onTap: onTap??(){},
      readOnly: readOnly!,
      // maxLength: maxLength,
      textAlign: textAlign??TextAlign.left,
      onChanged: onChange??(v){},
      inputFormatters: inputFormatters,
      validator: validation!?(v){
        if(v!.isEmpty) {
          return "fieldRequired";
        }
      }:null,
      autofocus: autofocus!,
      maxLines: maxLines??1,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Utilities.inputColor,
        suffixIconConstraints: const BoxConstraints(
            minWidth: 63
        ),
        prefixIcon: prefixIcon,
        contentPadding:  EdgeInsets.symmetric(horizontal: 10,vertical: MediaQuery.of(context).size.height*0.025),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Utilities.whiteColor,width: 2)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Utilities.whiteColor,width: 2)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Utilities.whiteColor,width: 2)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Utilities.whiteColor,width: 2)
        ),

      ),
    );
  }
}



class CustomText extends StatelessWidget {
  String text;
  int? fontSize;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  Color? color;
  CustomText({Key? key,required this.text,this.fontSize = 14,this.textAlign,this.fontWeight = FontWeight.w400,this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign: textAlign??TextAlign.left,style: TextStyle(color: color,fontSize: double.parse(fontSize.toString()),fontWeight: fontWeight,));
  }
}