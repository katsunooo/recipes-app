import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';

class Favorite extends ChangeNotifier {
  // базу делаю
  static const _allSweetsBox = "allSweetsBox";
  static const _favSweetsBox = "favSweetsBox";

  List<Sweets> _sweetRecipes = [
    Sweets(
      id: 1,
      name: 'Тирамису',
      imageSweet: 'assets/tiramisu.jpg',
      description:
          'Итальянский десерт с многослойной структурой: пропитанное эспрессо печенье савоярди чередуется с воздушным кремом на основе маскарпоне. Посыпка из какао придаёт благородную горчинку и завершает композицию.',
      toFavorites: false,
      ingredients: [
        Ingredient(
          name: 'Печенье савоярди',
          onHand: false,
          count: 400,
          unit: 'г',
        ),
        Ingredient(
          name: 'Сыр маскарпоне',
          onHand: false, // нет в наличии
          count: 500,
          unit: 'г',
        ),
        Ingredient(name: 'Яйца куриные', onHand: false, count: 4, unit: 'шт'),
        Ingredient(
          name: 'Пудра сахарная',
          onHand: false,
          count: 5,
          unit: 'с.л.',
        ),
        Ingredient(name: 'Кофе молотый', onHand: false, count: 8, unit: 'ч.л.'),
        Ingredient(
          name: 'Какао-порошок',
          onHand: false,
          count: 2.5,
          unit: 'ст.л',
        ),
        Ingredient(name: 'Вода', onHand: false, count: 400, unit: 'мл'),
        Ingredient(
          name: 'Ликёр (коньяк/кофейный ликёр)',
          onHand: false,
          count: 3,
          unit: 'с.л.',
        ),
      ],
      nutrition: Nutrition(
        calories: 283.4,
        proteins: 5.6,
        fats: 17.1,
        carbohydrates: 26.2,
      ),
      cookingSteps: [
        CookingStep(
          title: 'Подготовка кофейной пропитки',
          description:
              'Заварите крепкий кофе: залейте молотый кофе кипятком (400 мл), добавьте 1 ст. л. сахара. Дайте настояться 10 минут, затем процедите и остудите. В остывший кофе влейте ликёр (коньяк или кофейный ликёр). Пропитка должна быть прохладной, чтобы печенье не размякло слишком быстро.',
        ),
        CookingStep(
          title: 'Приготовление желткового крема',
          description:
              'Отделите 4 желтка от белков. В миске соедините желтки с 4 ст. л. сахара (80 г). Поставьте миску на паровую баню (вода в нижней посуде не должна касаться дна верхней миски). Взбивайте смесь миксером 10 минут до светлого крема: сахар должен полностью раствориться, а масса увеличиться в объёме. Снимите миску с бани и дайте крему остыть до едва тёплого состояния.',
        ),
        CookingStep(
          title: 'Взбивание белков',
          description:
              'В чистой сухой миске взбейте 3 белка до крепких устойчивых пиков. Используйте чистый миксер, чтобы белки хорошо взбились.',
        ),
        CookingStep(
          title: 'Соединение крема с маскарпоне',
          description:
              'В остывший желтковый крем добавьте маскарпоне (500 г). Аккуратно перемешайте на низкой скорости миксера до однородной консистенции.',
        ),
        CookingStep(
          title: 'Добавление белков',
          description:
              'Введите в крем половину взбитых белков, аккуратно вмешивая их лопаткой снизу вверх. Добавьте оставшиеся белки и снова бережно перемешайте. Крем должен получиться пышным и нежным.',
        ),
        CookingStep(
          title: 'Сборка торта',
          description:
              'Подготовьте прямоугольную или квадратную форму (желательно с съёмными бортиками). Быстро окунайте печенье савоярди в кофейную пропитку (по 2–3 секунды с каждой стороны) и выкладывайте в форму первым слоем. На печенье распределите половину крема, разровняйте. Повторите слой: пропитанное печенье + оставшийся крем. Поверхность крема разровняйте лопаткой.',
        ),
        CookingStep(
          title: 'Охлаждение',
          description:
              'Накройте форму пищевой плёнкой и поставьте торт в холодильник минимум на 5 часов (лучше на ночь). За это время слои хорошо пропитаются, а крем стабилизируется.',
        ),
        CookingStep(
          title: 'Подача',
          description:
              'Перед подачей посыпьте торт какао-порошком через сито. Это не только украсит десерт, но и добавит лёгкий шоколадный акцент. Разрежьте на порции и подавайте охлаждённым.',
        ),
      ],
      categories: ['торт', 'не требует выпечки', 'праздничный'],
    ),
    Sweets(
      id: 2,
      name: 'Медовик',
      imageSweet: 'assets/honey-cake.jpg',
      description:
          'Тёплый, медовый торт с тонкими нежными коржами, пропитанными ароматным заварным или сметанным кремом. Отличается насыщенным золотистым цветом и мягким, слегка пряным вкусом.',
      toFavorites: false,
      ingredients: [
        Ingredient(name: 'яйцо куриное', unit: 'шт.', count: 2),
        Ingredient(name: 'мёд', unit: 'г', count: 60),
        Ingredient(name: 'масло сливочное', unit: 'г', count: 100),
        Ingredient(name: 'сахар-песок', unit: 'г', count: 260),
        Ingredient(name: 'мука пшеничная высшего сорта', unit: 'г', count: 390),
        Ingredient(name: 'сода пищевая', unit: 'ч.л.', count: 0.5),
        Ingredient(name: 'сметана 20%', unit: 'г.', count: 400),
      ],
      nutrition: Nutrition(
        calories: 323.6,
        proteins: 5.1,
        fats: 13.5,
        carbohydrates: 44.6,
      ),
      cookingSteps: [
        CookingStep(title: 'Подготовка теста',
         description: 'В неэмалированной кастрюле (объёмом не менее 3 л) соедините яйца, мёд, сливочное масло и сахар. Поставьте на медленный огонь. Постоянно помешивайте до полного растворения сахара и однородности массы. Доведите до кипения.'),
        CookingStep(title: 'Гашение соды и замес теста',
         description: 'Снимите кастрюлю с огня. Добавьте гашёную соду (½ ч. л. соды + 1 ч. л. уксуса) — масса начнёт активно пузыриться. Быстро перемешайте. Постепенно всыпьте 3 стакана просеянной муки, непрерывно размешивая. Замесите тесто: оно должно быть мягким, но не липким.'),
        CookingStep(title: 'Разделение и раскатка коржей',
         description: 'Разделите тесто на 4–6 равных частей. Каждую часть раскатайте в тонкий круг диаметром 22–24 см на припылённой мукой поверхности. Для ровных краёв используйте тарелку или форму как шаблон.'),
        CookingStep(title: 'Выпекание коржей',
         description: 'Выпекайте каждый корж отдельно на противне, застеленном пергаментом, при 180 °C 5–7 минут до золотистого цвета. Готовые коржи остудите на решётке. Обрезки сохраните для посыпки.'),
        CookingStep(title: 'Приготовление крема',
         description: 'В глубокой миске взбейте сметану с сахаром (160 г) до однородности и лёгкого загустения. Крем не должен быть слишком плотным — он должен хорошо пропитывать коржи'),
        CookingStep(title: 'Сборка торта',
         description: 'На блюдо выложите первый корж, смажьте кремом. Повторите слои: корж + крем. Верхний корж и бока также покройте кремом. Для устойчивости можно слегка прижать торт сверху'),
        CookingStep(title: 'Оформление и пропитка',
         description: 'Обрезки коржей измельчите в крошку. Посыпьте крошкой верх и бока торта. Накройте пищевой плёнкой и уберите в холодильник на 6–8 часов (лучше на ночь) для полной пропитки'),
      ],
      categories: ['торт'],
    ),
    // Sweets(
    //   id: 1,
    //   name: 'Тирамису',
    //   imageSweet: 'assets/tiramisu.jpg',
    //   description:
    //       'Итальянский десерт с многослойной структурой: пропитанное эспрессо печенье савоярди чередуется с воздушным кремом на основе маскарпоне. Посыпка из какао придаёт благородную горчинку и завершает композицию.',
    //   toFavorites: false,
    // ),
    // Sweets(
    //   id: 2,
    //   name: 'Чизкей',
    //   imageSweet: 'assets/chize-cake.jpg',
    //   description:
    //       'Нежный десерт с кремовой текстурой: сливочно‑творожная начинка на основе сливочного сыра (маскарпоне, филадельфия) покоится на хрустящей основе из измельчённого печенья. Часто дополняется ягодами, фруктами или карамелью.',
    //   toFavorites: false,
    // ),
    // Sweets(
    //   id: 3,
    //   name: 'Медовик',
    //   imageSweet: 'assets/honey-cake.jpg',
    //   description:
    //       'Тёплый, медовый торт с тонкими нежными коржами, пропитанными ароматным заварным или сметанным кремом. Отличается насыщенным золотистым цветом и мягким, слегка пряным вкусом.',
    //   toFavorites: false,
    // ),
    // Sweets(
    //   id: 4,
    //   name: 'Красный бархат',
    //   imageSweet: 'assets/red-cake.jpg',
    //   description:
    //       'Эффектный торт с бархатистыми ярко‑красными коржами и лёгким шоколадным послевкусием. Нежный сливочный крем уравновешивает текстуру и придаёт десерту изысканный, сбалансированный вкус.',
    //   toFavorites: false,
    // ),
  ];

