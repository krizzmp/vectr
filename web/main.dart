import 'package:angular/angular.dart';
import 'components/super_range.dart';
import 'dart:html';
//import 'package:perf_api/perf_api.dart';

/* Use the NgController annotation to indicate that this class is an
 * Angular Controller. The compiler will instantiate the controller if
 * it finds it in the DOM.
 *
 * The selector field defines the CSS selector that will trigger the
 * controller. It can be any valid CSS selector which does not cross
 * element boundaries.
 *
 * The publishAs field specifies that the controller instance should be
 * assigned to the current scope under the name specified.
 *
 * The controller's public fields are available for data binding from the view.
 * Similarly, the controller's public methods can be invoked from the view.
 */
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
    type(RatingComponent);
    type(InputDateDirective);
    type(InputRangeDirective);
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