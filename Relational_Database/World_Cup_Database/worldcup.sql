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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(255) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 312, 313, 4, 2);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 314, 315, 2, 0);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 313, 315, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 312, 314, 1, 0);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 313, 316, 3, 2);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 315, 317, 2, 0);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 314, 318, 2, 1);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 312, 319, 2, 0);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 315, 320, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 317, 321, 1, 0);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 314, 322, 3, 2);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 318, 323, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 313, 324, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 316, 325, 2, 1);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 319, 326, 2, 1);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 312, 327, 4, 3);
INSERT INTO public.games VALUES (49, 2014, 'Final', 328, 327, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 329, 318, 3, 0);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 327, 329, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 328, 318, 7, 1);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 329, 330, 1, 0);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 327, 314, 1, 0);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 318, 320, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 328, 312, 1, 0);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 318, 331, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 320, 319, 2, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 312, 332, 2, 0);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 328, 333, 2, 1);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 329, 323, 2, 1);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 330, 334, 2, 1);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 327, 321, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 314, 335, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (312, 'France');
INSERT INTO public.teams VALUES (313, 'Croatia');
INSERT INTO public.teams VALUES (314, 'Belgium');
INSERT INTO public.teams VALUES (315, 'England');
INSERT INTO public.teams VALUES (316, 'Russia');
INSERT INTO public.teams VALUES (317, 'Sweden');
INSERT INTO public.teams VALUES (318, 'Brazil');
INSERT INTO public.teams VALUES (319, 'Uruguay');
INSERT INTO public.teams VALUES (320, 'Colombia');
INSERT INTO public.teams VALUES (321, 'Switzerland');
INSERT INTO public.teams VALUES (322, 'Japan');
INSERT INTO public.teams VALUES (323, 'Mexico');
INSERT INTO public.teams VALUES (324, 'Denmark');
INSERT INTO public.teams VALUES (325, 'Spain');
INSERT INTO public.teams VALUES (326, 'Portugal');
INSERT INTO public.teams VALUES (327, 'Argentina');
INSERT INTO public.teams VALUES (328, 'Germany');
INSERT INTO public.teams VALUES (329, 'Netherlands');
INSERT INTO public.teams VALUES (330, 'Costa Rica');
INSERT INTO public.teams VALUES (331, 'Chile');
INSERT INTO public.teams VALUES (332, 'Nigeria');
INSERT INTO public.teams VALUES (333, 'Algeria');
INSERT INTO public.teams VALUES (334, 'Greece');
INSERT INTO public.teams VALUES (335, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 335, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

