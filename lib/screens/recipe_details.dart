import 'package:flutter/material.dart';
import 'package:meal/models/recipe.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key? key}) : super(key: key);

  _createSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredients'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(recipe.ingredients[index]),
                      ),
                    );
                  }),
            ),
            _createSectionTitle(context, 'Steps'),
            _createSectionContainer(ListView.builder(
                itemCount: recipe.steps.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      maxRadius: 15,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      recipe.steps[index],
                      style: const TextStyle(fontSize: 17),
                    ),
                  );
                }))),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.star)),
    );
  }
}
