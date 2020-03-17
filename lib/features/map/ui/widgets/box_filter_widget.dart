import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

class BoxFilter extends StatefulWidget {
  @override
  _BoxFilterState createState() => _BoxFilterState();
}

class _BoxFilterState extends State<BoxFilter> {
  static const _listItemGap = 30.0;

  TextEditingController titleDescriptionController = TextEditingController();

  DateTime pickedDate;

  int selectedChipIndex = 0;

  List<Map<String, dynamic>> dateOptions = [];

  @override
  void didChangeDependencies() {
    //TOOD: Add localized strings
    dateOptions = [
      {'label': S.of(context).mapFilterNoDateLimit},
      {
        'label': S.of(context).mapFilterDate24Hours,
        'value': DateTime.now().subtract(Duration(hours: 24))
      },
      {
        'label': S.of(context).mapFilterDate7Days,
        'value': DateTime.now().subtract(Duration(days: 7))
      },
      {
        'label': S.of(context).mapFilterDate1Month,
        'value': DateTime.now().subtract(Duration(days: 30))
      },
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).mapFilterTitle,
                        style: Theme.of(context).primaryTextTheme.headline,
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () => _submitFilter(reset: true),
                            child: Text(
                              S.of(context).mapFilterReset,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .button
                                  .copyWith(color: Colors.purple[200]),
                            ),
                          ),
                          FlatButton(
                            onPressed: _submitFilter,
                            child: Text(
                              S.of(context).mapFilterApply,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .button
                                  .copyWith(color: Colors.purple[200]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 60.0, left: 20.0, right: 20.0, top: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.title,
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                    SizedBox(width: 5.0),
                    _inputField(
                      labelText: S.of(context).mapFilterTitleOrDescription,
                      controller: titleDescriptionController,
                    ),
                  ],
                ),
                SizedBox(height: _listItemGap),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      S.of(context).mapFilterDateLimitHint,
                      style: Theme.of(context).accentTextTheme.body1,
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Wrap(
                  children: List.generate(
                      dateOptions.length,
                      (i) =>
                          _dateChip(dateOptions[i]['label'], dateOptions[i]['value'], i)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleDescriptionController?.dispose();
    super.dispose();
  }

  Widget _inputField({String labelText, TextEditingController controller}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        style: TextStyle(color: Theme.of(context).accentTextTheme.body1.color),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).accentTextTheme.body1,
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }

  Widget _dateChip(String label, DateTime value, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: Theme.of(context).accentTextTheme.body2.copyWith(
                color: selectedChipIndex == index ? Colors.white : Colors.black,
              ),
        ),
        selected: selectedChipIndex == index,
        selectedColor: Theme.of(context).primaryColor,
        onSelected: (selected) {
          if (selected) {
            pickedDate = value;
            setState(() => selectedChipIndex = index);
          }
        },
      ),
    );
  }

  void _submitFilter({bool reset = false}) {
    if (reset) {
      // No need to parse input and create functions.
      Navigator.pop(context, List<bool Function(BoxMapItem)>());
      return;
    }

    final filters = List<bool Function(BoxMapItem)>();

    if (titleDescriptionController.text != null &&
        titleDescriptionController.text.isNotEmpty) {
      filters.add(
          BoxQueryMapper.titleDescriptionFunc(titleDescriptionController.text.trim()));
    }

    if (pickedDate != null) {
      filters.add(BoxQueryMapper.publishedDateFunc(pickedDate));
    }

    //TODO: Add filters for book author, book title and book genres

    Navigator.pop(context, filters);
  }
}
