import 'package:angular/angular.dart';
import 'experimental/Main.dart';
import 'dart:html';

@NgController(
    selector: '[app]',
    publishAs: 'ctrl')
class AppController {

  List<Shape> shapes;
  var colorPicker;
  AppController() {
    shapes = _loadData();
    selectedShape = shapes[0];

  }

  Shape selectedShape;
  String amTabSel="shape";

  void selectShape(Shape shape) {
    selectedShape = shape;
  }
  void newShape(){
    var shape = new Shape("new Rectangle",20,20,20,20);
    shapes.add(shape);
    selectedShape = shape;
  }

  List<Shape> _loadData() {
    return [
        new Shape("Rectangle 1", 10, 10, 10, 10),
        new Shape("Rectangle 2", 40, 10, 20, 10),
    ];
  }
}

class Shape {
  var name, x, y, width, height, rounding=0, rotation=0;
  var color="#446677", strokeColor="#776644", strokeWidth=1;

  Shape(this.name, this.x, this.y, this.width, this.height);

}

class MyAppModule extends Module {
  MyAppModule() {
    type(AppController);
    type(InputDateDirective);
    type(InputRangeDirective);
    type(RangeComponent);
    //type(Profiler, implementedBy: Profiler); // comment out to enable profiling
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}

@NgDirective(selector: 'input[type=color][ng-model]')
class InputDateDirective {
  InputElement inputElement;
  NgModel ngModel;
  Scope scope;

  InputDateDirective(Element this.inputElement, this.ngModel, this.scope) {
    ngModel.render = (String value) {
      if(value!=null){
        inputElement.value  = value;//new DateFormat('y-M-d').format(value);
      }
    };
    inputElement.onChange.listen((Event value) {
      scope.$apply(() {
        ngModel.viewValue = inputElement.value == '' ? null :  inputElement.value;
      });
    });
  }
}
@NgDirective(selector: 'input[type=range][ng-model]')
class InputRangeDirective {
  InputElement inputElement;
  NgModel ngModel;
  Scope scope;

  InputRangeDirective(Element this.inputElement, this.ngModel, this.scope) {
    ngModel.render = (int value) {
      if(value!=null){
        inputElement.valueAsNumber  = value;//new DateFormat('y-M-d').format(value);
      }
    };
    inputElement.onChange.listen((Event value) {
      scope.$apply(() {
        ngModel.viewValue = inputElement.value == '' ? null :  inputElement.valueAsNumber;
      });
    });
  }
}