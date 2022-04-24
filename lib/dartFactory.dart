// ignore: file_names
import 'dart:math';

abstract class Shape {
  factory Shape(shapeType) {
    if (shapeType == ShapeEnum.circle) return Circle(2);
    if (shapeType == ShapeEnum.square) return Square(2);
    throw 'Can not create $shapeType';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  @override
  // calc area
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  @override
  num get area => pow(side, 2);
}

class CircleMock implements Circle {
  num area = 0;
  num radius = 0;
}

enum ShapeEnum { circle, square }

Shape shapeFactory(ShapeEnum shapeType) {
  if (shapeType == ShapeEnum.circle) return Circle(2);
  if (shapeType == ShapeEnum.square) return Square(2);
  throw 'Can not create $shapeType';
}

void main(List<String> args) {
  final circle = Circle(2);
  print(circle.area);

  final circle2 = shapeFactory(ShapeEnum.circle);
  print(circle2.area);

  var circle3 = Shape(ShapeEnum.circle);
  print(circle3.area);
}
