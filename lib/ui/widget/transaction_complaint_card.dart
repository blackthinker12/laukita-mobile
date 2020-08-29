part of 'widgets.dart';

class TransactionComplaintCard extends StatelessWidget {
  const TransactionComplaintCard({
    Key key,
    @required this.complaint,
  }) : super(key: key);

  final TransactionComplaintModel complaint;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54, SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54),
                width: SizeConfig.safeBlockHorizontal * 34,
                color:
                    complaint.status == 4 ? yellowContainer : Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          convertComplaintStatusString(complaint.status),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 2.44,
                            color: convertComplaintStatusColor(
                              complaint.status,
                            ),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          complaint.date,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 1.946472,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      complaint.complaintCode,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 1.946472,
                        decoration: TextDecoration.underline,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      complaint.customerName,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              ),
              VerticalDivider(width: 1,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54, SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  complaint.product.imageUrl,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 2.44
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      complaint.product.name,
                                      style: TextStyle(
                                        fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      '${complaint.product.quantity} ${complaint.product.unit}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: SizeConfig.safeBlockHorizontal * 1.946472
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              complaint.message,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 2.18978102189781,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 2.44
                          ),
                          DottedBorder(
                            strokeWidth: .1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 1),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: complaint.images.length > 2
                                ? Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Modals.showImage(
                                            context,
                                            complaint.product.name,
                                            true,
                                            complaint.images[0],
                                            SizeConfig.safeBlockHorizontal * 4.86618,
                                            SizeConfig.safeBlockHorizontal * 5.5,
                                            isLocalImage: false
                                          );
                                        },
                                        child: shadowImage(
                                          image: complaint.images[0],
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Modals.showImage(
                                            context,
                                            complaint.product.name,
                                            true,
                                            complaint.images[1],
                                            SizeConfig.safeBlockHorizontal * 4.86618,
                                            SizeConfig.safeBlockHorizontal * 5.5,
                                            isLocalImage: false
                                          );
                                        },
                                        child: shadowImage(
                                          image: complaint.images[1],
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Modals.showListImage(
                                            context,
                                            complaint.product.name,
                                            true,
                                            complaint.images[1],
                                            SizeConfig.safeBlockHorizontal * 4.86618,
                                            SizeConfig.safeBlockHorizontal * 5.5,
                                            complaint.images
                                          );
                                        },
                                        child: Icon(
                                          Icons.skip_next,
                                          size: SizeConfig.safeBlockHorizontal * 3.64963503649635,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: <Widget>[
                                      for (var image in complaint.images)
                                        GestureDetector(
                                          onTap: () {
                                            Modals.showImage(
                                              context,
                                              complaint.product.name,
                                              true,
                                              image,
                                              SizeConfig.safeBlockHorizontal * 4.86618,
                                              SizeConfig.safeBlockHorizontal * 5.5,
                                              isLocalImage: false
                                            );
                                          },
                                          child: shadowImage(
                                            image: image,
                                            width: 20,
                                            height: 20,
                                          )
                                        ),
                                    ],
                                  ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}