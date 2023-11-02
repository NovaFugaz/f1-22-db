create table f1_countries (
	country_id serial,
	country_name text,
	country_three_letters text,
	country_continent text,
	primary key (country_id, country_name)
);

alter table f1_countries 
add constraint country_name_unq unique(country_name); 

insert into f1_countries (country_name, country_three_letters, country_continent)
values 
('Bahrain', 'BAH', 'Asia'),
('Saudi Arabia', 'KSA', 'Asia'),
('Australia', 'AUS', 'Oceania'),
('Italy', 'ITA', 'Europe'),
('United States', 'USA', 'North America'),
('Spain', 'SPA', 'Europe'),
('Monaco', 'MON', 'Europe'),
('Azerbaijan', 'AZE', 'Europe'),
('Canada', 'CAN', 'North America'),
('Great Britain', 'GBR', 'Europe'),
('Austria', 'AUT', 'Europe'),
('France', 'FRA', 'Europe'),
('Hungary', 'HUN', 'Europe'),
('Belgium', 'BEL', 'Europe'),
('Netherlands', 'NLD', 'Europe'),
('Singapore', 'SIN', 'Asia'),
('Japan', 'JPN', 'Asia'),
('Mexico', 'MEX', 'North America'),
('Brazil', 'BRA', 'South America'),
('United Emirates', 'UEA', 'Asia');

insert into f1_countries (country_name, country_three_letters, country_continent)
values ('England', 'ENG', 'Europe');

insert into f1_countries (country_name, country_three_letters, country_continent)
values ('Switzerland', 'CHE', 'Europe');

insert into f1_countries (country_name, country_three_letters, country_continent)
values ('Germany', 'GER', 'Europe');

insert into f1_countries (country_name, country_three_letters, country_continent)
values ('Estonia', 'EST', 'Europe');

insert into f1_countries (country_name, country_three_letters, country_continent)
values 
('New Zealand', 'NZE', 'Oceania'),
('China', 'CHN', 'Asia'),
('Finland', 'FIN', 'Europe'),
('Denmark', 'DEN', 'Europe'),
('Thailand', 'THA', 'Asia');

update f1_countries set country_name = 'México' where country_name = 'Mexico';
update f1_countries set country_name = 'United Arab Emirates' where country_name = 'United Emirates';
update f1_countries set country_three_letters = 'UAE' where country_three_letters = 'UEA';

create table engine_supplier (
	supplier_id serial,
	supplier_name text unique,
	supplier_country text,
	supplier_engine_spec text,
	supplier_acronym text null,
	primary key (supplier_id, supplier_name),
	foreign key (supplier_country) references f1_countries (country_name)
);

insert into engine_supplier (supplier_name, supplier_country, supplier_engine_spec, supplier_acronym)
values 
	('Red Bull Powertrains', 'England', 'Red Bull RBPTH001', 'RBPT'),
	('Ferrari', 'Italy', 'Ferrari 066/7', null),
	('Mercedes', 'England', 'Mercedes-AMG F1 M13', null),
	('Renault', 'France', 'Renault E-Tech RE22', null);
	
create table f1_constructor (
	team_id serial,
	team_name text unique,
	team_full_name text,
	team_chassis text,
	team_country text,
	team_engine text,
	primary key (team_id, team_name),
	foreign key (team_country) references f1_countries (country_name),
	foreign key (team_engine) references engine_supplier (supplier_name)
);

insert into f1_constructor (team_name, team_full_name, team_chassis, team_country, team_engine)
values 
	('Alfa Romeo', 'Alfa Romeo F1 Team Orlen', 'C42', 'Switzerland', 'Ferrari'),
	('Aston Martin Aramco', 'Aston Martin Aramco Cognizant F1 Team', 'AMR22', 'Great Britain', 'Mercedes'),
	('Alpine', 'BWT Alpine F1 Team', 'A522', 'France', 'Renault'),
	('Haas', 'Haas F1 Team', 'VF-22', 'United States', 'Ferrari'),
	('McLaren', 'McLaren F1 Team', 'MCL36', 'Great Britain', 'Mercedes'),
	('Mercedes', 'Mercedes-AMG Petronas F1 Team', 'F1 W13', 'Germany', 'Mercedes'),
	('Red Bull Racing', 'Oracle Red Bull Racing', 'RB18', 'Austria', 'Red Bull Powertrains'),
	('AlphaTauri', 'Scuderia AlphaTauri', 'AT03', 'Italy', 'Red Bull Powertrains'),
	('Ferrari', 'Scuderia Ferrari', 'F1-75', 'Italy', 'Ferrari'),
	('Williams', 'Williams Racing', 'FW44', 'Great Britain', 'Mercedes');

create table f1_drivers (
	driver_id serial,
	driver_number int,
	driver_name text unique,
	driver_img_url text,
	driver_country text,
	driver_team text,
	primary key (driver_id, driver_name),
	foreign key (driver_team) references f1_constructor (team_name)
);

