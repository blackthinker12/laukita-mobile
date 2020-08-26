part of 'widgets.dart';

class Modals {
  static showImage(
    BuildContext context,
    String title,
    bool dismissible,
    String urlImage,
    double iconSizeClose,
    double iconSizeDownload,
    {
      bool isLocalImage = true
    }
  ) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width-20,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3.64963503649635, vertical: SizeConfig.safeBlockVertical * 1.54),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: iconSizeClose,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4.86618),
                        child: Text(title, style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 3.893),),
                      ),
                    ],
                  ),
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width-20,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7), bottomRight: Radius.circular(7)),
                ),
                child: Stack(
                  children: [
                    isLocalImage ? Image.asset(urlImage) : Image.network(urlImage),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Icon(
                                Icons.file_download,
                                color: Colors.white70,
                                size: iconSizeDownload,
                              ),
                            ),
                          ),
                        ),
                      ]
                    )
                  ],
                ),
              ),
            ],
          )
        );
      },
    );
  }

  static showListImage(
    BuildContext context,
    String title,
    bool dismissible,
    String urlImage,
    double iconSizeClose,
    double iconSizeDownload,
    List<String> imgList
  ) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width-20,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3.64963503649635, vertical: SizeConfig.safeBlockVertical * 1.54),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: iconSizeClose,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4.86618),
                        child: Text(title, style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 3.893),),
                      ),
                    ],
                  ),
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width-20,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7), bottomRight: Radius.circular(7)),
                ),
                child: Stack(
                  children: [
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(),
                        items: imgList.map((item) => Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.network(item),
                            )
                          ),
                        )).toList(),
                      )
                    ),
                    //Image.network(urlImage),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Icon(
                                Icons.file_download,
                                color: Colors.white70,
                                size: iconSizeDownload,
                              ),
                            ),
                          ),
                        ),
                      ]
                    )
                  ],
                ),
              ),
            ],
          )
        );
      },
    );
  }
}