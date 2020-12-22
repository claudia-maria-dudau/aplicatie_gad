library movie;

import 'package:aplicatie_gad/movies/src/models/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder>{
  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;

  //deserializare din json
  factory Movie.fromJson(dynamic json){
    print(serializers.deserializeWith(serializer, json));
    return serializers.deserializeWith(serializer, json);
  }

  Movie._();

  String get title;
  int get year;
  num get rating;
  int get runtime;
  List<String> get genres;
  String get summary;

  @BuiltValueField(wireName: 'background_image')
  String get backgroundImage;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get mediumCoverImage;

  @BuiltValueField(wireName: 'large_cover_image')
  String get largeCoverImage;

  static Serializer<Movie> get serializer => _$movieSerializer;
}