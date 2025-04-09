--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.1

-- Started on 2025-04-09 17:38:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 24634)
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(100) NOT NULL
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24633)
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 217
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- TOC entry 223 (class 1259 OID 24662)
-- Name: questoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questoes (
    id integer NOT NULL,
    dimensao character varying(10),
    questao text,
    r1 text,
    r2 text,
    r3 text,
    r4 text,
    gabarito text
);


ALTER TABLE public.questoes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24661)
-- Name: questoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questoes_id_seq OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 222
-- Name: questoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questoes_id_seq OWNED BY public.questoes.id;


--
-- TOC entry 220 (class 1259 OID 24643)
-- Name: resultados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resultados (
    id integer NOT NULL,
    id_aluno integer,
    dimensao character varying(10),
    resultado character varying(10),
    parametro character varying(50)
);


ALTER TABLE public.resultados OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24642)
-- Name: resultados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resultados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resultados_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 219
-- Name: resultados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resultados_id_seq OWNED BY public.resultados.id;


--
-- TOC entry 221 (class 1259 OID 24654)
-- Name: videoaulas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videoaulas (
    dimensao character varying(10) NOT NULL,
    link text
);


ALTER TABLE public.videoaulas OWNER TO postgres;

--
-- TOC entry 4756 (class 2604 OID 24637)
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 24665)
-- Name: questoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes ALTER COLUMN id SET DEFAULT nextval('public.questoes_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 24646)
-- Name: resultados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultados ALTER COLUMN id SET DEFAULT nextval('public.resultados_id_seq'::regclass);


--
-- TOC entry 4916 (class 0 OID 24634)
-- Dependencies: 218
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, nome, email, senha) FROM stdin;
2	Maria Oliveira	maria@email.com	minhasenha
1	João da Silva	joao@email.com	senha123
\.


--
-- TOC entry 4921 (class 0 OID 24662)
-- Dependencies: 223
-- Data for Name: questoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questoes (id, dimensao, questao, r1, r2, r3, r4, gabarito) FROM stdin;
2	D1	O triângulo possui quantos lados?	dois	três	quatro	cinco	três
1	D1	Quais das formas abaixo não é uma figura plana?	quadrado	círculo	esfera	triângulo	esfera
\.


--
-- TOC entry 4918 (class 0 OID 24643)
-- Dependencies: 220
-- Data for Name: resultados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resultados (id, id_aluno, dimensao, resultado, parametro) FROM stdin;
2	1	D2	75%	Proficiente
1	1	D1	20%	Não proficiente
3	1	D3	40%	Não proficiente
\.


--
-- TOC entry 4919 (class 0 OID 24654)
-- Dependencies: 221
-- Data for Name: videoaulas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videoaulas (dimensao, link) FROM stdin;
D1	https://www.youtube.com/watch?v=TBnIizv7leo
D2	https://www.youtube.com/watch?v=_gEm11EDh5U
D3	https://www.youtube.com/watch?v=xunLTHB6KNc
\.


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 217
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 2, true);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 222
-- Name: questoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questoes_id_seq', 2, true);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 219
-- Name: resultados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resultados_id_seq', 3, true);


--
-- TOC entry 4760 (class 2606 OID 24641)
-- Name: alunos alunos_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_email_key UNIQUE (email);


--
-- TOC entry 4762 (class 2606 OID 24639)
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 24669)
-- Name: questoes questoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes
    ADD CONSTRAINT questoes_pkey PRIMARY KEY (id);


--
-- TOC entry 4764 (class 2606 OID 24648)
-- Name: resultados resultados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultados
    ADD CONSTRAINT resultados_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 24660)
-- Name: videoaulas videoaulas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videoaulas
    ADD CONSTRAINT videoaulas_pkey PRIMARY KEY (dimensao);


--
-- TOC entry 4769 (class 2606 OID 24649)
-- Name: resultados resultados_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultados
    ADD CONSTRAINT resultados_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.alunos(id);


-- Completed on 2025-04-09 17:38:56

--
-- PostgreSQL database dump complete
--

