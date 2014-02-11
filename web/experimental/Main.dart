import 'package:angular/angular.dart';
import 'dart:html';


@NgComponent(
    selector: 'range',
    templateUrl: 'experimental/index.html',
    cssUrl: 'experimental/main.css',
    publishAs: 'ctrl',
    map: const {
        'number' : '<=>number',
        'name' : '@name'
    }
)
class RangeComponent {
  int number, min=0, max=50, prevY, prevNr;
  String name;
  void drag(MouseEvent e){
    number = prevNr + (prevY - e.clientY);
  }
  void dragStart(MouseEvent e){
    querySelector('body').classes.add('drag');
    prevNr = number;
    prevY = e.clientY;
    //e.preventDefault();
  }
}
