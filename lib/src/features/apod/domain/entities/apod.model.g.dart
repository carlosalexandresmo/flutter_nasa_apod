// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApodAdapter extends TypeAdapter<Apod> {
  @override
  final int typeId = 0;

  @override
  Apod read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Apod();
  }

  @override
  void write(BinaryWriter writer, Apod obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
