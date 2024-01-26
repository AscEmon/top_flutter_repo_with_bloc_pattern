// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:top_flutter_repo/constant/constant_key.dart';
import 'package:top_flutter_repo/utils/extension.dart';

void main() {
  test('updateAt date unit testing', () {
    //Arrange
    String updatedAtString = "2023-12-15T10:54:19Z";
    DateTime parsedDateTime = updatedAtString.fomateDateFromString(
      dateFormat: AppConstant.YYYY_MM_DD_THH_mm_ss_z.key,
    );
    //Act
    String formattedDateTime = parsedDateTime.formattedDateFromDate();

    //Assert
    String expectedDateTime = "12-15-2023 10:54 AM";
    expect(formattedDateTime, equals(expectedDateTime));
  });
}
