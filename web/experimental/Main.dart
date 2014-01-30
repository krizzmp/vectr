import 'package:angular/angular.dart';


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
  int number, min=0, max=50;
  String name;
}
