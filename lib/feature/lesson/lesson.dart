import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/common/app_colors.dart';
import 'package:flutter_sample/common/text_widgets.dart';
import 'package:flutter_sample/feature/lesson/lesson_vm.dart';

class Lesson extends ConsumerStatefulWidget {
  const Lesson({super.key});

  @override
  ConsumerState<Lesson> createState() => _LessonState();
}

class _LessonState extends ConsumerState<Lesson> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: lessonAppBar(ref: ref),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

AppBar lessonAppBar({required WidgetRef ref, void Function()? back}) {
  return AppBar(
    title: Container(
      margin: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: back,
            child: 
            Text24Normal(text: ref.watch(lessonVMProvider).name, color: AppColors.primaryText),
          ),
        ],
      ),
    ),
  );
}
