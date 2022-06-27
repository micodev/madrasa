///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class StageModel {
  String? id;
  String? name;
  int? fee;
  String? schoolId;
  String? createdAt;
  String? updatedAt;

  StageModel({
    this.id,
    this.name,
    this.fee,
    this.schoolId,
    this.createdAt,
    this.updatedAt,
  });
  StageModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    fee = json['fee']?.toInt();
    schoolId = json['school_id']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['fee'] = fee;
    data['school_id'] = schoolId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
