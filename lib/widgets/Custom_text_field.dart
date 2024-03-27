import 'package:flutter/material.dart';

class CustomeTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  double? width;
  double? heigh;
  String? hinText;
  TextInputType? textInputType;
  void Function(String)? onChanged;
  CustomeTextFiled(
      {super.key,
      this.onChanged,
      required this.textEditingController,
      this.hinText,
      this.textInputType,
      this.width,
      this.heigh});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: heigh ?? 50,
      child: TextField(
          onChanged: onChanged,
          keyboardType: textInputType ?? TextInputType.text,
          controller: textEditingController,
          decoration: InputDecoration(
              hintText: hinText ?? 'Search here',
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: buildBorderSide(),
              enabledBorder: buildBorderSide(),
              focusedBorder: buildBorderSide())),
    );
  }

  OutlineInputBorder buildBorderSide() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.transparent));
  }
}

//* the steps to build prediction places in googl map
//* 1- text form filed
//* 2- add listner
//* 3- make request each time input chagned
//* 4- displasy list of changes
