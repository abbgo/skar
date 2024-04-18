import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skar/datas/local_storadge.dart';
import 'package:skar/helpers/permissions.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/shop.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/methods/pages/map.dart';
import 'package:skar/pages/parts/bottom_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.isTM});

  final bool isTM;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  // VARIABLES -----------------------------------------------------------------
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  bool _hasPermission = false;
  bool _isLoading = true;
  List<Shop> shops = [];
  Future<List<Shop>> brendShops = Future.value([]);
  double turns = 0.0;
  double bannerHeight = 0.4;
  int _page = 1;
  bool _loadPagination = false;
  final ScrollController _scrollController = ScrollController();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.898429, 58.354480),
    zoom: 15,
  );

  get ui => null;
  // VARIABLES END -----------------------------------------------------------------

// FUNCTIONS -------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    var localStoradgeFalse = Provider.of<LocalStoragde>(context, listen: false);
    localStoradgeFalse.getLangFromSharedPref();

    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        setState(() {
          _page++;
          _loadPagination = true;
        });
        List<Shop> newShops = await Shop.fetchShops('shops', 2, _page, true);
        brendShops.then((value) {
          value.addAll(newShops);
          setState(() {
            _loadPagination = false;
          });
        });
      }
    });

    setState(() {
      checkAndGetCurrentLocation(_markers, _controller).then((value) {
        _isLoading = false;
        if (value) {
          _hasPermission = true;
        }
      });
    });

    _getShopsForMap();
  }

  _getShopsForMap() async {
    bool hasIntConn = await checkIntConn();

    if (hasIntConn) {
      List<Shop> brendshops = await Shop.fetchShops('shops', 2, _page, true);
      brendShops = Future.value(brendshops);

      shops = await Shop.fetchShopsForMap('shops/map');

      if (shops.isNotEmpty) {
        for (Shop shop in shops) {
          _markers.add(
            Marker(
              markerId: MarkerId(shop.id),
              position: LatLng(shop.latitude, shop.longitude),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationPage(
                      shopID: shop.id,
                      isMapPage: false,
                      isTM: widget.isTM,
                    ),
                  ),
                );
              },
              icon: await Column(
                children: [
                  Text(
                    widget.isTM ? shop.nameTM : shop.nameRU,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(-1.5, -1.5),
                            color: Colors.red,
                          ),
                          Shadow(
                            offset: Offset(1.5, -1.5),
                            color: Colors.red,
                          ),
                          Shadow(
                            offset: Offset(1.5, 1.5),
                            color: Colors.red,
                          ),
                          Shadow(
                            offset: Offset(-1.5, 1.5),
                            color: Colors.red,
                          ),
                        ]),
                  ),
                  Image.asset(
                    'assets/icons/shirt_location.png',
                    height: 50,
                  ),
                ],
              ).toBitmapDescriptor(
                logicalSize: const Size(1000, 100),
                imageSize: const Size(1000, 100),
              ),
            ),
          );
        }
        if (mounted) setState(() {});
        return [];
      }
    }
    if (mounted) showIntConnErrSnackBar(context);
    return [];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  // FUNCTIONS END -------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: _isLoading
          ? Center(
              child: Image.asset(
                "assets/animated_icons/animated_map.gif",
              ),
            )
          : _hasPermission
              ? Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GoogleMap(
                      markers: Set<Marker>.of(_markers),
                      initialCameraPosition: _kGooglePlex,
                      mapType: MapType.hybrid,
                      myLocationButtonEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    AnimatedPositioned(
                      bottom: bannerHeight == 0.4
                          ? screenProperties(context).height * bannerHeight
                          : screenProperties(context).height * 0.07,
                      right: 5,
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        children: [
                          locationButtonMethod(
                            context,
                            () {
                              checkAndGetCurrentLocation(_markers, _controller)
                                  .then((value) {
                                setState(() {
                                  _isLoading = false;
                                });
                                if (value) {
                                  setState(() {
                                    _hasPermission = true;
                                  });
                                }
                              });
                            },
                          ),
                          vipButtonMethod(context),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onVerticalDragEnd: (details) {
                        setState(() {
                          if (bannerHeight == 0.4) {
                            bannerHeight = 0.07;
                            turns += 1 / 2;
                          } else {
                            bannerHeight = 0.4;
                            turns -= 1 / 2;
                          }
                        });
                      },
                      child: AnimatedContainer(
                        height: screenProperties(context).height * bannerHeight,
                        width: screenProperties(context).width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, top: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lang.proposedShops,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  AnimatedRotation(
                                    turns: turns,
                                    duration:
                                        const Duration(microseconds: 1000),
                                    child: const Icon(
                                        Icons.arrow_downward_rounded),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: _loadPagination
                                      ? LinearProgressIndicator(
                                          color: elevatedButtonColor)
                                      : const SizedBox(),
                                ),
                              ),
                              Expanded(
                                child: FutureBuilder(
                                  future: brendShops,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator(
                                              color: elevatedButtonColor));
                                    } else if (snapshot.hasData) {
                                      return listviewMethod(
                                          context,
                                          snapshot.data!,
                                          widget.isTM,
                                          _scrollController);
                                    }
                                    return const Center(
                                        child: Text('has error'));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: SizedBox(
                    width: screenProperties(context).width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/location_permission.jpeg",
                          height: screenProperties(context).height * 0.3,
                        ),
                        Text(
                          lang.locationPermission,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            await Geolocator.requestPermission()
                                .then((value) {})
                                .onError((error, stackTrace) {
                              if (kDebugMode) {
                                print("error: ${error.toString()}");
                              }
                            });

                            await checkAndGetCurrentLocation(
                                    _markers, _controller)
                                .then((value) {
                              setState(() {
                                _isLoading = false;
                              });
                              if (value) {
                                setState(() {
                                  _hasPermission = true;
                                });
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              lang.allow,
                              style: const TextStyle(color: Colors.white),
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