insert into f1_drivers (driver_number, driver_name, driver_img_url, driver_country, driver_team)
values 
('1', 'Max Verstappen', 'https://i.ibb.co/G3wTBjs/max-verstappen.webp', 'Netherlands', 'Red Bull Racing'),
('11', 'Sergio Pérez', 'https://i.ibb.co/JtWsb16/sergio-perez.webp', 'Mexico', 'Red Bull Racing'),
('24', 'Zhou Guanyu', 'https://i.ibb.co/GV877f2/guanyu-zhou.webp', 'China', 'Alfa Romeo'),
('77', 'Valtteri Bottas', 'https://i.ibb.co/m4nKsg4/valtteri-bottas.webp', 'Finland', 'Alfa Romeo' ),
('10', 'Pierre Gasly', 'https://i.ibb.co/2MTT8gX/pierre-gasly.webp', 'France', 'AlphaTauri'),
('22', 'Yuki Tsunoda', 'https://i.ibb.co/BT7Mb8j/yuki-tsunoda.webp', 'Japan', 'AlphaTauri'),
('14', 'Fernando Alonso', 'https://i.ibb.co/dL6m8j8/fernando-alonso.webp', 'Spain', 'Alpine'),
('31', 'Esteban Ocon', 'https://i.ibb.co/pdDXTcs/esteban-ocon.webp', 'France', 'Alpine'),
('27', 'Nico Hülkenberg', 'https://i.ibb.co/s9zNrcp/nico-hulkenberg.webp', 'Germany', 'Aston Martin Aramco'),
('5', 'Sebastian Vettel', 'https://i.ibb.co/FKnvkct/sebastian-vettel.webp', 'Germany', 'Aston Martin Aramco'),
('18', 'Lance Stroll', 'https://i.ibb.co/SdMNPKZ/lance-stroll.webp', 'Canada', 'Aston Martin Aramco'),
('16', 'Charles Leclerc', 'https://i.ibb.co/825npRQ/charles-leclerc.webp', 'Monaco', 'Ferrari'),
('55', 'Carlos Sainz', 'https://i.ibb.co/tLghC94/carlos-sainz.webp', 'Spain', 'Ferrari'),
('20', 'Kevin Magnussen', 'https://i.ibb.co/Y7FJNsD/kevin-magnussen.webp', 'Denmark', 'Haas'),
('47', 'Mick Schumacher', 'https://i.ibb.co/thr0Vdm/mick-schumacher.webp', 'Germany', 'Haas'),
('3', 'Daniel Ricciardo', 'https://i.ibb.co/GvHYF21/daniel-ricciardo.webp', 'Australia', 'McLaren'),
('4', 'Lando Norris', 'https://i.ibb.co/2PKNT2T/lando-norris.webp', 'Great Britain', 'McLaren'),
('44', 'Lewis Hamilton', 'https://i.ibb.co/74rCbm0/lewis-hamilton.webp', 'Great Britain', 'Mercedes'),
('63', 'George Russell', 'https://i.ibb.co/PzyPNKH/george-russell.webp', 'Great Britain', 'Mercedes'),
('6', 'Nicholas Latifi', 'https://i.ibb.co/4ZvCsYg/nicholas-latifi.webp', 'Canada', 'Williams'),
('23', 'Alexander Albon', 'https://i.ibb.co/xhn1jtf/alexander-albon.webp', 'Thailand', 'Williams'),
('45', 'Nick De Vryes', 'https://i.ibb.co/r6xx2xP/nyck-de-vries.webp', 'Netherlands', 'Williams');

create table f1_tracks (
	track_id serial,
	track_name text unique,
	track_alt_name text null,
	track_city text,
	track_country text,
	primary key (track_id, track_name),
	foreign key (track_country) references f1_countries (country_name));

insert into f1_tracks (track_name, track_alt_name, track_city, track_country)
values
	('Bahrain International Circuit', null, 'Sakhir', 'Bahrain'),
	('Jeddah Corniche Circuit', null, 'Jeddah', 'Saudi Arabia'),
	('Albert Park Circuit', null, 'Melbourne', 'Australia'),
	('Autodromo Internazionale Enzo e Dino Ferrari', 'Imola Circuit', 'Imola', 'Italy'),
	('Miami International Autodrome', null, 'Miami', 'United States'),
	('Circuit de Barcelona-Catalunya', null, 'Montmeló', 'Spain'),
	('Circuit de Monaco', 'Monte Carlo', 'La Condamine & Monte Carlo', 'Monaco'),
	('Baku City Circuit', null, 'Baku', 'Azerbaijan'),
	('Circuit Gilles Villeneuve', null, 'Montreal', 'Canada'),
	('Silverstone Circuit', null, 'Silverstone', 'Great Britain'),
	('Red Bull Ring', null, 'Spielberg', 'Austria'),
	('Circuit Paul Ricard', null, 'Le Castellet', 'France'),
	('Hungaroring', null, 'Mogyoród', 'Hungary'),
	('Circuit de Spa-Francorchamps', 'Spa', 'Stavelot', 'Belgium'),
	('Circuit Zandvoort', null, 'Zandvoort', 'Netherlands'),
	('Autodromo Nazionale di Monza', 'Monza Circuit', 'Monza', 'Italy'),
	('Marina Bay Street Circuit', 'Singapore Street Circuit', 'Singapore', 'Singapore'),
	('Suzuka International Racing Course', 'Suzuka Circuit', 'Suzuka', 'Japan'),
	('Circuit of the Americas', 'COTA', 'Austin', 'United States'),
	('Autódromo Hermanos Rodríguez', null, 'México City', 'México'),
	('Autódromo José Carlos Pace', 'Autódromo de Interlagos', 'São Paulo', 'Brazil'),
	('Yas Marina Circuit', null, 'Abu Dhabi', 'United Arab Emirates');

create table grand_prix (
	gp_id serial,
	gp_round int,
	gp_name text unique,
	gp_full_name text unique,
	gp_country text,
	gp_date date,
	gp_laps int,
	gp_weather text,
	gp_track text,
	gp_poleman text,
	gp_pole_time time,
	gp_fastest_lap_achiever text,
	gp_fastest_lap time,
	primary key (gp_id, gp_name),
	foreign key (gp_country) references f1_countries (country_name),
	foreign key (gp_poleman) references f1_drivers (driver_name),
	foreign key (gp_track) references f1_tracks (track_name),
	foreign key (gp_fastest_lap_achiever) references f1_drivers (driver_name)
);

