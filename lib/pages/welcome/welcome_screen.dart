import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';
/**
 * 欢迎页
 * @author yinlei
*/
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  late PageController _pageController;
  int _currentIndex = 0;
  double _enterBtnOpacity = 0.0;

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for(int i = 0; i < 3; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 5.h,
      width: isActive ? 15.w : 8.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }

  Widget _buildBootChildContent({image, title, content}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var isDesktop = constraints.maxWidth > AppDeviceSizes.mobileWidth;
        return Scrollbar(
          child: ListView(
            physics: isDesktop ? NeverScrollableScrollPhysics() : null,
            scrollDirection: isDesktop ? Axis.horizontal : Axis.vertical,
            children: [
              Image.asset(
                image,
                width: isDesktop ? 0.4.sw : 1.sw,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        title,
                        speed: const Duration(milliseconds: 800),
                        curve: Curves.bounceInOut,
                        textStyle: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      content,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        letterSpacing: 1.5,
                        height: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int currentPage){
              _enterBtnOpacity = currentPage == 2 ? 1.0 : 0.0;
              setState(() {
                _currentIndex = currentPage;
              });
            },
            children: [
              _buildBootChildContent(
                image: 'assets/images/boot_guitar.gif',
                title: '开眼短视频',
                content: '躲猫猫是一个全球精品短视频平台, \n汇集了动画、广告、影视、运动、创意、游戏、旅行等领域的优质短视频,\n以及这些领域的创意人群。',
              ),
              _buildBootChildContent(
                image: 'assets/images/boot_love.gif',
                title: '年轻人的社交元宇宙',
                content: '躲猫猫是一个基于兴趣图谱和推荐关系的社交元宇宙。\n在这里,\n你将获得沉浸式的社交体验。\n我们提供了丰富互动的场景与工具,\n让你轻松有趣的真实表达、认知他人、探索世界、获得精神共鸣与幸福感。',
              ),
              _buildBootChildContent(
                image: 'assets/images/boot_rocket.gif',
                title: '为梦想助力',
                content: '躲猫猫是一款大家都在用的学习大杀器!\n致力于为你解决背单词难题,独创图背单词学习法,趣味学英语;\n内涵海量词库,覆盖全年龄段词汇需求;\n配备单词全解,发音例句辅助学习。\n考研？考公？考事业单位？考银行？考教资？考国企？这款APP都能帮到你！',
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.h,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 10.w,
            child: AnimatedOpacity(
              opacity: _enterBtnOpacity,
              duration: Duration(milliseconds: 300),
              child: OutlinedButton.icon(
                icon: Icon(Icons.arrow_right),
                onPressed: () => Navigator.pushReplacementNamed(context, ManagerScreen.routeName),
                label: Text('Enter 躲猫猫'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

}

