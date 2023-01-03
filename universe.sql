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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    description text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: rocks; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rocks (
    rocks_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.rocks OWNER TO freecodecamp;

--
-- Name: my_serial; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_serial
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_serial OWNER TO freecodecamp;

--
-- Name: my_serial; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_serial OWNED BY public.rocks.rocks_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    description text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    description text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: rocks rocks_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocks ALTER COLUMN rocks_id SET DEFAULT nextval('public.my_serial'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 4500000, 3, false, 'The Andromeda Galaxy, also known as Messier 31');
INSERT INTO public.galaxy VALUES (2, 'NGC 4622', 4500000, 111000000, false, 'The spiral galaxy, NGC 4622 (also called Backward galaxy), lies approximately 111 million light years away from Earth in the constellation Centaurus.');
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 4500000, 3, false, 'Antennae GalaxiesAntennae GalaxiesAntennae GalaxiesAntennae GalaxiesAntennae Galaxies.');
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 4500000, 0, false, 'Milky Way is our galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 4500000, 0, false, 'Black Eye GalaxyBlack Eye Galaxy');
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 4500000, 0, false, 'Black Butterfly GalaxiesButterfly GalaxiesButterfly Galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (2, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (3, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (4, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (5, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (6, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (7, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (8, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (9, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (10, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (11, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (12, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (13, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (14, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (15, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (16, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (17, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (18, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (19, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (20, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (21, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (22, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (23, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (24, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (25, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (26, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (27, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);
INSERT INTO public.moon VALUES (28, 'Moon', 4600, 0, true, 'MoondHIP 13044bHIP 13044bHIP 13044bHIP 13044b', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4600, 0, true, 'Mercury Mercury Mercury Mercury Mercury Mercury', 7);
INSERT INTO public.planet VALUES (3, 'Earth', 4600, 0, true, 'Earth', 7);
INSERT INTO public.planet VALUES (2, 'Venus', 4600, 0, true, 'VenusVenusVenusVenusVenus', 7);
INSERT INTO public.planet VALUES (4, 'Mars', 4600, 0, true, 'Mars is the future', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600, 0, true, 'Mars JupiterJupiterJupiter', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 4600, 0, true, 'Mars SaturnSaturnSaturnSaturn', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 4600, 0, true, 'UranusUranusUranusUranus', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 4600, 0, true, 'Neptune', 7);
INSERT INTO public.planet VALUES (9, 'CoRoT-7b', 4600, 0, true, 'CoRoT-7bCoRoT-7bCoRoT-7b', 2);
INSERT INTO public.planet VALUES (10, 'Gliese 581', 4600, 0, true, 'Gliese 581Gliese 581Gliese 581Gliese 581', 7);
INSERT INTO public.planet VALUES (11, 'HD 209458b', 4600, 0, true, 'HD 209458bHD 209458bHD 209458bHD 209458b', 7);
INSERT INTO public.planet VALUES (12, 'HIP 13044b', 4600, 0, true, 'HIP 13044bHIP 13044bHIP 13044bHIP 13044b', 7);


--
-- Data for Name: rocks; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rocks VALUES (1, 'Round rock', 'Simle rock');
INSERT INTO public.rocks VALUES (2, 'Round rock', 'Simle rock');
INSERT INTO public.rocks VALUES (3, 'Round rock', 'Simle rock');
INSERT INTO public.rocks VALUES (4, 'Round rock', 'Simle rock');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4500000, 4, true, 'Proxima CentauriProxima CentauriProxima CentauriProxima Centauri', 4);
INSERT INTO public.star VALUES (2, 'Rigil Kentaurus', 4500000, 4, true, 'Rigil KentaurusRigil KentaurusRigil Kentaurus Centauri', 4);
INSERT INTO public.star VALUES (3, 'Toliman', 4500000, 4, true, 'TolimanTolimanToliman', 4);
INSERT INTO public.star VALUES (4, 'WISE 0855−0714', 4500000, 7, true, 'WISE 0855−0714WISE 0855−0714WISE 0855−0714', 4);
INSERT INTO public.star VALUES (5, 'Wolf 359', 4500000, 7, true, 'Wolf', 4);
INSERT INTO public.star VALUES (6, 'Epsilon Eridani', 4500000, 10, true, 'Epsilon EridaniEpsilon EridaniEpsilon EridaniWolf', 4);
INSERT INTO public.star VALUES (7, 'Sun', 4600, 0, true, 'As noted earlier, Earths average distance to the Sun is about 93 million miles (150 million kilometers) from the Sun.', 4);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 28, true);


--
-- Name: my_serial; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_serial', 4, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: rocks rocks_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocks
    ADD CONSTRAINT rocks_pkey PRIMARY KEY (rocks_id);


--
-- Name: rocks rocks_rocks_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocks
    ADD CONSTRAINT rocks_rocks_id_key UNIQUE (rocks_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

