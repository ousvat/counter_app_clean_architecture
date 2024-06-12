import 'package:counter_app/core/errors/failure.dart';
import 'package:counter_app/domain/repositories_contracts/counter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterUsecase {
  final CounterRepository _counterRepository;

  CounterUsecase(this._counterRepository);

  Future<Either<Failure, int>> getCounter() async =>
      _counterRepository.getCounter();

  Future<Either<Failure, void>> setCounter(int counter) async =>
      _counterRepository.setCounter(counter);
}
