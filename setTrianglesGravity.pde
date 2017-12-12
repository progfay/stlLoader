void setTrianglesGravity(ArrayList<Triangle> triangles) {
  PVector trianglesGravity = trianglesGravity(triangles).mult(-1);
  for(Iterator i = triangles.iterator(); i.hasNext();) {
    ((Triangle) (i.next())).translate(trianglesGravity);
  }
}

PVector trianglesGravity(ArrayList<Triangle> triangles) {
  PVector trianglesGravity = new PVector();
  for(Iterator i = triangles.iterator(); i.hasNext();) {
    trianglesGravity.add(((Triangle) (i.next())).gravity);
  }
  return trianglesGravity.div(triangles.size());
}