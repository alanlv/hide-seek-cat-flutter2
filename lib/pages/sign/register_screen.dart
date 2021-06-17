import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/api/api.dart';
import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';
import 'package:hide_seek_cat_flutter2/common/widgets/widgets.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';
import 'package:rive/rive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * 注册页
 * @author yinlei
 */
class RegisterScreen extends StatefulWidget {

  static String routeName = '/register_screen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {

  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;
  GlobalKey _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userConfirmPasswordController = TextEditingController();

  /// rive.
  late RiveAnimationController _riveController;
  bool _isPlaying = false;


  @override
  void initState() {
    super.initState();
    _riveController = OneShotAnimation(
      'Animation 1',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(_scaleController)
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed) {
          _widthController.forward();
        }
      });
    _widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 300,
    ).animate(_widthController)
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed) {
          _positionController.forward();
        }
      });

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _positionAnimation = Tween(
      begin: 0.0,
      end: 210.0,
    ).animate(_positionController)
      ..addStatusListener((status) async {
        if(status == AnimationStatus.completed) {
          setState(() {
            hideIcon = true;
          });
          /// 验证表单
          if((_registerFormKey.currentState as FormState).validate()) {
            if(_userPasswordController.value.text.trim() != _userConfirmPasswordController.value.text.trim()) {
              appShowToast(msg: "密码和确认密码不一致,请重写确认");
              setState(() {
                hideIcon = false;
              });
              _scaleController.reverse();
              _widthController.reverse();
              _positionController.reverse();
            }else {
              User params = User(
                userName: _userNameController.value.text.trim(),
                password: _userPasswordController.value.text.trim(),
              );
              bool isSuccessful = await UserApi.register(context: context, params: params);
              if(isSuccessful){
                /// 后台确认注册成功再启动动画并跳转
                _scale2Controller.forward();
              }
            }
          } else { /// 表单验证失败动画重置
            setState(() {
              hideIcon = false;
            });
            _scaleController.reverse();
            _widthController.reverse();
            _positionController.reverse();
          }
        }
      });

    _scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _scale2Animation = Tween(
      begin: 1.0,
      end: 32.0,
    ).animate(_scale2Controller)
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      });
  }

  Widget _buildRegisterHeader(bool isDesktop) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 1.sw,
            height: isDesktop ? 0.5.sh : 0.3.sh,
            child: RiveAnimation.asset(
              'assets/rives/240-469-viking-cartoon.riv',
              animations: const ['Animation 1'],
              controllers: [_riveController],
              onInit: () => setState(() {}),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.r),
            child: FractionallySizedBox(
              widthFactor: 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        '注册',
                        speed: Duration(milliseconds: 1500),
                        textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                          letterSpacing: 1.5,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: [
                          Colors.black87,
                          Colors.black54,
                          Colors.black38,
                          Colors.white10,
                        ],
                      ),
                    ],
                    isRepeatingAnimation: true,
                    totalRepeatCount: 5,
                    onTap: () {
                    },
                  ),
                  Text(
                    '申请专属于您的账号,就可以拍摄分享您的生活短视频，用短视频记录生活的点点滴滴。采用大数据推荐系统和AI，快速匹配共同话题的小伙伴。你还怕奋斗的道路上形单影只？在这里可以快速找到志同道合的朋友，本产品为您的幸福与快乐持续助力！',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      letterSpacing: 1.2,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterInput(bool isDesktop) {
    return FractionallySizedBox(
      widthFactor: isDesktop ? 0.4 : 1.0,
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Form(
          key: _registerFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              AppInput(
                controller: _userNameController,
                labelText: '用户名',
                hintText: 'Account',
                marginTop: 0,
              ),
              AppInput(
                  controller: _userPasswordController,
                  labelText: '密码',
                  hintText: 'Password',
                  isPassword: true,
                  obscureText: true,
                  suffixIcon: Icon(Icons.lock_rounded)
              ),
              AppInput(
                  controller: _userConfirmPasswordController,
                  labelText: '确认密码',
                  hintText: 'Confirm password',
                  isPassword: true,
                  obscureText: true,
                  suffixIcon: Icon(Icons.lock_rounded)
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterBtn(bool isDesktop) {
    return AnimatedBuilder(
      animation: _scaleController,
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value,
        child: AnimatedBuilder(
          animation: _widthController,
          builder: (context, child) {
            return Container(
              width: _widthAnimation.value.r,
              height: 80.r,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isDesktop ? AppColors.primaryDarkColor.withOpacity(.4) : AppColors.primaryColor.withOpacity(.4),
              ),
              child: InkWell(
                onTap: () {
                  _scaleController.forward();
                },
                child: Stack(
                  children: [
                    AnimatedBuilder(
                        animation: _positionController,
                        builder: (context, child) {
                          return Positioned(
                            left: _positionAnimation.value,
                            child: AnimatedBuilder(
                              animation: _scale2Controller,
                              builder: (context, child) => Transform.scale(
                                scale: _scale2Animation.value,
                                child: Container(
                                  width: 60.r,
                                  height: 60.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isDesktop ? AppColors.primaryDarkColor : AppColors.primaryColor,
                                  ),
                                  child: hideIcon == false ? Icon(Icons.arrow_forward, color: Colors.white,) : Container(),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var isDesktop = constraints.maxWidth > AppDeviceSizes.mobileWidth;
          return Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildRegisterHeader(isDesktop),
                  FractionallySizedBox(
                    widthFactor: 1.0,
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        _buildRegisterInput(isDesktop),
                        _buildRegisterBtn(isDesktop),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _isPlaying ? null : _riveController.isActive = true,
        tooltip: 'Play',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _scale2Controller.dispose();
    _positionController.dispose();
    _widthController.dispose();

    _userNameController.dispose();
    _userPasswordController.dispose();
    _userConfirmPasswordController.dispose();

    _riveController.dispose();
    super.dispose();
  }

}
