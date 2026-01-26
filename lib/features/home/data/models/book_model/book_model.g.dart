// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 0;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      kind: fields[0] as String?,
      id: fields[1] as String,
      volumeInfo: fields[2] as VolumeInfo,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.volumeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
