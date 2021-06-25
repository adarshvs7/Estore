--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    cat_name character varying(255) NOT NULL,
    "parentId" integer DEFAULT 0,
    level integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price real NOT NULL,
    currency character varying(255) DEFAULT '$'::character varying,
    "catId" integer,
    "subIdLv1" integer,
    "subIdLv2" integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, cat_name, "parentId", level, created_at, updated_at) FROM stdin;
1	Mobiles, Computers	0	0	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
2	TV, Applications, Electronics	0	0	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
3	Mens Fashion	0	0	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
4	All Mobile Phones	1	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
5	All Mobile Accessories	1	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
6	Cases Covers	1	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
7	TV	2	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
8	Washing Machines	2	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
9	Refrigerators	2	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
10	Top Wear	3	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
11	Bottom Wear	3	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
12	Footwear	3	1	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
13	Smart Phones	4	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
14	Basic Phones	4	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
15	Android	4	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
16	Chargers	5	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
17	Headsets	5	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
18	Selfie Stick	5	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
19	Hard Cases	6	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
20	Polysilicon Cases	6	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
21	Shock Proof Cases	6	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
22	LCD TV	7	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
23	LED TV	7	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
24	Android TV	7	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
25	Manual	8	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
26	Semi Automatic	8	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
27	Fully Automatic	8	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
28	Single Door	9	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
29	Double Door	9	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
30	Convertable	9	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
31	Shirt	10	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
32	T-Shirt	10	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
33	Kurtas	10	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
34	Pants	11	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
35	Shorts	11	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
36	Casual Shoes	12	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
37	Formal Shoes	12	2	2021-06-25 18:46:50.32859+05:30	2021-06-25 18:46:50.32859+05:30
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20210625113727_create_categories.js	1	2021-06-25 17:54:24.811+05:30
2	20210625121932_create_products.js	1	2021-06-25 17:54:24.907+05:30
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 2, true);


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, currency, "catId", "subIdLv1", "subIdLv2", created_at, updated_at) FROM stdin;
1	Acrantophis madagascariensis	223.440002	$	2	8	20	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
2	Francolinus swainsonii	298.76001	$	2	11	22	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
3	Macropus rufogriseus	122.110001	$	1	7	30	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
4	Marmota monax	228.240005	$	2	10	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
5	Spermophilus parryii	249.600006	$	1	10	13	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
6	Anhinga rufa	142.570007	$	2	7	32	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
7	Pycnonotus barbatus	184.75	$	3	5	23	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
8	Diomedea irrorata	276.429993	$	1	6	32	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
9	Potamochoerus porcus	210.179993	$	3	4	25	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
10	Tayassu tajacu	204.759995	$	3	9	15	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
11	Tragelaphus strepsiceros	196.889999	$	2	11	21	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
12	Physignathus cocincinus	165.740005	$	1	8	15	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
13	Dacelo novaeguineae	159.869995	$	2	4	27	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
14	Lepus townsendii	160.539993	$	3	11	32	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
15	Merops nubicus	295.51001	$	2	11	30	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
16	unavailable	298.230011	$	1	6	28	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
17	Larus fuliginosus	189.320007	$	2	12	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
18	Laniarius ferrugineus	190.660004	$	2	10	34	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
19	Aonyx capensis	195.949997	$	1	7	23	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
20	Ursus arctos	185.860001	$	3	12	32	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
21	Tachybaptus ruficollis	130.759995	$	2	7	14	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
22	Bettongia penicillata	165.729996	$	2	4	36	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
23	Zenaida asiatica	147.770004	$	3	10	31	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
24	Sula dactylatra	206.800003	$	2	9	22	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
25	Tachyglossus aculeatus	185.669998	$	3	10	21	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
26	Varanus sp.	291.869995	$	1	6	20	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
27	Acridotheres tristis	236.729996	$	1	5	28	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
28	Morelia spilotes variegata	217.070007	$	3	10	31	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
29	Lepus arcticus	180.970001	$	2	8	21	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
30	Varanus albigularis	285.73999	$	1	8	27	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
31	Hystrix cristata	227.110001	$	2	10	33	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
32	Laniarius ferrugineus	139.119995	$	2	7	26	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
33	Dasyurus maculatus	232.839996	$	2	4	32	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
34	Cacatua tenuirostris	177.940002	$	3	4	14	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
35	Milvago chimachima	191.720001	$	1	10	22	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
36	Phalacrocorax albiventer	215	$	2	8	29	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
37	Papio ursinus	244.529999	$	2	7	24	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
38	Stercorarius longicausus	205.279999	$	3	12	15	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
39	Geochelone elegans	145.050003	$	1	4	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
40	Bison bison	290.029999	$	3	4	14	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
41	Felis silvestris lybica	169.770004	$	1	11	29	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
42	Antidorcas marsupialis	135.679993	$	1	9	15	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
43	Cynictis penicillata	170.990005	$	1	9	33	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
44	Manouria emys	182.929993	$	3	11	17	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
45	Tayassu pecari	267.730011	$	3	12	33	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
46	Lutra canadensis	215.169998	$	1	5	23	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
47	Eurocephalus anguitimens	145.119995	$	2	11	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
48	Haliaeetus leucocephalus	180.559998	$	3	6	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
49	Turtur chalcospilos	123.480003	$	1	9	34	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
50	Naja haje	271.929993	$	2	6	25	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
51	Semnopithecus entellus	126.199997	$	1	8	26	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
52	Varanus komodensis	225.729996	$	3	8	29	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
53	Canis lupus baileyi	179.139999	$	3	9	26	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
54	Butorides striatus	296.519989	$	1	7	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
55	Lamprotornis nitens	284.390015	$	3	4	26	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
56	Mycteria ibis	265.190002	$	2	12	15	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
57	Trachyphonus vaillantii	135.029999	$	1	4	37	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
58	Lycaon pictus	121.860001	$	2	5	26	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
59	Papilio canadensis	154.460007	$	3	6	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
60	Dasyurus viverrinus	184.630005	$	2	9	23	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
61	Aegypius occipitalis	235.199997	$	3	5	25	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
62	Ploceus intermedius	283.75	$	3	11	23	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
63	Choriotis kori	222.809998	$	3	4	28	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
64	Pseudoleistes virescens	298.279999	$	1	4	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
65	Macropus giganteus	276.01001	$	3	10	20	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
66	Ciconia ciconia	297.279999	$	1	7	24	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
67	Stercorarius longicausus	223.570007	$	1	8	24	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
68	Cynictis penicillata	288.73999	$	3	12	37	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
69	Fratercula corniculata	215.529999	$	1	6	23	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
70	Sarkidornis melanotos	186.309998	$	3	7	19	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
71	Cervus canadensis	272.769989	$	3	12	21	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
72	Cordylus giganteus	192.25	$	1	9	37	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
73	Cervus duvauceli	266.049988	$	1	7	25	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
74	Geochelone elegans	228.100006	$	1	12	26	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
75	Limnocorax flavirostra	243.210007	$	3	4	34	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
76	Raphicerus campestris	210.339996	$	1	7	28	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
77	Crotalus cerastes	166.389999	$	2	8	14	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
78	Hystrix cristata	213.289993	$	3	10	19	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
79	Spermophilus tridecemlineatus	240.190002	$	1	9	16	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
80	Heloderma horridum	257.920013	$	2	8	31	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
81	Anser caerulescens	203.259995	$	1	11	32	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
82	Terrapene carolina	222.479996	$	1	4	20	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
83	Macropus fuliginosus	271.130005	$	2	11	29	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
84	Gazella thompsonii	249.289993	$	1	9	20	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
85	Castor canadensis	191.979996	$	3	10	22	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
86	Bettongia penicillata	203.070007	$	2	11	22	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
87	Lutra canadensis	233.770004	$	2	8	17	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
88	Varanus salvator	214.589996	$	3	4	36	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
89	Vicugna vicugna	156.610001	$	1	8	17	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
90	Corvus brachyrhynchos	249.539993	$	2	6	26	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
91	Macropus robustus	169.110001	$	1	9	35	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
92	Uraeginthus granatina	138.460007	$	2	12	25	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
93	Spheniscus magellanicus	178.669998	$	1	11	30	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
94	Canis lupus	184.610001	$	1	9	19	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
95	Anitibyx armatus	271.339996	$	3	7	15	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
96	Lasiorhinus latifrons	255.050003	$	3	4	17	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
97	Ploceus intermedius	178.339996	$	3	10	37	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
98	Chelodina longicollis	139.970001	$	1	6	16	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
99	Trichoglossus haematodus moluccanus	249.570007	$	3	11	16	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
100	Equus hemionus	190.210007	$	3	4	31	2021-06-25 18:46:50.334975+05:30	2021-06-25 18:46:50.334975+05:30
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 100, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

