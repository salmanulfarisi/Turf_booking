import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view/screen/screen.dart';
import 'package:turf_booking/view/screen/spot/widget/spot_widget.dart';
import 'package:turf_booking/view_model/view_model.dart';

class ViewAllTurf extends StatelessWidget {
  const ViewAllTurf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    DetailsController controller = context.read<DetailsController>();

    return Consumer<DetailsController>(
      builder: (context, value, _) {
        return controller.allTurffView
            ? AnimatedContainer(
                duration: const Duration(seconds: 5),
                width: controller.allTurffView ? 500 : 0,
                color: controller.allTurffView ? Colors.white : Colors.white,
                alignment: controller.allTurffView
                    ? Alignment.center
                    : AlignmentDirectional.centerStart,
                curve: Curves.fastOutSlowIn,
                child: Consumer<SoptViewModel>(
                  builder: (context, value, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        // const Divider(
                        //   thickness: 2,
                        // ),
                        Text(
                          "All Turf",
                          style: TextStyle(
                            fontSize: high / 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        ListView.builder(
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
                                // height: high / 9,
                                // width: wid,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2,
                                    )
                                  ],
                                ),
                                child: AllTurfWidget(all: altruf),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}
