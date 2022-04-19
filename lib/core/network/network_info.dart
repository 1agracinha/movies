 
import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetWorkInfo { 
  Future<bool> get isConnected; 
} 
 
class NetworkInfoImp implements NetWorkInfo { 
  final DataConnectionChecker dataConnectionChecker; 
 
  const NetworkInfoImp(this.dataConnectionChecker); 
 
  @override 
  Future<bool> get isConnected => dataConnectionChecker.hasConnection; 
}