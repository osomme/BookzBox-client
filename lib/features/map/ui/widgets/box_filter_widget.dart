import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

/// Widget which allows the user to set box filtering.
class BoxFilter extends StatefulWidget {
  /// The current filter, if any. Can be null.
  final BoxFilterValues currentFilter;

  const BoxFilter({
    Key key,
    this.currentFilter,
  }) : super(key: key);

  @override
  _BoxFilterState createState() => _BoxFilterState();
}

class _BoxFilterState extends State<BoxFilter> {
  static const _listItemGap = 15.0;

  TextEditingController titleDescriptionController;

  TextEditingController authorController;

  TextEditingController bookTitleController;

  DateLimit dateLimit;

  int selectedChipIndex = 0;

  List<Map<String, dynamic>> dateOptions = [];

  @override
  void initState() {
    // If there is a currently set filter, populate the text input widgets with the contents of that filter.
    titleDescriptionController = TextEditingController(
      text: widget.currentFilter?.boxTitleOrDescriptionText,
    );
    authorController = TextEditingController(
      text: widget.currentFilter?.authorName,
    );
    bookTitleController = TextEditingController(
      text: widget.currentFilter?.bookTitle,
    );
    dateLimit = widget.currentFilter?.dateLimitation;
    _setSelectedChipIndex(dateLimit);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dateOptions = [
      {
        'label': S.of(context).mapFilterNoDateLimit,
        'value': DateLimit.NoLimit,
      },
      {
        'label': S.of(context).mapFilterDate24Hours,
        'value': DateLimit.OneDay,
      },
      {
        'label': S.of(context).mapFilterDate7Days,
        'value': DateLimit.SevenDays,
      },
      {
        'label': S.of(context).mapFilterDate1Month,
        'value': DateLimit.ThirtyDays,
      },
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
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
                  const EdgeInsets.only(bottom: 40.0, left: 20.0, right: 20.0, top: 10.0),
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
                        Icons.person_outline,
                        color: Theme.of(context).accentIconTheme.color,
                      ),
                      SizedBox(width: 5.0),
                      _inputField(
                        labelText: S.of(context).mapFilterAuthorLabel,
                        controller: authorController,
                      ),
                    ],
                  ),
                  SizedBox(height: _listItemGap),
                  Row(
                    children: <Widget>[
                      Icon(
                        Entypo.book,
                        color: Theme.of(context).accentIconTheme.color,
                      ),
                      SizedBox(width: 5.0),
                      _inputField(
                        labelText: S.of(context).mapFilterBookTitleLabel,
                        controller: bookTitleController,
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
                        (i) => _dateChip(
                            dateOptions[i]['label'], dateOptions[i]['value'], i)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleDescriptionController?.dispose();
    authorController?.dispose();
    bookTitleController?.dispose();
    super.dispose();
  }

  Widget _inputField({String labelText, TextEditingController controller}) {
    return Expanded(
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

  Widget _dateChip(String label, DateLimit value, int index) {
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
            dateLimit = value;
            setState(() => selectedChipIndex = index);
          }
        },
      ),
    );
  }

  void _setSelectedChipIndex(DateLimit dateLimit) {
    switch (dateLimit) {
      case DateLimit.NoLimit:
        selectedChipIndex = 0;
        break;
      case DateLimit.OneDay:
        selectedChipIndex = 1;
        break;
      case DateLimit.SevenDays:
        selectedChipIndex = 2;
        break;
      case DateLimit.ThirtyDays:
        selectedChipIndex = 3;
        break;
      default:
        selectedChipIndex = 0;
    }
  }

  void _submitFilter({bool reset = false}) {
    if (reset) {
      // No need to parse input and create functions.
      Navigator.pop(context, BoxFilterValues.noFilters());
      return;
    }

    final filterModel = BoxFilterValues(
      boxTitleOrDescriptionText: titleDescriptionController.text,
      authorName: authorController.text,
      bookTitle: bookTitleController.text,
      dateLimitation: dateLimit,
    );

    //TODO: Add filters for book genres

    Navigator.pop(context, filterModel);
  }
}
