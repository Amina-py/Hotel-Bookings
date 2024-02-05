///changing the directory
cd "C:\Users\DELL\Desktop\PROJECT 1"
///checking the directory
pwd
///creating a log file
log using hotel.log
///importing the dataset
import excel "C:\Users\DELL\Desktop\PROJECT 1\Hotel Booking data.xlsx", sheet("Sheet1") firstrow
///viewwing the dataset
edit
///converting age group to categorical data type
encode AgeGroup, gen(Age_group)
///dropping the old column
drop AgeGroup
///converting hotel rating to string
tostring HotelRating, gen(Hotel_Rating)
///converting hotel rating to categorical
encode Hotel_Rating, gen(Hotel_rating)
///dopping columns
drop HotelRating Hotel_Rating
///which age group made the most booking
tab Age_goup
///finding the code of the categorical variable
tab Age_goup, nolabel
///average number of days spent by young adult
tabstat NoofDays if Age_goup == 3, stat(mean)
///average number of days spent by old-aged adult
tabstat NoofDays if Age_goup == 2, stat(mean)
///average number of days spent by middle aged adult
tabstat NoofDays if Age_goup == 1, stat(mean)
///is there a relationship between origin country and destination country? 
tab DestinationCountry OriginCountry,chi2 col
///is there a correlation between the number of people and rooms booked
pwcorr NoOfPeople Rooms, sig
///is there a correlation between the discount given and number of dayys stayed
pwcorr Discount NoofDays,sig
///is there a relationship between the hotel ratings and booking price
anova BookingPriceSGD Hotel_rating
///count of hotel ratings by booking frequency
tab Hotel_rating
