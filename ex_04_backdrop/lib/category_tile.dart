import 'package:ex_04_backdrop/category.dart';
import 'package:flutter/material.dart';
import 'package:ex_04_backdrop/unit_converter.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  /// The [CategoryTile] shows the name and color of a [Category] for unit
  /// conversions.
  ///
  /// Tapping on it brings you to the unit converter.

  const CategoryTile({
    Key key,
    @required this.category,
    this.onTap,
  })  : assert(category != null),
        super(key: key);

  /// Navigates to the [UnitConverter].
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              category.name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: category.color,
          ),
          body: UnitConverter(category: category),
          // This prevents the attempt to resize the screen when the keyboard
          // is opened
          resizeToAvoidBottomPadding: false,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          onTap == null ? Color.fromRGBO(50, 50, 50, 0.2) : Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color['hightlight'],
          splashColor: category.color['splash'],
          onTap: onTap == null ? null : () => onTap(category),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(category.iconLocation),
                ),
                Center(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
