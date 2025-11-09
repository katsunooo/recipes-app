import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/data/favorite.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';
import 'package:recipes_for_sweets_app/design/color.dart';

// ignore: must_be_immutable
class RecipesViewPage extends StatefulWidget {
  Sweets sweet;
  RecipesViewPage({super.key, required this.sweet});

  @override
  State<RecipesViewPage> createState() => _RecipesViewPageState();
}

class _RecipesViewPageState extends State<RecipesViewPage> {
  // доступные меры измерения
  final List<String> _units = ['г', 'мл', 'шт.', 'ч.л.', 'с.л.', 'стакан'];
  String? _selectedUnit;

  @override
  void initState() {
    super.initState();
    _selectedUnit = _units[0];
  }

  // обработка чекбокса
  void _handlerOnHand(int index) {
    setState(() {
      widget.sweet.ingredients[index].onHand =
          !widget.sweet.ingredients[index].onHand;
    });
  }

  // обработка выбора единицы
  void _handlerUnitSelected(String? unit) {
    setState(() {
      _selectedUnit = unit;
      if (unit != 0) {
        for (var ingredient in widget.sweet.ingredients) {
          ingredient.unit = unit;
        }
      }
    });
  }

  // добавление в свои рецепты
  void addSweetToFavoriteOnPage(Sweets sweet) {
    Provider.of<Favorite>(context, listen: false).addToFav(sweet);
    setState(() {});
  }

  // удаление на этой странице
  void remoteSweetToFavoriteonPage(Sweets sweet) {
    Provider.of<Favorite>(context, listen: false).removeFromFav(sweet);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              pinned: true,
              backgroundColor: whiteColor,
              title: Text(
                widget.sweet.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IconButton(
                    icon: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: whiteColor,
                        size: 20,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.sweet.toFavorites) {
                        remoteSweetToFavoriteonPage(widget.sweet);
                      } else {
                        addSweetToFavoriteOnPage(widget.sweet);
                      }
                    },
                    child: Icon(
                      widget.sweet.toFavorites
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: primaryColor,
                      size: 38,
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: 300,
                      child: Text(
                        widget.sweet.description,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Divider(color: primaryColor),
                    ),

                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.asset(
                          widget.sweet.imageSweet,
                          height: 260,
                          width: 260,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 20),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Необходимые продукты:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: _selectedUnit,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        labelText: 'Единица измерения',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2),
                        ),
                        labelStyle: TextStyle(color: primaryColor),
                      ),
                      items: _units
                          .map(
                            (unit) => DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            ),
                          )
                          .toList(),
                      onChanged: _handlerUnitSelected,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.sweet.ingredients.length,
                        itemBuilder: (context, index) {
                          final ingredient = widget.sweet.ingredients[index];
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: whiteColor,
                                  width: 290,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ingredient.name,
                                          maxLines: 6,
                                          style: TextStyle(
                                            fontSize: 18,
                                            decoration: ingredient.onHand
                                                ? TextDecoration.lineThrough
                                                : null,
                                            color: ingredient.onHand
                                                ? secondColor
                                                : Colors.black,
                                          ),
                                        ),
                                        Text(
                                          '${ingredient.count ?? ''} ${ingredient.unit ?? ''}',
                                          style: TextStyle(color: primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  value: ingredient.onHand,
                                  onChanged: (value) => _handlerOnHand(index),
                                  activeColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Пищевая ценность\nна 100 граммов:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Table(
                      border: TableBorder.all(color: primaryColor, width: 2),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Калории: ',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${widget.sweet.nutrition.calories} ккал',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Белки: ',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${widget.sweet.nutrition.proteins} г',style: TextStyle(color: Colors.black, 
                                fontWeight: FontWeight.w600, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Жиры: ',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${widget.sweet.nutrition.fats} г',style: TextStyle(color: Colors.black, 
                                fontWeight: FontWeight.w600, fontSize: 16),),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Углеводы: ',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${widget.sweet.nutrition.carbohydrates} г',style: TextStyle(color: Colors.black, 
                                fontWeight: FontWeight.w600, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 340,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Шаги готовки',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.sweet.cookingSteps.length,
                      itemBuilder: (context, index) {
                        final step = widget.sweet.cookingSteps[index];
                        return Padding(
                          padding: EdgeInsetsGeometry.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Шаг ${index + 1}: ${step.title}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: primaryColor,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                step.description,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Divider(color: primaryColor,),
                              )
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Wrap(
                        spacing: 8,
                        children: widget.sweet.categories
                            .map(
                              (category) => Chip(
                                label: Text(category),
                                backgroundColor: primaryColor,
                                labelStyle: TextStyle(color: whiteColor),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Center(
                        child: Text(
                          'Приятной готовки',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
