--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: sistemapedidos_marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sistemapedidos_marca (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.sistemapedidos_marca OWNER TO postgres;

--
-- Name: sistemapedidos_marca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sistemapedidos_marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sistemapedidos_marca_id_seq OWNER TO postgres;

--
-- Name: sistemapedidos_marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sistemapedidos_marca_id_seq OWNED BY public.sistemapedidos_marca.id;


--
-- Name: sistemapedidos_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sistemapedidos_pedido (
    id bigint NOT NULL,
    fecha date NOT NULL,
    estado character varying(1) NOT NULL,
    cliente_id integer NOT NULL
);


ALTER TABLE public.sistemapedidos_pedido OWNER TO postgres;

--
-- Name: sistemapedidos_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sistemapedidos_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sistemapedidos_pedido_id_seq OWNER TO postgres;

--
-- Name: sistemapedidos_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sistemapedidos_pedido_id_seq OWNED BY public.sistemapedidos_pedido.id;


--
-- Name: sistemapedidos_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sistemapedidos_producto (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL,
    precio double precision NOT NULL,
    stock integer NOT NULL,
    imagen character varying(100) NOT NULL,
    marca_id bigint NOT NULL
);


ALTER TABLE public.sistemapedidos_producto OWNER TO postgres;

--
-- Name: sistemapedidos_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sistemapedidos_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sistemapedidos_producto_id_seq OWNER TO postgres;

--
-- Name: sistemapedidos_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sistemapedidos_producto_id_seq OWNED BY public.sistemapedidos_producto.id;


--
-- Name: sistemapedidos_productopedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sistemapedidos_productopedido (
    id bigint NOT NULL,
    cantidad integer NOT NULL,
    pedido_id bigint NOT NULL,
    producto_id bigint NOT NULL
);


ALTER TABLE public.sistemapedidos_productopedido OWNER TO postgres;

--
-- Name: sistemapedidos_productopedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sistemapedidos_productopedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sistemapedidos_productopedido_id_seq OWNER TO postgres;

--
-- Name: sistemapedidos_productopedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sistemapedidos_productopedido_id_seq OWNED BY public.sistemapedidos_productopedido.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: sistemapedidos_marca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_marca ALTER COLUMN id SET DEFAULT nextval('public.sistemapedidos_marca_id_seq'::regclass);


--
-- Name: sistemapedidos_pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_pedido ALTER COLUMN id SET DEFAULT nextval('public.sistemapedidos_pedido_id_seq'::regclass);


--
-- Name: sistemapedidos_producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_producto ALTER COLUMN id SET DEFAULT nextval('public.sistemapedidos_producto_id_seq'::regclass);


--
-- Name: sistemapedidos_productopedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_productopedido ALTER COLUMN id SET DEFAULT nextval('public.sistemapedidos_productopedido_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add producto	7	add_producto
26	Can change producto	7	change_producto
27	Can delete producto	7	delete_producto
28	Can view producto	7	view_producto
29	Can add producto pedido	8	add_productopedido
30	Can change producto pedido	8	change_productopedido
31	Can delete producto pedido	8	delete_productopedido
32	Can view producto pedido	8	view_productopedido
33	Can add pedido	9	add_pedido
34	Can change pedido	9	change_pedido
35	Can delete pedido	9	delete_pedido
36	Can view pedido	9	view_pedido
37	Can add marca	10	add_marca
38	Can change marca	10	change_marca
39	Can delete marca	10	delete_marca
40	Can view marca	10	view_marca
41	Can add Token	11	add_token
42	Can change Token	11	change_token
43	Can delete Token	11	delete_token
44	Can view Token	11	view_token
45	Can add token	12	add_tokenproxy
46	Can change token	12	change_tokenproxy
47	Can delete token	12	delete_tokenproxy
48	Can view token	12	view_tokenproxy
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$320000$2cQj30iBIcwrcbQndRRVPa$lb7AiIpuZhHOrytso0nMs97YBZVqgXX57QF+Jl+8px8=	2022-05-12 07:20:25.076272-03	f	ignacio			curso@curso.com	f	t	2022-05-11 13:35:07.860463-03
2	pbkdf2_sha256$260000$9KAca4qQsjn1vT2EIwgSl3$rBI8b+fB+E1/CBDeWNPSb3UJeTM8mcwOAR7Js1bUAsY=	2022-06-23 12:43:14.308565-03	f	Gtorres10			gaabi.torrs@hotmail.com	f	t	2022-05-05 21:36:49.511077-03
1	pbkdf2_sha256$320000$mnHIi0BYuBAemGjhnYZ455$ynRR8R+dgayL+Ml5WoLPsKyLH47J+i8V85CRd6j9R1E=	2022-06-18 21:59:50.069634-03	t	Gtorres			gaabi.torrs@hotmail.com	t	t	2022-05-02 13:58:41.05531-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
f5dfedb63f804a58d6dcea665f75b04a925e8267	2022-06-23 11:20:30.134778-03	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-05-03 14:45:14.155784-03	1	RedDragon	1	[{"added": {}}]	10	1
2	2022-05-03 14:45:48.799444-03	1	Teclado Mecanico	1	[{"added": {}}]	7	1
3	2022-05-06 07:26:26.456518-03	1	Pedido object (1)	1	[{"added": {}}]	9	1
4	2022-05-06 07:27:29.012801-03	1	Pedido object (1)	3		9	1
5	2022-05-06 07:27:50.819313-03	2	Pedido object (2)	1	[{"added": {}}]	9	1
6	2022-05-06 07:28:17.535001-03	2	Pedido object (2)	3		9	1
7	2022-05-06 07:28:32.74169-03	3	Pedido object (3)	1	[{"added": {}}]	9	1
8	2022-05-06 07:31:35.929593-03	1	ProductoPedido object (1)	1	[{"added": {}}]	8	1
9	2022-05-11 14:10:00.418377-03	3	bbd78fbfe5c59a00eeeb35e1a92dc6b65c024bed	3		12	1
10	2022-05-11 14:10:04.684734-03	2	ee0a1b5df51e44c494851036eff7006ae1be4cb1	3		12	1
11	2022-05-20 10:50:20.756603-03	2	AURICULARES HYLAS	1	[{"added": {}}]	7	1
12	2022-05-20 10:51:25.009827-03	2	Microsoft Xbox	1	[{"added": {}}]	10	1
13	2022-05-20 10:51:55.932453-03	3	Xbox Series X	1	[{"added": {}}]	7	1
14	2022-05-20 10:52:40.095355-03	1	Teclado Mecanico	2	[{"changed": {"fields": ["Precio"]}}]	7	1
15	2022-05-23 08:04:53.136693-03	3	Pedido object (3)	2	[]	9	1
16	2022-06-16 16:59:00.976987-03	4	Pedido object (4)	1	[{"added": {}}]	9	1
17	2022-06-16 16:59:09.824206-03	1	ProductoPedido object (1)	2	[]	8	1
18	2022-06-16 16:59:24.447988-03	2	ProductoPedido object (2)	1	[{"added": {}}]	8	1
19	2022-06-16 17:19:20.982752-03	2	aefe18148fbaacd4e222b5a69ba4cb3cc0f843bc	3		12	1
20	2022-06-16 17:19:25.531745-03	1	e64b32c5529255c83a38ce776668dbd5efd1d587	3		12	1
21	2022-06-16 17:19:28.095241-03	3	cb372bc367a845887fe445f17ec90df9778df579	3		12	1
22	2022-06-17 17:51:18.565112-03	2	316f5751c0a1f5a9e290d942f9f2315780632a1e	3		12	1
23	2022-06-18 11:37:38.880497-03	4	Pedido object (4)	3		9	1
24	2022-06-18 11:37:38.896481-03	3	Pedido object (3)	3		9	1
25	2022-06-19 10:56:29.292957-03	6	Pedido object (6)	2	[{"changed": {"fields": ["Estado"]}}]	9	1
26	2022-06-19 10:56:54.744582-03	3	ProductoPedido object (3)	1	[{"added": {}}]	8	1
27	2022-06-19 10:57:01.394001-03	6	Pedido object (6)	2	[]	9	1
28	2022-06-23 11:22:58.260259-03	10	10	2	[{"changed": {"fields": ["Estado"]}}]	9	1
29	2022-06-23 11:23:24.414414-03	10	10	2	[{"changed": {"fields": ["Estado"]}}]	9	1
30	2022-06-23 11:29:45.471768-03	1	Teclado Mecanico	2	[]	7	1
31	2022-06-23 16:23:22.028209-03	3	Xbox Series X	2	[{"changed": {"fields": ["Imagen"]}}]	7	1
32	2022-06-23 16:23:37.105416-03	2	AURICULARES HYLAS	2	[{"changed": {"fields": ["Imagen"]}}]	7	1
33	2022-06-23 16:23:46.317209-03	1	Teclado Mecanico	2	[{"changed": {"fields": ["Imagen"]}}]	7	1
34	2022-06-23 16:24:04.403088-03	1	Teclado Mecanico	2	[]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sistemapedidos	producto
8	sistemapedidos	productopedido
9	sistemapedidos	pedido
10	sistemapedidos	marca
11	authtoken	token
12	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-02 13:49:26.379614-03
2	auth	0001_initial	2022-05-02 13:49:28.769362-03
3	admin	0001_initial	2022-05-02 13:49:28.952581-03
4	admin	0002_logentry_remove_auto_add	2022-05-02 13:49:28.964575-03
5	admin	0003_logentry_add_action_flag_choices	2022-05-02 13:49:28.977316-03
6	contenttypes	0002_remove_content_type_name	2022-05-02 13:49:29.110862-03
7	auth	0002_alter_permission_name_max_length	2022-05-02 13:49:29.124854-03
8	auth	0003_alter_user_email_max_length	2022-05-02 13:49:29.142844-03
9	auth	0004_alter_user_username_opts	2022-05-02 13:49:29.161829-03
10	auth	0005_alter_user_last_login_null	2022-05-02 13:49:29.177819-03
11	auth	0006_require_contenttypes_0002	2022-05-02 13:49:29.333535-03
12	auth	0007_alter_validators_add_error_messages	2022-05-02 13:49:29.354019-03
13	auth	0008_alter_user_username_max_length	2022-05-02 13:49:29.484653-03
14	auth	0009_alter_user_last_name_max_length	2022-05-02 13:49:29.502296-03
15	auth	0010_alter_group_name_max_length	2022-05-02 13:49:29.517288-03
16	auth	0011_update_proxy_permissions	2022-05-02 13:49:29.529718-03
17	auth	0012_alter_user_first_name_max_length	2022-05-02 13:49:29.542673-03
18	sessions	0001_initial	2022-05-02 13:49:29.797702-03
19	sistemapedidos	0001_initial	2022-05-03 13:40:23.213399-03
20	authtoken	0001_initial	2022-05-05 21:17:04.405393-03
21	authtoken	0002_auto_20160226_1747	2022-05-05 21:17:04.766855-03
22	authtoken	0003_tokenproxy	2022-05-05 21:17:04.77202-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
sacc7qluoi6qm6aoubo1a1voym9oxxuo	.eJxVjEEOwiAQRe_C2hApDgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtDciTgbSCbCEJiY9gKGH8MgMOIDrPxAgLulMEJ5ew9DI6ZQhqJWL0_7ys4rA:1noSKY:TsSE3O0IT5DpnleYA4dRqgmuOuXzmJOqOxh7ZF3kxqo	2022-05-24 13:03:22.676807-03
d3aqmql4fymvyn5ds23si6h4flzva3p6	.eJxVjEEOwiAQRe_C2hApDgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtDciTgbSCbCEJiY9gKGH8MgMOIDrPxAgLulMEJ5ew9DI6ZQhqJWL0_7ys4rA:1noomH:zZPCavoUYbh0pa-4sYSGN3RryoYVqh6ceoSH5wPE7qk	2022-05-25 13:01:29.70643-03
uc31859h4pjpvg5dorgplxdlm99ej9wa	.eJxVjEEOwiAQRe_C2hApDgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtDciTgbSCbCEJiY9gKGH8MgMOIDrPxAgLulMEJ5ew9DI6ZQhqJWL0_7ys4rA:1o17ch:4eITT3KMlUJ48NAKTAHlR_Swu9bzO_gXBDyF4jfDvbs	2022-06-28 11:34:27.670306-03
j1k1w75pjiyobtxagdz4u7w121vtzmgf	.eJxVjEEOwiAQRe_C2hApDgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtDciTgbSCbCEJiY9gKGH8MgMOIDrPxAgLulMEJ5ew9DI6ZQhqJWL0_7ys4rA:1o2GAt:xczA8jjLTOMXTbi5slmhoIp5eAaL3SzT-wjy0ei48pw	2022-07-01 14:54:27.514405-03
vf1gicbje4y6634av5dzla7f3h6jn2mh	.eJxVjEEOwiAQRe_C2hApDgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtDciTgbSCbCEJiY9gKGH8MgMOIDrPxAgLulMEJ5ew9DI6ZQhqJWL0_7ys4rA:1o2ZZl:PtTPtGQznXWLHerBoKjmbng1yHrM8Ig_OhqPlGI39dE	2022-07-02 11:37:25.959056-03
i3fow30s2wv28atcnc7c6gulnzl26e4u	.eJxVjEEOwiAQRe_C2hApDgWX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWRh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtDciTgbSCbCEJiY9gKGH8MgMOIDrPxAgLulMEJ5ew9DI6ZQhqJWL0_7ys4rA:1o2jI6:ShwcYyIfKaChbpglwYLPsAYGYPsR__b-H7WrgJFFvI8	2022-07-02 21:59:50.077641-03
\.


--
-- Data for Name: sistemapedidos_marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sistemapedidos_marca (id, nombre, descripcion) FROM stdin;
1	RedDragon	Una buena marca de hardware informatico y gamer
2	Microsoft Xbox	Microsoft Xbox
\.


--
-- Data for Name: sistemapedidos_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sistemapedidos_pedido (id, fecha, estado, cliente_id) FROM stdin;
5	2022-06-18	P	2
7	2022-06-19	P	2
6	2022-06-18	P	2
8	2022-06-19	P	2
9	2022-06-19	P	2
11	2022-06-23	A	2
10	2022-06-19	P	2
\.


--
-- Data for Name: sistemapedidos_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sistemapedidos_producto (id, nombre, descripcion, precio, stock, imagen, marca_id) FROM stdin;
3	Xbox Series X	Consola de Videojuegos Microsoft Xbox Series X	150000	2	img/seriesX_qTesq6X.jpg	2
2	AURICULARES HYLAS	Auriculares Gamer RGB	3000	5	img/Auris_Q63lqOj.jpg	1
1	Teclado Mecanico	Teclado Mecanico RGB	2500	2	img/teclado_IEVUair.jpg	1
\.


--
-- Data for Name: sistemapedidos_productopedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sistemapedidos_productopedido (id, cantidad, pedido_id, producto_id) FROM stdin;
3	2	6	3
4	1	8	2
5	1	8	3
6	1	9	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 34, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: sistemapedidos_marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sistemapedidos_marca_id_seq', 2, true);


--
-- Name: sistemapedidos_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sistemapedidos_pedido_id_seq', 11, true);


--
-- Name: sistemapedidos_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sistemapedidos_producto_id_seq', 3, true);


--
-- Name: sistemapedidos_productopedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sistemapedidos_productopedido_id_seq', 6, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: sistemapedidos_marca sistemapedidos_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_marca
    ADD CONSTRAINT sistemapedidos_marca_pkey PRIMARY KEY (id);


--
-- Name: sistemapedidos_pedido sistemapedidos_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_pedido
    ADD CONSTRAINT sistemapedidos_pedido_pkey PRIMARY KEY (id);


--
-- Name: sistemapedidos_producto sistemapedidos_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_producto
    ADD CONSTRAINT sistemapedidos_producto_pkey PRIMARY KEY (id);


--
-- Name: sistemapedidos_productopedido sistemapedidos_productopedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_productopedido
    ADD CONSTRAINT sistemapedidos_productopedido_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: sistemapedidos_pedido_cliente_id_f04ca47e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sistemapedidos_pedido_cliente_id_f04ca47e ON public.sistemapedidos_pedido USING btree (cliente_id);


--
-- Name: sistemapedidos_producto_marca_id_c199815e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sistemapedidos_producto_marca_id_c199815e ON public.sistemapedidos_producto USING btree (marca_id);


--
-- Name: sistemapedidos_productopedido_pedido_id_2e02ace6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sistemapedidos_productopedido_pedido_id_2e02ace6 ON public.sistemapedidos_productopedido USING btree (pedido_id);


--
-- Name: sistemapedidos_productopedido_producto_id_9f3498a6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sistemapedidos_productopedido_producto_id_9f3498a6 ON public.sistemapedidos_productopedido USING btree (producto_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemapedidos_pedido sistemapedidos_pedido_cliente_id_f04ca47e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_pedido
    ADD CONSTRAINT sistemapedidos_pedido_cliente_id_f04ca47e_fk_auth_user_id FOREIGN KEY (cliente_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemapedidos_producto sistemapedidos_produ_marca_id_c199815e_fk_sistemape; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_producto
    ADD CONSTRAINT sistemapedidos_produ_marca_id_c199815e_fk_sistemape FOREIGN KEY (marca_id) REFERENCES public.sistemapedidos_marca(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemapedidos_productopedido sistemapedidos_produ_pedido_id_2e02ace6_fk_sistemape; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_productopedido
    ADD CONSTRAINT sistemapedidos_produ_pedido_id_2e02ace6_fk_sistemape FOREIGN KEY (pedido_id) REFERENCES public.sistemapedidos_pedido(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemapedidos_productopedido sistemapedidos_produ_producto_id_9f3498a6_fk_sistemape; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistemapedidos_productopedido
    ADD CONSTRAINT sistemapedidos_produ_producto_id_9f3498a6_fk_sistemape FOREIGN KEY (producto_id) REFERENCES public.sistemapedidos_producto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

