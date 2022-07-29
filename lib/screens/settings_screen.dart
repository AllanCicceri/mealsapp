import 'package:flutter/material.dart';
import 'package:meal/components/main_drawer.dart';
import 'package:meal/models/filters_model.dart';

class SettingsScreen extends StatefulWidget {
  final FiltersModel Function(FiltersModel newFilters) _setFilters;
  final FiltersModel actualFilters;

  const SettingsScreen(this._setFilters, this.actualFilters, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  FiltersModel filters = FiltersModel();

  @override
  void initState() {
    super.initState();
    filters = widget.actualFilters;
  }

  @override
  Widget build(BuildContext context) {
    Widget _createSwtich(
        String title, String subtitle, bool value, Function(bool) onChanged) {
      return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: (value) {
          onChanged(value);
          widget._setFilters(filters);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwtich(
                  'Gluten Free',
                  'Displays only gluten free recipes',
                  filters.isGlutenFree,
                  (value) => setState(() => filters.isGlutenFree = value),
                ),
                _createSwtich(
                  'Lactose Free',
                  'Displays only lactose free recipes',
                  filters.isLactoseFree,
                  (value) => setState(() => filters.isLactoseFree = value),
                ),
                _createSwtich(
                  'Vegan',
                  'Displays only vegan recipes',
                  filters.isVegan,
                  (value) => setState(() => filters.isVegan = value),
                ),
                _createSwtich(
                  'Vegetarian',
                  'Displays only vegetarian recipes',
                  filters.isVegetarian,
                  (value) => setState(() => filters.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
