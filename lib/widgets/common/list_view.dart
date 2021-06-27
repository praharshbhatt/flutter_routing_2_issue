import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/font.dart';
import '../../utils/text_style.dart';
import '../device.dart';
import '../utils/card_type_enum.dart';

class TribesListView extends StatefulWidget {
  const TribesListView(
      {required this.listOfWidgets,
      required this.numOfWidgetsOnTablet,
      required this.numOfWidgetsOnDesktop,
      required this.numOfWidgetsOnWideScreen,
      required this.itemHeight,
      required this.cardType,
      required this.itemWidth,
      required this.padding,
      this.title,
      this.scrollDirection,
      this.showSeeAllButton,
      this.seeAllFunction,
      Key? key})
      : super(key: key);
  final List<Widget> listOfWidgets;
  final double itemHeight;
  final CardTypeEnum cardType;
  final double itemWidth;
  final double padding;
  final int numOfWidgetsOnTablet;
  final int numOfWidgetsOnDesktop;
  final int numOfWidgetsOnWideScreen;
  final Axis? scrollDirection;
  final bool? showSeeAllButton;
  final String? title;
  final dynamic seeAllFunction;

  @override
  _TribesListViewState createState() => _TribesListViewState();
}

class _TribesListViewState extends State<TribesListView> {
  final ScrollController _scrollController = ScrollController();
  late Size _screenSize;
  double movedItem = 0;
  late double _initMovedItem;
  late double _maxLength;
  bool backButton = false;
  bool forwardButton = true;
  late bool? _showSeeAllButton;

  @override
  void didChangeDependencies() {
    _screenSize = MediaQuery.of(context).size;
    _showSeeAllButton = widget.showSeeAllButton;
    _maxLength = (widget.itemWidth + (widget.padding * 2)) * widget.listOfWidgets.length;
    if (_screenSize.width >= 800 && _screenSize.width < 1440) {
      setState(() {
        _initMovedItem = (widget.itemWidth + (widget.padding * 2)) * widget.numOfWidgetsOnTablet;
        if (widget.listOfWidgets.length <= widget.numOfWidgetsOnTablet) {
          setState(() {
            forwardButton = false;
            _showSeeAllButton = false;
          });
        }
      });
    } else if (_screenSize.width >= 1440 && _screenSize.width < 1780) {
      setState(() {
        _initMovedItem = (widget.itemWidth + (widget.padding * 2)) * widget.numOfWidgetsOnDesktop;
        if (widget.listOfWidgets.length <= widget.numOfWidgetsOnDesktop) {
          setState(() {
            forwardButton = false;
            _showSeeAllButton = false;
          });
        }
      });
    } else if (_screenSize.width >= 1780) {
      setState(() {
        _initMovedItem = (widget.itemWidth + (widget.padding * 2)) * widget.numOfWidgetsOnWideScreen;
        if (widget.listOfWidgets.length <= widget.numOfWidgetsOnWideScreen) {
          setState(() {
            forwardButton = false;
            _showSeeAllButton = false;
          });
        }
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // key: widget.key,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenType(context) == DeviceType.phone ? 15 : 25, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title ?? '',
                style: homeTitleTextStyle,
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: widget.seeAllFunction,
                child: _showSeeAllButton ?? true
                    ? Row(
                        children: [
                          Text(
                            'seeAll',
                            style: seeAllTextStyle,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: fontColorGrey,
                            size: 15,
                          )
                        ],
                      )
                    : Container(),
              )
            ],
          ),
        ),
        if (getScreenType(context) == DeviceType.phone)
          Container(
            height: widget.itemHeight,
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: widget.listOfWidgets.length,
              addSemanticIndexes: false,
              scrollDirection: widget.scrollDirection ?? Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0 ? EdgeInsets.only(right: widget.padding, left: 15) : EdgeInsets.symmetric(horizontal: widget.padding),
                  child: widget.listOfWidgets[index],
                );
              },
            ),
          )
        else
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: widget.itemHeight,
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: widget.listOfWidgets.length,
                    addSemanticIndexes: false,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0 ? EdgeInsets.only(right: widget.padding) : EdgeInsets.symmetric(horizontal: widget.padding),
                        child: widget.listOfWidgets[index],
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: forwardButton,
                child: Positioned(
                    top: (widget.cardType.getHeight(context) - 50) / 2,
                    right: 0,
                    child: InkWell(
                      key: const Key('listview_forward_button'),
                      onTap: () {
                        if (movedItem == 0) {
                          setState(() {
                            movedItem = _initMovedItem;
                          });
                          if (_initMovedItem >= _maxLength - _initMovedItem) {
                            _scrollController
                                .animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                forwardButton = false;
                                backButton = true;
                              });
                            });
                          } else {
                            _scrollController
                                .animateTo(
                              _initMovedItem,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                movedItem = _scrollController.offset + _initMovedItem;
                                backButton = true;
                              });
                            });
                          }
                        } else {
                          if (movedItem >= _maxLength - _initMovedItem) {
                            _scrollController
                                .animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                forwardButton = false;
                                backButton = true;
                              });
                            });
                          } else {
                            _scrollController
                                .animateTo(
                              movedItem,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                movedItem = _scrollController.offset + _initMovedItem;
                                backButton = true;
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(color: themeBoxBlueLightest, shape: BoxShape.circle),
                        height: 50,
                        width: 50,
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
              Visibility(
                visible: backButton,
                child: Positioned(
                  top: (widget.cardType.getHeight(context) - 50) / 2,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        forwardButton = true;
                        movedItem = _scrollController.offset - _initMovedItem;
                      });
                      if (movedItem < 0) {
                        setState(() {
                          movedItem = 0;
                        });
                      }
                      _scrollController
                          .animateTo(
                        movedItem,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 500),
                      )
                          .then((_) {
                        if (movedItem <= 0) {
                          setState(() {
                            backButton = false;
                          });
                        }
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(color: themeBoxBlueLightest, shape: BoxShape.circle),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
