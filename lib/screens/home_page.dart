import 'package:apiweatherapp/data/image_path.dart';
import 'package:apiweatherapp/services/location_provider.dart';
import 'package:apiweatherapp/services/weather_service_provider.dart';
import 'package:apiweatherapp/utils/apptext.dart';
import 'package:apiweatherapp/utils/custom_divider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).determinePosition();

    Provider.of<WeatherServiceProvider>(context,listen: false).fetchWeatherDataByCity("Dubai");

    super.initState();
  }

  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(background[0]))),
        child: Stack(
          children: [
            _clicked == true
                ? Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Container(
              height: 50,
              child: Consumer<LocationProvider>(
                  builder: (context, locationProvider, child) {
                var locationCity;
                if (locationProvider.currentLocationName != null) {
                  locationCity = locationProvider.currentLocationName!.locality;
                } else {
                  locationCity = "Unknown Location";
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                data: locationCity,
                                color: Colors.white,
                                fw: FontWeight.w700,
                                size: 18,
                              ),
                              AppText(
                                data: "Good Morning",
                                color: Colors.white,
                                fw: FontWeight.w400,
                                size: 14,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _clicked = !_clicked;
                          });
                        },
                        icon: Icon(
                          Icons.search,
                          size: 32,
                        ))
                  ],
                );
              }),
            ),
            Align(
                alignment: Alignment(0, -0.7),
                child: Image.asset(imagePath[6])),
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      data: "21 C",
                      color: Colors.white,
                      fw: FontWeight.bold,
                      size: 32,
                    ),
                    AppText(
                      data: "Snow",
                      color: Colors.white,
                      fw: FontWeight.w600,
                      size: 26,
                    ),
                    AppText(
                      data: DateTime.now().toString(),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.75),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.4)),
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/temperature-high.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Temp Max",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: "21C",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/temperature-low.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Temp Min",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: "21C",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomDivider(
                      startIndent: 20,
                      endIndent: 20,
                      color: Colors.white,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/sun.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Sunrise",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: "21C",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/moon.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Sunset",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: "21C",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
