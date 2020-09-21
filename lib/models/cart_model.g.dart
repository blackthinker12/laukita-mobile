// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataCartModelAdapter extends TypeAdapter<DataCartModel> {
  @override
  final int typeId = 2;

  @override
  DataCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataCartModel(
      cart: (fields[0] as List)?.cast<CartModel>(),
      totalPrice: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DataCartModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.cart)
      ..writeByte(1)
      ..write(obj.totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 3;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      product: fields[0] as DataProductModel,
      productQuantity: fields[1] as ProductQuantity,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.product)
      ..writeByte(1)
      ..write(obj.productQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductQuantityAdapter extends TypeAdapter<ProductQuantity> {
  @override
  final int typeId = 4;

  @override
  ProductQuantity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductQuantity(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductQuantity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductQuantityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
