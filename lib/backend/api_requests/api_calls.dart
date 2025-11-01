import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Auth Group Code

class AuthGroup {
  static String getBaseUrl() =>
      'https://x8ki-letl-twmt.n7.xano.io/api:GHVIBqEY/auth';
  static Map<String, String> headers = {};
  static SignupCall signupCall = SignupCall();
  static LoginCall loginCall = LoginCall();
  static ResetpasswordCall resetpasswordCall = ResetpasswordCall();
}

class SignupCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? address = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'signup',
      apiUrl: '${baseUrl}/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'email': email,
        'password': password,
        'address': address,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user''',
      ));
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
  int? user(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user''',
      ));
}

class ResetpasswordCall {
  Future<ApiCallResponse> call({
    String? newPassword = '',
    String? token = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'resetpassword',
      apiUrl: '${baseUrl}/reset-password',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'new_password': newPassword,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Auth Group Code

/// Start Businesses Group Code

class BusinessesGroup {
  static String getBaseUrl() =>
      'https://x8ki-letl-twmt.n7.xano.io/api:VLmcAHqb/businesses';
  static Map<String, String> headers = {};
  static CreateCall createCall = CreateCall();
  static DeleteCall deleteCall = DeleteCall();
  static DetailCall detailCall = DetailCall();
  static IndustryListCall industryListCall = IndustryListCall();
  static ListCall listCall = ListCall();
  static PromotedListCall promotedListCall = PromotedListCall();
  static UpdateCall updateCall = UpdateCall();
}

class CreateCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? usersId,
    String? businessAddress = '',
    String? photo = '',
    bool? isPromoted,
    bool? proFamily,
    bool? sundays,
    bool? proLife,
    bool? proChurch,
    bool? proCharity,
    String? industry = '',
  }) async {
    final baseUrl = BusinessesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'create',
      apiUrl: '${baseUrl}/create',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'users_id': usersId,
        'industry': industry,
        'business_address': businessAddress,
        'photo': photo,
        'is_promoted': photo,
        'pro_family': proFamily,
        'sundays': sundays,
        'pro_life': proLife,
        'pro_church': proChurch,
        'pro_charity': proCharity,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteCall {
  Future<ApiCallResponse> call({
    int? businessId,
  }) async {
    final baseUrl = BusinessesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete',
      apiUrl: '${baseUrl}/delete/${businessId}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'business_id': businessId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DetailCall {
  Future<ApiCallResponse> call({
    String? businessId = '',
  }) async {
    final baseUrl = BusinessesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'detail',
      apiUrl: '${baseUrl}/detail/${businessId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'business_id': businessId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? industry(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.industry''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.business_address''',
      ));
  bool? promoted(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_promoted''',
      ));
  bool? profamily(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.pro_family''',
      ));
  bool? sundays(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.sundays''',
      ));
  bool? prolife(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.pro_life''',
      ));
  bool? prochurch(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.pro_church''',
      ));
  bool? procharity(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.pro_charity''',
      ));
  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photo.url''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  String? contact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contact''',
      ));
  String? website(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.website''',
      ));
  bool? isWebsite(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_website''',
      ));
  String? coverphoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.coverphoto.url''',
      ));
}

