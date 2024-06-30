import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'lectors_vm.g.dart';

@Riverpod(keepAlive: true)
//@riverpod
class LectorsVM extends _$LectorsVM {
  @override
  List<LectorsItem> build() {
    return List.generate(
      10,
      (index) => LectorsItem(
        avatarPath: "",
        title: "Title $index",
        name: "Name $index",
        courses: List.generate(
          3,
          (courseIndex) => LectorsCourse(
            time: "Time $index $courseIndex",
            name: "Course $index $courseIndex",
          ),
        ),
      ),
    );
  }

  void onChange(List<LectorsItem> items) {
    state = items;
  }

  void onIndexChange({required int index, String? avatarPath, String? title, String? name, List<LectorsCourse>? courses}) {
    state[index] = state[index].copyWith(avatarPath: avatarPath, title: title, name: name, courses: courses);
    List<LectorsItem> newState = List.generate(
      state.length,
      (index) => state[index]
    );
    state = newState;
  }
}

class LectorsItem {
  final String avatarPath;
  final String title;
  final String name;
  final List<LectorsCourse> courses;

  LectorsItem({
    this.avatarPath = "",
    this.title = "professor",
    this.name = "x",
    required this.courses,
  });

  LectorsItem copyWith(
      {String? avatarPath, String? title, String? name, List<LectorsCourse>? courses}) {
    return LectorsItem(
      avatarPath: avatarPath ?? this.avatarPath,
      title: title ?? this.title,
      name: name ?? this.name, 
      courses: courses ?? this.courses,
    );
  }
}

class LectorsCourse {
  final String time;
  final String name;

  const LectorsCourse({
    this.time = "",
    this.name = "flutter",
  });

  LectorsCourse copyWith({String? time, String? name}) {
    return LectorsCourse(
      time: time ?? this.time,
      name: name ?? this.name,
    );
  }
}
