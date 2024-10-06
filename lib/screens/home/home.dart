import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pingolearn_assignment/firebase/remote_config.dart';
import 'package:pingolearn_assignment/screens/home/widgets/product_card.dart';
import 'package:pingolearn_assignment/shared/bloc/authentication/authentication_bloc.dart';
import 'package:pingolearn_assignment/shared/bloc/home/home_bloc.dart';
import 'package:pingolearn_assignment/themes/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc homeBloc;
  late final RemoteConfigService remoteConfigService;
  late Future<void> remoteConfigFuture;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    remoteConfigService = RemoteConfigService();
    remoteConfigFuture = _initializeRemoteConfig();
    homeBloc.add(FetchProduct());
  }

  Future<void> _initializeRemoteConfig() async {
    await remoteConfigService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthenticationState>(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          listener: (context, state) {
            if (state is UserLogoutState) {
              context.go('/login');
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants().blueTextColor,
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'e-Shop',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: FutureBuilder<void>(
          future: remoteConfigFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading remote config: ${snapshot.error}'),
              );
            } else {
              return BlocBuilder<HomeBloc, HomeState>(
                bloc: homeBloc,
                builder: (context, state) {
                  if (state is ProductsFetchSuccess) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: state.productData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: state.productData[index],
                          showDiscountedPrice:
                              remoteConfigService.showDiscountedPrice,
                        );
                      },
                    );
                  } else if (state is ProductsFetchFailure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Error loading Products: ${state.message}'),
                          ElevatedButton(
                            onPressed: () {
                              homeBloc.add(FetchProduct());
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
