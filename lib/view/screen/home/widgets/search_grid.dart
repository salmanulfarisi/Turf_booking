import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view_model/view_model.dart';

class SearchGrid extends StatelessWidget {
  const SearchGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SoptViewModel>(context, listen: false);

    return Consumer<SoptViewModel>(
      builder: (context, value, child) {
        return controller.searchItems.isEmpty
            ? const Center(
                child: Text('No Data'),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.searchItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final search = controller.searchItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                        )
                      ],
                      image: DecorationImage(
                        image: NetworkImage(search.turfLogo!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text(
                            search.turfName!,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    search.turfPlace!,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    search.turfInfo!.turfRating!.toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
