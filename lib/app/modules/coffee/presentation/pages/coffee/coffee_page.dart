import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import 'cofee_state.dart';
import 'coffee_store.dart';

class CoffePage extends StatefulWidget {
  const CoffePage({Key? key}) : super(key: key);

  @override
  State<CoffePage> createState() => _CoffePageState();
}

class _CoffePageState extends ModularState<CoffePage, CoffeeStore> {
  @override
  void initState() {
    super.initState();
    store.getImage();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<CoffeeStore, Failure, CoffeeState>(
        store: store,
        onState: (context, state) => BodySucess(state: state, store: store),
        onError: (context, error) =>
            BodyFailure(store: store, message: error!.message),
        onLoading: (context) => const BodyLoading());
  }
}

class BodyFailure extends StatelessWidget {
  final String? message;
  final CoffeeStore store;

  const BodyFailure({Key? key, this.message, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message ?? 'Falha ao busucar imagem!'),
            IconButton(
              onPressed: () async => await store.getImage(),
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
      ),
    );
  }
}

class BodyLoading extends StatelessWidget {
  const BodyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Center(child: CircularProgressIndicator())),
    );
  }
}

class BodySucess extends StatelessWidget {
  final CoffeeState state;
  final CoffeeStore store;

  const BodySucess({Key? key, required this.state, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: state.backgroundColor ?? Colors.white,
        body: Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: state.image.image,
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          backgroundColor:
              state.backgroundColor ?? Theme.of(context).primaryColor,
          onPressed: () async => await store.getImage(),
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }
}
