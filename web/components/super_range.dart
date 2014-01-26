library rating;

import 'package:angular/angular.dart';
import 'dart:html';

/* Use the NgComponent annotation to indicate that this class is an
 * Angular Component.
 *
 * The selector field defines the CSS selector that will trigger the
 * component. Typically, the CSS selector is an element name.
 *
 * The templateUrl field tells the component which HTML template to use
 * for its view.
 *
 * The cssUrl field tells the component which CSS file to use.
 *
 * The publishAs field specifies that the component instance should be
 * assigned to the current scope under the name specified.
 *
 * The map field publishes the list of attributes that can be set on
 * the component. Users of this component will specify these attributes
 * in the html tag that is used to create the component. For example:
 *
 * <rating max-rating="5" rating="mycontrol.rating">
 *
 * The component's public fields are available for data binding from the
 * component's view. Similarly, the component's public methods can be
 * invoked from the component's view.
 */
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
