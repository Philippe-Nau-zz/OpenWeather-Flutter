import 'package:flutter/material.dart';

class CardListview extends StatelessWidget {
  final String titleCard;
  final String info;
  final bool isImage;
  final String tooltip;
  CardListview({this.info, this.titleCard, this.isImage, this.tooltip});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Card(
        color: Colors.white30,
        child: Container(
          width: 120,
          child: Column(
            children: [
              Container(
                height: constraints.maxHeight - 90,
                child: Center(
                  child: Text(
                    this.titleCard,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              !this.isImage
                  ? Container(
                      height: 80,
                      width: constraints.maxWidth,
                      padding: EdgeInsets.all(20),
                      child: FittedBox(
                        child: Center(
                          child: Text(
                            this.info,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Tooltip(
                      message: '${this.tooltip}',
                      child: Container(
                        height: 80,
                        width: constraints.maxWidth,
                        padding: EdgeInsets.all(20),
                        child: Image.network(
                          this.info,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
