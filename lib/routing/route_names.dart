import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tribes/pages/discovery_page.dart';
import 'package:tribes/pages/movements_page.dart';
import 'package:tribes/pages/music_page.dart';
import 'package:tribes/pages/tribes_page.dart';
import '../pages/home_page.dart';
import '../pages/unknown_page.dart';

class RouteNames {
  //Lowest level routes
  static const discoverTabRoute = '/home';
  static const tribesTabRoute = '/tribes';
  static const musicTabRoute = '/music';
  static const movementsTabRoute = '/movements';

  //Artist page
  static const artist = '/artist';
  static const tribe = '/tribe';
  static const bio = '/bio';
  static const videoPlayer = '/video_player';

  //Unknown page
  static const notFound = '/404';

  ///These are the list of all allowed pages
  List<String> get availablePages => [
        discoverTabRoute,
        tribesTabRoute,
        musicTabRoute,
        movementsTabRoute,
        artist,
        tribe,
        bio,
        videoPlayer,
      ];

  ///These are the list of pages that require parameters mandatory
  List<String> get mandatoryParameterPages => [artist, tribe, videoPlayer];

  ///These are the list of pages that require parameters which are fetched from their parent pages
  List<String> get parentParameterPages => [bio, videoPlayer];

  Page getPageFromRouteName(String routeName, {String? parameter1, String? parameter2}) {
    switch (routeName) {
      case '/':
      case RouteNames.discoverTabRoute:
        return MaterialPage(
          key: const ValueKey(RouteNames.discoverTabRoute),
          child: HomePage(0, DiscoveryPage()),
        );

      case RouteNames.tribesTabRoute:
        return MaterialPage(
          key: const ValueKey(RouteNames.tribesTabRoute),
          child: HomePage(1, TribesPage()),
        );

      case RouteNames.musicTabRoute:
        return MaterialPage(
          key: const ValueKey(RouteNames.musicTabRoute),
          child: HomePage(2, MusicPage()),
        );

      case RouteNames.movementsTabRoute:
        return MaterialPage(
          key: const ValueKey(RouteNames.movementsTabRoute),
          child: HomePage(3, MovementsPage()),
        );

      // case RouteNames.artist:
      //   return (parameter1 != null)
      //       ? CupertinoPage(
      //           key: ValueKey(routeName),
      //           child: HomePage(0, ArtistDetailsPage(artistId: parameter1)),
      //         )
      //       : UnknownPage();
      //
      // case RouteNamesibe:
      //   return (parameter1 != null)
      //       ? CupertinoPage(
      //           key: ValueKey(routeName),
      //           child: HomePage(0, AboutTribePage(tribeId: parameter1)),
      //         )
      //       : UnknownPage();
      //
      // case RouteNames.bio:
      //   return (parameter1 != null)
      //       ? CupertinoPage(
      //           key: ValueKey(routeName),
      //           child: HomePage(0, ArtistBioPage(artistId: parameter1)),
      //         )
      //       : UnknownPage();

      // case RouteNames.videoPlayer:
      //   final TribesArtist? artist = locator<AppRouterDelegate>().artist;
      //   final TribesVideo? video = locator<AppRouterDelegate>().video;
      //
      //   bool isInMemoryStack = false;
      //   if (artist != null &&
      //       video != null &&
      //       artist.artistId == parameter1 &&
      //       video.videoId == parameter2) {
      //     isInMemoryStack = true;
      //   }

        // return (parameter1 != null && parameter2 != null)
        //     ? CupertinoPage(
        //         key: ValueKey(routeName),
        //         child: HomePage(
        //           0,
        //           isInMemoryStack
        //               ? VideoPlayer.fromId(artist, video)
        //               : VideoPlayer.fromState(parameter1, parameter2),
        //         ),
        //       )
        //     : UnknownPage();

      case RouteNames.notFound:
        return UnknownPage();

      default:
        return UnknownPage();
    }
  }
}
