import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_test/presentation/bloc/shopping_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBloc, ShoppingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Shopping",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w800),
            ),
            leading: const Icon(Icons.menu, color: Colors.black, size: 35),
            actions: const [
              Icon(CupertinoIcons.search, color: Colors.black, size: 35),
              SizedBox(width: 25),
              Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
                size: 35,
              ),
              SizedBox(width: 25),
            ],
          ),
          body: ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                height: 90,
                margin: const EdgeInsets.fromLTRB(10, 15, 10, 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Image.asset(
                    state.items[index].image,
                    width: 80,
                    height: 80,
                  ),
                  title: Text(state.items[index].title),
                  subtitle: Text(state.items[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context
                              .read<ShoppingBloc>()
                              .add(RemoveItem(item: state.items[index]));
                        },
                        icon: const Icon(CupertinoIcons.delete,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[900],
            onPressed: () {
              context
                  .read<ShoppingBloc>()
                  .add(RefreshItem(item: state.items[0]));
            },
            child: const Icon(CupertinoIcons.refresh_circled,
                color: Colors.white, size: 30),
          ),
        );
      },
    );
  }
}
