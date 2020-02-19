<br />
<b>Strict Standards</b>:  Only variables should be assigned by reference in <b>/opt/lappstack-5.4.7-0/apps/phppgadmin/htdocs/classes/database/Connection.php</b> on line <b>23</b><br />
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: cbiometrico; Type: COMMENT; Schema: -; Owner: cbiometrico
--

COMMENT ON DATABASE cbiometrico IS 'Base de Datos para el sistema web biometrico';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: att_departamentos; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE att_departamentos (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL
);
ALTER TABLE ONLY att_departamentos ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY att_departamentos ALTER COLUMN nombre SET STATISTICS 0;


ALTER TABLE public.att_departamentos OWNER TO cbiometrico;

--
-- Name: att_departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE att_departamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.att_departamentos_id_seq OWNER TO cbiometrico;

--
-- Name: att_departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE att_departamentos_id_seq OWNED BY att_departamentos.id;


--
-- Name: att_departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('att_departamentos_id_seq', 4, true);


--
-- Name: att_devices; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE att_devices (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    ip character varying(20) NOT NULL,
    puerto character varying(5),
    descripcion character varying(500)
);


ALTER TABLE public.att_devices OWNER TO cbiometrico;

--
-- Name: att_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE att_devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.att_devices_id_seq OWNER TO cbiometrico;

--
-- Name: att_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE att_devices_id_seq OWNED BY att_devices.id;


--
-- Name: att_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('att_devices_id_seq', 5, true);


--
-- Name: att_horarios; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE att_horarios (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idefault boolean DEFAULT false NOT NULL,
    imorning boolean NOT NULL,
    mor_in time without time zone,
    mor_maxdelay smallint DEFAULT 0,
    mor_out time without time zone,
    mor_minout smallint DEFAULT 0,
    itarde boolean NOT NULL,
    tard_in time without time zone,
    tard_maxdelay smallint DEFAULT 0 NOT NULL,
    tard_out time without time zone,
    tard_minout smallint DEFAULT 0 NOT NULL,
    ialmuerzo boolean DEFAULT true NOT NULL,
    alm_tiempo smallint DEFAULT 0 NOT NULL,
    alm_cuadrar boolean DEFAULT true NOT NULL,
    ihediurna boolean DEFAULT false NOT NULL,
    hediurna time without time zone DEFAULT '16:00:00'::time without time zone,
    ihenocturna boolean DEFAULT false NOT NULL,
    henocturna time without time zone DEFAULT '19:00:00'::time without time zone
);
ALTER TABLE ONLY att_horarios ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY att_horarios ALTER COLUMN nombre SET STATISTICS 0;
ALTER TABLE ONLY att_horarios ALTER COLUMN idefault SET STATISTICS 0;


ALTER TABLE public.att_horarios OWNER TO cbiometrico;

--
-- Name: att_horarios_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE att_horarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.att_horarios_id_seq OWNER TO cbiometrico;

--
-- Name: att_horarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE att_horarios_id_seq OWNED BY att_horarios.id;


--
-- Name: att_horarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('att_horarios_id_seq', 6, true);


--
-- Name: att_logs; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE att_logs (
    id integer NOT NULL,
    att_persona_id integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    hashcode character varying(60) NOT NULL,
    att_device_id integer NOT NULL,
    att_horario_id integer NOT NULL
);
ALTER TABLE ONLY att_logs ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY att_logs ALTER COLUMN att_persona_id SET STATISTICS 0;


ALTER TABLE public.att_logs OWNER TO cbiometrico;

--
-- Name: att_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE att_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.att_logs_id_seq OWNER TO cbiometrico;

--
-- Name: att_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE att_logs_id_seq OWNED BY att_logs.id;


--
-- Name: att_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('att_logs_id_seq', 31109, true);


--
-- Name: att_personas; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE att_personas (
    gid integer DEFAULT nextval(('"public"."att_personas_gid_seq"'::text)::regclass) NOT NULL,
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    cedula integer NOT NULL,
    icontrato boolean DEFAULT false NOT NULL,
    att_horario_id integer NOT NULL,
    iactivo boolean DEFAULT true NOT NULL,
    att_departamento_id integer NOT NULL,
    att_device_id integer NOT NULL,
    device_manager boolean DEFAULT false NOT NULL,
    img character varying(500)
);


ALTER TABLE public.att_personas OWNER TO cbiometrico;

--
-- Name: att_personas_gid_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE att_personas_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.att_personas_gid_seq OWNER TO cbiometrico;

--
-- Name: att_personas_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('att_personas_gid_seq', 157, true);


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE departamentos (
    id integer NOT NULL,
    departamento character varying(150) NOT NULL
);


ALTER TABLE public.departamentos OWNER TO cbiometrico;

--
-- Name: departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE departamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamentos_id_seq OWNER TO cbiometrico;

--
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE departamentos_id_seq OWNED BY departamentos.id;


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('departamentos_id_seq', 31, true);


--
-- Name: fechas; Type: VIEW; Schema: public; Owner: cbiometrico
--

CREATE VIEW fechas AS
    SELECT DISTINCT att_logs.fecha, date_part('dow'::text, att_logs.fecha) AS dia FROM att_logs, att_personas WHERE (att_logs.att_persona_id = att_personas.id) ORDER BY att_logs.fecha DESC;


ALTER TABLE public.fechas OWNER TO cbiometrico;

--
-- Name: file_indexing; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE file_indexing (
    id integer NOT NULL,
    id_listing_files integer NOT NULL,
    contador integer NOT NULL
);


ALTER TABLE public.file_indexing OWNER TO cbiometrico;

--
-- Name: file_indexing_contador_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE file_indexing_contador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_indexing_contador_seq OWNER TO cbiometrico;

--
-- Name: file_indexing_contador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE file_indexing_contador_seq OWNED BY file_indexing.contador;


--
-- Name: file_indexing_contador_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('file_indexing_contador_seq', 1, false);


--
-- Name: file_indexing_id_listing_files_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE file_indexing_id_listing_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_indexing_id_listing_files_seq OWNER TO cbiometrico;

--
-- Name: file_indexing_id_listing_files_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE file_indexing_id_listing_files_seq OWNED BY file_indexing.id_listing_files;


--
-- Name: file_indexing_id_listing_files_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('file_indexing_id_listing_files_seq', 1, false);


--
-- Name: file_indexing_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE file_indexing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_indexing_id_seq OWNER TO cbiometrico;

--
-- Name: file_indexing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE file_indexing_id_seq OWNED BY file_indexing.id;


--
-- Name: file_indexing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('file_indexing_id_seq', 1, false);


--
-- Name: listing_files; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE listing_files (
    id integer NOT NULL,
    path character varying(300),
    description character varying(300)
);


ALTER TABLE public.listing_files OWNER TO cbiometrico;

--
-- Name: listing_files_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE listing_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.listing_files_id_seq OWNER TO cbiometrico;

--
-- Name: listing_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE listing_files_id_seq OWNED BY listing_files.id;


--
-- Name: listing_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('listing_files_id_seq', 12, true);


SET default_with_oids = false;

--
-- Name: seguridad_bitacora; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_bitacora (
    idbitacora integer DEFAULT nextval(('"public"."seguridad_bitacora_idbitacora_seq"'::text)::regclass) NOT NULL,
    fecha date NOT NULL,
    hora time(0) without time zone NOT NULL,
    entidad character varying(100),
    nro_registro character varying(20),
    actividad text NOT NULL,
    ip character varying(20) NOT NULL,
    idusuario integer NOT NULL,
    programa character varying(100)
);
ALTER TABLE ONLY seguridad_bitacora ALTER COLUMN idbitacora SET STATISTICS 0;


