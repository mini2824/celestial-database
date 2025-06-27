--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spiral boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    discovered_by text,
    age_in_millions_of_years integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    orbit_radius numeric,
    moons_count integer
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
-- Name: space_probe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_probe (
    space_probe_id integer NOT NULL,
    name character varying(100) NOT NULL,
    destination_planet_id integer,
    is_operational boolean NOT NULL,
    launch_year integer NOT NULL,
    notes text
);


ALTER TABLE public.space_probe OWNER TO freecodecamp;

--
-- Name: space_probe_space_probe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_probe_space_probe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_probe_space_probe_id_seq OWNER TO freecodecamp;

--
-- Name: space_probe_space_probe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_probe_space_probe_id_seq OWNED BY public.space_probe.space_probe_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    mass numeric
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
-- Name: space_probe space_probe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_probe ALTER COLUMN space_probe_id SET DEFAULT nextval('public.space_probe_space_probe_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy', 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 8000, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral shape', 9000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright core and dust ring', 12000, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Dwarf satellite of Milky Way', 13000, false);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Ring-shaped galaxy', 9000, false);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', 'Face-on spiral galaxy', 10000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 'Humans', 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 'Asaph Hall', 4500);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 'Asaph Hall', 4500);
INSERT INTO public.moon VALUES (4, 'Io', 3, true, 'Galileo Galilei', 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 3, true, 'Galileo Galilei', 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, true, 'Galileo Galilei', 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, 'Galileo Galilei', 4500);
INSERT INTO public.moon VALUES (8, 'Vulcan I', 5, false, 'Starfleet Records', 2000);
INSERT INTO public.moon VALUES (9, 'Kepler Moon', 4, false, 'NASA', 1000);
INSERT INTO public.moon VALUES (10, 'Gliese Rock', 6, false, 'Unknown', 2000);
INSERT INTO public.moon VALUES (11, 'Tau Ceti A', 9, true, 'ESA', 4000);
INSERT INTO public.moon VALUES (12, 'Tau Ceti B', 9, true, 'ESA', 4000);
INSERT INTO public.moon VALUES (13, 'Wolf Pup', 10, false, 'Astro Survey', 3000);
INSERT INTO public.moon VALUES (14, 'Trappist Tiny A', 11, false, 'ESA', 2000);
INSERT INTO public.moon VALUES (15, 'Trappist Tiny B', 12, false, 'ESA', 2000);
INSERT INTO public.moon VALUES (16, 'Centauri Alpha', 8, false, 'ESO', 3500);
INSERT INTO public.moon VALUES (17, 'Jupiter Moon X', 3, false, 'NASA', 1000);
INSERT INTO public.moon VALUES (18, 'Jupiter Moon Y', 3, false, 'NASA', 1000);
INSERT INTO public.moon VALUES (19, 'Jupiter Moon Z', 3, false, 'NASA', 1000);
INSERT INTO public.moon VALUES (20, 'Mystery Moon', 7, false, 'Unknown', 1000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 1.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 1.5, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, true, 5.2, 79);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 2, false, true, 600, 0);
INSERT INTO public.planet VALUES (5, 'Vulcan', 2, false, true, 0.7, 1);
INSERT INTO public.planet VALUES (6, 'Gliese 581g', 6, false, true, 0.13, 0);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', 3, false, true, 0.047, 0);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 6, false, true, 0.04, 0);
INSERT INTO public.planet VALUES (9, 'Tau Ceti f', 4, false, true, 1.35, 2);
INSERT INTO public.planet VALUES (10, 'Wolf 1061c', 6, false, true, 0.08, 1);
INSERT INTO public.planet VALUES (11, 'Trappist-1e', 6, false, true, 0.03, 0);
INSERT INTO public.planet VALUES (12, 'Trappist-1f', 6, false, true, 0.04, 0);


--
-- Data for Name: space_probe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_probe VALUES (1, 'Voyager 1', 3, true, 1977, 'Farthest man-made object');
INSERT INTO public.space_probe VALUES (2, 'Voyager 2', 4, true, 1977, 'Explored Uranus and Neptune');
INSERT INTO public.space_probe VALUES (3, 'Pioneer 10', 3, false, 1972, 'First probe to cross the asteroid belt');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, 1.0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true, 2.1);
INSERT INTO public.star VALUES (3, 'Vega', 2, 9602, true, 2.3);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 12100, false, 21.0);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 3500, false, 20.0);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 3042, true, 0.12);
INSERT INTO public.star VALUES (7, 'Altair', 1, 7550, true, 1.8);
INSERT INTO public.star VALUES (8, 'Deneb', 2, 8525, false, 19.0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_probe_space_probe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_probe_space_probe_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: space_probe space_probe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_probe
    ADD CONSTRAINT space_probe_name_key UNIQUE (name);


--
-- Name: space_probe space_probe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_probe
    ADD CONSTRAINT space_probe_pkey PRIMARY KEY (space_probe_id);


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

