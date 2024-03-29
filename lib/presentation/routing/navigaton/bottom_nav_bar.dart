import 'dart:ui';

import 'package:book_ai/presentation/classes/bottom_nav_models.dart';
import 'package:book_ai/presentation/reusable_components/models/nav_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  final Function(int tabIndex) onTabChange;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;

  // add init state

  @override
  void initState() {
    super.initState();
    // Set the icon with index 0 to be active when the page renders
  }

  void _onRiveIconInit(Artboard artboard, index) {
    final controller = StateMachineController.fromArtboard(
        artboard, bottomNavItems[index].rive.stateMachineName);
    artboard.addController(controller!);

    bottomNavItems[index].status =
        controller.findInput<bool>("active") as SMIBool;
  }

  void onTabPress(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });
    }
    widget.onTabChange(index);
    bottomNavItems[index].status.change(true);

    for (int i = 0; i < bottomNavItems.length; i++) {
      if (i != index) {
        bottomNavItems[i].status.change(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/nav-bg.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.w),
            topRight: Radius.circular(50.w),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.w),
            topRight: Radius.circular(50.w),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            blendMode: BlendMode.srcOver,
            child: Container(
              color: Theme.of(context).disabledColor,
              child: Container(
                height: 65.h,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(bottomNavItems.length, (index) {
                      NavItemModel item = bottomNavItems[index];
                      return CupertinoButton(
                        // padding: EdgeInsets.all(0),
                        onPressed: () {
                          onTabPress(index);
                        },
                        child: Container(
                          child: SizedBox(
                            height: 40.w,
                            width: 40.w,
                            child: RiveAnimation.asset(
                              item.rive.src,
                              stateMachines: [item.rive.stateMachineName],
                              artboard: item.rive.artboard,
                              onInit: (artboard) {
                                _onRiveIconInit(artboard, index);
                                // artboard.addController(_controller =
                                //     SimpleAnimation(
                                //         item.rive.stateMachineName[0],
                                //         autoplay: false));
                              },
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
