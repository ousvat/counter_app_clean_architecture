import 'package:counter_app/core/errors/failure.dart';
import 'package:counter_app/core/utils/constants.dart';
import 'package:counter_app/data/datasource/local/shared_preferences/counter_shared_prefs.dart';
import 'package:counter_app/domain/repositories_contracts/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CounterRepository)
class CounterRepoImpl implements CounterRepository {
  final CounterSharedPrefs _counterSharedPrefs;

  CounterRepoImpl(this._counterSharedPrefs);

  @override
  Future<Either<Failure, int>> getCounter() async {
    try {
      return Right(await _counterSharedPrefs.getCounter());
    } on Exception catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setCounter(int counter) async {
    try {
      await _counterSharedPrefs.setCounter(counter);
      return const Right(null);
    } catch (e) {
      return Left(Failure(AppString.setCounterError));
    }
  }
}
