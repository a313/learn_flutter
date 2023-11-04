// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'activity.freezed.dart';
part 'activity.g.dart';

List<Activity> activityFromJson(String str) => List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

String activityToJson(List<Activity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Activity with _$Activity {
    const factory Activity({
        int? activitySeqNo,
        int? activityNo,
        int? relActivityNo,
        String? activityNm1,
        String? activityNm2,
        String? activityCategory,
        String? activityStatus,
        String? activityModule,
        DateTime? activityStartDate,
        DateTime? activityEndDate,
        DateTime? activityFinalRegDate,
        DateTime? activityFinalCancelDate,
        String? activityStartTime,
        String? activityEndTime,
        int? activityMaxAttendents,
        int? activityMinAttendents,
        int? activityHours,
        int? activityPoints,
        int? activityOrganizer,
        int? activityLocation,
        dynamic activityLocationNm,
        int? activityContact,
        dynamic activityContactNm,
        dynamic activityContactEmail,
        int? activityInt1,
        int? activityInt2,
        bool? chkActivityPublishWeb,
        bool? chkOpt1,
        bool? chkOpt2,
        dynamic activityDate1,
        dynamic activityDate2,
        String? activityArticleNo,
        int? activityPrice,
        int? activityAccountGr1,
        int? activityAccountGr2,
        int? activityAccountGr3,
        String? activityNote,
        String? activityChBy,
        DateTime? activityChDt,
        String? activityCrBy,
        DateTime? activityCrDt,
        String? activityWebNote,
        dynamic activityDiplomaText,
        int? orderSeqNo,
        String? activitySal,
        int? activityActRel1,
        bool? activityOptBit3,
        bool? activityOptBit4,
        bool? activityOptBit5,
        bool? activityOptBit6,
        bool? activityOptBit7,
        dynamic activityOptDate3,
        dynamic activityOptDate4,
        String? activityOptChar1,
        String? activityWebNoteExtended,
        dynamic activityUrl,
        String? activityToken,
        bool? openForAll,
        bool? multiRegister,
        bool? multiRegisterGrouped,
        int? multiRegisterMin,
        int? multiRegisterMax,
        String? emailConfirmation,
        String? locationNm,
        dynamic hasPayment,
        bool? keepImgRatio,
        bool? registerPersonContact,
        bool? promoted,
        bool? requireLogin,
        bool? companyActivity,
        dynamic img,
        bool? multipleOptions,
        dynamic children,
    }) = _Activity;

    factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

  static List<Activity> getList(List data) {

    return data.map((e) => Activity.fromJson(e)).toList();

  } 
}
