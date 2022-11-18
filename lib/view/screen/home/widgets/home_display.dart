import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view/screen/home/widgets/grid_view.dart';
import 'package:turf_booking/view_model/home_view_model.dart';

class HomeDisplay extends StatelessWidget {
  const HomeDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homepageController = Provider.of<HomeViewModel>(context);
    return Column(
      children: [
        Container(
          height: size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage(
                'asset/image/images.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hai, Salman ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "Explore vanues and \nbook your favourite \nspot... ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Divider(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
              ),
            ),
          ],
        ),
        Consumer<HomeViewModel>(
          builder: (context, value, child) {
            return homepageController.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const GridViewWidget();
          },
        ),
        // Consumer(
        //   builder: builder,
        // )
      ],
    );
  }
}
