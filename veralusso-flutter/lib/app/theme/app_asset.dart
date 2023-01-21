import '../../gen/assets.gen.dart';

class AppAsset {
  AppAsset._();

  /// Icons

  static var logo = Assets.images.logo.path;
  static var appLogo = Assets.svgs.logo;
  static var appMenu = Assets.svgs.menu;
  static var banner = Assets.images.banner.path;
  static var cart = Assets.icons.cartSvg;
  static var search = Assets.icons.searchSvg;
  static var searchSvg = Assets.svgs.search;
  static var solo = Assets.images.solo.path;
  static var heart = Assets.icons.heartSvg;
  static var filter = Assets.icons.filter;
  static var rightArrow = Assets.icons.rightArrow.path;
  static var downArrow = Assets.icons.downArrow.path;
  static var userProfile = Assets.icons.userProfile.path;
  static var cart1 = Assets.icons.cartPng.path;
  static var search1 = Assets.icons.searchPng.path;
  static var menu = Assets.icons.menuPng.path;
  static var leftArrow = Assets.icons.leftArrow.path;
  static var rightArrow1 = Assets.icons.rightArrow1.path;
  static var question = Assets.icons.question.path;
  static var home = Assets.icons.home.path;
  static var tag = Assets.icons.tag.path;
  static var heart1 = Assets.icons.heartPng.path;
  static var chekIcon = Assets.icons.check.path;
  static var unCheckicon = Assets.icons.uncheck.path;
  static var sortIcon = Assets.icons.sort.path;

  static var homeNav = Assets.svgs.homeIcon;
  static var tagNav = Assets.svgs.tagIcon;
  static var searchNav = Assets.svgs.searchIcon;
  static var userNav = Assets.svgs.userIcon;
  static var cartNav = Assets.svgs.cartIcon;

  //Vera Lusso Icnon List
  static var user = Assets.icons.user1.path;
  static var veraLussoLogo = Assets.icons.veralussoLogo.path;
  static var shoppingCart = Assets.icons.shoppingCart2.path;
  static var facebookIcon = Assets.icons.facebookIcon.path;
  static var twitterIcon = Assets.icons.twitterIcon.path;
  static var linkedInIcon = Assets.icons.linkedinIcon.path;
  static var drawerIcon = Assets.icons.drawer.path;
  static var searchIcon = Assets.icons.searchPng.path;
  static var heartIcon = Assets.icons.heartPng.path;
  static var bagIcon = Assets.icons.bag.path;
  static var indianflagIcon = Assets.icons.indianFlag.path;

  /// Images
  static var bag = Assets.icons.bag.path;
  static var account = Assets.icons.account.path;
  static var secureShopping = Assets.images.secureShopping.path;
  static var security = Assets.images.security.path;
  static var buyerProtection = Assets.images.buyerProtection.path;
  static var immediateResolution = Assets.images.immediateResolution.path;
  static var masterCard = Assets.images.masterCard.path;
  static var payPalCard = Assets.images.payPalCard.path;
  static var visaCard = Assets.images.visaCard.path;
  static var amexCard = Assets.images.amexCard.path;
  static var discoverCard = Assets.images.discoverCard.path;
  static var charity1 = Assets.images.charity1.path;
  static var charity2 = Assets.images.charity2.path;
  static var charity3 = Assets.images.charity3.path;
  static var shoppingCartPng = Assets.images.shoppingCart.path;
  static var edit = Assets.images.edit.path;
  static var delete2 = Assets.images.delete2.path;
  static var shoppingBasket = Assets.images.shoppingBasket.path;
  static var editIcon = Assets.icons.edit.path;
  static var deleteIcon = Assets.icons.delete.path;
  static var he = Assets.images.he.path;

  ///animations

  static var noInternetAnimation = Assets.animations.noInternet;
  static var nothigToShowAnimation = Assets.animations.nothingToShow;
  static var commingSoonAnimation = Assets.animations.comingSoon;
  static var errorAnimation = Assets.animations.error;

  static var loader = Assets.json.loader;
  static var noData = Assets.json.nodata;

  ///svgs

  static var svgSort = Assets.svgs.sortIcon;
  static var svgFilter = Assets.svgs.filterIcon;
  static var svgAddToCartIcon = Assets.svgs.addToCartIcon;
  static var svgWishListIcon = Assets.svgs.wishListIcon;

  static String getBanner(int index) {
    // for handling out of bounds (only three banners available )
    if (index > 2) index = 2;
    if (index < 0) index = 0;
    var s = 'assets/images/banners/banner${index + 1}.png';
    return s;
  }
}
