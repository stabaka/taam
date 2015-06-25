### Geospatial TERR data function

TERR data functions for common geospatial data tasks

- *Points In Polygons (Geofencing) for Cartesian Coordinates.sfd*

  Data function that inputs a set of polygons and a set of points, and outputs which polygon each point is in. The points and polygons must be specified in Cartesian (x/y) coordinates. Requires the R packages `sp` and `wkb`.

- *Points In Polygons (Geofencing) for Longitude-Latitude Coordinates.sfd*

  Data function that inputs a set of polygons and a set of points, and outputs which polygon each point is in. The points and polygons must be specified in longitude/latitude coordinates. Requires the R packages `sp` and `wkb`. 

- *Transform CRS for Imported Shapefile by EPSG Code.sfd*

  Data function that converts an imported shapefile from one coordinate reference system to another, using EPSG codes to specify the reference systems. Requires the R packages `sp`, `rgdal`, and `wkb`. Note that the environment variable GDAL_DATA must be set to the location of the gdal folder in the rgdal folder in the library folder where TERR is installed. EPSG codes can be looked up from the .prj files in shapefiles at http://prj2epsg.org/. 

- *Transform CRS for Imported Shapefile by PROJ.4 String.sfd*

  Data function that converts an imported shapefile from one coordinate reference system to another, using PROJ.4 strings to specify the reference systems. Requires the R packages `sp`, `rgdal`, and `wkb`. PROJ.4 strings can be looked up at http://spatialreference.org/. 