ALTER TABLE public.seguridad_bitacora OWNER TO cbiometrico;

--
-- Name: seguridad_bitacora_idbitacora_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_bitacora_idbitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_bitacora_idbitacora_seq OWNER TO cbiometrico;

--
-- Name: seguridad_bitacora_idbitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_bitacora_idbitacora_seq', 2557, true);


--
-- Name: seguridad_modulos; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_modulos (
    idmodulo integer DEFAULT nextval(('"public"."seguridad_modulos_idmodulo_seq"'::text)::regclass) NOT NULL,
    modulo character varying(50) NOT NULL,
    orden_modulo integer NOT NULL
);
ALTER TABLE ONLY seguridad_modulos ALTER COLUMN idmodulo SET STATISTICS 0;


ALTER TABLE public.seguridad_modulos OWNER TO cbiometrico;

--
-- Name: seguridad_modulos_idmodulo_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_modulos_idmodulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_modulos_idmodulo_seq OWNER TO cbiometrico;

--
-- Name: seguridad_modulos_idmodulo_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_modulos_idmodulo_seq', 7, true);


--
-- Name: seguridad_privilegios; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_privilegios (
    idprivilegio integer DEFAULT nextval(('"public"."seguridad_privilegios_idprivilegio_seq"'::text)::regclass) NOT NULL,
    privilegio character varying(30) NOT NULL
);
ALTER TABLE ONLY seguridad_privilegios ALTER COLUMN idprivilegio SET STATISTICS 0;
ALTER TABLE ONLY seguridad_privilegios ALTER COLUMN privilegio SET STATISTICS 0;


ALTER TABLE public.seguridad_privilegios OWNER TO cbiometrico;

--
-- Name: seguridad_privilegios_idprivilegio_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_privilegios_idprivilegio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_privilegios_idprivilegio_seq OWNER TO cbiometrico;

--
-- Name: seguridad_privilegios_idprivilegio_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_privilegios_idprivilegio_seq', 7, true);


--
-- Name: seguridad_programas; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_programas (
    idprograma integer DEFAULT nextval(('"public"."seguridad_programas_idprograma_seq"'::text)::regclass) NOT NULL,
    programa character varying(300) NOT NULL,
    orden_programa integer NOT NULL,
    direccion_archivo character varying(250) NOT NULL,
    direccion_imagen character varying(250),
    descripcion_programa character varying(250),
    idseccion integer NOT NULL
);
ALTER TABLE ONLY seguridad_programas ALTER COLUMN idprograma SET STATISTICS 0;


ALTER TABLE public.seguridad_programas OWNER TO cbiometrico;

--
-- Name: seguridad_programas_idprograma_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_programas_idprograma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_programas_idprograma_seq OWNER TO cbiometrico;

--
-- Name: seguridad_programas_idprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_programas_idprograma_seq', 26, true);


--
-- Name: seguridad_secciones; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_secciones (
    idseccion integer DEFAULT nextval(('"public"."seguridad_secciones_idseccion_seq"'::text)::regclass) NOT NULL,
    seccion character varying(50) NOT NULL,
    direccion_imagen character varying(250),
    orden_seccion integer NOT NULL,
    idsubmodulo integer NOT NULL
);
ALTER TABLE ONLY seguridad_secciones ALTER COLUMN idseccion SET STATISTICS 0;


ALTER TABLE public.seguridad_secciones OWNER TO cbiometrico;

--
-- Name: seguridad_secciones_idseccion_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_secciones_idseccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_secciones_idseccion_seq OWNER TO cbiometrico;

--
-- Name: seguridad_secciones_idseccion_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_secciones_idseccion_seq', 17, true);


--
-- Name: seguridad_submodulos; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_submodulos (
    idsubmodulo integer DEFAULT nextval(('"public"."seguridad_submodulos_idsubmodulo_seq"'::text)::regclass) NOT NULL,
    submodulo character varying(50) NOT NULL,
    orden_submodulo integer NOT NULL,
    idmodulo integer NOT NULL
);
ALTER TABLE ONLY seguridad_submodulos ALTER COLUMN idsubmodulo SET STATISTICS 0;


ALTER TABLE public.seguridad_submodulos OWNER TO cbiometrico;

--
-- Name: seguridad_submodulos_idsubmodulo_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_submodulos_idsubmodulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_submodulos_idsubmodulo_seq OWNER TO cbiometrico;

--
-- Name: seguridad_submodulos_idsubmodulo_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_submodulos_idsubmodulo_seq', 8, true);


--
-- Name: seguridad_usuarios; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_usuarios (
    idusuario integer DEFAULT nextval(('"public"."seguridad_usuarios_idusuario_seq"'::text)::regclass) NOT NULL,
    cedula character varying(10) NOT NULL,
    usuario character varying(20) NOT NULL,
    contrasena character varying(50) NOT NULL,
    estatus character varying(8) NOT NULL,
    fecha_registro date NOT NULL,
    idtemp character varying(50)
);
ALTER TABLE ONLY seguridad_usuarios ALTER COLUMN idusuario SET STATISTICS 0;


ALTER TABLE public.seguridad_usuarios OWNER TO cbiometrico;

--
-- Name: seguridad_usuarios_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_usuarios_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_usuarios_idusuario_seq OWNER TO cbiometrico;

--
-- Name: seguridad_usuarios_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_usuarios_idusuario_seq', 13, true);


--
-- Name: seguridad_usuarios_programas_privilegios; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE seguridad_usuarios_programas_privilegios (
    idusuarios_programas_privilegios integer DEFAULT nextval(('"public"."seguridad_usuarios_programas_privilegios_idusuarios_programas_privilegios_seq"'::text)::regclass) NOT NULL,
    idusuario integer NOT NULL,
    idprograma integer NOT NULL,
    idprivilegio integer NOT NULL
);


ALTER TABLE public.seguridad_usuarios_programas_privilegios OWNER TO cbiometrico;

--
-- Name: seguridad_usuarios_programas_privilegios_idusuarios_programas_p; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE seguridad_usuarios_programas_privilegios_idusuarios_programas_p
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.seguridad_usuarios_programas_privilegios_idusuarios_programas_p OWNER TO cbiometrico;

