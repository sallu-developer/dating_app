import 'package:dating_app/data/datasources/user_remote_data_source.dart';
import 'package:dating_app/domain/entities/user_entity.dart';
import 'package:dating_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UserEntity>> getUsers() async {
    return await remoteDataSource.getUsers();
  }
}
