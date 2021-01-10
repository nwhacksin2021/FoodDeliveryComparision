import 'package:flutter/material.dart';
import 'package:food_delivery/card.dart';
import './dataclasses/restaurant.dart';

class RestaurantListScreen extends StatelessWidget {
  final List<Restaurant> restaurants;
  List<String> filterOptionsSelected;

  RestaurantListScreen({Key key, @required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
          title: restaurants.length > 0
              ? new Text(restaurants[0].address)
              : new Text(
                  "There are no available restaurants for the city you searched")),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: restaurants.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          RestaurantCardItem restaurantCard = new RestaurantCardItem(
              restaurant.name,
              restaurant.openingTime,
              restaurant.closingTime,
              restaurant.address,
              restaurant.listOfSupportedProviders);

          return Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(20),
                title: restaurantCard.buildTitle(context),
                isThreeLine: true,
                subtitle: restaurantCard.buildSubTitle(context),
                onTap: () {
                  //TODO: make API call to fetch menu data
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: ctxt,
            //builder: (BuildContext context) => _buildPopupDialog(context, filterOptionsSelected),
          );
        },
        child: Icon(Icons.settings_input_component),
      ),
    );
  }
}

//Widget _buildPopupDialog(BuildContext context, List<String> filterOptionsSelected) {
//  return AlertDialog(
//      title: Text("Select filters"),
//      content:MultiSelectChip(
//        filterOptions,
//        onSelectionChanged: (selectedList) {
//          setState(() {
//            selectedReportList = selectedList;
//          });
//        },
//      ),
//  )
//}

List<String> filterOptions = [
  "Delivery Fee",
  "Alphabetical"
  //Cuisine,
];

//class _MultiSelectChipState extends State<MultiSelectChip> {
//  List<String> selectedFilterOptions = [];
//
//  _buildChoiceList() {
//    List<Widget> choices = [];
//    widget.filterOptions.forEach((item) {
//      choices.add(Container(
//        padding: const EdgeInsets.all(2.0),
//        child: ChoiceChip(
//          label: Text(item),
//          selected: selectedFilterOptions.contains(item),
//          onSelected: (selected) {
//            setState(() {
//              selectedFilterOptions.contains(item)
//                  ? selectedFilterOptions.remove(item)
//                  : selectedFilterOptions.add(item);
//            });
//          },
//        ),
//      ));
//    });
//    return choices;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Wrap(
//      children: _buildChoiceList(),
//    );
//  }
//}
//
//class MultiSelectChip extends StatefulWidget {
//  final List<String> filterOptions;
//  final Function(List<String>) onSelectionChanged;
//
//  MultiSelectChip(this.filterOptions, this.onSelectionChanged);
//
//  @override
//  _MultiSelectChipState createState() => _MultiSelectChipState();
//}
