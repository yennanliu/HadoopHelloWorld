ratings = LOAD 'data/ml-100k/u.data' AS (userID:int, movieID:int, rating:int, ratingTime:int);

metadata = LOAD 'data/ml-100k/u.item' USING PigStorage('|')
	AS (movieID:int, movieTitle:chararray, releaseDate:chararray, videoRealese:chararray, imdblink:chararray);
   
nameLookup = FOREACH metadata GENERATE movieID, movieTitle;
   
groupRatings = GROUP ratings by movieID;

averageRatings = FOREACH groupRatings GENERATE group as movieID, 
AVG(ratings.rating) as avgRating, COUNT(ratings.rating) as numRatings;

badMovies = FILTER averageRatings BY avgRating  < 2 ;

nameBadMovies = JOIN badMovies BY movieID, nameLookup By movieID;

finalResults = FOREACH nameBadMovies GENERATE nameLookup::movieTitle AS movieName, badMovies::avgRating AS avgRating, badMovies::numRatings AS numRatings; 

finalResultsSorted = ORDER finalResults BY numRatings DESC;

DUMP finalResultsSorted;