  List<Sweets> _userFavorite = [];

  List<Sweets> get sweetRecipes => _sweetRecipes;
  List<Sweets> get userFavorite => _userFavorite;

  Favorite() {
    loadData();
    loadDataFav();
  }

  //синхроню состояние

  void syncToFavorite() {
    for (var sweet in _sweetRecipes) {
      sweet.toFavorites = _userFavorite.any((s) => s.id == sweet.id);
    }
    // ждем когда дерево отстроится...
    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  Future<void> loadData() async {
    try {
      final box = await Hive.openBox<Sweets>(_allSweetsBox);
      if (box.isEmpty) {
        _sweetRecipes = _sweetRecipes;
      } else {
        _sweetRecipes = box.values.toList();
      }
      notifyListeners();
    } catch (e) {
      print('Ошибка загрузки данных: e');
    }
  }

  Future<void> loadDataFav() async {
    try {
      final box = await Hive.openBox<Sweets>(_favSweetsBox);
      if (box.isEmpty) {
        _userFavorite = [];
      } else {
        _userFavorite = [];
        for (var i in box.values) {
          try {
            // ignore: unnecessary_type_check
            if (i is Sweets) {
              _userFavorite.add(i);
              // ignore: dead_code
            } else {
              print('Недопустимый тип в Hive: ${i.runtimeType}');
            }
          } catch (e) {
            print('ошибка преобразования обратно в структуру данных: $e');
          }
        }
      }
      syncToFavorite();
    } catch (e, trace) {
      print("ошибка загрузки данных в избранном: $e\n$trace");
    }
  }

  Future<void> addToFav(Sweets sweet) async {
    try {
      final box = await Hive.openBox<Sweets>(_favSweetsBox);
      final isAlreadyFav = _userFavorite.any((s) => s.id == sweet.id);
      if (!isAlreadyFav) {
        await box.add(sweet);
        _userFavorite.add(sweet);
        sweet.toFavorites = true;
        notifyListeners();
      }
    } catch (e) {
      print("Ошибка добавления: $e");
    }
  }

  Future<void> removeFromFav(Sweets sweet) async {
    try {
      final box = await Hive.openBox<Sweets>(_favSweetsBox);
      final keyToRemove = box.keys.firstWhere(
        (key) => box.get(key)?.id == sweet.id,
        orElse: () => null,
      );
      if (keyToRemove != null) {
        await box.delete(keyToRemove);
        _userFavorite.removeWhere((s) => s.id == sweet.id);
        sweet.toFavorites = false;
        syncToFavorite();
      }
    } catch (e) {
      print('ошибка удаления: $e');
    }
  }
}
