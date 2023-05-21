--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    shape text,
    visibility_season_from_earth text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    morphology character varying(30),
    distance_in_light_years integer,
    diameter_in_light_years integer,
    active_galatic_nucleus boolean NOT NULL,
    discovered_date text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_moon numeric(20,10),
    diameter_moon numeric(15,5),
    distance_from_planet_in_kilometers integer NOT NULL,
    orbital_period_in_days numeric(5,2),
    surface_temperature_in_celsius integer NOT NULL,
    atmosphere_composition text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_earth numeric(10,3),
    diameter_earth numeric(10,3),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_own_star_in_light_years numeric(10,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    mass_solar numeric(10,2),
    active boolean NOT NULL,
    discovered_date integer,
    distance_in_light_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 1, 'Orion', 'Hunter', 'Winter');
INSERT INTO public.constellation VALUES (2, 2, 'Pegasus', 'Winged Horse', 'Autumn');
INSERT INTO public.constellation VALUES (3, 2, 'Andromeda', 'Princess', 'Autumn');
INSERT INTO public.constellation VALUES (4, 3, 'Triangulum', 'Triangle', 'Autumn');
INSERT INTO public.constellation VALUES (5, 4, 'Virgo', 'Sombrero Hat', 'Spring');
INSERT INTO public.constellation VALUES (6, 5, 'Centaurus', 'Centaur', 'Summer');
INSERT INTO public.constellation VALUES (7, 6, 'Dorado', 'Swordfish', 'All year');
INSERT INTO public.constellation VALUES (8, 7, 'Canes Venatici', 'Whirlpool Spiral', 'Summer');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', NULL, 100000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromedra', 'Spiral', 2537000, 220000, true, '964 CE');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 60000, false, '1784');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 31000000, 50000, true, '1781');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 12000000, 60000, true, '1826');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 160000, 14000, false, 'Prehistoric');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'Spiral', 23500000, 60000, false, '1773');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 1.0000000000, 1.00000, 384400, 27.30, -20, 'Trace gases');
INSERT INTO public.moon VALUES (2, 4, 'Ganymede', 0.0250000000, 0.41400, 1070400, 7.15, -160, NULL);
INSERT INTO public.moon VALUES (3, 4, 'Callisto', 0.0180000000, 0.37800, 1882700, 16.69, -143, NULL);
INSERT INTO public.moon VALUES (4, 4, 'Io', 0.0150000000, 0.28600, 421800, 1.77, -153, 'Sulfur dioxide');
INSERT INTO public.moon VALUES (5, 4, 'Europa', 0.0080000000, 0.24500, 671100, 3.55, -160, 'Oxygen');
INSERT INTO public.moon VALUES (6, 4, 'Amalthea', 0.0000090000, 0.05000, 181300, 0.50, -130, NULL);
INSERT INTO public.moon VALUES (7, 4, 'Himalia', 0.0002900000, 0.18300, 11465000, 250.56, -160, NULL);
INSERT INTO public.moon VALUES (8, 4, 'Elara', 0.0001300000, 0.14500, 11737000, 259.65, -160, NULL);
INSERT INTO public.moon VALUES (9, 4, 'Leda', 0.0000020000, 0.05800, 11747000, 259.65, -160, NULL);
INSERT INTO public.moon VALUES (10, 4, 'Themisto', 0.0000005000, 0.01000, 7507000, 130.02, -160, NULL);
INSERT INTO public.moon VALUES (11, 4, 'Carpo', 0.0000000000, 0.00300, 17604000, 458.62, -160, NULL);
INSERT INTO public.moon VALUES (12, 5, 'Triton', 0.0034000000, 0.20700, 354800, 5.88, -235, 'Nitrogen');
INSERT INTO public.moon VALUES (13, 6, 'Titan', 0.0220000000, 0.40400, 1221830, 15.95, -179, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (14, 6, 'Enceladus', 0.0000400000, 0.08100, 238020, 1.37, -198, 'Water vapor, Methane');
INSERT INTO public.moon VALUES (15, 6, 'Mimas', 0.0000060000, 0.06100, 185520, 0.94, -200, NULL);
INSERT INTO public.moon VALUES (16, 6, 'Tethys', 0.0000550000, 0.16300, 294660, 1.89, -187, NULL);
INSERT INTO public.moon VALUES (17, 6, 'Rhea', 0.0002300000, 0.31400, 527040, 4.52, -201, NULL);
INSERT INTO public.moon VALUES (18, 7, 'Phobos', 0.0000150000, 0.00056, 9377, 0.32, -133, NULL);
INSERT INTO public.moon VALUES (19, 7, 'Deimos', 0.0000032000, 0.00032, 23459, 1.26, -138, NULL);
INSERT INTO public.moon VALUES (20, 8, 'Titania', 0.0000240000, 0.23200, 436300, 8.71, -193, 'Nitrogen');
INSERT INTO public.moon VALUES (21, 8, 'Oberon', 0.0000210000, 0.20900, 583500, 13.46, -193, 'Methane');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 1.000, 1.000, true, true, 0.00);
INSERT INTO public.planet VALUES (2, 1, 'Mercury', 0.055, 0.382, false, true, 0.39);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 0.815, 0.949, false, true, 0.72);
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', 317.800, 11.200, false, true, 5.20);
INSERT INTO public.planet VALUES (5, 1, 'Neptune', 17.200, 3.900, false, true, 30.10);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 95.200, 9.400, false, true, 9.50);
INSERT INTO public.planet VALUES (7, 1, 'Mars', 0.107, 0.530, false, true, 1.50);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', 14.600, 4.000, false, true, 19.20);
INSERT INTO public.planet VALUES (9, 3, 'Mirach III', 5.400, 1.500, false, true, 1290.00);
INSERT INTO public.planet VALUES (10, 4, 'Alpheratz II', 2.800, 1.500, false, true, 74.20);
INSERT INTO public.planet VALUES (11, 5, 'Hamal I', 5.200, 2.200, false, true, 100.20);
INSERT INTO public.planet VALUES (12, 6, 'Spica I', 2.900, 1.600, false, true, 260.30);
INSERT INTO public.planet VALUES (13, 7, 'R Doradus II', 3.500, 1.700, false, true, 340.20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G', 1.00, true, NULL, NULL);
INSERT INTO public.star VALUES (2, 1, 'Rigel', 'O', 23.00, true, 1792, 860);
INSERT INTO public.star VALUES (3, 2, 'Mirach', 'M', 0.12, false, 1780, 2537000);
INSERT INTO public.star VALUES (4, 2, 'Alpheratz', 'A', 2.50, true, 1943, 2537000);
INSERT INTO public.star VALUES (5, 3, 'Hamal', 'G', 0.90, true, 1930, 3000000);
INSERT INTO public.star VALUES (6, 4, 'Spica', 'B', 2.50, true, 2007, 31000000);
INSERT INTO public.star VALUES (7, 6, 'R Doradus', 'M', 0.12, true, 1931, 160000);
INSERT INTO public.star VALUES (8, 7, 'Polaris', 'F', 1.20, true, 1790, 23500000);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