insert into grand_prix (gp_round, gp_name, gp_full_name, gp_country, gp_date, gp_laps, gp_weather, gp_track, gp_poleman, gp_pole_time, gp_fastest_lap_achiever, gp_fastest_lap)
values
	('1', 'Bahrain Grand Prix', 'Formula 1 Gulf Air Bahrain Grand Prix 2022', 'Bahrain', '2022-03-20', '57', 'Clear', 'Bahrain International Circuit', 'Charles Leclerc', '1:30.558', 'Charles Leclerc', '1:34.570'),
	('2', 'Saudi Arabian Grand Prix', 'Formula 1 STC Saudi Arabian Grand Prix 2022', 'Saudi Arabia', '2022-03-27', '50', 'Clear', 'Jeddah Corniche Circuit', 'Sergio Pérez', '1:28.200', 'Charles Leclerc', '1:31.634'),
	('3', 'Australian Grand Prix', 'Formula 1 Heineken Australian Grand Prix 2022', 'Australia', '2022-04-10', '58', 'Partly Cloudy', 'Albert Park Circuit', 'Charles Leclerc', '1:17.868', 'Charles Leclerc', '1:20.260'),
	('4', 'Emilia Romagna Grand Prix', 'Formula 1 Rolex Gran Premio del Made in Italy e dell''Emilia-Romagna 2022', 'Italy', '2022-04-22', '63', 'Cloudy in a wet and drying track', 'Autodromo Internazionale Enzo e Dino Ferrari', 'Max Verstappen', '1:27.999', 'Max Verstappen', '1:18.446'),
	('5', 'Miami Grand Prix', 'Formula 1 Crypto.com Miami Grand Prix 2022', 'United States', '2022-05-08', '57', 'Warm, partly cloudy', 'Miami International Autodrome' ,'Charles Leclerc', '1:28.796', 'Max Verstappen', '1:31.361'),
	('6', 'Spanish Grand Prix', 'Formula 1 Pirelli Gran Premio de España 2022', 'Spain', '2022-05-22', '66', 'Sunny', 'Circuit de Barcelona-Catalunya', 'Charles Leclerc', '1:18.750', 'Sergio Pérez', '1:24.108'),
	('7', 'Monaco Grand Prix', 'Formula 1 Grand Prix de Monaco 2022', 'Monaco', '2022-05-29', '78', 'Rain and partly cloudy in wet-and-drying track conditions', 'Circuit de Monaco', 'Charles Leclerc', '1:11.376', 'Lando Norris', '1:14.693'),
	('8', 'Azerbaijan Grand Prix', 'Formula 1 Azerbaijan Grand Prix 2022', 'Azerbaijan', '2022-06-12', '51', 'Sunny', 'Baku City Circuit', 'Charles Leclerc', '1:41.359', 'Sergio Pérez', '1:46.046'),
	('9', 'Canadian Grand Prix', 'Formula 1 AWS Grand Prix du Canada 2022', 'Canada', '2022-06-19', '70', 'Sunny', 'Circuit Gilles Villeneuve', 'Max Verstappen', '1:21.299', 'Carlos Sainz', '1:15.749'),
	('10', 'British Grand Prix', 'Formula 1 Lenovo British Grand Prix 2022', 'Great Britain', '2022-07-03', '52' ,'Partly cloudy', 'Silverstone Circuit', 'Carlos Sainz', '1:40.983', 'Lewis Hamilton', '1:30.510'),
	('11', 'Austrian Grand Prix', 'Formula 1 Rolex Großer Preis von Österreich 2022', 'Austria', '2022-07-10', '71', 'Partly cloudy', 'Red Bull Ring', 'Max Verstappen', '1:04.984', 'Max Verstappen', '1:07.275'),
	('12', 'French Grand Prix', 'Formula 1 Lenovo Grand Prix de France 2022', 'France', '2022-07-24', '53', 'Sunny', 'Circuit Paul Ricard', 'Charles Leclerc', '1:30.872', 'Carlos Sainz', '1:35.781'),
	('13', 'Hungarian Grand Prix', 'Formula 1 Aramco Magyar Nagydíj 2022', 'Hungary', '2022-07-31', '70', 'Overcast with drizzle throughout, light rain at the end', 'Hungaroring', 'George Russell', '1:17.377', 'Lewis Hamilton', '1:21.386'),
	('14', 'Belgian Gran Prix', 'Formula 1 Rolex Belgian Grand Prix 2022', 'Belgium', '2022-08-28', '44', 'Sunny', 'Circuit de Spa-Francorchamps', 'Carlos Sainz', '1:44.297', 'Max Verstappen', '1:49.354'),
	('15', 'Dutch Grand Prix', 'Formula 1 Heineken Dutch Grand Prix 2022', 'Netherlands', '2022-09-04', '72' , 'Partly Cloudy', 'Circuit Zandvoort', 'Max Verstappen', '1:10.342', 'Max Verstappen', '1:13.652'),
	('16', 'Italian Grand Prix', 'Formula 1 Pirelli Gran Premio d''Italia 2022', 'Italy', '2022-09-11', '53', 'Sunny', 'Autodromo Nazionale di Monza', 'Charles Leclerc', '1:20.161', 'Sergio Pérez', '1:24.030'),
	('17', 'Singapore Grand Prix', 'Formula 1 Singapore Airlines Singapore Grand Prix 2022', 'Singapore', '2022-10-02', '59', 'Partly cloudy in a wet and drying track', 'Marina Bay Street Circuit', 'Charles Leclerc', '1:49.412', 'George Russell', '1:46.458'),
	('18', 'Japanese Grand Prix', 'Formula 1 Honda Japanese Grand Prix 2022', 'Japan', '2022-10-09', '28', 'Rain', 'Suzuka International Racing Course', 'Max Verstappen', '1:29.304', 'Zhou Guanyu', '1:44.411'),
	('19', 'United States Grand Prix', 'Formula 1 Aramco United States Grand Prix 2022', 'United States', '2022-10-23', '56', 'Partly cloudy', 'Circuit of the Americas', 'Carlos Sainz', '1:34.356', 'George Russell', '1:38.788'),
	('20', 'Mexico City Grand Prix', 'Formula 1 Gran Premio de la Ciudad de México 2022', 'México', '2022-10-30', '71', 'Partly cloudy', 'Autódromo Hermanos Rodríguez', 'Max Verstappen', '1:17.775', 'George Russell', '1:20.153'),
	('21', 'São Paulo Grand Prix', 'Formula 1 Heineken Grande Prêmio de São Paulo 2022', 'Brazil', '2022-11-13', '71', 'Cloudy', 'Autódromo José Carlos Pace', 'Kevin Magnussen', '1:11.674', 'George Russell', '1:13.785'),
	('22', 'Abu Dhabi Grand Prix', 'Formula 1 Etihad Airways Abu Dhabi Grand Prix 2022', 'United Arab Emirates', '2022-11-20', '58', 'Clear', 'Yas Marina Circuit', 'Max Verstappen', '1:23.824', 'Lando Norris', '1:28.391');

alter table grand_prix
add constraint gp_round_unq unique (gp_round);

create table sprint_race (
	sprint_round int primary key,
	sprint_track text,
	sprint_laps int,
	foreign key (sprint_track) references f1_tracks (track_name));

insert into sprint_race (sprint_round, sprint_track, sprint_laps)
values 
('1', 'Autodromo Internazionale Enzo e Dino Ferrari', '21'),
('2', 'Red Bull Ring', '23'),
('3', 'Autódromo José Carlos Pace', '24');

create table sprint_points_system (
	sp_position int primary key,
	sp_points_awarded int);

insert into sprint_points_system (sp_position, sp_points_awarded)
	values 
	('1', '8'), ('2', '7'), ('3', '6'), ('4', '5'), ('5', '4'),
	('6', '3'), ('7', '2'), ('8', '1'), ('9', '0'), ('10', '0'),
	('11', '0'), ('12', '0'), ('13', '0'), ('14', '0'), ('15', '0'),
	('16', '0'), ('17', '0'), ('18', '0'), ('19', '0'), ('20', '0');

create table sprint_results (
	sp_round int,	
	sp_driver text,
	sp_position int,
	sp_status text,
	primary key (sp_round, sp_driver),
	foreign key (sp_round) references sprint_race (sprint_round),
	foreign key (sp_position) references sprint_points_system (sp_position),
	foreign	key (sp_driver) references f1_drivers (driver_name)
);

