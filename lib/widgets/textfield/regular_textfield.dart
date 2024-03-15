import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const RegularTextField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
        ),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffE5E5E5),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Enter your email",
            hintStyle: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Color(0xffB4B9C0),
            ),
            border: InputBorder.none,
          ),
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),
          autofocus: false,
        ),
      ),
    );
  }
}
