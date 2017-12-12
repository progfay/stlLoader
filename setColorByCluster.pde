final int[] COLORS = {
  //color(  0, 0, 0),
  //color(  0, 0, 127), 
  //color(  0, 0, 255), 
  //color(  0, 127, 0), 
  //color(  0, 127, 127), 
  color(  0, 127, 255), 
  //color(  0, 255, 0), 
  color(  0, 255, 127), 
  color(  0, 255, 255), 
  //color(127, 0, 0), 
  //color(127, 0, 127), 
  color(127, 0, 255), 
  //color(127, 127, 0), 
  color(127, 127, 127), 
  color(127, 127, 255), 
  color(127, 255, 0), 
  color(127, 255, 127), 
  color(127, 255, 255), 
  //color(255, 0, 0), 
  color(255, 0, 127), 
  color(255, 0, 255), 
  color(255, 127, 0), 
  color(255, 127, 127), 
  color(255, 127, 255), 
  color(255, 255, 0), 
  color(255, 255, 127), 
  color(255, 255, 255)
};


// by k-means method
void setColorByCluster(ArrayList<Triangle> triangles, int clusterNum) {
  IntList colorList = new IntList(COLORS);
  colorList.shuffle();

  int[] cluster      = new int [triangles.size()];
  int[] clusterCount = new int [clusterNum];
  PVector[] clusterGravity = new PVector [clusterNum];
  PVector[] beforeGravity  = new PVector [clusterNum];
  for (int i = 0; i < clusterNum; i++) {
    clusterGravity[i] = new PVector();
    beforeGravity[i]  = new PVector();
  }

  for (int i = 0; i < cluster.length; i++) {
    int clust = (int) random(clusterNum);
    cluster[i] = clust;
    clusterCount[clust]++;
    clusterGravity[clust].add(triangles.get(i).gravity);
  }

  while (true) {
    for (int i = 0; i < clusterNum; i++) {
      if(clusterCount[i] == 0) continue;
      clusterGravity[i].div(float(clusterCount[i]));
    }

    if (equals(beforeGravity, clusterGravity)) {
      for (int j = 0; j < triangles.size(); j++) {
        triangles.get(j).setColor(colorList.get(cluster[j]));
      }
      return;
    }

    for (int i = 0; i < clusterNum; i++) {
      beforeGravity[i] = new PVector(clusterGravity[i].x, clusterGravity[i].y, clusterGravity[i].z);
      clusterGravity[i] = new PVector();
      clusterCount[i] = 0;
    }

    for (int i = 0; i < cluster.length; i++) {
      int clust = 0;
      float minDist = PVector.dist(triangles.get(i).gravity, beforeGravity[0]);
      for (int j = 1; j < clusterNum; j++) {
        float dist = PVector.dist(triangles.get(i).gravity, beforeGravity[j]);
        if (minDist > dist) {
          clust = j;
          minDist = dist;
        }
      }
      cluster[i] = clust;
      clusterCount[clust]++;
      clusterGravity[clust].add(triangles.get(i).gravity);
    }
  }
}


boolean equals(PVector[] a, PVector[] b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (!a[i].equals(b[i])) return false;
  }
  return true;
}