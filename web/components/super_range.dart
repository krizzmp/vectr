library rating;

import 'package:angular/angular.dart';
import 'dart:html';

@NgComponent(
    selector: 'range',
    templateUrl: 'components/super_range.html',
    cssUrl: 'components/super_range.css',
    publishAs: 'ctrl',
    map: const {
        'vaule' : '<=>vaule'
    }
)
class RatingComponent extends NgShadowRootAware{
  int vaule;
  var tt="0";
  RangeInputElement r;
  void onChange(){
    //RangeInputElement r = querySelector("input");
    //rating = r.valueAsNumber;
    vaule = r.valueAsNumber;
  }
  void onShadowRoot(ShadowRoot shadowRoot) {
    r = shadowRoot.querySelector("#test");
  }
}
