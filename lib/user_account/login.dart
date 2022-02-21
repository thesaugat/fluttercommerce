import 'package:ecom/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 22),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 0,
                ),
              ],
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 16),
            child: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/google.png",
                    height: 20,
                    width: 20,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Sign Up With Google",
                    style: TextStyle(fontSize: 16),
                  ),
                ]),
          ),
          const SizedBox(
            height: 24,
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 24,
          ),
          getTitle("Name"),
          getDecoratedContainer(TextFormField(
            decoration: getDecoation("Lexis Alexandar"),
          )),
          getTitle("Email"),
          getDecoratedContainer(TextFormField(
            decoration: getDecoation("example@mail.com"),
          )),
          getTitle("Password"),
          getDecoratedContainer(Stack(
            children: [
              TextFormField(
                decoration: getDecoation("at least 8 characters"),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: ColorConstants.kGreyColor,
                  ),
                ),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getPassowrdContainer(color: ColorConstants.kGreyColor),
              const SizedBox(width: 4),
              getPassowrdContainer(color: ColorConstants.kGreyColor),
              const SizedBox(width: 4),
              getPassowrdContainer(color: ColorConstants.kGreyColor),
              const SizedBox(width: 4),
              getPassowrdContainer(color: ColorConstants.kGreyColor),
            ],
          ),
          const SizedBox(
            height: SizeConstants.smallSpacing,
          ),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (val) {},
                side: BorderSide(
                  color: kDividerColor,
                  width: 2,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: ColorConstants.kSecondayTextColor, fontSize: 15),
                  text: 'I agree with',
                  children: const <TextSpan>[
                    TextSpan(
                        text: ' Terms',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                    TextSpan(text: ' and'),
                    TextSpan(
                        text: ' Privacy ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: SizeConstants.normalSpacing,
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.blue),
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
          ),
          const SizedBox(
            height: SizeConstants.largeSpacing,
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: SizeConstants.largeSpacing * 2,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Already Have an Account?",
              style: TextStyle(
                  fontSize: 16, color: ColorConstants.kSecondayTextColor),
            ),
          ),
          const SizedBox(
            height: SizeConstants.smallSpacing,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Log In",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  getPassowrdContainer({color}) {
    return Expanded(
      child: Container(
        height: 5,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  getDecoratedContainer(child) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: child,
    );
  }

  getDecoation(hint) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorConstants.kGreyColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorConstants.kGreyColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10));
  }

  Text getTitle(value) {
    return Text(
      value,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
