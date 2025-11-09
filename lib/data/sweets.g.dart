// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sweets.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SweetsAdapter extends TypeAdapter<Sweets> {
  @override
  final int typeId = 0;

  @override
  Sweets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sweets(
      id: fields[0] as int,
      name: fields[1] as String,
      imageSweet: fields[2] as String,
      description: fields[3] as String,
      toFavorites: fields[4] as bool,
      ingredients: (fields[5] as List).cast<Ingredient>(),
      nutrition: fields[6] as Nutrition,
      cookingSteps: (fields[7] as List).cast<CookingStep>(),
      categories: (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Sweets obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageSweet)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.toFavorites)
      ..writeByte(5)
      ..write(obj.ingredients)
      ..writeByte(6)
      ..write(obj.nutrition)
      ..writeByte(7)
      ..write(obj.cookingSteps)
      ..writeByte(8)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SweetsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 1;

  @override
  Ingredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(
      name: fields[0] as String,
      onHand: fields[1] as bool,
      unit: fields[2] as String?,
      count: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.onHand)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NutritionAdapter extends TypeAdapter<Nutrition> {
  @override
  final int typeId = 2;

  @override
  Nutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrition(
      calories: fields[0] as double,
      proteins: fields[1] as double,
      fats: fields[2] as double,
      carbohydrates: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.proteins)
      ..writeByte(2)
      ..write(obj.fats)
      ..writeByte(3)
      ..write(obj.carbohydrates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CookingStepAdapter extends TypeAdapter<CookingStep> {
  @override
  final int typeId = 3;

  @override
  CookingStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CookingStep(
      title: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CookingStep obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookingStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
