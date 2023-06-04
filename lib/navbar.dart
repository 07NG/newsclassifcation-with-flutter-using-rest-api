import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarFb2 extends StatefulWidget {
  BottomNavBarFb2({Key? key}) : super(key: key);

  @override
  _BottomNavBarFb2State createState() => _BottomNavBarFb2State();
}

class _BottomNavBarFb2State extends State<BottomNavBarFb2> {
  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  List<bool> isActive = [false, true, false, false];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey[400],
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                text: "Online news portal",
                icon: Icons.newspaper,
                selected: isActive[0],
                onPressed: () {
                  setState(() {
                    isActive = [true, false, false, false];
                  });
                  context.push('/');
                },
              ),
              IconBottomBar(
                text: "Home",
                icon: Icons.home,
                selected: isActive[1],
                onPressed: () {
                  setState(() {
                    isActive = [false, true, false, false];
                  });
                  context.push('/');
                },
              ),
              IconBottomBar(
                text: "Login",
                icon: Icons.login_sharp,
                selected: isActive[2],
                onPressed: () {
                  setState(() {
                    isActive = [false, false, true, false];
                  });
                  context.push('/login');
                },
              ),
              IconBottomBar(
                text: "Signup",
                icon: Icons.signpost_rounded,
                selected: isActive[3],
                onPressed: () {
                  context.push('/signup');
                  setState(() {
                    isActive = [false, false, false, true];
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primaryColor : Colors.black87,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            height: .1,
            color: selected ? primaryColor : Colors.black87,
          ),
        )
      ],
    );
  }
}
