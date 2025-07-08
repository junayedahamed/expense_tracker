import 'package:hive_flutter/adapters.dart';

import 'all_model.dart';

class AllDataModelAdapter extends TypeAdapter<AllDataModel> {
  @override
  final int typeId = 0;

  @override
  AllDataModel read(BinaryReader reader) {
    return AllDataModel(
      allamount: reader.readDouble(),
      allreason: reader.readString(),
      allcostTime: reader.read() as DateTime, // ✅ FIXED
      allisexpense: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, AllDataModel obj) {
    writer.writeDouble(obj.allamount);
    writer.writeString(obj.allreason);
    writer.write(obj.allcostTime); // ✅ FIXED
    writer.writeBool(obj.allisexpense);
  }
}
