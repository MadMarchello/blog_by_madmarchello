import 'dart:io';

import 'package:blog_by_madmarchello/authenticator.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _onPost(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _onPost(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final login = body['login'] as String?;
  final password = body['password'] as String?;

  if (login == null || password == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: {
        'code': HttpStatus.badRequest,
        'message': 'Missing login or password',
      },
    );
  }

  final _authenticator = context.read<Authenticator>();


  final user =
      _authenticator.findByloginAndPassword(login: login, password: password);

  if (user == null) {
    return Response.json(statusCode: HttpStatus.unauthorized, body: {'message': 'Invalid login or password'});
  }

  return Response.json(body: {'token': user.login});
}
