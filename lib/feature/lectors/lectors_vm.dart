import 'dart:math';

import 'package:flutter/material.dart';
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
        avatarColor: Color.fromRGBO(Random().nextInt(255),
            Random().nextInt(255), Random().nextInt(255), 1),
        avatarPath: "",
        title: "Title $index",
        name: "Name $index",
        courses: List.generate(
          Random().nextInt(3)+2,
          (courseIndex) => LectorsCourse(
            time: "Time $index $courseIndex",
            name: "Course $index $courseIndex",
            description: "Description $index $courseIndex",
          ),
        ),
      ),
    );
  }

  void onChange(List<LectorsItem> items) {
    state = items;
  }

  void onIndexChange({required int index, Color? avatarColor, String? avatarPath, String? title, String? name, List<LectorsCourse>? courses}) {
    state[index] = state[index].copyWith(avatarColor: avatarColor, avatarPath: avatarPath, title: title, name: name, courses: courses);
    List<LectorsItem> newState = List.generate(
      state.length,
      (index) => state[index]
    );
    state = newState;
  }
}

class LectorsItem {
  final Color avatarColor;
  final String avatarPath;
  final String title;
  final String name;
  final List<LectorsCourse> courses;

  LectorsItem({
    this.avatarColor = Colors.transparent,
    this.avatarPath = "",
    this.title = "professor",
    this.name = "x",
    required this.courses,
  });

  LectorsItem copyWith(
      {Color? avatarColor, String? avatarPath, String? title, String? name, List<LectorsCourse>? courses}) {
    return LectorsItem(
      avatarColor: avatarColor ?? this.avatarColor,
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
  final String description;

  const LectorsCourse({
    this.time = "",
    this.name = "flutter",
    this.description = "learn flutter programing",
  });

  LectorsCourse copyWith({String? time, String? name, String? description}) {
    return LectorsCourse(
      time: time ?? this.time,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
