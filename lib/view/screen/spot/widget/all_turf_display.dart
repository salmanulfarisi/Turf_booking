import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view/screen/screen.dart';
import 'package:turf_booking/view/screen/spot/widget/all_turf_display_widget.dart';
import 'package:turf_booking/view_model/spot_view_model.dart';

class AllTurfDisplay extends StatelessWidget {
  const AllTurfDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<SoptViewModel>(
          builder: (context, value, _) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.allTruff.length,
              itemBuilder: (context, index) {
                final altruf = value.allTruff[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => Details(
                        details: altruf,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AllTurfWidget(
                      all: altruf,
                    ),
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
