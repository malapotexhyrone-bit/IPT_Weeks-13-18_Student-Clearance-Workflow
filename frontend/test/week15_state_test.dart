import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_clearance_frontend/api/clearance_api.dart';
import 'package:student_clearance_frontend/models/session.dart';
import 'package:student_clearance_frontend/screens/admin_dashboard.dart';
import 'package:student_clearance_frontend/screens/office_dashboard.dart';
import 'package:student_clearance_frontend/screens/student_dashboard.dart';

void main() {
  testWidgets('student dashboard exposes loading then empty initiation state', (
    tester,
  ) async {
    final pending = Completer<Map<String, dynamic>?>();
    final api = ScenarioClearanceApi(
      currentClearanceHandler: (_) => pending.future,
    );

    await _pumpDashboard(
      tester,
      StudentDashboard(
        api: api,
        session: _session('student'),
        onSignOut: () {},
      ),
    );

    expect(find.bySemanticsLabel('Loading clearance data'), findsOneWidget);

    pending.complete(null);
    await tester.pumpAndSettle();

    expect(find.text('Start this term'), findsOneWidget);
    expect(find.text('Start clearance'), findsOneWidget);
  });

  testWidgets('office dashboard exposes an empty assigned queue', (
    tester,
  ) async {
    await _pumpDashboard(
      tester,
      OfficeDashboard(
        api: ScenarioClearanceApi(),
        session: _session('office'),
        onSignOut: () {},
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Library review queue'), findsOneWidget);
    expect(find.text('No assigned tasks'), findsOneWidget);
    expect(
      find.text('This office has no student clearance task to review.'),
      findsOneWidget,
    );
  });

  testWidgets('forbidden office response offers a safe role exit', (
    tester,
  ) async {
    var signedOut = false;
    final api = ScenarioClearanceApi(
      officeTasksHandler: (_) async => throw const ApiException(
        statusCode: 403,
        code: 'FORBIDDEN',
        message: 'This task belongs to a different clearing office.',
        correlationId: '01W15FORBIDDEN0000000000000',
      ),
    );

    await _pumpDashboard(
      tester,
      OfficeDashboard(
        api: api,
        session: _session('office'),
        onSignOut: () => signedOut = true,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Access not permitted'), findsOneWidget);
    expect(
      find.text('This task belongs to a different clearing office.'),
      findsOneWidget,
    );
    expect(find.text('Reference: 01W15FORBIDDEN0000000000000'), findsOneWidget);

    await tester.tap(find.text('Change role'));
    expect(signedOut, isTrue);
  });

  testWidgets('not-found response remains correlated and hides internals', (
    tester,
  ) async {
    final api = ScenarioClearanceApi(
      currentClearanceHandler: (_) async => throw const ApiException(
        statusCode: 404,
        code: 'RESOURCE_NOT_FOUND',
        message: 'The requested resource was not found.',
        correlationId: '01W15NOTFOUND00000000000000',
      ),
    );

    await _pumpDashboard(
      tester,
      StudentDashboard(
        api: api,
        session: _session('student'),
        onSignOut: () {},
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Unable to load this view'), findsOneWidget);
    expect(find.text('The requested resource was not found.'), findsOneWidget);
    expect(find.text('Reference: 01W15NOTFOUND00000000000000'), findsOneWidget);
    expect(find.textContaining('App\\Models'), findsNothing);
  });

  testWidgets('network failure recovers after the user retries', (
    tester,
  ) async {
    var calls = 0;
    final api = ScenarioClearanceApi(
      currentClearanceHandler: (_) async {
        calls++;
        if (calls == 1) {
          throw const ApiException(
            statusCode: 0,
            code: 'NETWORK_UNAVAILABLE',
            message: 'The trusted local HTTPS API could not be reached.',
          );
        }
        return null;
      },
    );

    await _pumpDashboard(
      tester,
      StudentDashboard(
        api: api,
        session: _session('student'),
        onSignOut: () {},
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Unable to load this view'), findsOneWidget);
    expect(
      find.text('The trusted local HTTPS API could not be reached.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();

    expect(calls, 2);
    expect(find.text('Start this term'), findsOneWidget);
    expect(find.text('Unable to load this view'), findsNothing);
  });

  testWidgets('timeout response gives a bounded actionable error', (
    tester,
  ) async {
    final api = ScenarioClearanceApi(
      currentClearanceHandler: (_) async => throw const ApiException(
        statusCode: 504,
        code: 'DEPENDENCY_TIMEOUT',
        message: 'The clearance dependency exceeded its test deadline.',
        correlationId: '01W15TIMEOUT000000000000000',
      ),
    );

    await _pumpDashboard(
      tester,
      StudentDashboard(
        api: api,
        session: _session('student'),
        onSignOut: () {},
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Unable to load this view'), findsOneWidget);
    expect(
      find.text('The clearance dependency exceeded its test deadline.'),
      findsOneWidget,
    );
    expect(find.text('Try again'), findsOneWidget);
  });

  testWidgets('server failure is distinct from an empty admin state', (
    tester,
  ) async {
    final api = ScenarioClearanceApi(
      automationFailuresHandler: (_) async => throw const ApiException(
        statusCode: 500,
        code: 'SERVER_ERROR',
        message: 'Automation failures could not be loaded safely.',
        correlationId: '01W15SERVER0000000000000000',
      ),
    );

    await _pumpDashboard(
      tester,
      AdminDashboard(api: api, session: _session('admin'), onSignOut: () {}),
    );
    await tester.pumpAndSettle();

    expect(find.text('Unable to load this view'), findsOneWidget);
    expect(
      find.text('Automation failures could not be loaded safely.'),
      findsOneWidget,
    );
    expect(find.text('No automation failures'), findsNothing);
  });

  testWidgets('administrator empty state does not claim a failure', (
    tester,
  ) async {
    await _pumpDashboard(
      tester,
      AdminDashboard(
        api: ScenarioClearanceApi(),
        session: _session('admin'),
        onSignOut: () {},
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No automation failures'), findsOneWidget);
    expect(find.text('Unable to load this view'), findsNothing);
  });
}

Future<void> _pumpDashboard(WidgetTester tester, Widget dashboard) async {
  tester.view.physicalSize = const Size(1280, 900);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(MaterialApp(home: dashboard));
}

AuthenticatedSession _session(String role) {
  return AuthenticatedSession(
    token: 'controlled-test-token',
    user: AuthenticatedUser(
      id: 1,
      name: role == 'student' ? 'Ari Santos' : 'Morgan Reyes',
      role: role,
      officeCode: role == 'office' ? 'LIBRARY' : null,
      officeName: role == 'office' ? 'Library' : null,
    ),
  );
}

typedef CurrentClearanceHandler = Future<Map<String, dynamic>?> Function(
  String token,
);
typedef ListHandler = Future<List<Map<String, dynamic>>> Function(String token);

class ScenarioClearanceApi implements ClearanceApi {
  ScenarioClearanceApi({
    CurrentClearanceHandler? currentClearanceHandler,
    ListHandler? officeTasksHandler,
    ListHandler? automationFailuresHandler,
  }) : _currentClearanceHandler =
           currentClearanceHandler ?? ((_) async => null),
       _officeTasksHandler = officeTasksHandler ?? ((_) async => const []),
       _automationFailuresHandler =
           automationFailuresHandler ?? ((_) async => const []);

  final CurrentClearanceHandler _currentClearanceHandler;
  final ListHandler _officeTasksHandler;
  final ListHandler _automationFailuresHandler;

  @override
  Future<Map<String, dynamic>?> currentClearance(String token) =>
      _currentClearanceHandler(token);

  @override
  Future<List<Map<String, dynamic>>> officeTasks(String token) =>
      _officeTasksHandler(token);

  @override
  Future<List<Map<String, dynamic>>> automationFailures(String token) =>
      _automationFailuresHandler(token);

  @override
  Future<AuthenticatedSession> login(String email, String password) =>
      throw UnimplementedError();

  @override
  Future<void> logout(String token) async {}

  @override
  Future<Map<String, dynamic>> initiateClearance(
    String token,
    String termCode,
  ) => throw UnimplementedError();

  @override
  Future<void> approveTask(String token, int taskId) async {}

  @override
  Future<void> reportDeficiency(
    String token,
    int taskId,
    String description,
  ) async {}

  @override
  Future<void> resolveDeficiency(
    String token,
    int deficiencyId,
    String note,
  ) async {}

  @override
  Future<void> retryAutomation(String token, int deliveryId) async {}

  @override
  Future<Map<String, dynamic>> sendSecureExchange(
    String token,
    int clearanceId,
  ) => throw UnimplementedError();
}
