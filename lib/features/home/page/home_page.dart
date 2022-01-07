import 'package:cantwait28/features/home/cubit/home_cubit.dart';
import 'package:cantwait28/features/home/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Can\'t Wait 🤩'),
      ),
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..start(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            children: [
              for (final itemModel in state.items)
                _ListViewItem(
                  itemModel: itemModel,
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.black12,
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(
                image: NetworkImage(
                  itemModel.imageURL,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        itemModel.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(itemModel.releaseDate),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      '${itemModel.daysLeft}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('days left'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
