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
    name character varying(255) NOT NULL,
    galaxy_type character varying(100),
    distance_from_earth double precision,
    age_in_million_of_years integer,
    description text,
    mass_in_million_kg integer
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    size double precision,
    orbital_period double precision,
    description text
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(100),
    mass double precision,
    distance_from_earth numeric(8,1),
    description text,
    has_life boolean
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
    name character varying(255),
    galaxy_id integer NOT NULL,
    star_type character varying(100),
    mass double precision,
    temperature double precision,
    distance_from_earth double precision,
    description text,
    has_life boolean
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
-- Name: video; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.video (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    videos character varying(40),
    name character varying(40),
    video_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.video OWNER TO freecodecamp;

--
-- Name: video_video_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.video_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_video_id_seq OWNER TO freecodecamp;

--
-- Name: video_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.video_video_id_seq OWNED BY public.video.video_id;


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
-- Name: video video_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.video ALTER COLUMN video_id SET DEFAULT nextval('public.video_video_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sprial', 0, 13500, 'Our home galaxy, contains the Solar System.', 1500000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Sprial', 2537000, 10000, 'Closest spiral galaxy to the Milky Way.', 1230000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2723000, 12000, 'Small spiral galaxy in the Local Group.', 500000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 10000, 'Famous for its interacting companion galaxy.', 900000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 31000000, 9000, 'Known for its bright core and large central bulge.', 800000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53500000, 12000, 'Home to a supermassive black hole in its center.', 3000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, 27.32, 'Earth''s natural satellite, the Moon.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.2, 0.32, 'A small moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.4, 1.26, 'A tiny moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Europa', 1, 3121.6, 3.55, 'One of Jupiter''s largest moons.');
INSERT INTO public.moon VALUES (5, 'Ganymede', 1, 5262.4, 7.15, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (6, 'Callisto', 1, 4821, 16.69, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (7, 'Titan', 6, 5149, 15.95, 'Saturn''s largest moon, with a thick atmosphere.');
INSERT INTO public.moon VALUES (8, 'Enceladus', 6, 504, 1.37, 'Known for its ice plumes.');
INSERT INTO public.moon VALUES (9, 'Proxima b Moon', 5, 3200, 5.44, 'Hypothetical moon orbiting Proxima Centauri b.');
INSERT INTO public.moon VALUES (10, 'Triton', 8, 2707, 5.88, 'Neptune''s largest moon, with retrograde orbit.');
INSERT INTO public.moon VALUES (11, 'Titania', 6, 1578, 8.71, 'One of Uranus''s large moons.');
INSERT INTO public.moon VALUES (12, 'Oberon', 6, 1523, 13.46, 'The second-largest moon of Uranus.');
INSERT INTO public.moon VALUES (13, 'Io', 1, 3643.2, 1.77, 'Volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 1528, 4.52, 'A large moon of Saturn.');
INSERT INTO public.moon VALUES (15, 'Mimas', 6, 396, 0.94, 'Known for its resemblance to the Death Star.');
INSERT INTO public.moon VALUES (16, 'Andromeda I', 7, 5200, 10.5, 'Large moon orbiting Andromeda A1.');
INSERT INTO public.moon VALUES (17, 'Triangulum I', 9, 4500, 9.2, 'A moon of the gas giant in the Triangulum Galaxy.');
INSERT INTO public.moon VALUES (18, 'Whirlpool I', 10, 3500, 8.8, 'A moon orbiting the gas giant Whirlpool B2.');
INSERT INTO public.moon VALUES (19, 'Messier Moon', 11, 6100, 20.6, 'Massive moon orbiting Messier 87 A1.');
INSERT INTO public.moon VALUES (20, 'Titan Moon', 12, 2500, 4.2, 'A moon orbiting Whirlpool B1.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4, 'Rocky', 0.055, 0.0, 'The closest planet to the Sun.', false);
INSERT INTO public.planet VALUES (2, 'Venus', 4, 'Rocky', 0.815, 0.0, 'Second planet from the Sun, with a thick atmosphere.', false);
INSERT INTO public.planet VALUES (3, 'Earth', 4, 'Rocky', 1, 0.0, 'Our home planet, the only one known to support life.', true);
INSERT INTO public.planet VALUES (4, 'Mars', 4, 'Rocky', 0.107, 0.0, 'The Red Planet, with evidence of water in its past.', false);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', 5, 'Rocky', 1.17, 4.2, 'An exoplanet orbiting in the habitable zone of Proxima Centauri.', false);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 5, 'Rocky', 1.1, 4.4, 'A possible rocky planet in the Alpha Centauri system.', false);
INSERT INTO public.planet VALUES (7, 'Andromeda A1', 6, 'Gas Giant', 300, 2537000.0, 'A massive gas giant in the Andromeda Galaxy.', false);
INSERT INTO public.planet VALUES (8, 'Andromeda A2', 6, 'Ice Giant', 15, 2537000.0, 'An icy planet far from its host star in Andromeda.', false);
INSERT INTO public.planet VALUES (9, 'Triangulum A1', 7, 'Gas Giant', 200, 2723000.0, 'A large gas planet with rings in the Triangulum Galaxy.', false);
INSERT INTO public.planet VALUES (10, 'Whirlpool B2', 8, 'Rocky', 0.9, 2300000.0, 'A rocky planet with a thin atmosphere orbiting Whirlpool B.', false);
INSERT INTO public.planet VALUES (11, 'Messier 87 A1', 9, 'Gas Giant', 400, 5350000.0, 'A massive gas giant in the Messier 87 system.', false);
INSERT INTO public.planet VALUES (12, 'Whirlpool B1', 8, 'Gas Giant', 250, 2300000.0, 'A gas giant orbiting Whirlpool B, known for its storms.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Sun', 1, 'G-type', 1, 5778, 0, 'The star of our Solar System.', true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 'G-type', 1.1, 5790, 4.37, 'Closest star system to the Sun.', false);
INSERT INTO public.star VALUES (6, 'Andromeda A', 2, 'M-type', 0.6, 3500, 2537000, 'A red dwarf in the Andromeda Galaxy.', false);
INSERT INTO public.star VALUES (7, 'Triangulum A', 3, 'A-type', 2, 9000, 2723000, 'A hot, young star in the Triangulum Galaxy.', false);
INSERT INTO public.star VALUES (8, 'Whirlpool B', 4, 'K-type', 0.8, 5000, 23000000, 'A cool star with prominent solar flares.', false);
INSERT INTO public.star VALUES (9, 'Messier 87 A', 6, 'O-type', 15, 30000, 53500000, 'A massive, hot star in the elliptical galaxy.', false);


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.video VALUES (1, 4, 1, 'GalaxyExploration.mp4', 'Galaxy Exploration', 5, 2);
INSERT INTO public.video VALUES (1, 4, 3, 'StarFormation.mp4', 'Star Formation', 6, 3);
INSERT INTO public.video VALUES (2, 5, 4, 'AndromedaTravel.mp4', 'Exploring Andromeda', 7, 5);
INSERT INTO public.video VALUES (3, 7, 5, 'TriangulumDiscovery.mp4', 'Discovering Triangulum', 8, 7);
INSERT INTO public.video VALUES (4, 8, 6, 'WhirlpoolWonders.mp4', 'Wonders of Whirlpool', 9, 9);
INSERT INTO public.video VALUES (6, 9, 7, 'MessierBlackHole.mp4', 'Messier 87 Black Hole', 10, 11);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: video_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.video_video_id_seq', 10, true);


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
-- Name: video video_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_moon_id_key UNIQUE (moon_id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (video_id);


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

