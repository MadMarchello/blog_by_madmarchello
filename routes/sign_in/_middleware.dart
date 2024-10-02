import 'package:blog_by_madmarchello/authenticator.dart';
import 'package:dart_frog/dart_frog.dart';

/// Provides a middleware handler that uses the Authenticator provider.
/// This middleware sets up the Authenticator instance for the request.
Handler middleware(Handler handler) {
  return handler.use(
    provider<Authenticator>(
      (_) => Authenticator(),
    ),
  );
}
