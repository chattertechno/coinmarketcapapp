import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:blockain/models/coin_model.dart';
import 'package:blockain/repositories/crypto_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository _cryptoRepository;

  CryptoBloc({@required CryptoRepository cryptoRepository})
   : assert(cryptoRepository != null), 
   _cryptoRepository = cryptoRepository;


  @override
  CryptoState get initialState => CryptoEmpty();

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is RefreshCoins) {
      yield* _getCoins(coins: []);
    } else if (event is LoadMoreCoins) {
      yield* _mapLoadMoreCoinsToState(event);
    }
  }


  
}
