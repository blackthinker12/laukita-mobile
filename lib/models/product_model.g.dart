// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataProductModelAdapter extends TypeAdapter<DataProductModel> {
  @override
  final int typeId = 6;

  @override
  DataProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataProductModel(
      pdId: fields[0] as int,
      pdCtId: fields[1] as int,
      pdName: fields[2] as String,
      pdPrice: fields[3] as int,
      pdWeight: fields[4] as String,
      pdUnit: fields[5] as String,
      pdPackage: fields[6] as String,
      pdDescription: fields[7] as String,
      isBookmark: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DataProductModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.pdId)
      ..writeByte(1)
      ..write(obj.pdCtId)
      ..writeByte(2)
      ..write(obj.pdName)
      ..writeByte(3)
      ..write(obj.pdPrice)
      ..writeByte(4)
      ..write(obj.pdWeight)
      ..writeByte(5)
      ..write(obj.pdUnit)
      ..writeByte(6)
      ..write(obj.pdPackage)
      ..writeByte(7)
      ..write(obj.pdDescription)
      ..writeByte(8)
      ..write(obj.isBookmark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
