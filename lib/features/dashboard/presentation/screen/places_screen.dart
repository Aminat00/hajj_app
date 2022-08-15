import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/widget/place_widget.dart';
import 'package:hajj_app/models/place_description.dart';
import 'package:hajj_app/services/places_service.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

Map<Icon, String> tabsArguments = {
  const Icon(Icons.star): 'Islamic Sites',
  const Icon(Icons.restaurant): 'Top restaurants',
  const Icon(Icons.directions_bus): 'Transportation',
  const Icon(Icons.attach_money): 'Currency exchange',
  const Icon(Icons.checkroom): 'Laundry service',
};

class _PlacesScreenState extends State<PlacesScreen> with SingleTickerProviderStateMixin {
  late Future<List<PlaceDescription>?> _futurePlaces;
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);
    _futurePlaces = PlacesService.getDescriptions(0);
    _controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TabBar(
            controller: _controller,
            padding: const EdgeInsets.all(8),
            isScrollable: true,
            unselectedLabelColor: Colors.teal,
            indicator: BoxDecoration(
                border: Border.all(color: Colors.teal),
                color: Colors.teal,
                borderRadius: BorderRadius.circular(7)),
            indicatorPadding: const EdgeInsets.all(3),
            onTap: (index) {
              _futurePlaces = PlacesService.getDescriptions(index);
              setState(() {});
            },
            tabs: tabsArguments.entries
                .map(
                  (entry) => Tab(
                    child: Row(
                      children: [
                        entry.key,
                        const SizedBox(
                          width: 4,
                        ),
                        Text(entry.value),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: _futurePlaces,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          children: [
                            const Icon(Icons.error_outline),
                            Text("Error fetching data: ${snapshot.error}"),
                          ],
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final response = snapshot.data;
                      return _body(context, response as List<PlaceDescription>);
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
          ),
        ],
      ),
    );
  }

  _body(BuildContext context, List<PlaceDescription> places) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return PlaceWidget(place);
      },
    );
  }
}
