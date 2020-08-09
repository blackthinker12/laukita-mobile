part of 'pages.dart';

class Poi {

}

class NearBy extends StatefulWidget {
  @override
  _NearByState createState() => _NearByState();
}

class _NearByState extends State<NearBy> {
  final double _initFabHeight = 90.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 80.0;
  MapController mapController;
  StreamController<List<Poi>> _events;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
    mapController = MapController();
  }

  Widget _loading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black26,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitFadingCircle(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Tunggu Sebentar...',
                style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.9, color: Colors.white),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _body() {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(-6.367884,106.8263503),
              //plugins: [FeatureLayerPlugin(), PopupMarkerPlugin()],
              //onTap: (_) => _popupLayerController.hidePopup(),
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                tileProvider: CachedNetworkTileProvider(),
              ),
              // FeatureLayerOptions(
              //   featureLayerController: _featureLayerController,
              //   rings: rings,
              //   render: (){
              //     return PolygonOptions(
              //       color: Colors.black26,
              //       borderStrokeWidth: 2,
              //       borderColor: Colors.blueAccent
              //     );
              //   },
              // ),
              // PopupMarkerLayerOptions(
              //   pois: _poisOnMap,
              //   popupSnap: PopupSnap.top,
              //   popupController: _popupLayerController,
              //   popupBuilder: (BuildContext _, Poi selectedPoi) {
              //     return MapPopup(
              //       _popupLayerController,
              //       mapController,
              //       _poisOnMap,
              //       selectedPoi
              //     );
              //   },
              //   mapController: mapController
              // ),
            ]
          )
        ]
      )

    );
  }

  Widget _panel(ScrollController sc){
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 3.6,
          vertical: SizeConfig.safeBlockVertical * 2.3
        ),
        child: StreamBuilder<List<Poi>>(
          stream: _events?.stream,
          builder: (BuildContext context, AsyncSnapshot<List<Poi>> snapshot) {
            Widget widget;
            if (snapshot.hasError) {
              widget = ListView(
                controller: sc,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 1.2,
                      width: SizeConfig.safeBlockHorizontal * 12.1,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2,),
                  ListTile(
                    title: Text(
                      'Error',
                      style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.9, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "${snapshot.error}",
                      style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 2.9, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    isThreeLine: true,
                    leading: Padding(
                      padding: EdgeInsets.only(left: 3.0),
                      child: Center(
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: SizeConfig.safeBlockVertical * 9.75,
                        ),
                      )
                    ),
                    contentPadding: EdgeInsets.all(3.0),
                  ),
                ],
              );
            }
            else if (!snapshot.hasData || snapshot.data.length == 0){
              widget = ListView(
                controller: sc,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 1.2,
                      width: SizeConfig.safeBlockHorizontal * 12.1,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2,),
                  Container(),
                ],
              );
            } 
            else if (snapshot.data.length == 0){
              widget = ListView(
                controller: sc,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 1.2,
                      width: SizeConfig.safeBlockHorizontal * 12.1,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2,),
                  ListTile(
                    title: Center(
                      child: Text(
                        "Tidak ditemukan",
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.9, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              );
            }
            else {
              widget = ListView.separated(
                controller: sc,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, i) {
                  //String imageUrl = snapshot.data[i].imageUrl;
                  String imageUrl = '';
                  // var attributes = jsonDecode(snapshot.data[i].attributes);
                  // String poiName = attributes['poi_name'];
                  // String address = attributes['st_name'].toString() != 'null' ? attributes['st_name'] : '-';
                  return Column(
                    children: <Widget>[
                      i == 0 ? Center(
                        child: Container(
                          height: SizeConfig.safeBlockVertical * 1.2,
                          width: SizeConfig.safeBlockHorizontal * 12.1,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                      ) : Container(),
                      i == 0 ? SizedBox(height: SizeConfig.safeBlockVertical * 2,) : Container(),
                      ListTile(
                        title: Text(
                          '',
                          // '${poiName.toUpperCase()}',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.9, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '',
                              //"${capitalize(snapshot.data[i].layerName)}",
                              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.1, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Text(
                              '',
                              //"${capitalize(address)}",
                              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3, fontWeight: FontWeight.w100),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.transparent,
                          child: imageUrl == "localimage" ? Image.asset(
                            "assets/images/logo/map-red.png",
                            height: SizeConfig.safeBlockVertical * 6.15,
                            width: SizeConfig.safeBlockHorizontal * 9.75,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ) : CachedNetworkImage(
                            imageUrl: "https://deketku.com/assets_mobile/image/$imageUrl",
                            placeholder: (context, url) {
                              return Image.asset(
                                "assets/images/logo/map-red.png",
                                height: SizeConfig.safeBlockVertical * 6.15,
                                width: SizeConfig.safeBlockHorizontal * 9.75,
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ); 
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                "assets/images/logo/map-red.png",
                                height: SizeConfig.safeBlockVertical * 6.15,
                                width: SizeConfig.safeBlockHorizontal * 9.75,
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                        ),
                        trailing: Icon(
                          Icons.directions,
                          color: Colors.blueAccent,
                          size: 30.0,
                        ),
                        contentPadding: EdgeInsets.all(3.0),
                      ),
                    ],
                  );
                }
              );
            }
            return widget;
          } 
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _panelHeightOpen = MediaQuery.of(context).size.height * .75;

    return Scaffold(
      body: loading ? _loading() : SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SlidingUpPanel(
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              panelSnapping: false,
              body: _body(),
              panelBuilder: (sc) => _panel(sc),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              onPanelSlide: (double pos) => setState((){
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
              }),
            ),

            Positioned(
              top: 35.0,
              left: 20,
              child: FloatingActionButton(
                elevation: 0.0,
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }
              ),
            ),

            Positioned(
              top: 35.0,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 8.5,
                    height: SizeConfig.safeBlockVertical * 5.3,
                    child: FloatingActionButton(
                      elevation: 0.0,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () {
                        final z = mapController.zoom + 0.5;
                        mapController.move(mapController.center, z);
                      }
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 1.2),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 8.5,
                    height: SizeConfig.safeBlockVertical * 5.3,
                    child: FloatingActionButton(
                      elevation: 0.0,
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () {
                        final z = mapController.zoom - 0.5;
                        mapController.move(mapController.center, z);
                      }
                    ),
                  ),
                ],
              ),
            ),

          ],
        )
      )
    );
  }
}