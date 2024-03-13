import 'package:blog/home/components/rectangle_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late FragmentProgram fragmentProgram;
  // bool init = false;
  //
  // Future<void> loadShader() async {
  //   final shader = await FragmentProgram.fromAsset('assets/shaders/black_hole_shader.frag');
  //   fragmentProgram = shader;
  //   setState(() {
  //     init = true;
  //   });
  // }
  //
  // @override
  // void initState() {
  //   loadShader();
  //   super.initState();
  // }

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(
            controller: _controller,
            physics: const PageScrollPhysics(),
            slivers: [
              // SliverFillViewport(
              //   delegate: SliverChildBuilderDelegate(
              //     childCount: 1,
              //     (BuildContext context, int index) {
              //       return Center(
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             AnimatedTextKit(
              //               key: UniqueKey(),
              //               totalRepeatCount: 1,
              //               animatedTexts: [
              //                 TypewriterAnimatedText(
              //                   'Mr.Chae Blog',
              //                   textStyle: TextStyle(fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.w700, height: 1.0),
              //                   speed: const Duration(milliseconds: 200),
              //                   cursor: '_',
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SliverToBoxAdapter(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 1.sh,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          RectangleFrame(
                            imageUrl:
                                'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
                            title: 'Title',
                            description: 'Description',
                          ),
                          RectangleFrame(
                            imageUrl:
                            'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
                            title: 'Title',
                            description: 'Description',
                          ),
                          RectangleFrame(
                            imageUrl:
                            'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg',
                            title: 'Title',
                            description: 'Description',
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
