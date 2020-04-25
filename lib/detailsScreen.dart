import 'package:flutter/material.dart';
import 'package:immo_result/realEstateObjects/house.dart';
import 'package:immo_result/slederDirection.dart';
import 'package:immo_result/viewStates.dart';
import 'components/bottomBars.dart';
import 'components/title.dart';

class DetailsScreen extends StatefulWidget {
  final List<House> housesList;
  final int selectedIndex;

  const DetailsScreen({
    Key key,
    this.housesList,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  int offstageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  ValueNotifier<SlideDirection> slideNotifier;

  AnimationController _slideLeftAnimation;
  Animation<Offset> heroSlide;
  Animation<Offset> offstageSlide;
  double contentSpacing;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;

    slideNotifier = ValueNotifier(slideDirection)
      ..addListener(() {
        setState(() {
          animate();
        });
      });

    _slideLeftAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          updateContents();
        }
      });
  }

  @override
  void dispose() {
    _slideLeftAnimation.dispose();
    slideNotifier.dispose();
    super.dispose();
  }

  void animate() {
    switch (slideNotifier.value) {
      case SlideDirection.leftToRight:
        heroSlide = Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(contentSpacing, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        offstageSlide = Tween<Offset>(
          begin: Offset(-contentSpacing, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        _slideLeftAnimation.forward(from: 0.0);
        break;
      case SlideDirection.rightToLeft:
        heroSlide = Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(-contentSpacing, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        offstageSlide = Tween<Offset>(
          begin: Offset(contentSpacing, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        _slideLeftAnimation.forward(from: 0.0);
        break;
      default:
        break;
    }
  }

  void updateContents() {
    switch (slideNotifier.value) {
      case SlideDirection.leftToRight:
        currentIndex =
            (currentIndex - 1).clamp(0, widget.housesList.length - 1);
        slideNotifier.value = SlideDirection.none;
        break;
      case SlideDirection.rightToLeft:
        currentIndex =
            (currentIndex + 1).clamp(0, widget.housesList.length - 1);
        slideNotifier.value = SlideDirection.none;
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    contentSpacing = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          DetailContent(
            house: widget.housesList[currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarWithoutCurves(),
    );
  }
}

class DetailContent extends StatelessWidget {
  final House house;

  const DetailContent({
    Key key,
    @required this.house,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 380.0,
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                top: 20.0,
                left: 0,
                child: Hero(
                  tag: '${house.houseId}-img',
                  child: Image.asset(
                    house.imgAssetsPath[0],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                  ),
                ),
              ),
              Positioned(
                top: 320.0,
                left: 16.0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: FractionalTranslation(
                    translation: Offset(0.0, 0.5),
                    child: Hero(
                      tag: '${house.houseId}-price',
                      child: DestinationTitle(
                        title: house.housePrice,
                        viewState: ViewState.enlarged,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 327.0,
                left: 160.0,
                child: FractionalTranslation(
                  translation: Offset(0.0, 0.5),
                  child: Hero(
                    tag: '${house.houseId}-quantity',
                    child: DestinationTitle(
                      title: house.houseQuantity,
                      viewState: ViewState.enlarged,
                      largeFontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 327.0,
                left: 280.0,
                child: FractionalTranslation(
                  translation: Offset(0.0, 0.5),
                  child: Hero(
                    tag: '${house.houseId}-value',
                    child: DestinationTitle(
                      title: house.houseValue,
                      viewState: ViewState.enlarged,
                      largeFontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Hero(
                tag: '${house.houseId}-address',
                child: DestinationTitle(
                  title: house.houseAddress,
                  viewState: ViewState.enlarged,
                  largeFontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(4.0),
              shadowColor: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 36.0,
                  top: 10.0,
                  bottom: 16.0,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores '
                          'et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore'
                          ' et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.' +
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores '
                          'et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore '
                          'et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
