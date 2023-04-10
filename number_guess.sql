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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    id_game integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_id_game_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_id_game_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_game_seq OWNER TO freecodecamp;

--
-- Name: games_id_game_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_id_game_seq OWNED BY public.games.id_game;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    date_register date DEFAULT now() NOT NULL,
    fewest_number integer,
    games_played integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games id_game; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN id_game SET DEFAULT nextval('public.games_id_game_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1);
INSERT INTO public.games VALUES (2, 3);
INSERT INTO public.games VALUES (3, 3);
INSERT INTO public.games VALUES (4, 1);
INSERT INTO public.games VALUES (5, 1);
INSERT INTO public.games VALUES (6, 1);
INSERT INTO public.games VALUES (7, 4);
INSERT INTO public.games VALUES (8, 5);
INSERT INTO public.games VALUES (9, 5);
INSERT INTO public.games VALUES (10, 6);
INSERT INTO public.games VALUES (11, 6);
INSERT INTO public.games VALUES (12, 5);
INSERT INTO public.games VALUES (13, 5);
INSERT INTO public.games VALUES (14, 5);
INSERT INTO public.games VALUES (15, 7);
INSERT INTO public.games VALUES (16, 7);
INSERT INTO public.games VALUES (17, 8);
INSERT INTO public.games VALUES (18, 8);
INSERT INTO public.games VALUES (19, 7);
INSERT INTO public.games VALUES (20, 7);
INSERT INTO public.games VALUES (21, 7);
INSERT INTO public.games VALUES (22, 9);
INSERT INTO public.games VALUES (23, 9);
INSERT INTO public.games VALUES (24, 10);
INSERT INTO public.games VALUES (25, 9);
INSERT INTO public.games VALUES (26, 9);
INSERT INTO public.games VALUES (27, 9);
INSERT INTO public.games VALUES (28, 12);
INSERT INTO public.games VALUES (29, 14);
INSERT INTO public.games VALUES (30, 14);
INSERT INTO public.games VALUES (31, 12);
INSERT INTO public.games VALUES (32, 12);
INSERT INTO public.games VALUES (33, 12);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'user_1681159730321', '2023-04-10', 2, 2);
INSERT INTO public.users VALUES (1, 'user_1681159730322', '2023-04-10', 5, 4);
INSERT INTO public.users VALUES (4, 'Al', '2023-04-10', 8, 1);
INSERT INTO public.users VALUES (6, 'user_1681159980762', '2023-04-10', 725, 2);
INSERT INTO public.users VALUES (5, 'user_1681159980763', '2023-04-10', 358, 5);
INSERT INTO public.users VALUES (8, 'user_1681160706346', '2023-04-10', 649, 2);
INSERT INTO public.users VALUES (7, 'user_1681160706347', '2023-04-10', 137, 5);
INSERT INTO public.users VALUES (10, 'user_1681161170601', '2023-04-10', 514, 1);
INSERT INTO public.users VALUES (9, 'user_1681161170602', '2023-04-10', 388, 5);
INSERT INTO public.users VALUES (14, 'user_1681161525245', '2023-04-10', 390, 2);
INSERT INTO public.users VALUES (12, 'user_1681161525246', '2023-04-10', 224, 4);


--
-- Name: games_id_game_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_id_game_seq', 33, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id_game);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--