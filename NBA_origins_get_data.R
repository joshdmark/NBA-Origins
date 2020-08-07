## load packages 
library(tidyverse)
library(nbastatR)
library(data.table)
library(sqldf)
library(future)


## get rosters for seasons after 2000
roster2000 <- seasons_rosters(seasons = 2000)
roster2001 <- seasons_rosters(seasons = 2001)
roster2002 <- seasons_rosters(seasons = 2002)
roster2003 <- seasons_rosters(seasons = 2003)
roster2004 <- seasons_rosters(seasons = 2004)
roster2005 <- seasons_rosters(seasons = 2005)
roster2006 <- seasons_rosters(seasons = 2006)
roster2007 <- seasons_rosters(seasons = 2007)
roster2008 <- seasons_rosters(seasons = 2008)
roster2009 <- seasons_rosters(seasons = 2009)
roster2010 <- seasons_rosters(seasons = 2010)
roster2011 <- seasons_rosters(seasons = 2011)
roster2012 <- seasons_rosters(seasons = 2012)
roster2013 <- seasons_rosters(seasons = 2013)
roster2014 <- seasons_rosters(seasons = 2014)
roster2015 <- seasons_rosters(seasons = 2015)
roster2016 <- seasons_rosters(seasons = 2016)
roster2017 <- seasons_rosters(seasons = 2017)
roster2018 <- seasons_rosters(seasons = 2018)
roster2019 <- seasons_rosters(seasons = 2019)
roster2020 <- seasons_rosters(seasons = 2020)

fwrite(roster2020, "~/Desktop/SPORTS/NBA_Origins_data/roster2020.csv")
rm(roster2020)

## load all rosters 
nba_rosters_list <- list.files("~/Desktop/SPORTS/NBA_Origins_data")
nba_rosters_list <- nba_rosters_list[grep(pattern = 'roster', x = nba_rosters_list)]
nba_rosters <- data.frame()
## loop to read all seasons' rosters 
for (r in nba_rosters_list){
  ## load season 
  tmp_file <- fread(paste("~/Desktop/SPORTS/NBA_Origins_data/", r, sep = ''))
  
  ## combine with nba_rosters 
  nba_rosters <- suppressWarnings(bind_rows(nba_rosters, tmp_file))
}

fwrite(nba_rosters, "~/Desktop/SPORTS/NBA_Origins_data/nba_rosters.csv")
nba_rosters <- fread("~/Desktop/SPORTS/NBA_Origins_data/nba_rosters.csv")


## GET PLAYER PROFILES 
player_ids_list <- unique(nba_rosters$idPlayer)

p1 <- player_ids_list[1:500]
p2 <- player_ids_list[501:600]
p3 <- player_ids_list[601:800]
p4 <- player_ids_list[801:1000]
p5 <- player_ids_list[1001:1200]
p6 <- player_ids_list[1201:1400]
p7 <- player_ids_list[1401:1550]
p8 <- player_ids_list[1551:1700]
p9 <- player_ids_list[1701:1892]

player_profs <- player_profiles(player_ids = p9,
                                nest_data = FALSE,
                                return_message = TRUE)
fwrite(player_profs, "~/Desktop/SPORTS/NBA_Origins_data/player_profs9.csv")
rm(player_profs)

nba_player_profiles_list <- list.files("~/Desktop/SPORTS/NBA_Origins_data")
nba_player_profs <- nba_player_profiles_list[grep(pattern = 'player_profs', x = nba_player_profiles_list)]
nba_profiles <- data.frame()
## loop to read all seasons' rosters 
for (r in nba_player_profs){
  ## load profiles 
  tmp_file <- fread(paste("~/Desktop/SPORTS/NBA_Origins_data/", r, sep = ''))

  ## combine with nba_profiles
  nba_profiles <- suppressWarnings(bind_rows(nba_profiles, tmp_file))
}

fwrite(nba_profiles, "~/Desktop/SPORTS/NBA_Origins_data/nba_profiles.csv")

## list of all player ids
player_profs <- data.frame(player_profs)

# tmp <- prof %>% 
#   separate(nameOrganizationFrom, into = c('school', 'playerCountry'), sep = '/')
