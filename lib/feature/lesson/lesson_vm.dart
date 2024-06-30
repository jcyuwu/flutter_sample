import 'package:flutter_sample/feature/lectors/lectors_vm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'lesson_vm.g.dart';

@Riverpod(keepAlive: true)
//@riverpod
class LessonVM extends _$LessonVM {
  @override
  LectorsCourse build() {
    return const LectorsCourse(name: "flutter");
  }

  void onChange(LectorsCourse course) {
    state = course;
  }
}
