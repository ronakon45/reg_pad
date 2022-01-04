import 'dart:convert';

AuthFromApi authFromApiFromJson(String str) =>
    AuthFromApi.fromJson(json.decode(str));

String authFromApiToJson(AuthFromApi data) => json.encode(data.toJson());

class AuthFromApi {
  AuthFromApi({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.oAuth2SessionId,
  });

  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;
  String? oAuth2SessionId;

  factory AuthFromApi.fromJson(Map<String, dynamic> json) => AuthFromApi(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        refreshToken:
            json["refresh_token"] == null ? null : json["refresh_token"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        scope: json["scope"] == null ? null : json["scope"],
        oAuth2SessionId: json["OAuth2.SESSION_ID"] == null
            ? null
            : json["OAuth2.SESSION_ID"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "refresh_token": refreshToken == null ? null : refreshToken,
        "expires_in": expiresIn == null ? null : expiresIn,
        "scope": scope == null ? null : scope,
        "OAuth2.SESSION_ID": oAuth2SessionId == null ? null : oAuth2SessionId,
      };
}
