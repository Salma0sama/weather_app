import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/initial_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/weather_page.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weather;

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoadinState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccessState) {
          weather = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return WeatherPage(weather: weather);
        } else if (state is WeatherFailureaState) {
          return const Center(
            child: Text(
              'Something wentwrong try again',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return const InitialScreen();
        }
      }),
    );
  }
}
