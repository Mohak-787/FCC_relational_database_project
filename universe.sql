--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    discovered_year integer,
    is_periodic boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age_in_millions_of_year integer,
    is_spiral boolean,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    distance_from_earth numeric
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
    age_in_millions_of_year integer,
    has_life boolean,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    distance_from_earth numeric,
    planet_id integer
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
    age_in_millions_of_year integer,
    has_life boolean,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    distance_from_earth numeric,
    star_id integer
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
    age_in_millions_of_year integer,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    distance_from_earth numeric,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'A periodic comet visible every 76 years', 1705, true);
INSERT INTO public.comet VALUES (2, 'Encke', 'Short-period comet', 1819, true);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 'A bright comet that passed close to Earth', 1996, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 13600, true, 'Milky Way', 'Our home galaxy', 0);
INSERT INTO public.galaxy VALUES (2, 10000, true, 'Andromeda', 'Nearest major galaxy', 2500000);
INSERT INTO public.galaxy VALUES (3, 10000, true, 'Triangulum', 'Small spiral galaxy', 3000000);
INSERT INTO public.galaxy VALUES (4, 13000, false, 'Sombrero', 'Bright galaxy with dust lane', 29000000);
INSERT INTO public.galaxy VALUES (5, 400, true, 'Whirlpool', 'Face-on spiral galaxy', 23000000);
INSERT INTO public.galaxy VALUES (6, 13000, false, 'Messier 87', 'Large elliptical galaxy', 53000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4500, false, 'Moon', 'Earth’s natural satellite', 1, 3);
INSERT INTO public.moon VALUES (2, 4500, false, 'Phobos', 'Moon of Mars', 1.52, 4);
INSERT INTO public.moon VALUES (3, 4500, false, 'Deimos', 'Moon of Mars', 1.52, 4);
INSERT INTO public.moon VALUES (4, 4500, false, 'Io', 'Volcanic moon of Jupiter', 5.2, 5);
INSERT INTO public.moon VALUES (5, 4500, false, 'Europa', 'Icy moon of Jupiter', 5.2, 5);
INSERT INTO public.moon VALUES (6, 4500, false, 'Ganymede', 'Largest moon in the solar system', 5.2, 5);
INSERT INTO public.moon VALUES (7, 4500, false, 'Callisto', 'Cratered moon of Jupiter', 5.2, 5);
INSERT INTO public.moon VALUES (8, 4500, false, 'Titan', 'Largest moon of Saturn', 9.5, 6);
INSERT INTO public.moon VALUES (9, 4500, false, 'Enceladus', 'Icy geysers moon', 9.5, 6);
INSERT INTO public.moon VALUES (10, 4500, false, 'Mimas', 'Saturn moon with crater', 9.5, 6);
INSERT INTO public.moon VALUES (11, 4500, false, 'Tethys', 'Icy moon', 9.5, 6);
INSERT INTO public.moon VALUES (12, 4500, false, 'Dione', 'Moon of Saturn', 9.5, 6);
INSERT INTO public.moon VALUES (13, 4500, false, 'Rhea', 'Moon of Saturn', 9.5, 6);
INSERT INTO public.moon VALUES (14, 4500, false, 'Iapetus', 'Two-tone moon', 9.5, 6);
INSERT INTO public.moon VALUES (15, 4500, false, 'Triton', 'Moon of Neptune', 30, 8);
INSERT INTO public.moon VALUES (16, 4500, false, 'Nereid', 'Moon of Neptune', 30, 8);
INSERT INTO public.moon VALUES (17, 4500, false, 'Proteus', 'Moon of Neptune', 30, 8);
INSERT INTO public.moon VALUES (18, 4500, false, 'Larissa', 'Moon of Neptune', 30, 8);
INSERT INTO public.moon VALUES (19, 4500, false, 'Galatea', 'Moon of Neptune', 30, 8);
INSERT INTO public.moon VALUES (20, 4500, false, 'Despina', 'Moon of Neptune', 30, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 4500, false, 'Mercury', 'Closest planet to the Sun', 0.39, 1);
INSERT INTO public.planet VALUES (2, 4500, false, 'Venus', 'Hot planet', 0.72, 1);
INSERT INTO public.planet VALUES (3, 4500, true, 'Earth', 'Our home planet', 1, 1);
INSERT INTO public.planet VALUES (4, 4500, false, 'Mars', 'Red planet', 1.52, 1);
INSERT INTO public.planet VALUES (5, 4500, false, 'Jupiter', 'Gas giant', 5.2, 1);
INSERT INTO public.planet VALUES (6, 4500, false, 'Saturn', 'Ringed planet', 9.5, 1);
INSERT INTO public.planet VALUES (7, 4500, false, 'Uranus', 'Ice giant', 19.8, 1);
INSERT INTO public.planet VALUES (8, 4500, false, 'Neptune', 'Farthest planet', 30, 1);
INSERT INTO public.planet VALUES (9, 4000, false, 'Kepler-22b', 'Exoplanet in habitable zone', 600, 2);
INSERT INTO public.planet VALUES (10, 6000, false, 'Kepler-452b', 'Super Earth', 1400, 2);
INSERT INTO public.planet VALUES (11, 4500, false, 'Proxima b', 'Nearest exoplanet', 4.24, 5);
INSERT INTO public.planet VALUES (12, 455, false, 'Vega b', 'Hypothetical exoplanet', 25, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 4600, 'Sun', 'The star of our solar system', 0, 1);
INSERT INTO public.star VALUES (2, 200, 'Sirius', 'Brightest star in night sky', 8.6, 1);
INSERT INTO public.star VALUES (3, 8, 'Betelgeuse', 'Red supergiant star', 642.5, 1);
INSERT INTO public.star VALUES (4, 8, 'Rigel', 'Bright blue supergiant', 860, 1);
INSERT INTO public.star VALUES (5, 4500, 'Proxima Centauri', 'Closest star to the Sun', 4.24, 1);
INSERT INTO public.star VALUES (6, 455, 'Vega', 'Bright star in Lyra', 25, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

