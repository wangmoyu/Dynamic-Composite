void loadChromaData(String jsonFilename) {
  JSONObject jsonData = loadJSONObject(jsonFilename);
  
  closeColourDistance = jsonData.getFloat("closeColourValue");
  blur = jsonData.getBoolean("blur");
  
  JSONArray kC = jsonData.getJSONArray("keyColours");
  
  keyColours = new color[kC.size()];
  
  for (int i = 0; i < kC.size(); i += 1) {
    keyColours[i] = kC.getInt(i);
  }
  
}