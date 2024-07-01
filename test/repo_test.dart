import 'package:flutter_sample/common/repo/repo.dart';
import 'package:test/test.dart';

void main() {
  group('CourseRepository Tests', () {
    test('Create new course', () {
      // Arrange
      CourseRepository repository = CourseRepository();
      Course newCourse = Course(
        id: 'c1',
        name: 'Flutter Development',
        description: 'Learn Flutter app development from scratch.',
        instructorId: 'i1',
      );

      // Act
      repository.createCourse(newCourse);

      // Assert
      repository.getCourses().then((courses) {
        expect(courses.length, 1); // 預期數據庫中有一門課程
        expect(courses[0].name, 'Flutter Development'); // 預期創建的課程名稱正確
      });
    });

    test('Update course content', () {
      // Arrange
      CourseRepository repository = CourseRepository();
      Course initialCourse = Course(
        id: 'c1',
        name: 'Flutter Development',
        description: 'Learn Flutter app development.',
        instructorId: 'i1',
      );
      repository.createCourse(initialCourse);

      // Act
      String updatedDescription = 'Learn Flutter app development from scratch.';
      repository.updateCourseContent('c1', updatedDescription);

      // Assert
      repository.getCourses().then((courses) {
        expect(courses.length, 1); // 預期數據庫中仍然只有一門課程
        expect(courses[0].description, updatedDescription); // 預期課程描述已更新
      });
    });

    test('Delete course', () {
      // Arrange
      CourseRepository repository = CourseRepository();
      Course courseToDelete = Course(
        id: 'c1',
        name: 'Flutter Development',
        description: 'Learn Flutter app development from scratch.',
        instructorId: 'i1',
      );
      repository.createCourse(courseToDelete);

      // Act
      repository.deleteCourse('c1');

      // Assert
      repository.getCourses().then((courses) {
        expect(courses.isEmpty, true); // 預期課程列表應該是空的，因為已經刪除了課程
      });
    });
  });
}
