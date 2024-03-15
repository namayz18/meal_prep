import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
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
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/message.svg",
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(
                controller.text.isEmpty
                    ? const Color(0xffB4B9C0)
                    : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Color(0xffB4B9C0),
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
                autofocus: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  controller.text = "";
                }
              },
              child: SvgPicture.asset(
                "assets/icons/Cancel.svg",
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  controller.text.isEmpty ? Colors.transparent : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
