import 'package:flutter/material.dart';
import 'package:postal_code_finder/assets/styles/styles.dart';
import 'package:postal_code_finder/models/search_entry.dart';
import 'package:postal_code_finder/widgets/spacing_widget.dart';

class MapBottomSheetWidget extends StatelessWidget {
  const MapBottomSheetWidget(this.element, {super.key});

  final Styles styles = const Styles();
  final SearchEntry element;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: styles.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              element.address,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: styles.fontSize,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SpacingWidget(),
            Image.network(
                "https://developers.onemap.sg/commonapi/staticmap/getStaticImage?layerchosen=default&lat=${element.latitude}&lng=${element.longitude}&zoom=17&height=200&width=500&points=[${element.latitude},${element.longitude},%22255,255,178%22,%22X%22]")
          ],
        ),
      ),
    );
  }
}
