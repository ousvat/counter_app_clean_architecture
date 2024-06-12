import 'package:counter_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CounterRepository {
  Future<Either<Failure, int>> getCounter();

  Future<Either<Failure, void>> setCounter(int counter);
}
