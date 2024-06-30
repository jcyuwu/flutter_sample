import 'dart:async';

class CourseRepository {
  // Example data storage (replace with actual data storage mechanism)
  final List<Course> _courses = [];
  final List<Instructor> _instructors = [];

  // Method to get the list of courses
  Future<List<Course>> getCourses() async {
    return _courses;
  }

  // Method to get the list of instructors
  Future<List<Instructor>> getInstructors() async {
    return _instructors;
  }

  // Method to get courses taught by a specific instructor
  Future<List<Course>> getCoursesByInstructor(String instructorId) async {
    return _courses
        .where((course) => course.instructorId == instructorId)
        .toList();
  }

  // Method to create a new instructor
  Future<void> createInstructor(Instructor instructor) async {
    _instructors.add(instructor);
  }

  // Method to create a new course
  Future<void> createCourse(Course course) async {
    _courses.add(course);
  }

  // Method to update course content
  Future<void> updateCourseContent(
      String courseId, String newDescription) async {
    var course = _courses.firstWhere((c) => c.id == courseId);
    course.description = newDescription;
  }

  // Method to delete a course
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
