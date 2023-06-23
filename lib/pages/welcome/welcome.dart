import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body:
          BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(alignment: Alignment.topCenter, children: [
            PageView(
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  print("index value is :- ${index}");
                },
                children: [
                  _page(
                      1,
                      context,
                      "next",
                      "First See Learning",
                      "Forget about a for of paper all Knowledge in one Learning",
                      "imagepath"),
                  _page(
                      2,
                      context,
                      "next",
                      "Connect with Everyone",
                      "Always keep in touch with tutor & friends. Let get Connected",
                      "imagepath"),
                  _page(
                      3,
                      context,
                      "Get Started",
                      "Always Fascinated Learning",
                      "Anywhere anytime. The time is at discrtion so study whenever you want",
                      "imagepath"),
                ]),
            Positioned(
                bottom: 100.h,
                child: DotsIndicator(
                  position: state.page,
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  decorator: DotsDecorator(
                      color: Colors.grey,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeColor: Colors.blue,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ))
          ]),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: const Text("Image One"),
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1))
            ],
          ),
          width: 325.w,
          height: 50.h,
          child: Center(
            child: Text(buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal)),
          ),
        )
      ],
    );
  }
}