insert into sprint_results (sp_round, sp_driver, sp_position, sp_status)
values
('1', 'Max Verstappen', '1', 'Finished'),
('1', 'Charles Leclerc', '2', 'Finished'),
('1', 'Sergio Pérez', '3', 'Finished'),
('1', 'Carlos Sainz', '4', 'Finished'),
('1', 'Lando Norris', '5', 'Finished'),
('1', 'Daniel Ricciardo', '6', 'Finished'),
('1', 'Valtteri Bottas', '7', 'Finished'),
('1', 'Kevin Magnussen', '8', 'Finished'),
('1', 'Fernando Alonso', '9', 'Finished'),
('1', 'Mick Schumacher', '10', 'Finished'),
('1', 'George Russell', '11', 'Finished'),
('1', 'Yuki Tsunoda', '12', 'Finished'),
('1', 'Sebastian Vettel', '13', 'Finished'),
('1', 'Lewis Hamilton', '14', 'Finished'),
('1', 'Lance Stroll', '15', 'Finished'),
('1', 'Esteban Ocon', '16', 'Finished'),
('1', 'Pierre Gasly', '17', 'Finished'),
('1', 'Alexander Albon', '18', 'Finished'),
('1', 'Nicholas Latifi', '19', 'Finished'),
('1', 'Zhou Guanyu', '20', 'DNF');

insert into sprint_results (sp_round, sp_driver, sp_position, sp_status)
values
('2', 'Max Verstappen', '1', 'Finished'),
('2', 'Charles Leclerc', '2', 'Finished'),
('2', 'Carlos Sainz', '3', 'Finished'),
('2', 'George Russell', '4', 'Finished'),
('2', 'Sergio Pérez', '5', 'Finished'),
('2', 'Esteban Ocon', '6', 'Finished'),
('2', 'Kevin Magnussen', '7', 'Finished'),
('2', 'Lewis Hamilton', '8', 'Finished'),
('2', 'Mick Schumacher', '9', 'Finished'),
('2', 'Valtteri Bottas', '10', 'Finished'),
('2', 'Lando Norris', '11', 'Finished'),
('2', 'Daniel Ricciardo', '12', 'Finished'),
('2', 'Lance Stroll', '13', 'Finished'),
('2', 'Zhou Guanyu', '14', 'Finished'),
('2', 'Pierre Gasly', '15', 'Finished'),
('2', 'Alexander Albon', '16', 'Finished'),
('2', 'Yuki Tsunoda', '17', 'Finished'),
('2', 'Nicholas Latifi', '18', 'Finished'),
('2', 'Sebastian Vettel', '19', 'DNF'),
('2', 'Fernando Alonso', '20', 'DNS');

insert into sprint_results (sp_round, sp_driver, sp_position, sp_status)
values
('3', 'George Russell', '1', 'Finished'),
('3', 'Carlos Sainz', '2', 'Finished'),
('3', 'Lewis Hamilton', '3', 'Finished'),
('3', 'Max Verstappen', '4', 'Finished'),
('3', 'Sergio Pérez', '5', 'Finished'),
('3', 'Charles Leclerc', '6', 'Finished'),
('3', 'Lando Norris', '7', 'Finished'),
('3', 'Kevin Magnussen', '8', 'Finished'),
('3', 'Sebastian Vettel', '9', 'Finished'),
('3', 'Pierre Gasly', '10', 'Finished'),
('3', 'Daniel Ricciardo', '11', 'Finished'),
('3', 'Mick Schumacher', '12', 'Finished'),
('3', 'Zhou Guanyu', '13', 'Finished'),
('3', 'Valtteri Bottas', '14', 'Finished'),
('3', 'Yuki Tsunoda', '15', 'Finished'),
('3', 'Lance Stroll', '15', 'Finished'),
('3', 'Esteban Ocon', '16', 'Finished'),
('3', 'Fernando Alonso', '18', 'Finished'),
('3', 'Nicholas Latifi', '19', 'Finished'),
('3', 'Alexander Albon', '20', 'DNF');

create table gp_points_system (
	gp_position int primary key,
	gp_points_awarded int);

insert into gp_points_system (gp_position, gp_points_awarded)
	values 
	('1', '25'), ('2', '18'), ('3', '15'), ('4', '12'), ('5', '10'),
	('6', '8'), ('7', '6'), ('8', '4'), ('9', '2'), ('10', '1'),
	('11', '0'), ('12', '0'), ('13', '0'), ('14', '0'), ('15', '0'),
	('16', '0'), ('17', '0'), ('18', '0'), ('19', '0'), ('20', '0');

