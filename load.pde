import java.util.regex.*;

// load ASCII type stl file
ArrayList<Triangle> loadSTL(String filePath) {
  ArrayList<Triangle> result = new ArrayList<Triangle>();
  String file = join(loadStrings(filePath), ' ').replaceAll("\\s+", " ");
  String[] block = file.split("endfacet");
  Pattern p = Pattern.compile("( vertex( -?\\d+(\\.\\d*)?([eE][-+]?\\d+)?){3}){3}");
  for (int i = 0; i < block.length; i++) {
    Matcher m = p.matcher(block[i]);
    if (m.find()) {
      result.add(new Triangle(m.group()));
    }
  }
  return result;
}