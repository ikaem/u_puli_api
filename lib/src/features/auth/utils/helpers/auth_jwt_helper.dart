import 'package:u_puli_api/src/features/auth/domain/values/auth_jwt_payload_value.dart';
import 'package:u_puli_api/src/features/auth/utils/constants/auth_jwt_constants.dart';
import 'package:u_puli_api/src/features/core/domain/exceptions/jwt_exceptions.dart';
import 'package:u_puli_api/src/wrappers/dart_jsonwebtoken/dart_jsonwebtoken_wrapper.dart';

class AuthJWTHelper {
  const AuthJWTHelper({
    required DartJsonwebtokenWrapper dartJsonwebtokenWrapper,
  }) : _dartJsonwebtokenWrapper = dartJsonwebtokenWrapper;

  final DartJsonwebtokenWrapper _dartJsonwebtokenWrapper;

  String generateAccessJWT({required int authId}) {
    final Map<String, dynamic> payload = _generatePayload(authId: authId);

    final String token = _dartJsonwebtokenWrapper.sign(
      payload: payload,
      expiresIn: AuthJwtDurationConstants.ACCESS_JWT_DURATION.value,
      isAccessToken: true,
    );

    return token;
  }

  String generateRefreshJWT({required int authId}) {
    final Map<String, dynamic> payload = _generatePayload(authId: authId);

    final String token = _dartJsonwebtokenWrapper.sign(
      payload: payload,
      expiresIn: AuthJwtDurationConstants.REFRESH_JWT_DURATION.value,
      isAccessToken: false,
    );

    return token;
  }

  Map<String, dynamic> _generatePayload({required int authId}) {
    final Map<String, dynamic> payload = {
      AuthJwtPayloadKeysConstants.AUTH_ID.value: authId,
    };

    return payload;
  }

  AuthJwtPayloadValue verifyAccessJwt(String token) {
    final AuthJwtPayloadValue authJwtPayloadValue = _verifyJwt(
      token: token,
      isAccessToken: true,
    );

    return authJwtPayloadValue;
  }

  AuthJwtPayloadValue verifyRefreshJwt(String token) {
    final AuthJwtPayloadValue authJwtPayloadValue = _verifyJwt(
      token: token,
      isAccessToken: false,
    );

    return authJwtPayloadValue;
  }

  AuthJwtPayloadValue _verifyJwt({
    required String token,
    required bool isAccessToken,
  }) {
    try {
      final Map<String, dynamic> payload = _dartJsonwebtokenWrapper
          .verify<Map<String, dynamic>>(
            token: token,
            isAccessToken: isAccessToken,
          );

      final int? authId =
          payload[AuthJwtPayloadKeysConstants.AUTH_ID.value] as int?;

      if (authId == null) {
        return AuthJwtPayloadMissingDataValue();
      }

      final AuthJwtPayloadValue authJwtPayloadValue = AuthJwtPayloadValidValue(
        authId: authId,
      );
      return authJwtPayloadValue;
    } on JwtInvalidException {
      return AuthJwtPayloadInvalidValue();
    } on JwtExpiredException {
      return AuthJwtPayloadExpiredValue();
    } catch (_) {
      return AuthJwtPayloadInvalidValue();
    }
  }

  // extract commong logic from verifyAccessJWT and verifyRefreshJWT
  // AuthJwtPayloadValue? _verifyJWT({
  //   required String token,
  //   required bool isAccessToken,
  // }) {
  //   final Map<String, dynamic> payload = _dartJsonwebtokenWrapper
  //       .verify<Map<String, dynamic>>(
  //         token: token,
  //         isAccessToken: isAccessToken,
  //       );

  //   final int? authId =
  //       payload[AuthJwtPayloadKeysConstants.AUTH_ID.value] as int?;

  //   if (authId == null) {
  //     return null;
  //   }

  //   final AuthJwtPayloadValue authJwtPayloadValue = AuthJwtPayloadValue(
  //     authId: authId,
  //   );
  //   return authJwtPayloadValue;
  // }
}
