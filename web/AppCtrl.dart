part of vectr;

@NgController(
    selector: '[app]',
    publishAs: 'ctrl')
class AppController {
  List<Shape> shapes;
  Shape selectedShape;
  String amTabSel = "shape";
  int prevNrX, prevX;
  int prevNrY, prevY;
  bool startedX = false, startedY = false;
  int prevPanX, prevPanY, panX = 0, panY = 0;
  bool panStarted = false;
  int scale = 1;

  AppController() {
    shapes = _loadData();
    selectedShape = shapes[0];
  }

  void selectShape(Shape shape) {selectedShape = shape;}
  void newShape(){
    var shape = new Shape("new Rectangle",20,20,100,100);
    shapes.add(shape);
    selectedShape = shape;
  }

  List<Shape> _loadData() {
    return [
        new Shape("Rectangle 1", 10, 10, 100, 100),
        new Shape("Rectangle 2", 80, 80, 100, 100),
    ];
  }
  void drag(MouseEvent e){
    if(startedX){
      selectedShape.x = prevNrX - (prevX - e.clientX);
    }
    if(startedY){
      selectedShape.y = prevNrY - (prevY - e.clientY);
    }
    if(panStarted){
      panX = prevPanX - (prevX - e.clientX);
      panY = prevPanY - (prevY - e.clientY);
    }
  }
  void dragStartX(MouseEvent e){
    if(e.which==1){
      startedX=true;
      prevNrX = selectedShape.x;
      prevX = e.clientX;
    }
  }
  void dragStartY(MouseEvent e){
    if(e.which==1){
      startedY=true;
      prevNrY = selectedShape.y;
      prevY = e.clientY;
    }
  }
  void dragEnd(){
    startedX = false;
    startedY = false;
    panStarted = false;
  }

  void panStart(MouseEvent e){
    if(e.which==2){
      prevPanX = panX;
      prevPanY = panY;
      prevX = e.clientX;
      prevY = e.clientY;
      panStarted = true;
    }
  }
  void zoom(WheelEvent e){
    if(e.altKey){
      scale -= e.deltaY*0.001;
    }
  }
}
