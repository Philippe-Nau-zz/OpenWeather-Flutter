import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/controller.dart';

class SearchBar extends StatelessWidget {
  final _controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          margin: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white24,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  width: constraints.maxWidth - 84,
                  child: Center(
                    child: TextField(
                      controller: _controller.searchController,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (_) => _controller.searchCity(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white60,
                      size: 28,
                    ),
                    onPressed: () {
                      _controller.searchCity();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