class IndustryListCall {
  Future<ApiCallResponse> call({
    String? industry = '',
  }) async {
    final baseUrl = BusinessesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'industry list',
      apiUrl: '${baseUrl}/list/industry',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'industry': industry,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? industry(dynamic response) => (getJsonField(
        response,
        r'''$[:].industry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$[:].business_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? photo(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? businessId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? coverphoto(dynamic response) => (getJsonField(
        response,
        r'''$[:].coverphoto.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ListCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BusinessesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'list',
      apiUrl: '${baseUrl}/list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? coverphoto(dynamic response) => (getJsonField(
        response,
        r'''$.businesses[:].coverphoto.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PromotedListCall {
  Future<ApiCallResponse> call({
    bool? isPromoted,
  }) async {
    final baseUrl = BusinessesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'promoted list',
      apiUrl: '${baseUrl}/list/promoted',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'is_promoted': isPromoted,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.filtered[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? industry(dynamic response) => (getJsonField(
        response,
        r'''$.filtered[:].industry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.filtered[:].business_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? filtered(dynamic response) => getJsonField(
        response,
        r'''$.filtered''',
        true,
      ) as List?;
  List<String>? photo(dynamic response) => (getJsonField(
        response,
        r'''$.filtered[:].photo.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? businessId(dynamic response) => (getJsonField(
        response,
        r'''$.filtered[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? coverphoto(dynamic response) => (getJsonField(
        response,
        r'''$.filtered[:].coverphoto.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UpdateCall {
  Future<ApiCallResponse> call({
    int? businessId,
    String? name = '',
    String? usersId = '',
    String? industry = '',
    String? businessAddress = '',
    String? photo = '',
    bool? isPromoted,
    bool? proFamily,
    bool? proLife,
    bool? sundays,
    bool? proChurch,
    bool? proCharity,
    String? description = '',
    String? coverphoto = '',
  }) async {
    final baseUrl = BusinessesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'update',
      apiUrl: '${baseUrl}/update/${businessId}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {
        'business_id': businessId,
        'name': name,
        'users_id': usersId,
        'industry': industry,
        'business_address': businessAddress,
        'photo': photo,
        'is_promoted': isPromoted,
        'pro_family': proFamily,
        'sunday': sundays,
        'pro_life': proLife,
        'pro_church': proChurch,
        'pro_charity': proCharity,
        'description': description,
        'coverphoto': coverphoto,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Businesses Group Code

/// Start Blacklist Group Code

class BlacklistGroup {
  static String getBaseUrl() =>
      'https://x8ki-letl-twmt.n7.xano.io/api:-bfDPiDl/blacklist';
  static Map<String, String> headers = {};
  static StatusCall statusCall = StatusCall();
  static BlacklistDetailCall blacklistDetailCall = BlacklistDetailCall();
  static BlacklistListCall blacklistListCall = BlacklistListCall();
  static NominateCall nominateCall = NominateCall();
  static VoteCall voteCall = VoteCall();
}

class StatusCall {
  Future<ApiCallResponse> call({
    String? status = 'approved',
  }) async {
    final baseUrl = BlacklistGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'status',
      apiUrl: '${baseUrl}/list/status',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'status': status,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? blacklistname(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? justification(dynamic response) => (getJsonField(
        response,
        r'''$[:].justification''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? businessId(dynamic response) => (getJsonField(
        response,
        r'''$[:].businesses_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? blacklistJSON(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<String>? photo(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? blacklistId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class BlacklistDetailCall {
  Future<ApiCallResponse> call({
    int? blacklistId,
  }) async {
    final baseUrl = BlacklistGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'blacklist detail',
      apiUrl: '${baseUrl}/detail/${blacklistId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'blacklist_id': blacklistId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? businessId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.businesses_id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? justification(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.justification''',
      ));
  int? userid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.users_id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? createdAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photo.url''',
      ));
}

class BlacklistListCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BlacklistGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'blacklist list',
      apiUrl: '${baseUrl}/list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NominateCall {
  Future<ApiCallResponse> call({
    int? businessesId,
    String? justification = '',
    int? usersId,
    String? voteType = '',
    String? status = '',
  }) async {
    final baseUrl = BlacklistGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'nominate',
      apiUrl: '${baseUrl}/nominate',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'businesses_id': businessesId,
        'justification': justification,
        'users_id': usersId,
        'vote_type': voteType,
        'status': status,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VoteCall {
  Future<ApiCallResponse> call({
    int? blacklistId,
    String? usersId = '',
    String? voteType = '',
  }) async {
    final baseUrl = BlacklistGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'vote',
      apiUrl: '${baseUrl}/vote',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'blacklist_id': blacklistId,
        'users_id': usersId,
        'vote_type': voteType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Blacklist Group Code

/// Start My Business Group Code

class MyBusinessGroup {
  static String getBaseUrl() =>
      'https://x8ki-letl-twmt.n7.xano.io/api:StWBJaVY/user';
  static Map<String, String> headers = {};
  static MybusinessesCall mybusinessesCall = MybusinessesCall();
}

class MybusinessesCall {
  Future<ApiCallResponse> call({
    String? usersId = '',
    bool? isPromoted,
  }) async {
    final baseUrl = MyBusinessGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'mybusinesses',
      apiUrl: '${baseUrl}/my-businesses',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'users_id': usersId,
        'is_promoted': isPromoted,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? promoted(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_promoted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? profamily(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_family''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? sundays(dynamic response) => (getJsonField(
        response,
        r'''$[:].sundays''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? prolife(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_life''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? prochurch(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_church''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? procharity(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_charity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? photo(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$[:].business_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? industry(dynamic response) => (getJsonField(
        response,
        r'''$[:].industry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? businessId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? coverphoto(dynamic response) => (getJsonField(
        response,
        r'''$[:].coverphoto.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End My Business Group Code

/// Start Users Group Code

class UsersGroup {
  static String getBaseUrl() =>
      'https://x8ki-letl-twmt.n7.xano.io/api:zPDe2Nbe/users';
  static Map<String, String> headers = {};
  static UserProfileCall userProfileCall = UserProfileCall();
  static EditUserProfileCall editUserProfileCall = EditUserProfileCall();
}

class UserProfileCall {
  Future<ApiCallResponse> call({
    String? usersId = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'user profile',
      apiUrl: '${baseUrl}/${usersId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'users_id': usersId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address''',
      ));
  bool? creed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.creed''',
      ));
  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile_image.url''',
      ));
  String? creedphoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.creedimage.url''',
      ));
  String? noncreedphoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.noncreedimage.url''',
      ));
  String? coverphoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.coverPhoto.url''',
      ));
}

class EditUserProfileCall {
  Future<ApiCallResponse> call({
    String? usersId = '',
    String? name = '',
    String? email = '',
    String? profileImage = '',
    String? address = '',
    bool? creed,
    String? coverPhoto = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'edit user profile',
      apiUrl: '${baseUrl}/${usersId}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {
        'users_id': usersId,
        'name': name,
        'email': email,
        'profile_image': profileImage,
        'address': address,
        'creed': creed,
        'coverPhoto': coverPhoto,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? creed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.creed''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
}

/// End Users Group Code

class SearchbusinessCall {
  static Future<ApiCallResponse> call({
    String? searchQuery = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchbusiness',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:zr7n3EEi/search/businesses',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'search_query': searchQuery,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? businessid(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? userId(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? industry(dynamic response) => (getJsonField(
        response,
        r'''$[:].industry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$[:].business_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? promoted(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_promoted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? profamily(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_family''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? sundays(dynamic response) => (getJsonField(
        response,
        r'''$[:].sundays''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? prolife(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_life''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? prochurch(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_church''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? coverphoto(dynamic response) => (getJsonField(
        response,
        r'''$[:].coverphoto.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? profilephoto(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? iswebsite(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_website''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? websiteurl(dynamic response) => (getJsonField(
        response,
        r'''$[:].website''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contact(dynamic response) => (getJsonField(
        response,
        r'''$[:].contact''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? charity(dynamic response) => (getJsonField(
        response,
        r'''$[:].pro_charity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
