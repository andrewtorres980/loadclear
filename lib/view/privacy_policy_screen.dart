import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/constant.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarComponent(
            title: 'Privacy Policy',
          )),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non eleifend odio, suscipit aliquam erat. Quisque eu fermentum tortor. Nunc efficitur dictum finibus. Integer lorem lacus, sodales ut interdum vitae, tempus non mi. Sed mollis vehicula nulla id iaculis. In hac habitasse platea dictumst. Vivamus eget tellus sollicitudin, aliquam ligula quis, euismod massa. Morbi iaculis sit amet metus ut condimentum. Maecenas scelerisque lacus sodales posuere sollicitudin. Vivamus accumsan purus mauris, a placerat sapien porta vitae.\n\nProin finibus orci neque, nec sollicitudin lorem auctor sit amet. Integer lacinia massa auctor augue facilisis feugiat. Sed nisl metus, faucibus quis mauris non, pellentesque tincidunt eros. Cras vulputate ornare lectus quis accumsan. Nam laoreet, eros dapibus semper gravida, libero dolor imperdiet augue, eu posuere urna velit id nibh. Proin purus mauris,\n\nUt eget velit blandit, tempus ex non, varius leo. Maecenas ultricies, arcu in volutpat consectetur, eros augue maximus lectus, nec congue odio velit sit amet ipsum. Nulla ultricies, ante sit amet tempor finibus, lectus est consectetur dui, ac iaculis purus augue a justo.\n\nSuspendisse tristique ipsum vitae nunc commodo, non eleifend nisi pretium. Nulla facilisi. Curabitur id ultricies leo. Quisque eleifend accumsan sem, sit amet hendrerit neque dictum vel. Nullam nec velit sed ligula bibendum dictum. Phasellus volutpat efficitur quam id posuere. Suspendisse at velit sollicitudin, vestibulum eros nec, hendrerit lectus. Praesent placerat ex urna, eget sagittis metus cursus in.\n\nProin finibus orci neque, nec sollicitudin lorem auctor sit amet. Integer lacinia massa auctor augue facilisis feugiat. Sed nisl metus, faucibus quis mauris non, pellentesque tincidunt eros. Cras vulputate ornare lectus quis accumsan. Nam laoreet, eros dapibus semper gravida, libero dolor imperdiet augue, eu posuere urna velit id nibh. Proin purus mauris,\n\n',
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppin',
                  fontSize: 13.0.sp),
            ),
          ),
        ),
      ),
    );
  }
}
