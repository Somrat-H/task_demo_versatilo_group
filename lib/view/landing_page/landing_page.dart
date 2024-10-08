import 'package:flutter/material.dart';
import 'package:task_demo_versatilo_group/view/home_page/home_page.dart';
import 'package:task_demo_versatilo_group/view/landing_page/widget/custom_navbar_button.dart';
import 'package:task_demo_versatilo_group/view/notification_page/notification_page.dart';
import 'package:task_demo_versatilo_group/view/profile_page/profile_page.dart';
import 'package:task_demo_versatilo_group/view/search_page/search_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  int pagesIndex = 0;

  List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];

  final Color selectedColor = Colors.white;
  final Color unselectedColor = Colors.grey;

  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _scaleAnimations = [];
  final List<Animation<Color?>> _colorAnimations = [];

  //assign the animation controller value
  AnimationController setValueController(int milliseconds) {
    return AnimationController(
      duration: Duration(milliseconds: milliseconds),
      vsync: this,
    );
  }

//here set the color and scale aniamtion value
  void setAnimationControllerListValue() {
    for (int i = 0; i < pages.length; i++) {
      AnimationController controller = setValueController(300);
      _controllers.add(controller);
      // Scale animation
      _scaleAnimations
          .add(Tween<double>(begin: 1.0, end: 1.2).animate(controller));

      // Color animation
      _colorAnimations.add(
        ColorTween(begin: unselectedColor, end: selectedColor)
            .animate(controller),
      );
    }
    _controllers[pagesIndex].forward();
    setState(() {});
  }

  //this function for animation shifting
  void onTabTapped(int index) {
    setState(() {
      _controllers[pagesIndex].reverse(); // Reverse current tab animation
      pagesIndex = index;
      _controllers[pagesIndex].forward(); // Forward animation for the new tab
    });
  }

  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    setAnimationControllerListValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: const Text(
          "Task Demo Versatilo Group",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: pagesIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.red.shade600),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(pages.length, (index) {
            return CustomNavbarButton(
                colorAnimations: _colorAnimations[index],
                controller: _controllers[index],
                iconData: iconList[index],
                onTap: () {
                  setState(() {
                    onTabTapped(index);
                  });
                },
                scaleAnimations: _scaleAnimations[index]);
          }),
        ),
      ),
    );
  }
}
