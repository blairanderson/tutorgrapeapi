

dojo.require("esri.map");
dojo.require("esri.arcgis.utils");
dojo.require("esri.dijit.Legend");
dojo.require("esri.dijit.Popup");
dojo.require("esri.layers.FeatureLayer");

var map;

function init(){
  var webmapid = "d2dcc1bd47d04ef0962276474a63a01f";
  esri.arcgis.utils.createMap(webmapid, "mapDiv").then(function(response){
    map = response.map;

    var legend = new esri.dijit.Legend({
      map:map,
      layerInfos:(esri.arcgis.utils.getLegendLayers(response))
    },"legendDiv");
    legend.startup();


  },function(error){alert ('Failed to load map');
      console.log("Error loading webmap: " & dojo.toJson(error));});

};


dojo.ready(init);

