import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late NetworkInfoImp networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImp(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('Should forward the call to DataConnectionChecker.hasConnection',
        () async {
      final tHasConnectionFuture = Future.value(true);

      when(() => mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      final result = networkInfo.isConnected;

      verify(() => mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
