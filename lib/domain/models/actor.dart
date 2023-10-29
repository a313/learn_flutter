// To parse this JSON data, do
//
//     final actor = actorFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

Actor actorFromJson(String str) => Actor.fromJson(json.decode(str));

String actorToJson(Actor data) => json.encode(data.toJson());

@freezed
class Actor with _$Actor {
  const factory Actor({
    @JsonKey(name: "seqNo") int? seqNo,
    String? type,
    int? actNo,
    String? nm,
    String? fiNm,
    DateTime? bDt,
    String? pNo,
    String? sex,
    String? orgNo,
    String? ph,
    String? fax,
    String? mobPh,
    String? eMail,
    String? web,
    String? adType,
    dynamic note1,
    dynamic note2,
    DateTime? startDt,
    String? startCd,
    dynamic endDt,
    String? endCd,
    int? payTerm,
    String? accNo,
    int? disc,
    bool? vatCd,
    int? optInt1,
    int? optInt2,
    int? optInt3,
    int? optInt4,
    int? optInt5,
    int? optInt6,
    int? optInt7,
    int? optInt8,
    int? optInt9,
    String? optChar1,
    String? optChar2,
    String? optChar3,
    String? optChar4,
    String? optChar5,
    String? optChar6,
    String? optChar7,
    String? optChar8,
    String? optChar9,
    bool? optBit1,
    bool? optBit2,
    bool? optBit3,
    bool? optBit4,
    bool? optBit5,
    bool? optBit6,
    int? optLng1,
    int? optLng2,
    int? optLng3,
    DateTime? optDate1,
    String? county1,
    String? county2,
    int? actRel1,
    int? actRel2,
    int? actRel3,
    int? actRel4,
    int? actRel5,
    int? actRel6,
    int? actRel7,
    int? actRel8,
    int? actRel9,
    String? inf1,
    String? inf2,
    String? inf3,
    String? webUsr,
    int? webSh,
    String? crBy,
    DateTime? crDt,
    String? chBy,
    DateTime? chDt,
    bool? pNoIsDNo,
    @JsonKey(name: "actPicture") String? avatarBase64,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
