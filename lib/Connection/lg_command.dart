class LGCommands {
  
  // Command 1: Show LG Logo on left screen
  static String showLogo() {
    String kml = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <ScreenOverlay>
      <n>LG Logo</n>
      <Icon>
        <href>https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgXmdNgBTXup6bdWew5RzgCmC9pPb7rK487CpiscWB2S8OlhwFHmeeACHIIjx4B5-Iv-t95mNUx0JhB_oATG3-Tq1gs8Uj0-Xb9Njye6rHtKKsnJQJlzZqJxMDnj_2TXX3eA5x6VSgc8aw/s320-rw/LOGO+LIQUID+GALAXY-sq1000-+OKnoline.png</href>
      </Icon>
      <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
      <screenXY x="0.02" y="0.98" xunits="fraction" yunits="fraction"/>
      <size x="200" y="200" xunits="pixels" yunits="pixels"/>
    </ScreenOverlay>
  </Document>
</kml>''';

    return "echo '$kml' > /var/www/html/kml/slave_2.kml";
  }

  // Command 2: Show 3D Pyramid
  static String showPyramid() {
    String kml = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <n>Pyramid</n>
    
    <Style id="red">
      <PolyStyle><color>7d0000ff</color></PolyStyle>
    </Style>
    <Style id="green">
      <PolyStyle><color>7d00ff00</color></PolyStyle>
    </Style>
    <Style id="blue">
      <PolyStyle><color>7dff0000</color></PolyStyle>
    </Style>
    <Style id="yellow">
      <PolyStyle><color>7d00ffff</color></PolyStyle>
    </Style>
    
    <Placemark>
      <n>Base</n>
      <styleUrl>#red</styleUrl>
      <Polygon>
        <extrude>1</extrude>
        <altitudeMode>relativeToGround</altitudeMode>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              2.1734,41.3851,0
              2.1744,41.3851,0
              2.1744,41.3861,0
              2.1734,41.3861,0
              2.1734,41.3851,0
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>
    
    <Placemark>
      <n>South Face</n>
      <styleUrl>#green</styleUrl>
      <Polygon>
        <extrude>1</extrude>
        <altitudeMode>relativeToGround</altitudeMode>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              2.1734,41.3851,0
              2.1739,41.3856,100
              2.1744,41.3851,0
              2.1734,41.3851,0
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>
    
    <Placemark>
      <n>East Face</n>
      <styleUrl>#blue</styleUrl>
      <Polygon>
        <extrude>1</extrude>
        <altitudeMode>relativeToGround</altitudeMode>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              2.1744,41.3851,0
              2.1739,41.3856,100
              2.1744,41.3861,0
              2.1744,41.3851,0
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>
    
    <Placemark>
      <n>North Face</n>
      <styleUrl>#yellow</styleUrl>
      <Polygon>
        <extrude>1</extrude>
        <altitudeMode>relativeToGround</altitudeMode>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              2.1744,41.3861,0
              2.1739,41.3856,100
              2.1734,41.3861,0
              2.1744,41.3861,0
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>
    
  </Document>
</kml>''';

    return "echo '$kml' > /var/www/html/kml/pyramid.kml";
  }

  // Command 3: Fly to Barcelona (my home city)
  static String flyToCity() {
    String query = "flytoview=<LookAt><longitude>77.030836</longitude><latitude>28.456113</latitude><altitude>0</altitude><heading>0</heading><tilt>60</tilt><range>1500</range></LookAt>";
    return "echo '$query' > /tmp/query.txt";
  }

  // Command 4: Clear Logos
  static String clearLogos() {
    return "echo '' > /var/www/html/kml/slave_2.kml";
  }

  // Command 5: Clear KMLs
  static String clearKmls() {
    return "rm -f /var/www/html/kml/pyramid.kml";
  }
}