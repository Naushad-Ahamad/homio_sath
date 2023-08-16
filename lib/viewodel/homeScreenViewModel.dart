import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hica_app/model/home/homeScreenResponse.dart';
import 'package:hica_app/model/home/recentlyVisitedResponse.dart';
import 'package:hica_app/model/home/savedSearchResponse.dart';
import 'package:hica_app/model/home/topDanceResponse.dart';
import 'package:hica_app/model/home/topFootballResponse.dart';
import '../data/response/api_response.dart';
import '../model/home/sliderResponse.dart';
import '../model/home/topDesignInstituteResponse.dart';
import '../model/home/topRatedInstituteResponse.dart';
import '../model/home/topTutorResponse.dart';
import '../repository/homeRepository.dart';

class HomeViewModel extends ChangeNotifier{
  final myRepo=HomeRepository();
  ApiResponse<HomeScreenResponse> model=ApiResponse.loading();
  ApiResponse<TopRatedInstituteResponse> topRatedResponse=ApiResponse.loading();
  ApiResponse<RecentlyVisitedResponse> recentlyViews=ApiResponse.loading();
  ApiResponse<SavedSearchResponse> savedResponse=ApiResponse.loading();
  ApiResponse<TopTutorResponse> topTutorResponse=ApiResponse.loading();
  ApiResponse<TopDesignInstituteResponse> topDesignInstituteResponse=ApiResponse.loading();
  ApiResponse<TopFootballResponse> topFootballResponse=ApiResponse.loading();
  ApiResponse<TopDanceResponse> topDanceResponse=ApiResponse.loading();
  ApiResponse<SliderResponse> sliderResponse=ApiResponse.loading();
  setHomeData( ApiResponse<HomeScreenResponse> response){
    model=response;
    notifyListeners();
  }
  setTopRatedInstituteData( ApiResponse<TopRatedInstituteResponse> topResponse){
    topRatedResponse=topResponse;
    notifyListeners();
  }
  Future<void > getHomeDataAPI() async{
    setHomeData(ApiResponse.loading());
    myRepo.homeSectionAPI().then((value) => {
      getRecentViewData(),
      setHomeData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getRecentViewData(),
      setHomeData(ApiResponse.error(error.toString()))
    });
  }
  setRecentlyViewdData( ApiResponse<RecentlyVisitedResponse> rec){
    recentlyViews=rec;
    notifyListeners();
  }
  Future<void > getRecentViewData() async{
    setRecentlyViewdData(ApiResponse.loading());
    myRepo.getRecAPI().then((value) => {
      getSavedSearch(),
      setRecentlyViewdData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getSavedSearch(),
      setRecentlyViewdData(ApiResponse.error(error.toString()))
    });
  }
  setSavedSearchdData( ApiResponse<SavedSearchResponse> saved){
    savedResponse=saved;
    notifyListeners();
  }
  Future<void > getSavedSearch() async{
    setSavedSearchdData(ApiResponse.loading());
    myRepo.getSaved().then((value) => {
      getTopDataAPI(),
      setSavedSearchdData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getTopDataAPI(),
      setSavedSearchdData(ApiResponse.error(error.toString()))
    });
  }
  Future<void > getTopDataAPI() async{
    setTopRatedInstituteData(ApiResponse.loading());
    myRepo.topRatedAPI().then((value) => {
      getTopDesignDataAPI(),
      setTopRatedInstituteData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getTopDesignDataAPI(),
      setTopRatedInstituteData(ApiResponse.error(error.toString()))
    });
  }
  setTopDesignInstituteData( ApiResponse<TopDesignInstituteResponse> topDesignResponse){
    topDesignInstituteResponse=topDesignResponse;
    notifyListeners();
  }

  Future<void > getTopDesignDataAPI() async{
    setTopDesignInstituteData(ApiResponse.loading());
    myRepo.topDesignAPI().then((value) => {
      getTopFootballData(),
      setTopDesignInstituteData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getTopFootballData(),
      setTopDesignInstituteData(ApiResponse.error(error.toString()))
    });
  }
  setTopFootballData( ApiResponse<TopFootballResponse> topFootballData){
    topFootballResponse=topFootballData;
notifyListeners();
  }

  Future<void > getTopFootballData() async{
    setTopFootballData(ApiResponse.loading());
    myRepo.topFootballAPI().then((value) => {
      getTopDanceData(),
      setTopFootballData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getTopDanceData(),
      setTopFootballData(ApiResponse.error(error.toString()))
    });
  }

  setTopDanceData( ApiResponse<TopDanceResponse> topDanceData){
    topDanceResponse=topDanceData;
    notifyListeners();
  }
  Future<void > getTopDanceData() async{
    setTopDanceData(ApiResponse.loading());
    myRepo.getTopDanceData().then((value) => {
      getSliderData(),
      setTopDanceData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getSliderData(),
      setTopDanceData(ApiResponse.error(error.toString()))
    });
  }

  //TODO : SLIDER DATA API
  setSliderData( ApiResponse<SliderResponse> slider){
    sliderResponse=slider;
    notifyListeners();
  }

  Future<void > getSliderData() async{
    setSliderData(ApiResponse.loading());
    myRepo.getSlider().then((value) => {
      getTopTutorData(),
      setSliderData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      getTopTutorData(),
      setSliderData(ApiResponse.error(error.toString()))
    });
  }
  //TODO : SLIDER DATA API
  setTutorData( ApiResponse<TopTutorResponse> top){
    topTutorResponse=top;
    notifyListeners();
  }

  Future<void > getTopTutorData() async{
    setTutorData(ApiResponse.loading());
    myRepo.getTutor().then((value) => {
      setTutorData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      setTutorData(ApiResponse.error(error.toString()))
    });
  }
}