--
-- Name: seguridad_usuarios_programas_privilegios_idusuarios_programas_p; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('seguridad_usuarios_programas_privilegios_idusuarios_programas_p', 1456, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY att_departamentos ALTER COLUMN id SET DEFAULT nextval('att_departamentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY att_devices ALTER COLUMN id SET DEFAULT nextval('att_devices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY att_horarios ALTER COLUMN id SET DEFAULT nextval('att_horarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY att_logs ALTER COLUMN id SET DEFAULT nextval('att_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY departamentos ALTER COLUMN id SET DEFAULT nextval('departamentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY file_indexing ALTER COLUMN id SET DEFAULT nextval('file_indexing_id_seq'::regclass);


--
-- Name: id_listing_files; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY file_indexing ALTER COLUMN id_listing_files SET DEFAULT nextval('file_indexing_id_listing_files_seq'::regclass);


--
-- Name: contador; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY file_indexing ALTER COLUMN contador SET DEFAULT nextval('file_indexing_contador_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cbiometrico
--

ALTER TABLE ONLY listing_files ALTER COLUMN id SET DEFAULT nextval('listing_files_id_seq'::regclass);


--
-- Data for Name: att_departamentos; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO att_departamentos VALUES (2, 'Departamento T&eacute;cnico');
INSERT INTO att_departamentos VALUES (3, 'Departamento Administrativo');
INSERT INTO att_departamentos VALUES (1, 'Inform&aacute;tica y Sistemas');
INSERT INTO att_departamentos VALUES (4, 'Gerencia General');


--
-- Data for Name: att_devices; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO att_devices VALUES (5, 'Biometrico1', '192.168.1.106', '8000', 'Unidad Biometrica de FBG');


--
-- Data for Name: att_horarios; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO att_horarios VALUES (5, 'Horario General de Oficina', false, true, '08:00:00', 15, '12:00:00', 0, true, '13:00:00', 5, '17:00:00', 0, true, 60, true, true, '16:00:00', true, '19:00:00');
INSERT INTO att_horarios VALUES (1, 'Horario T&eacute;cnico', true, true, '08:00:00', 15, '12:00:00', 0, false, '13:00:00', 5, '17:00:00', 0, true, 60, true, true, '16:00:00', true, '19:00:00');
INSERT INTO att_horarios VALUES (6, 'Horario Yolanda', false, true, '09:30:00', 15, '12:00:00', 0, false, NULL, 0, '16:30:00', 0, true, 0, true, false, '16:00:00', false, '19:00:00');


--
-- Data for Name: att_logs; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO att_logs VALUES (31050, 3, '2012-10-30', '09:17:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 6);
INSERT INTO att_logs VALUES (31051, 4, '2012-10-30', '10:34:00', '80f30bc8ce222679607838254f9c2bcc15906a02', 5, 1);
INSERT INTO att_logs VALUES (31052, 4, '2012-10-30', '13:05:00', 'e41449b2f837fffd543e90f2f16bac377838e5d2', 5, 1);
INSERT INTO att_logs VALUES (31053, 2, '2012-10-30', '13:05:00', 'da293baacb787031cf1610be6441942fc2eea340', 5, 1);
INSERT INTO att_logs VALUES (31054, 10, '2012-10-30', '13:47:00', 'aa581a6d012c6fcb1d6648cd50134de6d5949bae', 5, 5);
INSERT INTO att_logs VALUES (31055, 3, '2012-10-30', '17:18:00', 'eccda81539c47458af1917260ca73647d2a0ba44', 5, 6);
INSERT INTO att_logs VALUES (31056, 8, '2012-10-30', '17:19:00', 'a006a993cbd20c06d9a8f88ecde04b3e46952bff', 5, 6);
INSERT INTO att_logs VALUES (31057, 2, '2012-10-30', '17:26:00', '0cc8a11ef56c9349e03715e8fbcfc18b2e180d0f', 5, 1);
INSERT INTO att_logs VALUES (31058, 4, '2012-10-30', '17:36:00', '780728823658d99a79a821cc7293d43dcf0c103a', 5, 1);
INSERT INTO att_logs VALUES (31059, 10, '2012-10-30', '18:04:00', '5f4deb7ce2491d54f108f7bdd2604b48f4895eee', 5, 5);
INSERT INTO att_logs VALUES (31060, 9, '2012-10-30', '18:04:00', '55a72d24b7f727d3a3d941ef681e411120a6b30d', 5, 5);
INSERT INTO att_logs VALUES (31061, 5, '2012-10-30', '18:04:00', '2663d9c6caf789b624770e3751edcaa3915bd654', 5, 5);
INSERT INTO att_logs VALUES (31062, 5, '2012-10-31', '07:29:00', '7420f8924da7cd75cfa530dc158a3daa3777427a', 5, 5);
INSERT INTO att_logs VALUES (31063, 6, '2012-10-31', '08:10:00', 'c4cd9c870e084e73d8cdcb2285b16d36cacfedb5', 5, 1);
INSERT INTO att_logs VALUES (31064, 4, '2012-10-31', '08:45:00', 'dc9306b46355f3209f72352f24e4f53d5ec209fb', 5, 1);
INSERT INTO att_logs VALUES (31065, 2, '2012-10-31', '09:40:00', '1e4dc5a80b01fc8606344bb0968a6eb31dab50e6', 5, 1);
INSERT INTO att_logs VALUES (31066, 3, '2012-10-31', '09:41:00', '4f7231fa7c17c9665d8bc716a72b399a97b906d8', 5, 6);
INSERT INTO att_logs VALUES (31067, 8, '2012-10-31', '13:28:00', '52e4523a4df475606edcf4c4aa55501665ef1a3a', 5, 6);
INSERT INTO att_logs VALUES (31068, 9, '2012-10-31', '13:29:00', 'd7b49e53b56b5228f3f0dab4da1e226431030114', 5, 5);
INSERT INTO att_logs VALUES (31069, 10, '2012-10-31', '14:28:00', '29628bfd962c2060b05db4ee95ebd3bba93a0e04', 5, 5);
INSERT INTO att_logs VALUES (31070, 2, '2012-10-31', '16:44:00', '03e7d2d6bb44d056b4276fc329eb99e5f41e529d', 5, 1);
INSERT INTO att_logs VALUES (31071, 8, '2012-10-31', '17:12:00', '4a55e2d011f226e9fae11ac4f225755f8071d07b', 5, 6);
INSERT INTO att_logs VALUES (31072, 10, '2012-10-31', '18:55:00', 'a99e2135f0dcd4ce3fd0b3074bef756954e56304', 5, 5);
INSERT INTO att_logs VALUES (31073, 5, '2012-10-31', '18:56:00', '073bc68574a8fef9c8139809ebebfa7388b54b5d', 5, 5);
INSERT INTO att_logs VALUES (31074, 9, '2012-10-31', '18:56:00', '6530e5c631f5414b4cb511004e14eb959624edd5', 5, 5);
INSERT INTO att_logs VALUES (31075, 7, '2012-11-01', '07:59:00', 'e8540380cbab16762fbefd09cf3adb393ca92e4f', 5, 1);
INSERT INTO att_logs VALUES (31076, 5, '2012-11-01', '08:25:00', '9a53c2aa67254e21b082938ea0b0fa7daa3a62ad', 5, 5);
INSERT INTO att_logs VALUES (31077, 4, '2012-11-01', '08:27:00', 'd96c7622353c3adfd1a5aa6055d8d8a01c3103c6', 5, 1);
INSERT INTO att_logs VALUES (31078, 3, '2012-11-01', '09:11:00', 'cf53cea9a47487b3e72f90a52997376f32637c0f', 5, 6);
INSERT INTO att_logs VALUES (31079, 6, '2012-11-01', '09:22:00', 'b4a924f6a5b89408c3ceb5619aa86712805a38cc', 5, 1);
INSERT INTO att_logs VALUES (31080, 4, '2012-11-01', '10:52:00', 'ca117aff5dc2ad40a5b2472c0091c6dcaebf9269', 5, 1);
INSERT INTO att_logs VALUES (31081, 10, '2012-11-01', '12:25:00', '6d37f88e277b338ea66bf119d45889717392e5a9', 5, 5);
INSERT INTO att_logs VALUES (31082, 8, '2012-11-01', '12:36:00', '22ae662d8d479d007e1aabe0330cab5f8ac03820', 5, 6);
INSERT INTO att_logs VALUES (31083, 9, '2012-11-01', '13:50:00', '51c61b0b8c0952510d2e580a1f6dd99f35c7262b', 5, 5);
INSERT INTO att_logs VALUES (31084, 8, '2012-11-01', '17:21:00', 'defceaa25c5a14bc8bd40f7b2dbaeb99b8141727', 5, 6);
INSERT INTO att_logs VALUES (31085, 3, '2012-11-01', '17:22:00', 'a96d611a07138e11d669079d1a5ec3a44a4ff93a', 5, 6);
INSERT INTO att_logs VALUES (31086, 6, '2012-11-01', '17:23:00', '12636498562d809feda22ea24e4c24de5c29b6b6', 5, 1);
INSERT INTO att_logs VALUES (31087, 2, '2012-11-01', '17:33:00', 'd4557a7d91c9aa588f09507da67817df83931c2f', 5, 1);
INSERT INTO att_logs VALUES (31088, 10, '2012-11-01', '18:16:00', '850e76ed7d50b9d6be17435334e7903f3a64a0ce', 5, 5);
INSERT INTO att_logs VALUES (31089, 5, '2012-11-02', '07:41:00', 'da0125ead8720382c4c1a43d9635e7cfa3220554', 5, 5);
INSERT INTO att_logs VALUES (31090, 4, '2012-11-02', '08:07:00', 'e9db3f45f9a0dd26ec4cdcb9f8c766a4f613cf48', 5, 1);
INSERT INTO att_logs VALUES (31091, 4, '2012-11-02', '08:08:00', '40c682796f751bab777c8fa5a0acc374e621c6c2', 5, 1);
INSERT INTO att_logs VALUES (31092, 2, '2012-11-02', '08:11:00', 'c333c21047deac6b9c043647cfcafb8ba8fe08e6', 5, 1);
INSERT INTO att_logs VALUES (31093, 7, '2012-11-02', '08:14:00', '90f9eb0f21a2a8b7c50cdea60caa40d59bb895d5', 5, 1);
INSERT INTO att_logs VALUES (31094, 6, '2012-11-02', '08:14:00', '029db09c176841148ba38a3ee17db11ab0516f16', 5, 1);
INSERT INTO att_logs VALUES (31095, 3, '2012-11-02', '09:04:00', '7c88fcb1bd5cfb996460059c78347e2506f6d911', 5, 6);
INSERT INTO att_logs VALUES (31096, 10, '2012-11-02', '14:34:00', 'b9d8a862ad2b7f32f3c9da9c3b7ff46b9e47b7ab', 5, 5);
INSERT INTO att_logs VALUES (31097, 9, '2012-11-02', '15:12:00', '9c06018aa42f3bf2b9bd83b2621b43add93204da', 5, 5);
INSERT INTO att_logs VALUES (31098, 3, '2012-11-02', '16:00:00', 'c2fa77ce3b3eb10182d86730367e2d4bab9f2043', 5, 6);
INSERT INTO att_logs VALUES (31099, 7, '2012-11-02', '16:00:00', '90aada949cd3cad0c1c0948d45ef677c02c9ba34', 5, 1);
INSERT INTO att_logs VALUES (31100, 4, '2012-11-02', '17:50:00', '2e4bc06244cc26922cdf017f4170ce3f50b13870', 5, 1);
INSERT INTO att_logs VALUES (31101, 2, '2012-11-02', '18:07:00', '9ce15329b503be89f04046578c615c32ef1302e9', 5, 1);
INSERT INTO att_logs VALUES (31102, 10, '2012-11-02', '19:49:00', 'b2fd2f1daa0363d0dd0b366e4ad959b4e6c8750a', 5, 5);
INSERT INTO att_logs VALUES (31103, 9, '2012-11-02', '19:50:00', '8c66704c9837d58ecc13534a79665c78382a0827', 5, 5);
INSERT INTO att_logs VALUES (31104, 5, '2012-11-02', '19:50:00', '014ed6e76f9f692c18b52edbf93053ac08ffbf63', 5, 5);
INSERT INTO att_logs VALUES (31105, 5, '2012-11-05', '07:21:00', 'dec5754f49b8c8b735bb8d62a35984007e828d26', 5, 5);
INSERT INTO att_logs VALUES (31106, 4, '2012-11-05', '08:05:00', '1f1642524417a0e00dd28ab814caf6eb1542930a', 5, 1);
INSERT INTO att_logs VALUES (31107, 7, '2012-11-05', '08:05:00', '268da32a9661537da90386e193a40b4458048b4f', 5, 1);
INSERT INTO att_logs VALUES (31108, 2, '2012-11-05', '08:44:00', 'ae96d73695e575483ecfa77730d61fddcb9a9d92', 5, 1);
INSERT INTO att_logs VALUES (31109, 3, '2012-11-05', '10:10:00', 'ceb41eae602a01bd7ed939a62bb42720398b39ef', 5, 6);


--
-- Data for Name: att_personas; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO att_personas VALUES (148, 1, 'LUIS FRANQUIZ', 9420867, true, 1, true, 1, 1, true, NULL);
INSERT INTO att_personas VALUES (150, 8, 'YULIETH MENDOZA', 18734582, true, 6, true, 3, 5, true, NULL);
INSERT INTO att_personas VALUES (151, 5, 'THAIS MENDOZA', 11025797, true, 5, true, 4, 5, true, NULL);
INSERT INTO att_personas VALUES (152, 9, 'ISRAEL FRANQUIZ', 27235515, true, 5, true, 3, 5, true, NULL);
INSERT INTO att_personas VALUES (153, 10, 'MOISES FRANQUIZ', 999999999, true, 5, true, 3, 5, true, NULL);
INSERT INTO att_personas VALUES (154, 4, 'NESTOR MONTAñO', 17311603, true, 1, true, 1, 5, true, NULL);
INSERT INTO att_personas VALUES (155, 6, 'JONATHAN MERLANO', 23184005, true, 1, true, 2, 5, true, NULL);
INSERT INTO att_personas VALUES (156, 7, 'DELKIMET MERLANO', 22964529, true, 1, true, 2, 5, true, NULL);
INSERT INTO att_personas VALUES (157, 3, 'YOLANDA', 4315160, true, 6, true, 3, 5, true, NULL);
INSERT INTO att_personas VALUES (149, 2, 'CHRISTIAN VIVAS', 17176888, true, 1, true, 1, 5, true, NULL);


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO departamentos VALUES (1, 'Inform&aacute;tica y Sistemas');
INSERT INTO departamentos VALUES (2, 'Satrim');
INSERT INTO departamentos VALUES (3, 'Catastro');
INSERT INTO departamentos VALUES (4, 'Ingenier&iacute;a Municipal');
INSERT INTO departamentos VALUES (5, 'Archivo');
INSERT INTO departamentos VALUES (6, 'Bienes');
INSERT INTO departamentos VALUES (7, 'Compras');
INSERT INTO departamentos VALUES (8, 'Servicios Generales ');
INSERT INTO departamentos VALUES (9, 'Sindicato');
INSERT INTO departamentos VALUES (10, 'Transporte');
INSERT INTO departamentos VALUES (11, 'Administraci&oacute;n');
INSERT INTO departamentos VALUES (12, 'Atenci&oacute;n Ciudadana ');
INSERT INTO departamentos VALUES (13, 'Central Telefonica');
INSERT INTO departamentos VALUES (14, 'Biblioteca');
INSERT INTO departamentos VALUES (15, 'Sindicatura');
INSERT INTO departamentos VALUES (16, 'Sacumg');
INSERT INTO departamentos VALUES (17, 'Despacho');
INSERT INTO departamentos VALUES (18, 'Presupuesto');
INSERT INTO departamentos VALUES (19, 'Relaciones Publicas');
INSERT INTO departamentos VALUES (20, 'Obras Municipales');
INSERT INTO departamentos VALUES (21, 'Consejo Local');
INSERT INTO departamentos VALUES (22, 'Asuntos Legales');
INSERT INTO departamentos VALUES (23, 'Recursos Humanos');
INSERT INTO departamentos VALUES (24, 'Caja de Ahorro');
INSERT INTO departamentos VALUES (25, 'Enfermer&iacute;a');
INSERT INTO departamentos VALUES (26, 'Auditoria Interna');
INSERT INTO departamentos VALUES (27, 'Oficina Tecnica Municipal');
INSERT INTO departamentos VALUES (28, 'Parroquializaci&oacute;n');
INSERT INTO departamentos VALUES (29, 'Fondo de Gesti&oacute;n Social');
INSERT INTO departamentos VALUES (30, 'Omdecu');
INSERT INTO departamentos VALUES (31, 'Concejales');


--
-- Data for Name: file_indexing; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--



--
-- Data for Name: listing_files; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO listing_files VALUES (6, '/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/1e9567ab1e72b9ef8c31c74797eb30f9svnmanager-1.09.zip', '2012-11-05:11:40:02:0000000.65624900 1352144402 Direccion IP del usuario127.0.0.1');
INSERT INTO listing_files VALUES (7, '/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/f20dee4bdf479efe718753d56836fbb4svnmanager-1.09.zip', '2012-11-05:11:40:11:0000000.38453600 1352144411 Direccion IP del usuario127.0.0.1');
INSERT INTO listing_files VALUES (8, '/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/132b7401b1cc0f2ca72384811cc33931svnmanager-1.09.zip', '2012-11-05:11:40:20:0000000.26004200 1352144420 Direccion IP del usuario127.0.0.1');
INSERT INTO listing_files VALUES (9, '/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/8208d6351f81c6d3f7d2832ed247dab0svnmanager-1.09.zip', '2012-11-05:11:40:29:0000000.11305400 1352144429 Direccion IP del usuario127.0.0.1');
INSERT INTO listing_files VALUES (10, '/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/d0a6fbd88ff76a79ac8a1776e61905f5jkkjj.csv', '2012-11-05:12:00:19:0000000.07348300 1352145619 Direccion IP del usuario127.0.0.1');
INSERT INTO listing_files VALUES (11, '/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/96ee85b9839081ee9fb8a9f6c909ee32jkkjj.csv', '2012-11-05:12:34:23:0000000.73112300 1352147663 Direccion IP del usuario127.0.0.1');
INSERT INTO listing_files VALUES (12, '/opt/lappstack-5.4.7-0/apache2/htdocs/uploads/132b7401b1cc0f2ca72384811cc33931jkkjj.csv', '2012-11-05:13:16:20:0000000.31341700 1352150180 Direccion IP del usuario127.0.0.1');


--
-- Data for Name: seguridad_bitacora; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_bitacora VALUES (2170, '2012-10-24', '13:23:38', 'seguridad_programas', '', 'Se agrego el programa: Descarga de Datos de &oacute;rden: 99', '127.0.0.1', 1, 'programas_form.php');
INSERT INTO seguridad_bitacora VALUES (2171, '2012-10-24', '13:25:34', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: admin', '127.0.0.1', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2172, '2012-10-24', '13:25:34', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: admin', '127.0.0.1', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2173, '2012-10-24', '13:25:34', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: admin', '127.0.0.1', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2174, '2012-10-24', '13:25:34', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: admin', '127.0.0.1', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2175, '2012-10-24', '13:25:34', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: admin', '127.0.0.1', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2176, '2012-10-25', '08:41:55', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2177, '2012-10-25', '12:44:42', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2178, '2012-10-26', '12:11:22', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2179, '2012-10-27', '16:09:55', '', '', 'Apertura de Sesi&oacute;n', '::1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2180, '2012-10-27', '16:12:30', '', '', 'Apertura de Sesi&oacute;n', '::1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2181, '2012-10-30', '13:42:13', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2182, '2012-10-30', '13:42:39', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2183, '2012-10-30', '13:47:12', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.100', 1, '');
INSERT INTO seguridad_bitacora VALUES (2184, '2012-10-30', '14:01:18', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2185, '2012-10-30', '14:05:37', 'seguridad_usuarios_programas_privilegios', '', 'Se eliminaron todos los privilegios del programa: Grafico de Retrasos e Inasistencias, para el usuario: bkaren', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2186, '2012-10-30', '14:06:11', 'seguridad_usuarios_programas_privilegios', '', 'Se eliminaron todos los privilegios del programa: Admon. Accesos, para el usuario: bkaren', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2187, '2012-10-30', '14:12:05', '', '', 'Apertura de Sesi&oacute;n', '190.142.53.177', 1, '');
INSERT INTO seguridad_bitacora VALUES (2188, '2012-10-30', '14:12:40', 'seguridad_usuarios', '6', 'Se elimino el usuario:  con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2189, '2012-10-30', '14:12:51', 'seguridad_usuarios', '9', 'Se elimino el usuario:  con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2190, '2012-10-30', '14:13:01', 'seguridad_usuarios', '8', 'Se elimino el usuario:  con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2191, '2012-10-30', '14:13:14', 'seguridad_usuarios', '10', 'Se elimino el usuario:  con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2192, '2012-10-30', '14:13:26', 'seguridad_usuarios', '5', 'Se elimino el usuario:  con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2193, '2012-10-30', '14:13:41', 'seguridad_usuarios', '7', 'Se elimino el usuario:  con est&aacute;tus: Inactivo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2194, '2012-10-30', '14:14:08', 'seguridad_usuarios', '1', 'Se modifico el usuario existente', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2195, '2012-10-30', '14:14:19', 'seguridad_usuarios', '1', 'Se modifico el usuario existente', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2196, '2012-10-30', '14:25:33', 'seguridad_usuarios', '1', 'Se modifico el usuario existente', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2197, '2012-10-30', '14:27:18', 'seguridad_usuarios', '', 'Se agrego el usuario: luisf con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2198, '2012-10-30', '14:28:28', 'seguridad_usuarios', '', 'Se agrego el usuario: mnestor con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2199, '2012-10-30', '14:28:58', 'seguridad_usuarios', '', 'Se agrego el usuario: thais con est&aacute;tus: Activo', '190.142.53.177', 1, 'usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2200, '2012-10-30', '14:29:46', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2201, '2012-10-30', '14:29:51', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2202, '2012-10-30', '14:29:55', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2203, '2012-10-30', '14:30:00', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2204, '2012-10-30', '14:30:04', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2205, '2012-10-30', '14:30:09', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2206, '2012-10-30', '14:30:13', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2207, '2012-10-30', '14:30:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2208, '2012-10-30', '14:30:23', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2209, '2012-10-30', '14:30:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2210, '2012-10-30', '14:30:32', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2211, '2012-10-30', '14:30:36', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2212, '2012-10-30', '14:30:41', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2213, '2012-10-30', '14:30:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2214, '2012-10-30', '14:30:50', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2215, '2012-10-30', '14:30:54', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2216, '2012-10-30', '14:30:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2217, '2012-10-30', '14:31:03', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2218, '2012-10-30', '14:31:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2219, '2012-10-30', '14:31:12', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2220, '2012-10-30', '14:31:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2222, '2012-10-30', '14:31:21', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '190.142.53.177', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2221, '2012-10-30', '14:31:24', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2223, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2224, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2225, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2226, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2227, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2228, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2229, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2230, '2012-10-30', '14:40:16', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2231, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2232, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2233, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2234, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2235, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2236, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2237, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2238, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2239, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2240, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2241, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2242, '2012-10-30', '14:40:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2243, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2244, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2245, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2246, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2247, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2248, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2249, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2250, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2251, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2252, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2253, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2254, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2255, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2256, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2257, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2258, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2259, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2260, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2261, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2262, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2263, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2264, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2265, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2266, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2267, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2268, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2269, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2270, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2271, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2272, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2273, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2274, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2275, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2276, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2277, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2278, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2279, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2280, '2012-10-30', '14:40:26', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2281, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2282, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2283, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2284, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2285, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2286, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2287, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2288, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2289, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2290, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2291, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2292, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2293, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2294, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2295, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2296, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2297, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2298, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2299, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2300, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2301, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2302, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2303, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2304, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2305, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2306, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2307, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2308, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2309, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2310, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2311, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2312, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2313, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2314, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2315, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2316, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2317, '2012-10-30', '14:40:27', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2318, '2012-10-30', '14:40:58', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2319, '2012-10-30', '14:40:58', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2320, '2012-10-30', '14:40:58', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2321, '2012-10-30', '14:40:58', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2322, '2012-10-30', '14:40:58', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2323, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2324, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2325, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2326, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2327, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2328, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2329, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2330, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2331, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2332, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2333, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2334, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2335, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2336, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2337, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2338, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2339, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2340, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2341, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2342, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2343, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2344, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2345, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2346, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2347, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2348, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2349, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2350, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2351, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2352, '2012-10-30', '14:40:59', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: thais', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2353, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2354, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2355, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2356, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2357, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2358, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2359, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2360, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2361, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2362, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2363, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2364, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2365, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2366, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2367, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2368, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2369, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2370, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2371, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2372, '2012-10-30', '14:41:17', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2373, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2374, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2375, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2376, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2377, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2378, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2379, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2380, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2381, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2382, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2383, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2384, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2385, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2386, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2387, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2388, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2389, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2390, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2391, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2392, '2012-10-30', '14:51:05', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2393, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2394, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2395, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2396, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2397, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2398, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2399, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2400, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2401, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2402, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2403, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2404, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2405, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2406, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2407, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2408, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2409, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2410, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2411, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2412, '2012-10-30', '14:51:08', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2413, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2414, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2415, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2416, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2417, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2418, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2419, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2420, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2421, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2422, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2423, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2424, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2425, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2426, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2427, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2428, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2429, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2430, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2431, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2432, '2012-10-30', '14:51:44', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2433, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2434, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2435, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2436, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2437, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2438, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2439, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2440, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2441, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2442, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2443, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2444, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2445, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2446, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2447, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2448, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2449, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2450, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2451, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2452, '2012-10-30', '14:51:45', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: mnestor', '192.168.1.105', 1, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2453, '2012-10-30', '14:52:22', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2454, '2012-10-30', '14:52:38', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 12, '');
INSERT INTO seguridad_bitacora VALUES (2455, '2012-10-30', '14:52:48', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.105', 12, '');
INSERT INTO seguridad_bitacora VALUES (2456, '2012-10-30', '14:52:54', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 13, '');
INSERT INTO seguridad_bitacora VALUES (2457, '2012-10-30', '14:53:38', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.105', 13, '');
INSERT INTO seguridad_bitacora VALUES (2458, '2012-10-30', '14:53:48', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 11, '');
INSERT INTO seguridad_bitacora VALUES (2459, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2460, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2461, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2462, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2463, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2464, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2465, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2466, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2467, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2468, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2469, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2470, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2471, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2472, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2473, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2474, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2475, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2476, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2477, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2478, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2479, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2480, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2481, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2482, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2483, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2484, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2485, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2486, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2487, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2488, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2489, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2490, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2491, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2492, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2493, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2494, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2495, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2496, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2497, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2498, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2499, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2500, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2501, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2502, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2503, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2504, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2505, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2506, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2507, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2508, '2012-10-30', '14:54:18', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2509, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2510, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2511, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2512, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2513, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2514, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2515, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2516, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2517, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2518, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2519, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2520, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2521, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2522, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2523, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2524, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2525, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2526, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2527, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2528, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2529, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Agregar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2530, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Consultar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2531, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Eliminar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2532, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Imprimir, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2533, '2012-10-30', '14:54:19', 'seguridad_usuarios_programas_privilegios', '', 'Se agrego el privilegio: Modificar, para el usuario: luisf', '192.168.1.105', 11, 'privilegios_usuarios_form.php');
INSERT INTO seguridad_bitacora VALUES (2534, '2012-10-30', '14:54:26', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.105', 11, '');
INSERT INTO seguridad_bitacora VALUES (2535, '2012-10-30', '15:20:16', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.100', 13, '');
INSERT INTO seguridad_bitacora VALUES (2536, '2012-10-30', '15:22:15', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.100', 11, '');
INSERT INTO seguridad_bitacora VALUES (2537, '2012-10-30', '15:25:38', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.100', 11, '');
INSERT INTO seguridad_bitacora VALUES (2538, '2012-10-31', '07:45:11', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 11, '');
INSERT INTO seguridad_bitacora VALUES (2539, '2012-10-31', '13:04:26', '', '', 'Apertura de Sesi&oacute;n', '190.39.169.146', 11, '');
INSERT INTO seguridad_bitacora VALUES (2540, '2012-11-01', '13:43:33', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2541, '2012-11-02', '06:13:40', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2542, '2012-11-02', '07:22:31', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2543, '2012-11-02', '07:24:18', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2544, '2012-11-02', '07:24:42', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2545, '2012-11-02', '07:24:55', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2546, '2012-11-02', '07:30:27', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2547, '2012-11-02', '08:23:36', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2548, '2012-11-02', '11:54:49', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2549, '2012-11-05', '07:16:33', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2550, '2012-11-05', '13:15:56', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2551, '2012-11-06', '05:16:05', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2552, '2012-11-06', '11:04:52', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2553, '2012-11-06', '11:06:46', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2554, '2012-11-06', '11:10:39', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2555, '2012-11-06', '11:10:43', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2556, '2012-11-06', '11:15:40', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2557, '2012-11-06', '11:18:23', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');


--
-- Data for Name: seguridad_modulos; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_modulos VALUES (7, 'SCAYA', 1);
INSERT INTO seguridad_modulos VALUES (1, 'OPCIONES', 2);


--
-- Data for Name: seguridad_privilegios; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_privilegios VALUES (1, 'Agregar');
INSERT INTO seguridad_privilegios VALUES (2, 'Modificar');
INSERT INTO seguridad_privilegios VALUES (3, 'Eliminar');
INSERT INTO seguridad_privilegios VALUES (4, 'Imprimir');
INSERT INTO seguridad_privilegios VALUES (5, 'Consultar');


--
-- Data for Name: seguridad_programas; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_programas VALUES (4, 'Registro de M&oacute;dulos', 1, '../../seguridad/registro_modulos/configuracion_menu_form.php', '/imagenes/seguridad/iconos/addremoveprograms.png', ' Registro de M&oacute;dulos para la Configuraci&oacute;n del Men&uacute;', 1);
INSERT INTO seguridad_programas VALUES (3, 'Registro de Sucesos del Sistema', 1, '../../seguridad/registro_sucesos/bitacora_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Gestor de Reportes del Registro Suceos del Sistema', 3);
INSERT INTO seguridad_programas VALUES (14, 'Horas Extras entre fechas', 1, '../../seca/reportes/horas_extras_fechas/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Calculo de Horas extras entre Fechas', 14);
INSERT INTO seguridad_programas VALUES (15, 'Horas Extras Compacto', 2, '../../seca/reportes/he_fechas_comp/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Reporte Compacto de Horas Extras', 14);
INSERT INTO seguridad_programas VALUES (12, 'Carga de Archivos', 1, '../../seca/mantenimientos/carga_asist_file/carga_asistencia_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Carga Archivos de Info del Biometrico', 12);
INSERT INTO seguridad_programas VALUES (13, 'Asistencia de una Fecha', 1, '../../seca/reportes/asist_fecha/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Asistencia tomada en una fecha', 13);
INSERT INTO seguridad_programas VALUES (19, 'Admon. Accesos', 2, '../../seca/mantenimientos/adm_accesos/accesos_form.php', '/imagenes/seguridad/iconos/programas.gif', '', 12);
INSERT INTO seguridad_programas VALUES (18, 'Admon. Equipos', 1, '../../seca/mantenimientos/adm_devices/devices_form.php', '/imagenes/seguridad/iconos/programas.gif', '', 11);
INSERT INTO seguridad_programas VALUES (20, 'Asistencia entre Fechas', 2, '../../seca/reportes/asist_entrefch/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Reportes de Asistencia de Personal entre Fechas', 13);
INSERT INTO seguridad_programas VALUES (21, 'Grafico de Horas Extras', 1, '../../seca/reportes/grafico_he_fechas/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Grafico de Horas Extras de Personal Entre Fechas', 17);
INSERT INTO seguridad_programas VALUES (22, 'Inasistencias y Retardos', 3, '../../seca/reportes/retardos_fechas/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Inasistencias y Retardos del personal entre fechas', 14);
INSERT INTO seguridad_programas VALUES (23, 'Grafico de Retrasos e Inasistencias', 2, '../../seca/reportes/graf_ret_fechas/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Escala de Inasistencias y Retardos por departamento', 17);
INSERT INTO seguridad_programas VALUES (24, 'Control de Asistencia entre Fechas Para un solo Empleado o Funcionario', 12, '../../seca/reportes/asist_fecha_perso/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', '', 13);
INSERT INTO seguridad_programas VALUES (25, 'Horas Extras Compacto Personalizado', 33, '../../seca/reportes/he_fechas_comp_perso/consulta_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Horas extras personalizado para un solo empleado en detalle', 14);
INSERT INTO seguridad_programas VALUES (17, 'Admon. Horarios', 2, '../../seca/mantenimientos/adm_horarios/horarios_form.php', '/imagenes/seguridad/iconos/programas.gif', 'Maneja y Administra los Horarios Disponible', 10);
INSERT INTO seguridad_programas VALUES (16, 'Ficha de Personal', 1, '../../seca/mantenimientos/adm_personal/personal_form.php', '/imagenes/seguridad/iconos/programas.gif', '', 10);
INSERT INTO seguridad_programas VALUES (26, 'Descarga de Datos', 99, '../../seca/mantenimientos/adm_descargadatos/form.php', '/imagenes/seguridad/iconos/programas.gif', '', 11);
INSERT INTO seguridad_programas VALUES (5, 'Registro de Usuarios', 3, '../../seguridad/registro_privilegios_usuarios/configuracion_usuarios_form.php', '/imagenes/seguridad/iconos/users.png', 'Registro de Privilegios de Usuarios sobre los Programas', 2);
INSERT INTO seguridad_programas VALUES (1, 'Administrar Roles de Usuario', 1, '../../seguridad/registro_privilegios/privilegios_form.php', '/imagenes/seguridad/iconos/user_roles.png', 'Mantenimiento de Privilegios', 2);


--
-- Data for Name: seguridad_secciones; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_secciones VALUES (1, 'Configuraci&oacute;n del Men&uacute;', NULL, 1, 1);
INSERT INTO seguridad_secciones VALUES (2, 'Configuraci&oacute;n de Usuarios', NULL, 2, 1);
INSERT INTO seguridad_secciones VALUES (3, 'Sucesos del Sistema', NULL, 1, 5);
INSERT INTO seguridad_secciones VALUES (10, 'Personal', '', 1, 6);
INSERT INTO seguridad_secciones VALUES (11, 'Equipos', '', 2, 6);
INSERT INTO seguridad_secciones VALUES (12, 'Control Acceso', '', 3, 6);
INSERT INTO seguridad_secciones VALUES (13, 'Asistencia', '', 2, 7);
INSERT INTO seguridad_secciones VALUES (17, 'Graficos', '', 1, 8);
INSERT INTO seguridad_secciones VALUES (14, 'Dir. Recursos Humanos', '', 2, 7);


--
-- Data for Name: seguridad_submodulos; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_submodulos VALUES (6, 'Registro', 1, 7);
INSERT INTO seguridad_submodulos VALUES (7, 'Reportes', 2, 7);
INSERT INTO seguridad_submodulos VALUES (8, 'Graficos', 3, 7);
INSERT INTO seguridad_submodulos VALUES (5, 'Auditoria', 2, 1);
INSERT INTO seguridad_submodulos VALUES (1, 'Configuraci&oacute;n del Sistema', 1, 1);


--
-- Data for Name: seguridad_usuarios; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_usuarios VALUES (12, '17311603', 'mnestor', '827ccb0eea8a706c4c34a16891f84e7b', 'Activo', '2012-10-30', '');
INSERT INTO seguridad_usuarios VALUES (13, '11025797', 'thais', '81dc9bdb52d04dc20036dbd8313ed055', 'Activo', '2012-10-30', '0cf936f8bd2e96644eb54d1af13c6ba7');
INSERT INTO seguridad_usuarios VALUES (11, '9420867', 'luisf', '81dc9bdb52d04dc20036dbd8313ed055', 'Activo', '2012-10-30', '768282262cd494b82c925e31ef2dcf3a');
INSERT INTO seguridad_usuarios VALUES (1, '0000000', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Activo', '2009-04-24', '');


--
-- Data for Name: seguridad_usuarios_programas_privilegios; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1124, 1, 26, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1125, 1, 26, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1126, 1, 26, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1127, 1, 26, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1128, 1, 26, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (3, 1, 7, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1362, 12, 1, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1363, 12, 1, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1364, 12, 1, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1365, 12, 1, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1366, 12, 1, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1367, 12, 4, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1368, 12, 4, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1369, 12, 4, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1370, 12, 4, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1371, 12, 4, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1372, 12, 3, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1373, 12, 3, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1374, 12, 3, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1375, 12, 3, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1376, 12, 3, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1377, 12, 5, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1378, 12, 5, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1379, 12, 5, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1380, 12, 5, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1381, 12, 5, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1152, 11, 1, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1153, 11, 1, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1154, 11, 1, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1155, 11, 1, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1156, 11, 1, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1157, 11, 4, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1158, 11, 4, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1159, 11, 4, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1160, 11, 4, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1161, 11, 4, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1162, 11, 3, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1163, 11, 3, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1164, 11, 3, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1165, 11, 3, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1166, 11, 3, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1167, 11, 5, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1168, 11, 5, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1169, 11, 5, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1170, 11, 5, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1171, 11, 5, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1172, 12, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1173, 12, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1174, 12, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1175, 12, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1176, 12, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1177, 12, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1178, 12, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1179, 12, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1180, 12, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1181, 12, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1182, 12, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1183, 12, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1184, 12, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1185, 12, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1186, 12, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1187, 12, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1188, 12, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1189, 12, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1190, 12, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1191, 12, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1192, 12, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1193, 12, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1194, 12, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1195, 12, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1196, 12, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1197, 12, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1198, 12, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1199, 12, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1200, 12, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1201, 12, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1202, 12, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1203, 12, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1204, 12, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1205, 12, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1206, 12, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1207, 12, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1208, 12, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1209, 12, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1210, 12, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1211, 12, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1212, 12, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1213, 12, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1214, 12, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1215, 12, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1216, 12, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1217, 12, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1218, 12, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1219, 12, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1220, 12, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1221, 12, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1222, 12, 24, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1223, 12, 24, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1224, 12, 24, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1225, 12, 24, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1226, 12, 24, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1227, 12, 25, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1228, 12, 25, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1229, 12, 25, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1230, 12, 25, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1231, 12, 25, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1232, 12, 17, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1233, 12, 17, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1234, 12, 17, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1235, 12, 17, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1236, 12, 17, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1237, 12, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1238, 12, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1239, 12, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1240, 12, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1241, 12, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1242, 12, 26, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1243, 12, 26, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1244, 12, 26, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1245, 12, 26, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1246, 12, 26, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1247, 13, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1248, 13, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1249, 13, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1250, 13, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1251, 13, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1252, 13, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1253, 13, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1254, 13, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1255, 13, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1256, 13, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1257, 13, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1258, 13, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1259, 13, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1260, 13, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1261, 13, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1262, 13, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1263, 13, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1264, 13, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1265, 13, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1266, 13, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1267, 13, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1268, 13, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1269, 13, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1270, 13, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1271, 13, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1272, 13, 24, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1273, 13, 24, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1274, 13, 24, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1275, 13, 24, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1276, 13, 24, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1277, 13, 25, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1278, 13, 25, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1279, 13, 25, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1280, 13, 25, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1281, 13, 25, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1382, 11, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1383, 11, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1384, 11, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1385, 11, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1386, 11, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1387, 11, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1388, 11, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1389, 11, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1390, 11, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1391, 11, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1392, 11, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1393, 11, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1394, 11, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1395, 11, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1396, 11, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1397, 11, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1398, 11, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1399, 11, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1400, 11, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1401, 11, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1402, 11, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1403, 11, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1404, 11, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1405, 11, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1406, 11, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1407, 11, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1408, 11, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1409, 11, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1410, 11, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1411, 11, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1412, 11, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1413, 11, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1414, 11, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1415, 11, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1416, 11, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1417, 11, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1418, 11, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1419, 11, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1420, 11, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1421, 11, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1422, 11, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1423, 11, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1424, 11, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1425, 11, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1426, 11, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1427, 11, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1428, 11, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1429, 11, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1430, 11, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1431, 11, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1432, 11, 24, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1433, 11, 24, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1434, 11, 24, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1435, 11, 24, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1436, 11, 24, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1014, 1, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1015, 1, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1016, 1, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1017, 1, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1018, 1, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1019, 1, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1020, 1, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1021, 1, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1022, 1, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1023, 1, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1024, 1, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1025, 1, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1026, 1, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1027, 1, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1028, 1, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1029, 1, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1030, 1, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1031, 1, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1032, 1, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1033, 1, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1034, 1, 17, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1035, 1, 17, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1036, 1, 17, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1037, 1, 17, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1038, 1, 17, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1039, 1, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1040, 1, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1041, 1, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1042, 1, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1043, 1, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1044, 1, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1045, 1, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1046, 1, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1047, 1, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1048, 1, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1049, 1, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1050, 1, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1051, 1, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1052, 1, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1053, 1, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1054, 1, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1055, 1, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1056, 1, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1057, 1, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1058, 1, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1059, 1, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1060, 1, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1061, 1, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1062, 1, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1063, 1, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1064, 1, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1065, 1, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1066, 1, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1067, 1, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1068, 1, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1069, 1, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1070, 1, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1071, 1, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1072, 1, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1073, 1, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1074, 1, 24, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1075, 1, 24, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1076, 1, 24, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1077, 1, 24, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1078, 1, 24, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1079, 1, 25, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1080, 1, 25, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1081, 1, 25, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1082, 1, 25, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1083, 1, 25, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1104, 1, 1, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1105, 1, 1, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1106, 1, 1, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1107, 1, 1, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1108, 1, 1, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1109, 1, 4, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1110, 1, 4, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1111, 1, 4, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1112, 1, 4, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1113, 1, 4, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1114, 1, 3, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1115, 1, 3, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1116, 1, 3, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1117, 1, 3, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1118, 1, 3, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1119, 1, 5, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1120, 1, 5, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1121, 1, 5, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1122, 1, 5, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1123, 1, 5, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1437, 11, 25, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1438, 11, 25, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1439, 11, 25, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1440, 11, 25, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1441, 11, 25, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1442, 11, 17, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1443, 11, 17, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1444, 11, 17, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1445, 11, 17, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1446, 11, 17, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1447, 11, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1448, 11, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1449, 11, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1450, 11, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1451, 11, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1452, 11, 26, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1453, 11, 26, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1454, 11, 26, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1455, 11, 26, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1456, 11, 26, 2);


--
-- Name: att_departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY att_departamentos
    ADD CONSTRAINT att_departamentos_pkey PRIMARY KEY (id);


--
-- Name: att_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY att_devices
    ADD CONSTRAINT att_devices_pkey PRIMARY KEY (id);


--
-- Name: att_horarios_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY att_horarios
    ADD CONSTRAINT att_horarios_pkey PRIMARY KEY (id);


--
-- Name: att_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY att_logs
    ADD CONSTRAINT att_logs_pkey PRIMARY KEY (id);


--
-- Name: att_personas_cedula_key; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY att_personas
    ADD CONSTRAINT att_personas_cedula_key UNIQUE (cedula);


--
-- Name: att_personas_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY att_personas
    ADD CONSTRAINT att_personas_pkey PRIMARY KEY (gid);


--
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- Name: pkey_listing_files; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY listing_files
    ADD CONSTRAINT pkey_listing_files PRIMARY KEY (id);


--
-- Name: pkeyfile_indexing; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY file_indexing
    ADD CONSTRAINT pkeyfile_indexing PRIMARY KEY (id);


--
-- Name: seguridad_bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_bitacora
    ADD CONSTRAINT seguridad_bitacora_pkey PRIMARY KEY (idbitacora);


--
-- Name: seguridad_modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_modulos
    ADD CONSTRAINT seguridad_modulos_pkey PRIMARY KEY (idmodulo);


--
-- Name: seguridad_privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_privilegios
    ADD CONSTRAINT seguridad_privilegios_pkey PRIMARY KEY (idprivilegio);


--
-- Name: seguridad_programas_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_programas
    ADD CONSTRAINT seguridad_programas_pkey PRIMARY KEY (idprograma);


--
-- Name: seguridad_secciones_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_secciones
    ADD CONSTRAINT seguridad_secciones_pkey PRIMARY KEY (idseccion);


--
-- Name: seguridad_submodulos_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_submodulos
    ADD CONSTRAINT seguridad_submodulos_pkey PRIMARY KEY (idsubmodulo);


--
-- Name: seguridad_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_usuarios
    ADD CONSTRAINT seguridad_usuarios_pkey PRIMARY KEY (idusuario);


--
-- Name: seguridad_usuarios_programas_privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY seguridad_usuarios_programas_privilegios
    ADD CONSTRAINT seguridad_usuarios_programas_privilegios_pkey PRIMARY KEY (idusuarios_programas_privilegios);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

