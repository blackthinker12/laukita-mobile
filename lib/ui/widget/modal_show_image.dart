part of 'widgets.dart';

class Modals {
  static showImage(
    BuildContext context,
    String title,
    bool dismissible,
    String urlImage,
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
                  color: Color(0xFFcc0001),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(title, style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white, fontSize: 16),),
                      ),
                    ],
                  ),
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width-20,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7), bottomRight: Radius.circular(7)),
                ),
                child: Stack(
                  children: [
                    Image.asset(urlImage),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Icon(
                                Icons.file_download,
                                color: Colors.white70,
                                size: 35,
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