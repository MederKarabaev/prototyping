// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prototyping/models/photo_model.dart';
import 'package:prototyping/models/post_model.dart';
import 'package:prototyping/models/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    {
      fetchPhotos();
    }
  }
  List<PhotoModel> listPhotos = [];
  List<UserModel> listUsers = [];
  List<PostModel> listPosts = [];
  Future<void> fetchPhotos() async {
    emit(HomeLoading());
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> photoJsonList = json.decode(response.body);
        final List<PhotoModel> photos = photoJsonList
            .map((photoJson) => PhotoModel.fromJson(photoJson))
            .toList();
        listPhotos = photos;
        await fetchUsers();
        await fetchPosts();
        emit(HomeLoaded());
      } else {
        emit(HomeError(error: 'Failed to load photos'));
      }
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }

  Future<void> fetchUsers() async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> userJsonList = json.decode(response.body);
        final List<UserModel> users = userJsonList
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
        listUsers = users;
      } else {}
    } catch (e) {}
  }

  Future<void> fetchPosts() async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> postJsonList = json.decode(response.body);
        final List<PostModel> posts =
            postJsonList.map((json) => PostModel.fromJson(json)).toList();
        listPosts = posts;
      } else {}
    } catch (e) {}
  }
}