create table results (
	gp_round int,
	driver_name text,
	gp_position int,
	gp_status text,
	primary key (gp_round, driver_name),
	foreign key (gp_round) references grand_prix (gp_round),
	foreign key (gp_position) references gp_points_system (gp_position),
	foreign key (driver_name) references f1_drivers (driver_name));

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('1', 'Charles Leclerc', '1', 'Finished'),
	('1', 'Carlos Sainz', '2', 'Finished'),
	('1', 'Lewis Hamilton', '3', 'Finished'),
	('1', 'George Russell', '4', 'Finished'),
	('1', 'Kevin Magnussen', '5', 'Finished'),
	('1', 'Valtteri Bottas', '6', 'Finished'),
	('1', 'Esteban Ocon', '7', 'Finished'),
	('1', 'Yuki Tsunoda', '8', 'Finished'),
	('1', 'Fernando Alonso', '9', 'Finished'),
	('1', 'Zhou Guanyu', '10', 'Finished'),
	('1', 'Mick Schumacher', '11', 'Finished'),
	('1', 'Lance Stroll', '12', 'Finished'),
	('1', 'Alexander Albon', '13', 'Finished'),
	('1', 'Daniel Ricciardo', '14', 'Finished'),
	('1', 'Lando Norris', '15', 'Finished'),
	('1', 'Nicholas Latifi', '16', 'Finished'),
	('1', 'Nico Hülkenberg', '17', 'Finished'),
	('1', 'Sergio Pérez', '18', 'Finished'),
	('1', 'Max Verstappen', '19', 'Finished'),
	('1', 'Pierre Gasly', '20', 'DNF');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('2', 'Max Verstappen', '1', 'Finished'),
	('2', 'Charles Leclerc', '2', 'Finished'),
	('2', 'Carlos Sainz', '3', 'Finished'),
	('2', 'Sergio Pérez', '4', 'Finished'),
	('2', 'George Russell', '5', 'Finished'),
	('2', 'Esteban Ocon', '6', 'Finished'),
	('2', 'Lando Norris', '7', 'Finished'),
	('2', 'Pierre Gasly', '8', 'DNF'),
	('2', 'Kevin Magnussen', '9', 'Finished'),
	('2', 'Lewis Hamilton', '10', 'Finished'),
	('2', 'Zhou Guanyu', '11', 'Finished'),
	('2', 'Nico Hülkenberg', '12', 'Finished'),
	('2', 'Lance Stroll', '13', 'Finished'),
	('2', 'Alexander Albon', '14', 'Finished'),
	('2', 'Valtteri Bottas', '15', 'Retired'),
	('2', 'Fernando Alonso', '16', 'Retired'),
	('2', 'Daniel Ricciardo', '17', 'Retired'),
	('2', 'Nicholas Latifi', '18', 'Retired'),
	('2', 'Yuki Tsunoda', '19', 'DNS'),
	('2', 'Mick Schumacher', '20', 'Withdrew');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('3', 'Charles Leclerc', '1', 'Finished'),
	('3', 'Sergio Pérez', '2', 'Finished'),
	('3', 'George Russell', '3', 'Finished'),
	('3', 'Lewis Hamilton', '4', 'Finished'),
	('3', 'Lando Norris', '5', 'Finished'),
	('3', 'Daniel Ricciardo', '6', 'Retired'),
	('3', 'Esteban Ocon', '7', 'Finished'),
	('3', 'Valtteri Bottas', '8', 'Finished'),
	('3', 'Pierre Gasly', '9', 'Finished'),
	('3', 'Alexander Albon', '10', 'Finished'),
	('3', 'Zhou Guanyu', '11', 'Finished'),
	('3', 'Lance Stroll', '12', 'Finished'),
	('3', 'Mick Schumacher', '13', 'Finished'),
	('3', 'Kevin Magnussen', '14', 'Finished'),
	('3', 'Yuki Tsunoda', '15', 'Finished'),
	('3', 'Nicholas Latifi', '16', 'Finished'),
	('3', 'Fernando Alonso', '17', 'Finished'),
	('3', 'Max Verstappen', '18', 'Retired'),
	('3', 'Sebastian Vettel', '19', 'Retired'),
	('3', 'Carlos Sainz', '20', 'Retired');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('4', 'Max Verstappen', '1', 'Finished'),
	('4', 'Sergio Pérez', '2', 'Finished'),
	('4', 'Lando Norris', '3', 'Finished'),
	('4', 'George Russell', '4', 'Finished'),
	('4', 'Valtteri Bottas', '5', 'Finished'),
	('4', 'Charles Leclerc', '6', 'Finished'),
	('4', 'Yuki Tsunoda', '7', 'Finished'),
	('4', 'Sebastian Vettel', '8', 'Finished'),
	('4', 'Kevin Magnussen', '9', 'Finished'),
	('4', 'Lance Stroll', '10', 'Finished'),
	('4', 'Alexander Albon', '11', 'Finished'),
	('4', 'Pierre Gasly', '12', 'Finished'),
	('4', 'Lewis Hamilton', '13', 'Finished'),
	('4', 'Esteban Ocon', '14', 'Finished'),
	('4', 'Zhou Guanyu', '15', 'Finished'),
	('4', 'Nicholas Latifi', '16', 'Finished'),
	('4', 'Mick Schumacher', '17', 'Finished'),
	('4', 'Daniel Ricciardo', '18', 'Finished'),
	('4', 'Fernando Alonso', '19', 'Retired'),
	('4', 'Carlos Sainz', '20', 'Retired');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('5', 'Max Verstappen', '1', 'Finished'),
	('5', 'Charles Leclerc', '2', 'Finished'),
	('5', 'Carlos Sainz', '3', 'Finished'),
	('5', 'Sergio Pérez', '4', 'Finished'),
	('5', 'George Russell', '5', 'Finished'),
	('5', 'Lewis Hamilton', '6', 'Finished'),
	('5', 'Valtteri Bottas', '7', 'Finished'),
	('5', 'Esteban Ocon', '8', 'Finished'),
	('5', 'Alexander Albon', '9', 'Finished'),
	('5', 'Lance Stroll', '10', 'Finished'),
	('5', 'Fernando Alonso', '11', 'Finished'),
	('5', 'Yuki Tsunoda', '12', 'Finished'),
	('5', 'Daniel Ricciardo', '13', 'Finished'),
	('5', 'Nicholas Latifi', '14', 'Finished'),
	('5', 'Mick Schumacher', '15', 'Finished'),
	('5', 'Kevin Magnussen', '16', 'Finished'),
	('5', 'Sebastian Vettel', '17', 'Finished'),
	('5', 'Pierre Gasly', '18', 'Retired'),
	('5', 'Lando Norris', '19', 'Retired'),
	('5', 'Zhou Guanyu', '20', 'Retired');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('6', 'Max Verstappen', '1', 'Finished'),
	('6', 'Sergio Pérez', '2', 'Finished'),
	('6', 'Carlos Sainz', '3', 'Finished'),
	('6', 'George Russell', '4', 'Finished'),
	('6', 'Lewis Hamilton', '5', 'Finished'),
	('6', 'Valtteri Bottas', '6', 'Finished'),
	('6', 'Esteban Ocon', '7', 'Finished'),
	('6', 'Lando Norris', '8', 'Finished'),
	('6', 'Fernando Alonso', '9', 'Finished'),
	('6', 'Yuki Tsunoda', '10', 'Finished'),
	('6', 'Sebastian Vettel', '11', 'Finished'),
	('6', 'Daniel Ricciardo', '12', 'Finished'),
	('6', 'Pierre Gasly', '13', 'Finished'),
	('6', 'Mick Schumacher', '14', 'Finished'),
	('6', 'Lance Stroll', '15', 'Finished'),
	('6', 'Nicholas Latifi', '16', 'Finished'),
	('6', 'Kevin Magnussen', '17', 'Finished'),
	('6', 'Alexander Albon', '18', 'Finished'),
	('6', 'Zhou Guanyu', '19', 'Retired'),
	('6', 'Charles Leclerc', '20', 'Retired');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('7', 'Sergio Pérez', '1', 'Finished'),
	('7', 'Carlos Sainz', '2', 'Finished'),
	('7', 'Max Verstappen', '3', 'Finished'),
	('7', 'Charles Leclerc', '4', 'Finished'),
	('7', 'George Russell', '5', 'Finished'),
	('7', 'Lando Norris', '6', 'Finished'),
	('7', 'Fernando Alonso', '7', 'Finished'),
	('7', 'Lewis Hamilton', '8', 'Finished'),
	('7', 'Valtteri Bottas', '9', 'Finished'),
	('7', 'Sebastian Vettel', '10', 'Finished'),
	('7', 'Pierre Gasly', '11', 'Finished'),
	('7', 'Esteban Ocon', '12', 'Finished'),
	('7', 'Daniel Ricciardo', '13', 'Finished'),
	('7', 'Lance Stroll', '14', 'Finished'),
	('7', 'Nicholas Latifi', '15', 'Finished'),
	('7', 'Zhou Guanyu', '16', 'Finished'),
	('7', 'Yuki Tsunoda', '17', 'Finished'),
	('7', 'Alexander Albon', '18', 'Retired'),
	('7', 'Mick Schumacher', '19', 'Retired'),
	('7', 'Kevin Magnussen', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('8', 'Max Verstappen', '1', 'Finished'),
	('8', 'Sergio Pérez', '2', 'Finished'),
	('8', 'George Russell', '3', 'Finished'),
	('8', 'Lewis Hamilton', '4', 'Finished'),
	('8', 'Pierre Gasly', '5', 'Finished'),
	('8', 'Sebastian Vettel', '6', 'Finished'),
	('8', 'Fernando Alonso', '7', 'Finished'),
	('8', 'Daniel Ricciardo', '8', 'Finished'),
	('8', 'Lando Norris', '9', 'Finished'),
	('8', 'Esteban Ocon', '10', 'Finished'),
	('8', 'Valtteri Bottas', '11', 'Finished'),
	('8', 'Alexander Albon', '12', 'Finished'),
	('8', 'Yuki Tsunoda', '13', 'Finished'),
	('8', 'Mick Schumacher', '14', 'Finished'),
	('8', 'Nicholas Latifi', '15', 'Finished'),
	('8', 'Lance Stroll', '16', 'Finished'),
	('8', 'Kevin Magnussen', '17', 'Retired'),
	('8', 'Zhou Guanyu', '18', 'Retired'),
	('8', 'Charles Leclerc', '19', 'Retired'),
	('8', 'Carlos Sainz', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('9', 'Max Verstappen', '1', 'Finished'),
	('9', 'Carlos Sainz', '2', 'Finished'),
	('9', 'Lewis Hamilton', '3', 'Finished'),
	('9', 'George Russell', '4', 'Finished'),
	('9', 'Charles Leclerc', '5', 'Finished'),
	('9', 'Esteban Ocon', '6', 'Finished'),
	('9', 'Valtteri Bottas', '7', 'Finished'),
	('9', 'Zhou Guanyu', '8', 'Finished'),
	('9', 'Fernando Alonso', '9', 'Finished'),
	('9', 'Lance Stroll', '10', 'Finished'),
	('9', 'Daniel Ricciardo', '11', 'Finished'),
	('9', 'Sebastian Vettel', '12', 'Finished'),
	('9', 'Alexander Albon', '13', 'Finished'),
	('9', 'Pierre Gasly', '14', 'Finished'),
	('9', 'Lando Norris', '15', 'Finished'),
	('9', 'Nicholas Latifi', '16', 'Finished'),
	('9', 'Kevin Magnussen', '17', 'Finished'),
	('9', 'Yuki Tsunoda', '18', 'Retired'),
	('9', 'Mick Schumacher', '19', 'Retired'),
	('9', 'Sergio Pérez', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('10', 'Carlos Sainz', '1', 'Finished'),
	('10', 'Sergio Pérez', '2', 'Finished'),
	('10', 'Lewis Hamilton', '3', 'Finished'),
	('10', 'Charles Leclerc', '4', 'Finished'),
	('10', 'Fernando Alonso', '5', 'Finished'),
	('10', 'Lando Norris', '6', 'Finished'),
	('10', 'Max Verstappen', '7', 'Finished'),
	('10', 'Mick Schumacher', '8', 'Finished'),
	('10', 'Sebastian Vettel', '9', 'Finished'),
	('10', 'Kevin Magnussen', '10', 'Finished'),
	('10', 'Lance Stroll', '11', 'Finished'),
	('10', 'Nicholas Latifi', '12', 'Finished'),
	('10', 'Daniel Ricciardo', '13', 'Finished'),
	('10', 'Yuki Tsunoda', '14', 'Finished'),
	('10', 'Esteban Ocon', '15', 'Retired'),
	('10', 'Pierre Gasly', '16', 'Retired'),
	('10', 'Valtteri Bottas', '17', 'Retired'),
	('10', 'George Russell', '18', 'Retired'),
	('10', 'Zhou Guanyu', '19', 'Retired'),
	('10', 'Alexander Albon', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('11', 'Charles Leclerc', '1', 'Finished'),
	('11', 'Max Verstappen', '2', 'Finished'),
	('11', 'Lewis Hamilton', '3', 'Finished'),
	('11', 'George Russell', '4', 'Finished'),
	('11', 'Esteban Ocon', '5', 'Finished'),
	('11', 'Mick Schumacher', '6', 'Finished'),
	('11', 'Lando Norris', '7', 'Finished'),
	('11', 'Kevin Magnussen', '8', 'Finished'),
	('11', 'Daniel Ricciardo', '9', 'Finished'),
	('11', 'Fernando Alonso', '10', 'Finished'),
	('11', 'Valtteri Bottas', '11', 'Finished'),
	('11', 'Alexander Albon', '12', 'Finished'),
	('11', 'Lance Stroll', '13', 'Finished'),
	('11', 'Zhou Guanyu', '14', 'Finished'),
	('11', 'Pierre Gasly', '15', 'Finished'),
	('11', 'Yuki Tsunoda', '16', 'Finished'),
	('11', 'Sebastian Vettel', '17', 'Finished'),
	('11', 'Carlos Sainz', '18', 'Retired'),
	('11', 'Nicholas Latifi', '19', 'Retired'),
	('11', 'Sergio Pérez', '20', 'Retired');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('12', 'Max Verstappen', '1', 'Finished'),
	('12', 'Lewis Hamilton', '2', 'Finished'),
	('12', 'George Russell', '3', 'Finished'),
	('12', 'Sergio Pérez', '4', 'Finished'),
	('12', 'Carlos Sainz', '5', 'Finished'),
	('12', 'Fernando Alonso', '6', 'Finished'),
	('12', 'Lando Norris', '7', 'Finished'),
	('12', 'Esteban Ocon', '8', 'Finished'),
	('12', 'Daniel Ricciardo', '9', 'Finished'),
	('12', 'Lance Stroll', '10', 'Finished'),
	('12', 'Sebastian Vettel', '11', 'Finished'),
	('12', 'Pierre Gasly', '12', 'Finished'),
	('12', 'Alexander Albon', '13', 'Finished'),
	('12', 'Valtteri Bottas', '14', 'Finished'),
	('12', 'Mick Schumacher', '15', 'Finished'),
	('12', 'Zhou Guanyu', '16', 'Finished'),
	('12', 'Nicholas Latifi', '17', 'Retired'),
	('12', 'Kevin Magnussen', '18', 'Retired'),
	('12', 'Charles Leclerc', '19', 'Retired'),
	('12', 'Yuki Tsunoda', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('13', 'Max Verstappen', '1', 'Finished'),
	('13', 'Lewis Hamilton', '2', 'Finished'),
	('13', 'George Russell', '3', 'Finished'),
	('13', 'Carlos Sainz', '4', 'Finished'),
	('13', 'Sergio Pérez', '5', 'Finished'),
	('13', 'Charles Leclerc', '6', 'Finished'),
	('13', 'Lando Norris', '7', 'Finished'),
	('13', 'Fernando Alonso', '8', 'Finished'),
	('13', 'Esteban Ocon', '9', 'Finished'),
	('13', 'Sebastian Vettel', '10', 'Finished'),
	('13', 'Lance Stroll', '11', 'Finished'),
	('13', 'Pierre Gasly', '12', 'Finished'),
	('13', 'Zhou Guanyu', '13', 'Finished'),
	('13', 'Mick Schumacher', '14', 'Finished'),
	('13', 'Daniel Ricciardo', '15', 'Finished'),
	('13', 'Kevin Magnussen', '16', 'Finished'),
	('13', 'Alexander Albon', '17', 'Finished'),
	('13', 'Nicholas Latifi', '18', 'Finished'),
	('13', 'Yuki Tsunoda', '19', 'Finished'),
	('13', 'Valtteri Bottas', '20', 'Finished');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('14', 'Max Verstappen', '1', 'Finished'),
	('14', 'Sergio Pérez', '2', 'Finished'),
	('14', 'Carlos Sainz', '3', 'Finished'),
	('14', 'George Russell', '4', 'Finished'),
	('14', 'Fernando Alonso', '5', 'Finished'),
	('14', 'Charles Leclerc', '6', 'Finished'),
	('14', 'Esteban Ocon', '7', 'Finished'),
	('14', 'Sebastian Vettel', '8', 'Finished'),
	('14', 'Pierre Gasly', '9', 'Finished'),
	('14', 'Alexander Albon', '10', 'Finished'),
	('14', 'Lance Stroll', '11', 'Finished'),
	('14', 'Lando Norris', '12', 'Finished'),
	('14', 'Yuki Tsunoda', '13', 'Finished'),
	('14', 'Zhou Guanyu', '14', 'Finished'),
	('14', 'Daniel Ricciardo', '15', 'Finished'),
	('14', 'Kevin Magnussen', '16', 'Finished'),
	('14', 'Mick Schumacher', '17', 'Finished'),
	('14', 'Nicholas Latifi', '18', 'Finished'),
	('14', 'Valtteri Bottas', '19', 'Retired'),
	('14', 'Lewis Hamilton', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('15', 'Max Verstappen', '1', 'Finished'),
	('15', 'George Russell', '2', 'Finished'),
	('15', 'Charles Leclerc', '3', 'Finished'),
	('15', 'Lewis Hamilton', '4', 'Finished'),
	('15', 'Sergio Pérez', '5', 'Finished'),
	('15', 'Fernando Alonso', '6', 'Finished'),
	('15', 'Lando Norris', '7', 'Finished'),
	('15', 'Carlos Sainz', '8', 'Finished'),
	('15', 'Esteban Ocon', '9', 'Finished'),
	('15', 'Lance Stroll', '10', 'Finished'),
	('15', 'Pierre Gasly', '11', 'Finished'),
	('15', 'Alexander Albon', '12', 'Finished'),
	('15', 'Mick Schumacher', '13', 'Finished'),
	('15', 'Sebastian Vettel', '14', 'Finished'),
	('15', 'Kevin Magnussen', '15', 'Finished'),
	('15', 'Zhou Guanyu', '16', 'Finished'),
	('15', 'Daniel Ricciardo', '17', 'Finished'),
	('15', 'Nicholas Latifi', '18', 'Finished'),
	('15', 'Valtteri Bottas', '19', 'Retired'),
	('15', 'Yuki Tsunoda', '20', 'Retired');

insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('16', 'Max Verstappen', '1', 'Finished'),
	('16', 'Charles Leclerc', '2', 'Finished'),
	('16', 'George Russell', '3', 'Finished'),
	('16', 'Carlos Sainz', '4', 'Finished'),
	('16', 'Lewis Hamilton', '5', 'Finished'),
	('16', 'Sergio Pérez', '6', 'Finished'),
	('16', 'Lando Norris', '7', 'Finished'),
	('16', 'Pierre Gasly', '8', 'Finished'),
	('16', 'Nyck de Vries', '9', 'Finished'),
	('16', 'Zhou Guanyu', '10', 'Finished'),
	('16', 'Esteban Ocon', '11', 'Finished'),
	('16', 'Mick Schumacher', '12', 'Finished'),
	('16', 'Valtteri Bottas', '13', 'Finished'),
	('16', 'Yuki Tsunoda', '14', 'Finished'),
	('16', 'Nicholas Latifi', '15', 'Finished'),
	('16', 'Kevin Magnussen', '16', 'Finished'),
	('16', 'Daniel Ricciardo', '17', 'Retired'),
	('16', 'Lance Stroll', '18', 'Retired'),
	('16', 'Fernando Alonso', '19', 'Retired'),
	('16', 'Sebastian Vettel', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('17', 'Sergio Pérez', '1', 'Finished'),
	('17', 'Charles Leclerc', '2', 'Finished'),
	('17', 'Carlos Sainz', '3', 'Finished'),
	('17', 'Lando Norris', '4', 'Finished'),
	('17', 'Daniel Ricciardo', '5', 'Finished'),
	('17', 'Lance Stroll', '6', 'Finished'),
	('17', 'Max Verstappen', '7', 'Finished'),
	('17', 'Sebastian Vettel', '8', 'Finished'),
	('17', 'Lewis Hamilton', '9', 'Finished'),
	('17', 'Pierre Gasly', '10', 'Finished'),
	('17', 'Valtteri Bottas', '11', 'Finished'),
	('17', 'Kevin Magnussen', '12', 'Finished'),
	('17', 'Mick Schumacher', '13', 'Finished'),
	('17', 'George Russell', '14', 'Finished'),
	('17', 'Yuki Tsunoda', '15', 'Retired'),
	('17', 'Esteban Ocon', '16', 'Retired'),
	('17', 'Alexander Albon', '17', 'Retired'),
	('17', 'Fernando Alonso', '18', 'Retired'),
	('17', 'Nicholas Latifi', '19', 'Retired'),
	('17', 'Zhou Guanyu', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('18', 'Max Verstappen', '1', 'Finished'),
	('18', 'Sergio Pérez', '2', 'Finished'),
	('18', 'Charles Leclerc', '3', 'Finished'),
	('18', 'Esteban Ocon', '4', 'Finished'),
	('18', 'Lewis Hamilton', '5', 'Finished'),
	('18', 'Sebastian Vettel', '6', 'Finished'),
	('18', 'Fernando Alonso', '7', 'Finished'),
	('18', 'George Russell', '8', 'Finished'),
	('18', 'Nicholas Latifi', '9', 'Finished'),
	('18', 'Lando Norris', '10', 'Finished'),
	('18', 'Daniel Ricciardo', '11', 'Finished'),
	('18', 'Lance Stroll', '12', 'Finished'),
	('18', 'Yuki Tsunoda', '13', 'Finished'),
	('18', 'Kevin Magnussen', '14', 'Finished'),
	('18', 'Valtteri Bottas', '15', 'Finished'),
	('18', 'Zhou Guanyu', '16', 'Finished'),
	('18', 'Mick Schumacher', '17', 'Finished'),
	('18', 'Pierre Gasly', '18', 'Finished'),
	('18', 'Carlos Sainz', '19', 'Retired'),
	('18', 'Alexander Albon', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('19', 'Max Verstappen', '1', 'Finished'),
	('19', 'Lewis Hamilton', '2', 'Finished'),
	('19', 'Charles Leclerc', '3', 'Finished'),
	('19', 'Sergio Pérez', '4', 'Finished'),
	('19', 'George Russell', '5', 'Finished'),
	('19', 'Lando Norris', '6', 'Finished'),
	('19', 'Fernando Alonso', '7', 'Finished'),
	('19', 'Sebastian Vettel', '8', 'Finished'),
	('19', 'Kevin Magnussen', '9', 'Finished'),
	('19', 'Yuki Tsunoda', '10', 'Finished'),
	('19', 'Esteban Ocon', '11', 'Finished'),
	('19', 'Zhou Guanyu', '12', 'Finished'),
	('19', 'Alexander Albon', '13', 'Finished'),
	('19', 'Pierre Gasly', '14', 'Finished'),
	('19', 'Mick Schumacher', '15', 'Finished'),
	('19', 'Daniel Ricciardo', '16', 'Finished'),
	('19', 'Nicholas Latifi', '17', 'Finished'),
	('19', 'Lance Stroll', '18', 'Retired'),
	('19', 'Valtteri Bottas', '19', 'Retired'),
	('19', 'Carlos Sainz', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('20', 'Max Verstappen', '1', 'Finished'),
	('20', 'Lewis Hamilton', '2', 'Finished'),
	('20', 'Sergio Pérez', '3', 'Finished'),
	('20', 'George Russell', '4', 'Finished'),
	('20', 'Carlos Sainz', '5', 'Finished'),
	('20', 'Charles Leclerc', '6', 'Finished'),
	('20', 'Daniel Ricciardo', '7', 'Finished'),
	('20', 'Esteban Ocon', '8', 'Finished'),
	('20', 'Lando Norris', '9', 'Finished'),
	('20', 'Valtteri Bottas', '10', 'Finished'),
	('20', 'Pierre Gasly', '11', 'Finished'),
	('20', 'Alexander Albon', '12', 'Finished'),
	('20', 'Zhou Guanyu', '13', 'Finished'),
	('20', 'Sebastian Vettel', '14', 'Finished'),
	('20', 'Lance Stroll', '15', 'Finished'),
	('20', 'Mick Schumacher', '16', 'Finished'),
	('20', 'Kevin Magnussen', '17', 'Finished'),
	('20', 'Nicholas Latifi', '18', 'Finished'),
	('20', 'Fernando Alonso', '19', 'Finished'),
	('20', 'Yuki Tsunoda', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('21', 'George Russell', '1', 'Finished'),
	('21', 'Lewis Hamilton', '2', 'Finished'),
	('21', 'Carlos Sainz', '3', 'Finished'),
	('21', 'Charles Leclerc', '4', 'Finished'),
	('21', 'Fernando Alonso', '5', 'Finished'),
	('21', 'Max Verstappen', '6', 'Finished'),
	('21', 'Sergio Pérez', '7', 'Finished'),
	('21', 'Esteban Ocon', '8', 'Finished'),
	('21', 'Valtteri Bottas', '9', 'Finished'),
	('21', 'Lance Stroll', '10', 'Finished'),
	('21', 'Sebastian Vettel', '11', 'Finished'),
	('21', 'Zhou Guanyu', '12', 'Finished'),
	('21', 'Mick Schumacher', '13', 'Finished'),
	('21', 'Pierre Gasly', '14', 'Finished'),
	('21', 'Alexander Albon', '15', 'Finished'),
	('21', 'Nicholas Latifi', '16', 'Finished'),
	('21', 'Yuki Tsunoda', '17', 'Finished'),
	('21', 'Lando Norris', '18', 'Retired'),
	('21', 'Kevin Magnussen', '19', 'Retired'),
	('21', 'Daniel Ricciardo', '20', 'Retired');
	
insert into results (gp_round, driver_name, gp_position, gp_status)
	values
	('22', 'Max Verstappen', '1', 'Finished'),
	('22', 'Charles Leclerc', '2', 'Finished'),
	('22', 'Sergio Pérez', '3', 'Finished'),
	('22', 'Carlos Sainz', '4', 'Finished'),
	('22', 'George Russell', '5', 'Finished'),
	('22', 'Lando Norris', '6', 'Finished'),
	('22', 'Esteban Ocon', '7', 'Finished'),
	('22', 'Lance Stroll', '8', 'Finished'),
	('22', 'Daniel Ricciardo', '9', 'Finished'),
	('22', 'Sebastian Vettel', '10', 'Finished'),
	('22', 'Yuki Tsunoda', '11', 'Finished'),
	('22', 'Zhou Guanyu', '12', 'Finished'),
	('22', 'Alexander Albon', '13', 'Finished'),
	('22', 'Pierre Gasly', '14', 'Finished'),
	('22', 'Valtteri Bottas', '15', 'Finished'),
	('22', 'Mick Schumacher', '16', 'Finished'),
	('22', 'Kevin Magnussen', '17', 'Finished'),
	('22', 'Lewis Hamilton', '18', 'Finished'),
	('22', 'Nicholas Latifi', '19', 'Finished'),
	('22', 'Fernando Alonso', '20', 'Retired');