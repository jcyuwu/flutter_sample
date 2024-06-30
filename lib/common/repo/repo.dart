import 'dart:async';

class CourseRepository {
  final List<Course> _courses = [];
  final List<Instructor> _instructors = [];

  Future<List<Course>> getCourses() async {
    return _courses;
  }

  Future<List<Instructor>> getInstructors() async {
    return _instructors;
  }

  Future<List<Course>> getCoursesByInstructor(String instructorId) async {
    return _courses
        .where((course) => course.instructorId == instructorId)
        .toList();
  }

  Future<void> createInstructor(Instructor instructor) async {
    _instructors.add(instructor);
  }

  Future<void> createCourse(Course course) async {
    _courses.add(course);
  }

  Future<void> updateCourseContent(
      String courseId, String newDescription) async {
    var course = _courses.firstWhere((c) => c.id == courseId);
    course.description = newDescription;
  }

  Future<void> deleteCourse(String courseId) async {
    _courses.removeWhere((course) => course.id == courseId);
  }
}

class Course {
  final String id;
  final String name;
  String description;
  final String instructorId;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.instructorId,
  });
}

class Instructor {
  final String id;
  final String name;
  final String email;

  Instructor({
    required this.id,
    required this.name,
    required this.email,
  });
}
