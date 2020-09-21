// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstallationInformationModelAdapter
    extends TypeAdapter<InstallationInformationModel> {
  @override
  final int typeId = 5;

  @override
  InstallationInformationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InstallationInformationModel(
      fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InstallationInformationModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isInstalled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstallationInformationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
