class BoundingBox {
  PVector position;
  PVector size;


  BoundingBox(PVector position, PVector size) {
    this.position = position.copy();
    this.size = size.copy();
  }
    float x(){
    return this.position.x;
  }
  
  float y(){
    return this.position.y;
  }
  
  float width(){
    return this.size.x;
  }
  
  float height(){
    return this.size.y;
  }
  
  float left(){
    return x() - width()/2;
  }
  
  float right(){
    return x() + width()/2;
  }
  
  float top(){
    return y() - height()/2;
  }
  
  float bottom(){
    return y() + height()/2;
  }
}