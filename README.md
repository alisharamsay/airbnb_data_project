# DATA201 - Christchurch Airbnb Listings Analysis
This project analyses Christchurch Airbnb listing trends from Oct 2025-June 2026 using data 
from Inside Airbnb, combining 9 monthly snapshots into a single dataset for exploratory analysis.

**Team members:** Alice Kuo, Charlie Harris and Alisha Ramsay

## Airbnb Dataset Analysis
This repository contains Airbnb data that has been renamed and transformed for this project.

**Original Source** Inside Airbnb (https://insideairbnb.com/get-the-data/)
**License** This data is licensed under a [Creative Commons Attribution 4.0 International License (CCBY 4.0)](https://creativecommons.org)
**Modifications** The original CSV dataset files were downloaded to "Week_5_datasets" folder and filenames were changed to fit the project.


## Data Dictionary
Source: Inside Airbnb - New Zealand listings.csv (monthly snapshots, Oct 2025 - June 2026)

This describes the columns in the combined dataset (all_chch), which is 
filtered to Christchurch City only and concatenated across all 9 monthly snapshots.
Descriptions below are adapted from Inside Airbnb's official Data Dictionary: 
https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit?usp=sharing

id (integer): Airbnb's unique identifier for the listing

name (string): Name of the listing

host_id(integer): Airbnb's unique identifier for the host/user

host_name (string): Name of the host. Usually just the first name(s).

neighbourhood_group (string): The city/district the listing belongs to (filtered to "Christchurch City" only in this dataset)

neighbourhood (string): The neighbourhood as geocoded using the latitude and longitude against neighborhoods as defined by open or public digital shapefiles.

latitude (numeric):	Uses the World Geodetic System (WGS84) projection for latitude and longitude.

longitude (numeric): Uses the World Geodetic System (WGS84) projection for latitude and longitude.

room_type (string): Has 3 room types - entire place, private or shared

price (numeric): daily price in local currency.

minimum_nights (integer): minimum number of night stay for the listing 

number_of_reviews (integer): The number of reviews the listing has

last_review (date): The date of the last/newest review

reviews_per_month (numeric): The average number of reviews per month the listing has over the lifetime of the listing. 

Uses the equation: IF scrape_date - first_review <= 30 THEN number_of_reviews
                   ELSE number_of_reviews / ((scrape_date - first_review + 1) / (365/12))
This means the value is undefined when a listing has no reviews, since the formula requires first_review. These NAs were recoded to 0, confirmed to always align with a missing last_review

calculated_host_listings_count (integer): The number of listings the host has in the current scrape

availability_365 (integer): number of days listings available in 365 days

number_of_reviews_ltm (integer): The number of reviews the listing has (in the last 12 months) 

license (string): The listing's license/registration number, where required and provided. Often missing.

month_year (string): Added during processing (not part of the original Inside Airbnb data) - indicates which monthly snapshot the row came from, e.g. "2025-10"


## Datasheet

### Motivation
This dataset was created by Inside Airbnb, a mission-driven activist project 
that provides data quantifying the impact of short-term rentals on housing 
and residential communities, and supports advocacy for policies to protect 
cities from these impacts. It is run independently of Airbnb, by Murray Cox, 
and is not commercially funded.

For this project, the New Zealand dataset was downloaded, filtered to 
Christchurch City, and combined across 9 monthly snapshots (Oct 2025 - 
June 2026) for DATA201, to analyse trends in Christchurch Airbnb listings 
over time.

### Composition
- Each row represents a single Airbnb listing active in Christchurch City 
  at the time of that month's scrape.
- The combined dataset (all_chch) contains 28795 rows across 9 monthly 
  snapshots.
- 19 columns, described in the data dictionary above.
- Represents Airbnb hosts and listings in Christchurch City only

### Collection process
- Inside Airbnb collects the data by scraping Airbnb's public website 
  each month, without needing to log in.
- Exact snapshot dates used in this project: 5 Oct 2025, 7 Nov 2025, 
  11 Dec 2025, 16 Jan 2026, 13 Feb 2026, 17 Mar 2026, 16 Apr 2026, 
  23 May 2026, 19 June 2026.
- No direct consent was obtained from hosts, as the data reflects publicly 
  listed information already visible on Airbnb's site.
- Airbnb anonymizes listing locations by randomizing coordinates by 0-150 
  metres from the actual address. Listings in the same building may therefore 
  appear scattered on a map.
  
### Preprocessing, cleaning and labelling
- Each monthly file was filtered to the "Christchurch City" neighbourhood_group
- A new column, month_year, was added to each monthly file to record 
  which snapshot it came from (e.g. "2025-10").
- The 9 filtered files were concatenated into all_chch.

### Uses
- Intended for this DATA201 coursework project, exploring trends in 
  Christchurch Airbnb listings (price, availability, room types, etc.) 
  over a 9-month period.
- Inappropriate uses: identifying or contacting individual hosts, treating 
  this as a complete record of all Airbnb activity in Christchurch, or 
  redistributing the dataset outside this coursework (per Inside Airbnb's 
  guidelines against republishing their data).
  
### Distribution
- Original source data: https://insideairbnb.com/get-the-data/, licensed 
  under a Creative Commons Attribution 4.0 International License 
  (http://creativecommons.org/licenses/by/4.0/).
- Inside Airbnb's community guidelines ask users to "only take the data 
  you need," not to scrape the site directly, and not to republish the 
  data, since "this site provides the best context for the data." Their 
  Data Policies page also states that Inside Airbnb data "should be 
  attributed and cited appropriately."
- The combined, filtered dataset (all_chch_listings.csv) produced by this 
  project is stored in this repository's week_5_datasets folder for 
  coursework purposes only, in line with the above guidelines.
  
### Maintenance
- The original data is maintained and updated monthly by Inside Airbnb 
  (Murray Cox).
- The combined Christchurch dataset in this repository will be maintained 
  for the duration of this DATA201 project and is not planned to be 
  updated beyond the June 2026 snapshot.
  
  
### Rental bond data set analysis
-Updated quarterly (last update 17/8/26)

-The files above are for private bonds, starting from January 1993. 
'Private' means private sector landlords. 

-This data comes from our tenancy bond database, which records all new 
rental bonds that are lodged with us each month.

-It is listed by tenancy start date and uses the SA2-2019 area definitions
from Statistics NZ. Privacy protection measures have been applied; fixed
random rounding is applied to base 3 and there is a suppression of results
when there are fewer than 5 bonds for any given selection.

## Data Dictionary

-source: tenancy.gov 
https://www.tenancy.govt.nz/about-tenancy-services/data-and-statistics/rental-bond-data/

TimeFrame (date): The quarter the data covers, given as the first day of the 
quarter (e.g. 2026-04-01 = Q2 2026).
Location Id (integer): The geographic area the row describes, coded using
Statistics NZ's SA2-2019 (Statistical Area 2) boundaries.
Dwelling Type (string): The property type — one of ALL, Apartment, Boarding 
House, Flat, House, or Room.
Number Of Beds (integer): The number of bedrooms in the property. 0-5+
Total Bonds (integer): The count of bonds newly lodged in that quarter for 
the given Location Id/Dwelling Type/Beds combination.
Active Bonds (integer): The count of bonds that were active (in force) at some
point during the quarter.
Closed Bonds (integer): The count of bonds that were closed (tenancy ended) 
during the quarter.
Median Rent (numeric): The median weekly rent, in NZD, for bonds in that group.
Geometric Mean Rent (numeric): The geometric mean of weekly rent, in NZD, for 
bonds in that group.
Upper Quartile Rent (numeric): The 75th percentile weekly rent, in NZD, for 
bonds in that group.
Lower Quartile Rent (numeric): The 25th percentile weekly rent, in NZD, for bonds in that group.
Log Std Dev Weekly Rent (numeric): The standard deviation of the natural log of weekly rent, a measure of rent dispersion within the group.

## AI Usage Declaration
Our group used ai during this project. We used primarily for debugging, code review and summarising code. 
All analytical decisions were made by the team, with AI used to help implement those decisions rather than to make them.

Tools used: Gemini, Claude, 

