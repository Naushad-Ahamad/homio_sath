
class AppConfig{

  // TODO : BASE URL
  // static String BASE_URL="https://hica.eighteenpixels.in/api/v2/";
  static String BASE_URL="https://homoeosathi.dreamitsolution.org/api/";


  //TODO : APIs END POINTs

  static String getPatientList=BASE_URL+"PatientManagement/GetPatientsByDoctorId?DoctorId=";
  static String loginAPI=BASE_URL+"User/Login";
  static String logoutAPI=BASE_URL+"User/Login";
  static String getBillingList=BASE_URL+"BillingManagement/GetBillById";
  static String getStockList=BASE_URL+"StockManagement/GetStockByDoctorId?DoctorId=";
  static String getSaveStockList=BASE_URL+"StockManagement/SaveMedicineStock";
  static String getPatient=BASE_URL+"PatientManagement/CreatePatient";


  static String homeSectionApi=BASE_URL+"homeSections";
  static String topRatedApi=BASE_URL+"homeSections/topRatedInstitutes";
  static String topDesignInstitutesApi=BASE_URL+"homeSections/topDesignInstitutes";
  static String categoryListingApi=BASE_URL+"categories";
  static String topFootballApi=BASE_URL+"homeSections/topFootballInstitutes";
  static String topDanceAPI=BASE_URL+"homeSections/topDanceInstitutes";
  static String sliderAPI=BASE_URL+"homeSections/sliders";
  static String topTutorAPI=BASE_URL+"homeSections/topPrivateTutor";
  static String loginAPI2=BASE_URL+"auth/login";
  static String registrationAPI=BASE_URL+"auth/signup";
  static String serachAPI=BASE_URL+"search";
  static String recentlyVisitedAPI=BASE_URL+"services/recently_visited/";
  static String savedSearchAPI=BASE_URL+"services/saved_services/";
  static String productDetailAPI=BASE_URL+"services/";
  static String favoriteListAPI=BASE_URL+"services/favorites/";
  static String addToFavAPI=BASE_URL+"services/add_to_favorite";
  static String removeFromFavAPI=BASE_URL+"services/remove_from_favorite";

  static String ListingApi=BASE_URL+"categories";

}