import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'status-change.g.dart';

@JsonSerializable(explicitToJson: true)
class StatusChange{
  String oldState;
  String newState;
  String timestamp;
  String uid;
  StatusChange({this.oldState, this.newState, this.timestamp, this.uid});
  /*
  StatusChange.fromJson(Map<String, dynamic> json)
  : oldState = json['oldState'],
    newState = json['newState'],
    timestamp = json['timestamp'],
    uid = json['uid'];

  Map toJson() => {
    'oldState': oldState,
    'newState': newState,
    'timeStamp':timestamp,
    'uid':uid
  };

   */

  factory StatusChange.fromJson(Map<String, dynamic> json) => _$StatusChangeFromJson(json);
  Map<String, dynamic> toJson() => _$StatusChangeToJson(this);

}