part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
    @override
  List<Object> get props => [];
}

// initial state when we load the app
class CryptoEmpty extends CryptoState {}


// Fetching coins from our api
class CryptoLoading extends CryptoState {}


// Retrieved coins
class CryptoLoaded extends CryptoState {
  final List<Coin> coins;

  const CryptoLoaded({this.coins});

  @override
  List<Object> get props => [coins];

  @override
  String toString() => 'CryptoLoaded { coins: $coins }';
  
}


// if we have error when calling api request
class CryptoError extends CryptoState {}