import 'package:flutter/material.dart';
import '../../core/styles/box_decoration.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key, this.overrideBackButton,
    this.color = Colors.black,
    this.size,
  });

  final void Function()? overrideBackButton;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: ()=> Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: CustomDecoration(
          isCircular: true,
          borderColor: Colors.black26,
          borderWidth: 1,
        ),
        child: Icon(Icons.arrow_back_ios_rounded, color: color,  size: size,),
      ),
    );
  }

}
