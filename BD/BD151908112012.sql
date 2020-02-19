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

SELECT pg_catalog.setval('att_logs_id_seq', 36312, true);


--
-- Name: att_logs_temporal; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE att_logs_temporal (
    id integer NOT NULL,
    att_persona_id integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    hashcode character varying(60) NOT NULL,
    att_device_id integer NOT NULL,
    att_horario_id integer NOT NULL
);
ALTER TABLE ONLY att_logs_temporal ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY att_logs_temporal ALTER COLUMN att_persona_id SET STATISTICS 0;


ALTER TABLE public.att_logs_temporal OWNER TO cbiometrico;

--
-- Name: att_logs_temporal_id_seq; Type: SEQUENCE; Schema: public; Owner: cbiometrico
--

CREATE SEQUENCE att_logs_temporal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.att_logs_temporal_id_seq OWNER TO cbiometrico;

--
-- Name: att_logs_temporal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbiometrico
--

ALTER SEQUENCE att_logs_temporal_id_seq OWNED BY att_logs_temporal.id;


--
-- Name: att_logs_temporal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbiometrico
--

SELECT pg_catalog.setval('att_logs_temporal_id_seq', 1, false);


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


--
-- Name: no_repetidos; Type: VIEW; Schema: public; Owner: cbiometrico
--

CREATE VIEW no_repetidos AS
    SELECT DISTINCT (ROW(att_logs_temporal.fecha, att_logs_temporal.hora, att_logs_temporal.att_persona_id))::text AS registro_unico, att_logs_temporal.hashcode, att_logs_temporal.att_device_id, att_logs_temporal.att_horario_id, att_logs_temporal.fecha, att_logs_temporal.hora, att_logs_temporal.att_persona_id FROM att_logs_temporal;


ALTER TABLE public.no_repetidos OWNER TO cbiometrico;

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

SELECT pg_catalog.setval('seguridad_bitacora_idbitacora_seq', 2581, true);


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

ALTER TABLE ONLY att_logs_temporal ALTER COLUMN id SET DEFAULT nextval('att_logs_temporal_id_seq'::regclass);


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

INSERT INTO att_logs VALUES (35780, 3, '2012-11-02', '09:04:09', '877e718802da015c37a30c4e6e9d6b5f084b46ba', 5, 5);
INSERT INTO att_logs VALUES (35781, 5, '2012-10-30', '18:04:52', '586bad469163630ecf46eea715fe2f15d2a84f69', 5, 5);
INSERT INTO att_logs VALUES (35782, 1, '2012-11-02', '07:12:55', '37cf7b7097e68f2381bf2621b3bbb15ecc3c3361', 5, 5);
INSERT INTO att_logs VALUES (35783, 9, '2012-10-26', '19:47:51', 'd0ec928189b71d5f3304b7318beba7a59566af51', 5, 5);
INSERT INTO att_logs VALUES (35784, 5, '2012-10-31', '07:29:48', '5f35c08d6db233a12082160b1c4a1afd1d227c05', 5, 5);
INSERT INTO att_logs VALUES (35785, 9, '2012-11-06', '18:32:09', 'eab78cdd88ae75f486f66ff0cb11cf4ad6233c72', 5, 5);
INSERT INTO att_logs VALUES (35786, 10, '2012-10-31', '18:55:56', '9d17f97a1cbf7a914720fce52f91e49e6b1930f3', 5, 5);
INSERT INTO att_logs VALUES (35787, 3, '2012-10-29', '16:52:54', '884b677e6c7a0c5a392a21910b2dd20967ec992b', 5, 5);
INSERT INTO att_logs VALUES (35788, 6, '2012-11-09', '12:37:23', 'afe4eeeddf45df462ef96715dd0cbc33cc88e3e1', 5, 5);
INSERT INTO att_logs VALUES (35789, 10, '2012-11-06', '18:30:53', 'a6f0cace630fa0b22c8bf97b17661fa927aa9077', 5, 5);
INSERT INTO att_logs VALUES (35790, 5, '2012-11-05', '17:36:26', 'c644b2e25eca4976315ddcc335ecd6a8ee1ae18a', 5, 5);
INSERT INTO att_logs VALUES (35791, 2, '2012-11-07', '17:57:39', '07d54959878e487f4df0e08824d6a36bfe7cc731', 5, 5);
INSERT INTO att_logs VALUES (35792, 4, '2012-11-08', '08:14:43', '8eb6a4f41f972e98bd8422c7f488db946792f3cb', 5, 5);
INSERT INTO att_logs VALUES (35793, 10, '2012-10-29', '16:54:02', 'a4f31dc5aea37de33e3451db433e704b2197e63c', 5, 5);
INSERT INTO att_logs VALUES (35794, 1, '2012-10-30', '12:03:23', 'dc8b57eaba544e461fe7c5650f5893605f8ce11f', 5, 5);
INSERT INTO att_logs VALUES (35795, 8, '2012-10-30', '17:19:34', 'f9bb6a49d50ec507457e507ff19c5cca7e6ffdd5', 5, 5);
INSERT INTO att_logs VALUES (35796, 10, '2012-10-29', '12:48:31', '5750d39e02890d02fa9f297d3bf3ebc26ef1d1b0', 5, 5);
INSERT INTO att_logs VALUES (35797, 9, '2012-11-02', '15:12:30', '66ef4942533613a3d11f4bab18a357b7a5dc7463', 5, 5);
INSERT INTO att_logs VALUES (35798, 8, '2012-10-31', '13:28:51', '14391c2f68395399423a81af93348d9bcc9ebc91', 5, 5);
INSERT INTO att_logs VALUES (35799, 2, '2012-10-29', '16:34:49', '63d235fded781a48f8355b42e0397ca74d7599ee', 5, 5);
INSERT INTO att_logs VALUES (35800, 4, '2012-11-05', '08:05:08', '820722eb10cc1a34113c06bb2a22fac990e6230e', 5, 5);
INSERT INTO att_logs VALUES (35801, 7, '2012-11-07', '07:47:20', '565341b69e7bde62e3645c83afa3a6531c6c7ed3', 5, 5);
INSERT INTO att_logs VALUES (35802, 9, '2012-11-07', '18:03:29', '118ec538ea3ffa795012b176099218a762c584b8', 5, 5);
INSERT INTO att_logs VALUES (35803, 10, '2012-11-01', '18:16:10', '08abea014fd9527b5aff47dc91e8f563d2d09171', 5, 5);
INSERT INTO att_logs VALUES (35804, 3, '2012-10-29', '09:19:05', '484dc8af4cfb506f3c3ba924df98f5d6678b1b9a', 5, 5);
INSERT INTO att_logs VALUES (35805, 8, '2012-11-01', '12:36:55', 'ffb31885ecfc65ed6e44cad76b88db4b45385bb3', 5, 5);
INSERT INTO att_logs VALUES (35806, 2, '2012-10-30', '08:16:18', 'db8abe5fe6056c509d1528fcb1f81d34a3a078b5', 5, 5);
INSERT INTO att_logs VALUES (35807, 10, '2012-10-26', '19:48:03', '69eb5fd8d4c9106218094572dcdec99a1bee92bd', 5, 5);
INSERT INTO att_logs VALUES (35808, 1, '2012-11-06', '08:14:54', '12888163df3ba95aeadccd4d10dfd6b3b0016ad6', 5, 5);
INSERT INTO att_logs VALUES (35809, 7, '2012-11-09', '08:15:11', '0cdaf8e3a7c783775f0f15cb870bad022e89a49a', 5, 5);
INSERT INTO att_logs VALUES (35810, 10, '2012-11-02', '19:49:48', 'f28900da9da288571b28113e2f0fb4798f993f5a', 5, 5);
INSERT INTO att_logs VALUES (35811, 6, '2012-11-02', '08:14:54', 'fb611c652625542a9ede354e4093e81c9eb8eb20', 5, 5);
INSERT INTO att_logs VALUES (35812, 10, '2012-11-07', '17:57:59', '8757b8b90a9c90911fc796890287806bb3f05183', 5, 5);
INSERT INTO att_logs VALUES (35813, 1, '2012-10-30', '07:40:44', '214e445f4e6d62bf1746980aa7379de4419a79eb', 5, 5);
INSERT INTO att_logs VALUES (35814, 10, '2012-11-01', '12:25:59', 'd2879982462c2a1efea6e3b71d9df27818e45029', 5, 5);
INSERT INTO att_logs VALUES (35815, 4, '2012-11-02', '17:50:56', '8b6ad8fe020e64d9b37cc40c84847c082a487f63', 5, 5);
INSERT INTO att_logs VALUES (35816, 7, '2012-11-08', '08:04:43', '91d2784009f2f44293283beffcd8cd3aa797d273', 5, 5);
INSERT INTO att_logs VALUES (35817, 3, '2012-11-05', '17:33:46', '90ecb0d75c3042408d30b4a52325058494461397', 5, 5);
INSERT INTO att_logs VALUES (35818, 10, '2012-11-08', '12:10:27', 'a0c4356528dd5d51ebe0293daa40b4a7aeb59f80', 5, 5);
INSERT INTO att_logs VALUES (35819, 3, '2012-10-31', '09:41:01', '696e0651b9542fe91889b308e3896ba343c69eb7', 5, 5);
INSERT INTO att_logs VALUES (35820, 1, '2012-11-05', '07:21:02', '39965fe9fc2762fdecc96c7af571ac8468e85730', 5, 5);
INSERT INTO att_logs VALUES (35821, 5, '2012-10-29', '09:25:19', '8ce8161566565904be5c6a175743e0f6460af2e2', 5, 5);
INSERT INTO att_logs VALUES (35822, 4, '2012-10-30', '13:05:06', 'bab47a2ce57dfd207f76b96227dfe4a54b70f393', 5, 5);
INSERT INTO att_logs VALUES (35823, 2, '2012-11-01', '17:33:34', '3d1c0da97c9e0579eb3c65c212b7a6de906dd91e', 5, 5);
INSERT INTO att_logs VALUES (35824, 5, '2012-10-31', '18:56:07', '6ef61f9d5b793736f86874c23920a3a19bc2bdc3', 5, 5);
INSERT INTO att_logs VALUES (35825, 4, '2012-10-30', '17:36:55', 'd3ae8329b0c786df153e9198b52ad03937b87c27', 5, 5);
INSERT INTO att_logs VALUES (35826, 7, '2012-11-02', '08:14:24', 'e96ef6ccaca1d43a9f61ac8360375c45930acf52', 5, 5);
INSERT INTO att_logs VALUES (35827, 1, '2012-11-03', '07:49:30', 'f5c53019ae359a0bafd217c0be76c6f4fcd40f7c', 5, 5);
INSERT INTO att_logs VALUES (35828, 4, '2012-11-01', '10:52:07', '97e2c2d62d23253e67a71f64c9e4ac3e649d8578', 5, 5);
INSERT INTO att_logs VALUES (35829, 4, '2012-11-08', '17:47:42', '044ba13062ca041f015aa3b85680ab9fc6c00057', 5, 5);
INSERT INTO att_logs VALUES (35830, 1, '2012-10-30', '15:04:23', '11fa60d5da56a0168976ad781bd228b5f8d9c9f5', 5, 5);
INSERT INTO att_logs VALUES (35831, 9, '2012-11-08', '13:47:56', 'ce266029882dc344d584d9ef1392754bd9f1dc83', 5, 5);
INSERT INTO att_logs VALUES (35832, 6, '2012-10-30', '07:39:47', 'aa9ac26b4f0b467479d012c5988b5bc46dc99798', 5, 5);
INSERT INTO att_logs VALUES (35833, 2, '2012-10-31', '09:40:47', '85ece400253f92ff79fe8dafb87406d0882a528a', 5, 5);
INSERT INTO att_logs VALUES (35834, 9, '2012-10-31', '18:56:39', '2a913ff09dd0f66e6cb2dd129dc46b57bc72d475', 5, 5);
INSERT INTO att_logs VALUES (35835, 4, '2012-11-07', '07:45:04', '48f1bc5159e6fdcb9cb0a9fb5544f0a73345cdf3', 5, 5);
INSERT INTO att_logs VALUES (35836, 1, '2012-11-06', '18:31:46', '7c3daa182bf32a6d845d48f42600498b8e9122e9', 5, 5);
INSERT INTO att_logs VALUES (35837, 5, '2012-11-07', '07:32:02', '4344d726f8345682a2bc2114207fcce5c97630e6', 5, 5);
INSERT INTO att_logs VALUES (35838, 7, '2012-11-02', '16:00:40', '41b838ba3ca844645c08f7065fcd1222aa61b194', 5, 5);
INSERT INTO att_logs VALUES (35839, 1, '2012-11-07', '18:23:27', 'c3bbc9c83335a1874eb85ed69a86dd2cd6d33fc6', 5, 5);
INSERT INTO att_logs VALUES (35840, 7, '2012-10-30', '07:40:51', '1d09d501f8bed38ea1d7ec6ec0e6f61787565441', 5, 5);
INSERT INTO att_logs VALUES (35841, 2, '2012-10-30', '17:26:18', '79cdb5ab956cd9392ea6510bcbe3e0d03a627131', 5, 5);
INSERT INTO att_logs VALUES (35842, 10, '2012-11-05', '12:34:04', '955d1bc1d27343f5bd668a34d2a7851aa65534d3', 5, 5);
INSERT INTO att_logs VALUES (35843, 4, '2012-11-08', '16:17:19', '7e829d257c6741b24435b0547de19050e495896b', 5, 5);
INSERT INTO att_logs VALUES (35844, 7, '2012-10-29', '08:17:49', '7ff6d47be36557b9f14019d1f27e1327bea45e50', 5, 5);
INSERT INTO att_logs VALUES (35845, 10, '2012-11-05', '17:34:20', '4c7a016ad4b37def3220a7f2243df7737547cea1', 5, 5);
INSERT INTO att_logs VALUES (35846, 10, '2012-11-08', '17:46:10', '610b2e52e302e1a45a6b94dfbcd51720884ba90b', 5, 5);
INSERT INTO att_logs VALUES (35847, 10, '2012-10-29', '12:49:13', 'bbde1119d8054e3842ed81bd51e5ae92919740b9', 5, 5);
INSERT INTO att_logs VALUES (35848, 1, '2012-10-26', '19:44:57', 'd36d6ef94004e7dce5573eb5b18cb3053451ce6e', 5, 5);
INSERT INTO att_logs VALUES (35849, 1, '2012-11-07', '07:17:55', 'f4a25e9cdb084ca4adfbba1d83485d6373395bc9', 5, 5);
INSERT INTO att_logs VALUES (35850, 1, '2012-11-08', '10:43:02', '8261623375fdddbb81197e10292c53bd21cf9d62', 5, 5);
INSERT INTO att_logs VALUES (35851, 4, '2012-10-30', '08:22:18', '359d009d886fe75f62a66d3e319adedabda2bcc5', 5, 5);
INSERT INTO att_logs VALUES (35852, 9, '2012-10-29', '16:52:50', '7668cbf62d41efc4fdd4e172d0aa320145ee2f8d', 5, 5);
INSERT INTO att_logs VALUES (35853, 4, '2012-10-29', '08:27:08', 'e8d257823072aab309e091b45e84aaebdbd149b0', 5, 5);
INSERT INTO att_logs VALUES (35854, 7, '2012-10-26', '08:52:30', 'f118711f0b5a81a3774acf5bc05e5de0276f028f', 5, 5);
INSERT INTO att_logs VALUES (35855, 4, '2012-11-01', '08:27:29', 'e8d257823072aab309e091b45e84aaebdbd149b0', 5, 5);
INSERT INTO att_logs VALUES (35856, 4, '2012-10-26', '08:55:28', '95f8882875ec402622d529973f6c2e47449afda6', 5, 5);
INSERT INTO att_logs VALUES (35857, 3, '2012-10-30', '17:18:59', '2814543f8bd703ac0a54e9e0678af3df78204e0d', 5, 5);
INSERT INTO att_logs VALUES (35858, 2, '2012-11-05', '17:35:27', '35e61972424775efb75a64f1a00766100e473f95', 5, 5);
INSERT INTO att_logs VALUES (35859, 7, '2012-11-09', '08:15:08', '0cdaf8e3a7c783775f0f15cb870bad022e89a49a', 5, 5);
INSERT INTO att_logs VALUES (35860, 2, '2012-11-09', '12:04:37', '2afc90d8bd87517f0701c39d2e9e53bb6a23b08b', 5, 5);
INSERT INTO att_logs VALUES (35861, 4, '2012-10-26', '09:29:13', 'fb74a2fddcd1dba140ce86b17a978e0cb4273b60', 5, 5);
INSERT INTO att_logs VALUES (35862, 1, '2012-11-06', '07:01:28', 'd57160d8665284c31e32b29d3e4c67697c336090', 5, 5);
INSERT INTO att_logs VALUES (35863, 5, '2012-10-26', '19:45:12', 'ac30d757818cf21f215c0ebbbef8262d28d29fad', 5, 5);
INSERT INTO att_logs VALUES (35864, 7, '2012-11-05', '08:05:16', 'cb0d8583fdb043a686de4d373da573389d91b944', 5, 5);
INSERT INTO att_logs VALUES (35865, 4, '2012-10-30', '08:37:15', 'ea9a7206759fb5fcff9604c17e125cf6cdc5cbfa', 5, 5);
INSERT INTO att_logs VALUES (35866, 6, '2012-11-09', '08:14:57', 'fb611c652625542a9ede354e4093e81c9eb8eb20', 5, 5);
INSERT INTO att_logs VALUES (35867, 2, '2012-10-30', '13:05:13', '6b28b4c108558abae77e73790992acf780147061', 5, 5);
INSERT INTO att_logs VALUES (35868, 4, '2012-10-26', '09:31:00', '1d6ec73ffee0eb82a91e5161001185683afdfe38', 5, 5);
INSERT INTO att_logs VALUES (35869, 9, '2012-11-01', '13:50:11', '47e9d591d55e4e5b77cfd4900b967a11d05eee6a', 5, 5);
INSERT INTO att_logs VALUES (35870, 9, '2012-10-26', '19:47:57', 'd0ec928189b71d5f3304b7318beba7a59566af51', 5, 5);
INSERT INTO att_logs VALUES (35871, 2, '2012-11-09', '13:59:36', '08055a00839dfcc34278d7c83dd4049947d3994b', 5, 5);
INSERT INTO att_logs VALUES (35872, 5, '2012-11-07', '18:01:06', '77f648c887dd7e6521fd15cfa678238843fc7274', 5, 5);
INSERT INTO att_logs VALUES (35873, 4, '2012-11-09', '08:39:19', 'd1647bd5b3fbf31a9f2c2e28a0912c6d75410562', 5, 5);
INSERT INTO att_logs VALUES (35874, 4, '2012-11-06', '17:44:09', '2da9a2e932a044c2ec32912763b32c8933e74bfb', 5, 5);
INSERT INTO att_logs VALUES (35875, 2, '2012-11-02', '08:11:59', 'e3814f50894740ec21591ec580a4cda1df6dab3d', 5, 5);
INSERT INTO att_logs VALUES (35876, 5, '2012-11-01', '08:25:41', '56cca8ab6aea7d1ce0c12588f59e83b561d05016', 5, 5);
INSERT INTO att_logs VALUES (35877, 9, '2012-10-30', '18:04:39', 'f86d9f26387c127221b295816876432d7ed48346', 5, 5);
INSERT INTO att_logs VALUES (35878, 2, '2012-10-31', '16:44:29', '48d6493a319be60a55cbf62abac316280f558d4f', 5, 5);
INSERT INTO att_logs VALUES (35879, 2, '2012-11-02', '18:07:59', 'b39b78db5e2ebbf4975d8f99d4b2353e243b7d73', 5, 5);
INSERT INTO att_logs VALUES (35880, 1, '2012-10-30', '14:39:10', '1aa0d7f388025bda549d4489075bf4ae0732852c', 5, 5);
INSERT INTO att_logs VALUES (35881, 10, '2012-10-30', '18:04:28', 'ca29dc435d5f7700ec321088e9639bbac7fd1976', 5, 5);
INSERT INTO att_logs VALUES (35882, 3, '2012-11-07', '09:02:49', '09a630852438e6eba98712e8d6b3f3111e075d63', 5, 5);
INSERT INTO att_logs VALUES (35883, 10, '2012-10-30', '13:47:49', '21f8822003322af0745013b458647611dced2f3c', 5, 5);
INSERT INTO att_logs VALUES (35884, 6, '2012-10-26', '17:26:03', '44023fb151299b541882ef58746881f401c7c48b', 5, 5);
INSERT INTO att_logs VALUES (35885, 7, '2012-11-06', '07:49:35', 'e4e13f17542b82071a44ae7237e2957e5ae7c1f8', 5, 5);
INSERT INTO att_logs VALUES (35886, 2, '2012-11-08', '17:45:50', '9d020897ce24d4f3dfcdea873decfcdb8e93479b', 5, 5);
INSERT INTO att_logs VALUES (35887, 4, '2012-11-09', '10:10:21', 'b2595ac38cf58cb43433969882b07ca0b2e0c3bc', 5, 5);
INSERT INTO att_logs VALUES (35888, 5, '2012-11-06', '08:15:26', '1c6b7f988c344759ebc44d9c4e0646157f3f1881', 5, 5);
INSERT INTO att_logs VALUES (35889, 2, '2012-11-06', '18:30:06', 'e65d6c0ea73eb7a95b335a4d8b22ed79788cfda0', 5, 5);
INSERT INTO att_logs VALUES (35890, 1, '2012-10-26', '08:56:14', '13959746e6c02ec052812136297c979a92ef1c7b', 5, 5);
INSERT INTO att_logs VALUES (35891, 10, '2012-11-06', '14:26:37', '9f75c010a5aa902e8b05a4fcffbd575765493754', 5, 5);
INSERT INTO att_logs VALUES (35892, 1, '2012-10-30', '18:05:13', '1d2c292dd418b7092219254a433d1aff137f1343', 5, 5);
INSERT INTO att_logs VALUES (35893, 2, '2012-11-07', '08:00:11', '2215daf653c997d01a0d404ffc477abe4322cb9d', 5, 5);
INSERT INTO att_logs VALUES (35894, 1, '2012-11-09', '07:05:21', 'efffc1b83a4bde91aadd6dd5697cb3104c4b619b', 5, 5);
INSERT INTO att_logs VALUES (35895, 3, '2012-10-26', '09:21:35', 'c05b3a3537a3082a407e5ed9e1f0bcdfbe85ded1', 5, 5);
INSERT INTO att_logs VALUES (35896, 6, '2012-11-01', '09:22:51', '157028f8a28feabfc816706d051bd8b18d30bbd0', 5, 5);
INSERT INTO att_logs VALUES (35897, 1, '2012-11-06', '15:35:40', 'b04c4d4b1a1f066475e7e67b16fe490c1c87c3dd', 5, 5);
INSERT INTO att_logs VALUES (35898, 5, '2012-11-02', '19:50:55', 'e21c1c052ecb10a1ec0a15bda93e7ad321b7ca4f', 5, 5);
INSERT INTO att_logs VALUES (35899, 3, '2012-10-30', '09:17:00', 'b32eec12761fb95c25d18c44f62aa287782b00a5', 5, 5);
INSERT INTO att_logs VALUES (35900, 9, '2012-11-07', '13:01:34', '07ddea2d6db12a50fb4df73322d8f2dc0dab114d', 5, 5);
INSERT INTO att_logs VALUES (35901, 5, '2012-11-05', '07:21:09', '5aa209ece0f1c416b7d8e158874e2bbe7ccb298e', 5, 5);
INSERT INTO att_logs VALUES (35902, 1, '2012-11-02', '19:49:00', '4d609b2543daab0e3058aecc8cb7566bb91fd29f', 5, 5);
INSERT INTO att_logs VALUES (35903, 4, '2012-11-06', '08:20:39', 'f560c602f929320398f9b69bb7a81e8c2bbacd34', 5, 5);
INSERT INTO att_logs VALUES (35904, 10, '2012-10-31', '14:28:02', '14d43f788adcca317b1998a426a34efe51427609', 5, 5);
INSERT INTO att_logs VALUES (35905, 2, '2012-10-29', '09:18:35', '1847e7d86fdceaedc475ff1e5d17c64abc2652b9', 5, 5);
INSERT INTO att_logs VALUES (35906, 4, '2012-10-31', '08:45:55', '751b561139a34b3ea38f2daaf639362cbd8b986a', 5, 5);
INSERT INTO att_logs VALUES (35907, 7, '2012-11-07', '07:47:17', '565341b69e7bde62e3645c83afa3a6531c6c7ed3', 5, 5);
INSERT INTO att_logs VALUES (35908, 6, '2012-10-31', '08:10:36', '4437eaaf346a7ef3b0e2a963453061fee87af074', 5, 5);
INSERT INTO att_logs VALUES (35909, 5, '2012-10-29', '16:52:18', '1ca4531c35fb8bf76a0b56d252149e142b96de9b', 5, 5);
INSERT INTO att_logs VALUES (35910, 5, '2012-11-06', '07:53:32', 'bee9e4d08bdd1796ec2c4e006dbed8225f049791', 5, 5);
INSERT INTO att_logs VALUES (35911, 7, '2012-10-26', '08:56:28', '61069f91874b85043be2f7eff2452f0f996ce7d0', 5, 5);
INSERT INTO att_logs VALUES (35912, 6, '2012-10-29', '08:17:37', '7d16169bddf305e28285b552fa62346281de43bd', 5, 5);
INSERT INTO att_logs VALUES (35913, 2, '2012-11-09', '07:53:37', 'fe6eafde974a07c26316c4a67d6700612eaa88e8', 5, 5);
INSERT INTO att_logs VALUES (35914, 3, '2012-11-01', '09:11:08', 'f0d69572145de3be60dfbe37a87c5ad3c112d178', 5, 5);
INSERT INTO att_logs VALUES (35915, 7, '2012-11-06', '07:49:31', 'e4e13f17542b82071a44ae7237e2957e5ae7c1f8', 5, 5);
INSERT INTO att_logs VALUES (35916, 3, '2012-11-02', '16:00:28', 'fa4eed5026651a6a27fca873f1176914e387d8ad', 5, 5);
INSERT INTO att_logs VALUES (35917, 3, '2012-11-05', '10:10:27', '712079d90c160fd3e5753147fe7167a5e0bd3354', 5, 5);
INSERT INTO att_logs VALUES (35918, 8, '2012-11-01', '17:21:55', '51040cdd32518eb6418819efd7cd1b81522ed50f', 5, 5);
INSERT INTO att_logs VALUES (35919, 4, '2012-11-02', '08:08:18', '474c26a1a6e2d943ff8bb4f4cb8ae933c347bfab', 5, 5);
INSERT INTO att_logs VALUES (35920, 10, '2012-11-02', '14:34:36', '2cac7f0756ac6f0ca16627bfece317efbe3b373b', 5, 5);
INSERT INTO att_logs VALUES (35921, 10, '2012-11-09', '12:04:43', '68b8514c589f2c60a250705376f9047c370041e4', 5, 5);
INSERT INTO att_logs VALUES (35922, 5, '2012-11-02', '07:41:59', '45d4b733e913c8f9b1d3e493eb4aca1ee7c304fe', 5, 5);
INSERT INTO att_logs VALUES (35923, 7, '2012-11-01', '07:59:47', '4871cbd747f0b073a99b48501f45af07fd75a6dd', 5, 5);
INSERT INTO att_logs VALUES (35924, 7, '2012-10-30', '07:40:17', '1d09d501f8bed38ea1d7ec6ec0e6f61787565441', 5, 5);
INSERT INTO att_logs VALUES (35925, 9, '2012-10-31', '13:29:03', '2850cabe15332dadc400c55d50f8ac0f05ef8935', 5, 5);
INSERT INTO att_logs VALUES (35926, 1, '2012-11-02', '18:08:30', 'b76f13c8ef68cc66fd073acab8f20b8abf02ead7', 5, 5);
INSERT INTO att_logs VALUES (35927, 4, '2012-10-29', '16:56:17', 'cd786f57151b07da3565b15fcf429a61d0673f87', 5, 5);
INSERT INTO att_logs VALUES (35928, 3, '2012-11-06', '09:13:52', 'b69dba3c8fda2f247a49d0130d570ccc9d4a522b', 5, 5);
INSERT INTO att_logs VALUES (35929, 5, '2012-11-08', '08:04:23', '1e025b9d6da4251f2ed4424e27c5b509de39ee87', 5, 5);
INSERT INTO att_logs VALUES (35930, 9, '2012-10-29', '16:53:00', 'e7c03c3580c3f93d7aa9eac099c5b0a833bbbd4f', 5, 5);
INSERT INTO att_logs VALUES (35931, 1, '2012-11-08', '17:47:47', 'cfb91fec9453c54044e46bd83c683238ff396117', 5, 5);
INSERT INTO att_logs VALUES (35932, 9, '2012-11-08', '13:47:53', 'ce266029882dc344d584d9ef1392754bd9f1dc83', 5, 5);
INSERT INTO att_logs VALUES (35933, 6, '2012-10-26', '08:56:21', 'b334eb685b8a2824a7566aa8d22f1de365071b9e', 5, 5);
INSERT INTO att_logs VALUES (35934, 2, '2012-11-07', '10:47:51', 'a03c6baf59b3ff776f0a835ea64654b70f281386', 5, 5);
INSERT INTO att_logs VALUES (35935, 3, '2012-11-01', '17:22:04', 'e7275aeeff5ba0366006f46b512a936227b813d8', 5, 5);
INSERT INTO att_logs VALUES (35936, 2, '2012-11-05', '08:44:49', 'df130d0b7ae1bdfc212485f26b4def45ce959d7f', 5, 5);
INSERT INTO att_logs VALUES (35937, 9, '2012-11-02', '19:50:33', '2808701116692c967ab02e2bee560f7056646a51', 5, 5);
INSERT INTO att_logs VALUES (35938, 1, '2012-10-31', '06:55:45', '8af7bc6760d52c8f484f57b32abfa9f4d23c7441', 5, 5);
INSERT INTO att_logs VALUES (35939, 4, '2012-10-26', '17:57:46', 'b2e722079faa3a951e4ca118aef457a853717ff8', 5, 5);
INSERT INTO att_logs VALUES (35940, 9, '2012-10-26', '19:48:15', '04c6abb9dbd882e15dbe8879342bad48c3fa687c', 5, 5);
INSERT INTO att_logs VALUES (35941, 3, '2012-11-07', '17:58:06', 'fd5045e5498125eee5ebe531698a4862882a7bde', 5, 5);
INSERT INTO att_logs VALUES (35942, 1, '2012-11-02', '18:08:37', 'b76f13c8ef68cc66fd073acab8f20b8abf02ead7', 5, 5);
INSERT INTO att_logs VALUES (35943, 2, '2012-11-06', '08:15:06', 'bd3cae4a466cb7293c8be495d1f1979af95a7e21', 5, 5);
INSERT INTO att_logs VALUES (35944, 10, '2012-11-07', '14:30:12', '28765691d914a454907767b42c3d633c4a21afff', 5, 5);
INSERT INTO att_logs VALUES (35945, 1, '2012-10-29', '08:17:25', '2e7bc2bb6411b8a3ded482e15770f42adfb098a5', 5, 5);
INSERT INTO att_logs VALUES (35946, 6, '2012-11-01', '17:23:57', 'da1f25b9a4c1c2ceb96e95632651dbfc5810acda', 5, 5);
INSERT INTO att_logs VALUES (35947, 9, '2012-11-06', '12:17:01', 'e33157e361379a8692d7aa7e74b77dd918e9fe13', 5, 5);
INSERT INTO att_logs VALUES (35948, 1, '2012-11-01', '08:00:01', '1d5529ddefd7a22c5158a4424ebb660ae8511d82', 5, 5);
INSERT INTO att_logs VALUES (35949, 8, '2012-10-31', '17:12:15', '3c3d6dc00f6bd2ee590ae8f0724a766369157aee', 5, 5);
INSERT INTO att_logs VALUES (35950, 4, '2012-11-02', '08:07:11', '5218e2c3e1fa65a8b663c01aead8f3df7819e688', 5, 5);
INSERT INTO att_logs VALUES (35951, 7, '2012-11-02', '16:00:36', '41b838ba3ca844645c08f7065fcd1222aa61b194', 5, 5);
INSERT INTO att_logs VALUES (35952, 5, '2012-10-30', '07:32:28', '4344d726f8345682a2bc2114207fcce5c97630e6', 5, 5);
INSERT INTO att_logs VALUES (35953, 4, '2012-10-30', '10:34:31', '4f9682d341d5ec3bb5fd1166e1867e074a625932', 5, 5);
INSERT INTO att_logs VALUES (35954, 9, '2012-10-29', '15:50:37', 'ce7058607caf27e45d957f90ade76b554f6ee232', 5, 5);
INSERT INTO att_logs VALUES (35955, 1, '2012-10-30', '07:12:09', '37cf7b7097e68f2381bf2621b3bbb15ecc3c3361', 5, 5);
INSERT INTO att_logs VALUES (35956, 9, '2012-11-05', '17:36:14', 'ce5eda02fa1ea79d80aab9702acb1e6f782656ea', 5, 5);
INSERT INTO att_logs VALUES (36312, 2, '2012-11-09', '14:32:39', '1c1f8bd67126a17e7562a60050fc60f3c8a38ce3', 5, 5);


--
-- Data for Name: att_logs_temporal; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO att_logs_temporal VALUES (35427, 7, '2012-10-26', '08:52:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35428, 4, '2012-10-26', '08:55:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35429, 1, '2012-10-26', '08:56:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35430, 6, '2012-10-26', '08:56:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35431, 7, '2012-10-26', '08:56:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35432, 3, '2012-10-26', '09:21:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35433, 4, '2012-10-26', '09:29:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35434, 4, '2012-10-26', '09:31:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35435, 6, '2012-10-26', '17:26:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35436, 4, '2012-10-26', '17:57:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35437, 1, '2012-10-26', '19:44:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35438, 5, '2012-10-26', '19:45:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35439, 9, '2012-10-26', '19:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35440, 9, '2012-10-26', '19:47:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35441, 10, '2012-10-26', '19:48:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35442, 9, '2012-10-26', '19:48:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35443, 1, '2012-10-29', '08:17:25', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35444, 6, '2012-10-29', '08:17:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35445, 7, '2012-10-29', '08:17:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35446, 4, '2012-10-29', '08:27:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35447, 2, '2012-10-29', '09:18:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35448, 3, '2012-10-29', '09:19:05', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35449, 5, '2012-10-29', '09:25:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35450, 10, '2012-10-29', '12:48:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35451, 10, '2012-10-29', '12:49:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35452, 9, '2012-10-29', '15:50:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35453, 2, '2012-10-29', '16:34:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35454, 5, '2012-10-29', '16:52:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35455, 9, '2012-10-29', '16:52:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35456, 3, '2012-10-29', '16:52:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35457, 9, '2012-10-29', '16:53:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35458, 10, '2012-10-29', '16:54:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35459, 4, '2012-10-29', '16:56:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35460, 1, '2012-10-30', '07:12:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35461, 5, '2012-10-30', '07:32:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35462, 6, '2012-10-30', '07:39:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35463, 7, '2012-10-30', '07:40:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35464, 1, '2012-10-30', '07:40:44', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35465, 7, '2012-10-30', '07:40:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35466, 2, '2012-10-30', '08:16:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35467, 4, '2012-10-30', '08:22:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35468, 4, '2012-10-30', '08:37:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35469, 3, '2012-10-30', '09:17:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35470, 4, '2012-10-30', '10:34:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35471, 1, '2012-10-30', '12:03:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35472, 4, '2012-10-30', '13:05:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35473, 2, '2012-10-30', '13:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35474, 10, '2012-10-30', '13:47:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35475, 1, '2012-10-30', '14:39:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35476, 1, '2012-10-30', '15:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35477, 3, '2012-10-30', '17:18:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35478, 8, '2012-10-30', '17:19:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35479, 2, '2012-10-30', '17:26:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35480, 4, '2012-10-30', '17:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35481, 10, '2012-10-30', '18:04:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35482, 9, '2012-10-30', '18:04:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35483, 5, '2012-10-30', '18:04:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35484, 1, '2012-10-30', '18:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35485, 1, '2012-10-31', '06:55:45', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35486, 5, '2012-10-31', '07:29:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35487, 6, '2012-10-31', '08:10:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35488, 4, '2012-10-31', '08:45:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35489, 2, '2012-10-31', '09:40:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35490, 3, '2012-10-31', '09:41:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35491, 8, '2012-10-31', '13:28:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35492, 9, '2012-10-31', '13:29:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35493, 10, '2012-10-31', '14:28:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35494, 2, '2012-10-31', '16:44:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35495, 8, '2012-10-31', '17:12:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35496, 10, '2012-10-31', '18:55:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35497, 5, '2012-10-31', '18:56:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35498, 9, '2012-10-31', '18:56:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35499, 7, '2012-11-01', '07:59:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35500, 1, '2012-11-01', '08:00:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35501, 5, '2012-11-01', '08:25:41', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35502, 4, '2012-11-01', '08:27:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35503, 3, '2012-11-01', '09:11:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35504, 6, '2012-11-01', '09:22:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35505, 4, '2012-11-01', '10:52:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35506, 10, '2012-11-01', '12:25:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35507, 8, '2012-11-01', '12:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35508, 9, '2012-11-01', '13:50:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35509, 8, '2012-11-01', '17:21:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35510, 3, '2012-11-01', '17:22:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35511, 6, '2012-11-01', '17:23:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35512, 2, '2012-11-01', '17:33:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35513, 10, '2012-11-01', '18:16:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35514, 1, '2012-11-02', '07:12:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35515, 5, '2012-11-02', '07:41:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35516, 4, '2012-11-02', '08:07:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35517, 4, '2012-11-02', '08:08:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35518, 2, '2012-11-02', '08:11:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35519, 7, '2012-11-02', '08:14:24', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35520, 6, '2012-11-02', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35521, 3, '2012-11-02', '09:04:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35522, 10, '2012-11-02', '14:34:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35523, 9, '2012-11-02', '15:12:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35524, 3, '2012-11-02', '16:00:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35525, 7, '2012-11-02', '16:00:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35526, 7, '2012-11-02', '16:00:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35527, 4, '2012-11-02', '17:50:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35528, 2, '2012-11-02', '18:07:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35529, 1, '2012-11-02', '18:08:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35530, 1, '2012-11-02', '18:08:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35531, 1, '2012-11-02', '19:49:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35532, 10, '2012-11-02', '19:49:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35533, 9, '2012-11-02', '19:50:33', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35534, 5, '2012-11-02', '19:50:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35535, 1, '2012-11-03', '07:49:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35536, 1, '2012-11-05', '07:21:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35537, 5, '2012-11-05', '07:21:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35538, 4, '2012-11-05', '08:05:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35539, 7, '2012-11-05', '08:05:16', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35540, 2, '2012-11-05', '08:44:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35541, 3, '2012-11-05', '10:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35542, 10, '2012-11-05', '12:34:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35543, 3, '2012-11-05', '17:33:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35544, 10, '2012-11-05', '17:34:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35545, 2, '2012-11-05', '17:35:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35546, 9, '2012-11-05', '17:36:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35547, 5, '2012-11-05', '17:36:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35548, 1, '2012-11-06', '07:01:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35549, 7, '2012-11-06', '07:49:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35550, 7, '2012-11-06', '07:49:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35551, 5, '2012-11-06', '07:53:32', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35552, 1, '2012-11-06', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35553, 2, '2012-11-06', '08:15:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35554, 5, '2012-11-06', '08:15:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35555, 4, '2012-11-06', '08:20:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35556, 3, '2012-11-06', '09:13:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35557, 9, '2012-11-06', '12:17:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35558, 10, '2012-11-06', '14:26:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35559, 1, '2012-11-06', '15:35:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35560, 4, '2012-11-06', '17:44:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35561, 2, '2012-11-06', '18:30:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35562, 10, '2012-11-06', '18:30:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35563, 1, '2012-11-06', '18:31:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35564, 9, '2012-11-06', '18:32:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35565, 1, '2012-11-07', '07:17:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35566, 5, '2012-11-07', '07:32:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35567, 4, '2012-11-07', '07:45:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35568, 7, '2012-11-07', '07:47:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35569, 7, '2012-11-07', '07:47:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35570, 2, '2012-11-07', '08:00:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35571, 3, '2012-11-07', '09:02:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35572, 2, '2012-11-07', '10:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35573, 9, '2012-11-07', '13:01:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35574, 10, '2012-11-07', '14:30:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35575, 2, '2012-11-07', '17:57:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35576, 10, '2012-11-07', '17:57:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35577, 3, '2012-11-07', '17:58:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35578, 5, '2012-11-07', '18:01:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35579, 9, '2012-11-07', '18:03:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35580, 1, '2012-11-07', '18:23:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35581, 5, '2012-11-08', '08:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35582, 7, '2012-11-08', '08:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35583, 4, '2012-11-08', '08:14:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35584, 1, '2012-11-08', '10:43:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35585, 10, '2012-11-08', '12:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35586, 9, '2012-11-08', '13:47:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35587, 9, '2012-11-08', '13:47:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35588, 4, '2012-11-08', '16:17:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35589, 2, '2012-11-08', '17:45:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35590, 10, '2012-11-08', '17:46:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35591, 4, '2012-11-08', '17:47:42', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35592, 1, '2012-11-08', '17:47:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35593, 1, '2012-11-09', '07:05:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35594, 2, '2012-11-09', '07:53:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35595, 6, '2012-11-09', '08:14:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35596, 7, '2012-11-09', '08:15:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35597, 7, '2012-11-09', '08:15:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35598, 4, '2012-11-09', '08:39:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35599, 4, '2012-11-09', '10:10:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35600, 2, '2012-11-09', '12:04:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35601, 10, '2012-11-09', '12:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35602, 6, '2012-11-09', '12:37:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35603, 7, '2012-10-26', '08:52:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35604, 4, '2012-10-26', '08:55:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35605, 1, '2012-10-26', '08:56:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35606, 6, '2012-10-26', '08:56:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35607, 7, '2012-10-26', '08:56:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35608, 3, '2012-10-26', '09:21:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35609, 4, '2012-10-26', '09:29:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35610, 4, '2012-10-26', '09:31:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35611, 6, '2012-10-26', '17:26:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35612, 4, '2012-10-26', '17:57:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35613, 1, '2012-10-26', '19:44:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35614, 5, '2012-10-26', '19:45:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35615, 9, '2012-10-26', '19:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35616, 9, '2012-10-26', '19:47:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35617, 10, '2012-10-26', '19:48:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35618, 9, '2012-10-26', '19:48:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35619, 1, '2012-10-29', '08:17:25', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35620, 6, '2012-10-29', '08:17:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35621, 7, '2012-10-29', '08:17:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35622, 4, '2012-10-29', '08:27:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35623, 2, '2012-10-29', '09:18:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35624, 3, '2012-10-29', '09:19:05', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35625, 5, '2012-10-29', '09:25:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35626, 10, '2012-10-29', '12:48:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35627, 10, '2012-10-29', '12:49:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35628, 9, '2012-10-29', '15:50:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35629, 2, '2012-10-29', '16:34:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35630, 5, '2012-10-29', '16:52:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35631, 9, '2012-10-29', '16:52:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35632, 3, '2012-10-29', '16:52:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35633, 9, '2012-10-29', '16:53:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35634, 10, '2012-10-29', '16:54:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35635, 4, '2012-10-29', '16:56:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35636, 1, '2012-10-30', '07:12:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35637, 5, '2012-10-30', '07:32:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35638, 6, '2012-10-30', '07:39:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35639, 7, '2012-10-30', '07:40:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35640, 1, '2012-10-30', '07:40:44', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35641, 7, '2012-10-30', '07:40:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35642, 2, '2012-10-30', '08:16:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35643, 4, '2012-10-30', '08:22:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35644, 4, '2012-10-30', '08:37:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35645, 3, '2012-10-30', '09:17:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35646, 4, '2012-10-30', '10:34:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35647, 1, '2012-10-30', '12:03:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35648, 4, '2012-10-30', '13:05:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35649, 2, '2012-10-30', '13:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35650, 10, '2012-10-30', '13:47:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35651, 1, '2012-10-30', '14:39:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35652, 1, '2012-10-30', '15:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35653, 3, '2012-10-30', '17:18:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35654, 8, '2012-10-30', '17:19:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35655, 2, '2012-10-30', '17:26:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35656, 4, '2012-10-30', '17:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35657, 10, '2012-10-30', '18:04:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35658, 9, '2012-10-30', '18:04:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35659, 5, '2012-10-30', '18:04:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35660, 1, '2012-10-30', '18:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35661, 1, '2012-10-31', '06:55:45', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35662, 5, '2012-10-31', '07:29:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35663, 6, '2012-10-31', '08:10:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35664, 4, '2012-10-31', '08:45:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35665, 2, '2012-10-31', '09:40:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35666, 3, '2012-10-31', '09:41:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35667, 8, '2012-10-31', '13:28:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35668, 9, '2012-10-31', '13:29:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35669, 10, '2012-10-31', '14:28:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35670, 2, '2012-10-31', '16:44:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35671, 8, '2012-10-31', '17:12:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35672, 10, '2012-10-31', '18:55:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35673, 5, '2012-10-31', '18:56:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35674, 9, '2012-10-31', '18:56:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35675, 7, '2012-11-01', '07:59:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35676, 1, '2012-11-01', '08:00:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35677, 5, '2012-11-01', '08:25:41', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35678, 4, '2012-11-01', '08:27:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35679, 3, '2012-11-01', '09:11:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35680, 6, '2012-11-01', '09:22:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35681, 4, '2012-11-01', '10:52:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35682, 10, '2012-11-01', '12:25:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35683, 8, '2012-11-01', '12:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35684, 9, '2012-11-01', '13:50:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35685, 8, '2012-11-01', '17:21:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35686, 3, '2012-11-01', '17:22:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35687, 6, '2012-11-01', '17:23:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35688, 2, '2012-11-01', '17:33:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35689, 10, '2012-11-01', '18:16:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35690, 1, '2012-11-02', '07:12:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35691, 5, '2012-11-02', '07:41:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35692, 4, '2012-11-02', '08:07:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35693, 4, '2012-11-02', '08:08:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35694, 2, '2012-11-02', '08:11:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35695, 7, '2012-11-02', '08:14:24', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35696, 6, '2012-11-02', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35697, 3, '2012-11-02', '09:04:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35698, 10, '2012-11-02', '14:34:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35699, 9, '2012-11-02', '15:12:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35700, 3, '2012-11-02', '16:00:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35701, 7, '2012-11-02', '16:00:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35702, 7, '2012-11-02', '16:00:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35703, 4, '2012-11-02', '17:50:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35704, 2, '2012-11-02', '18:07:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35705, 1, '2012-11-02', '18:08:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35706, 1, '2012-11-02', '18:08:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35707, 1, '2012-11-02', '19:49:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35708, 10, '2012-11-02', '19:49:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35709, 9, '2012-11-02', '19:50:33', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35710, 5, '2012-11-02', '19:50:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35711, 1, '2012-11-03', '07:49:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35712, 1, '2012-11-05', '07:21:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35713, 5, '2012-11-05', '07:21:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35714, 4, '2012-11-05', '08:05:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35715, 7, '2012-11-05', '08:05:16', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35716, 2, '2012-11-05', '08:44:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35717, 3, '2012-11-05', '10:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35718, 10, '2012-11-05', '12:34:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35719, 3, '2012-11-05', '17:33:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35720, 10, '2012-11-05', '17:34:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35721, 2, '2012-11-05', '17:35:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35722, 9, '2012-11-05', '17:36:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35723, 5, '2012-11-05', '17:36:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35724, 1, '2012-11-06', '07:01:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35725, 7, '2012-11-06', '07:49:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35726, 7, '2012-11-06', '07:49:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35727, 5, '2012-11-06', '07:53:32', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35728, 1, '2012-11-06', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35729, 2, '2012-11-06', '08:15:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35730, 5, '2012-11-06', '08:15:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35731, 4, '2012-11-06', '08:20:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35732, 3, '2012-11-06', '09:13:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35733, 9, '2012-11-06', '12:17:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35734, 10, '2012-11-06', '14:26:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35735, 1, '2012-11-06', '15:35:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35736, 4, '2012-11-06', '17:44:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35737, 2, '2012-11-06', '18:30:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35738, 10, '2012-11-06', '18:30:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35739, 1, '2012-11-06', '18:31:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35740, 9, '2012-11-06', '18:32:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35741, 1, '2012-11-07', '07:17:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35742, 5, '2012-11-07', '07:32:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35743, 4, '2012-11-07', '07:45:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35744, 7, '2012-11-07', '07:47:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35745, 7, '2012-11-07', '07:47:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35746, 2, '2012-11-07', '08:00:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35747, 3, '2012-11-07', '09:02:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35748, 2, '2012-11-07', '10:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35749, 9, '2012-11-07', '13:01:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35750, 10, '2012-11-07', '14:30:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35751, 2, '2012-11-07', '17:57:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35752, 10, '2012-11-07', '17:57:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35753, 3, '2012-11-07', '17:58:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35754, 5, '2012-11-07', '18:01:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35755, 9, '2012-11-07', '18:03:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35756, 1, '2012-11-07', '18:23:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35757, 5, '2012-11-08', '08:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35758, 7, '2012-11-08', '08:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35759, 4, '2012-11-08', '08:14:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35760, 1, '2012-11-08', '10:43:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35761, 10, '2012-11-08', '12:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35762, 9, '2012-11-08', '13:47:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35763, 9, '2012-11-08', '13:47:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35764, 4, '2012-11-08', '16:17:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35765, 2, '2012-11-08', '17:45:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35766, 10, '2012-11-08', '17:46:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35767, 4, '2012-11-08', '17:47:42', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35768, 1, '2012-11-08', '17:47:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35769, 1, '2012-11-09', '07:05:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35770, 2, '2012-11-09', '07:53:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35771, 6, '2012-11-09', '08:14:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35772, 7, '2012-11-09', '08:15:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35773, 7, '2012-11-09', '08:15:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35774, 4, '2012-11-09', '08:39:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35775, 4, '2012-11-09', '10:10:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35776, 2, '2012-11-09', '12:04:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35777, 10, '2012-11-09', '12:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35778, 6, '2012-11-09', '12:37:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35779, 2, '2012-11-09', '13:59:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35957, 7, '2012-10-26', '08:52:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35958, 4, '2012-10-26', '08:55:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35959, 1, '2012-10-26', '08:56:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35960, 6, '2012-10-26', '08:56:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35961, 7, '2012-10-26', '08:56:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35962, 3, '2012-10-26', '09:21:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35963, 4, '2012-10-26', '09:29:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35964, 4, '2012-10-26', '09:31:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35965, 6, '2012-10-26', '17:26:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35966, 4, '2012-10-26', '17:57:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35967, 1, '2012-10-26', '19:44:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35968, 5, '2012-10-26', '19:45:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35969, 9, '2012-10-26', '19:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35970, 9, '2012-10-26', '19:47:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35971, 10, '2012-10-26', '19:48:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35972, 9, '2012-10-26', '19:48:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35973, 1, '2012-10-29', '08:17:25', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35974, 6, '2012-10-29', '08:17:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35975, 7, '2012-10-29', '08:17:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35976, 4, '2012-10-29', '08:27:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35977, 2, '2012-10-29', '09:18:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35978, 3, '2012-10-29', '09:19:05', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35979, 5, '2012-10-29', '09:25:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35980, 10, '2012-10-29', '12:48:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35981, 10, '2012-10-29', '12:49:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35982, 9, '2012-10-29', '15:50:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35983, 2, '2012-10-29', '16:34:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35984, 5, '2012-10-29', '16:52:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35985, 9, '2012-10-29', '16:52:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35986, 3, '2012-10-29', '16:52:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35987, 9, '2012-10-29', '16:53:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35988, 10, '2012-10-29', '16:54:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35989, 4, '2012-10-29', '16:56:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35990, 1, '2012-10-30', '07:12:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35991, 5, '2012-10-30', '07:32:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35992, 6, '2012-10-30', '07:39:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35993, 7, '2012-10-30', '07:40:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35994, 1, '2012-10-30', '07:40:44', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35995, 7, '2012-10-30', '07:40:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35996, 2, '2012-10-30', '08:16:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35997, 4, '2012-10-30', '08:22:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35998, 4, '2012-10-30', '08:37:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (35999, 3, '2012-10-30', '09:17:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36000, 4, '2012-10-30', '10:34:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36001, 1, '2012-10-30', '12:03:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36002, 4, '2012-10-30', '13:05:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36003, 2, '2012-10-30', '13:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36004, 10, '2012-10-30', '13:47:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36005, 1, '2012-10-30', '14:39:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36006, 1, '2012-10-30', '15:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36007, 3, '2012-10-30', '17:18:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36008, 8, '2012-10-30', '17:19:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36009, 2, '2012-10-30', '17:26:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36010, 4, '2012-10-30', '17:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36011, 10, '2012-10-30', '18:04:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36012, 9, '2012-10-30', '18:04:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36013, 5, '2012-10-30', '18:04:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36014, 1, '2012-10-30', '18:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36015, 1, '2012-10-31', '06:55:45', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36016, 5, '2012-10-31', '07:29:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36017, 6, '2012-10-31', '08:10:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36018, 4, '2012-10-31', '08:45:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36019, 2, '2012-10-31', '09:40:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36020, 3, '2012-10-31', '09:41:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36021, 8, '2012-10-31', '13:28:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36022, 9, '2012-10-31', '13:29:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36023, 10, '2012-10-31', '14:28:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36024, 2, '2012-10-31', '16:44:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36025, 8, '2012-10-31', '17:12:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36026, 10, '2012-10-31', '18:55:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36027, 5, '2012-10-31', '18:56:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36028, 9, '2012-10-31', '18:56:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36029, 7, '2012-11-01', '07:59:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36030, 1, '2012-11-01', '08:00:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36031, 5, '2012-11-01', '08:25:41', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36032, 4, '2012-11-01', '08:27:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36033, 3, '2012-11-01', '09:11:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36034, 6, '2012-11-01', '09:22:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36035, 4, '2012-11-01', '10:52:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36036, 10, '2012-11-01', '12:25:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36037, 8, '2012-11-01', '12:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36038, 9, '2012-11-01', '13:50:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36039, 8, '2012-11-01', '17:21:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36040, 3, '2012-11-01', '17:22:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36041, 6, '2012-11-01', '17:23:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36042, 2, '2012-11-01', '17:33:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36043, 10, '2012-11-01', '18:16:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36044, 1, '2012-11-02', '07:12:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36045, 5, '2012-11-02', '07:41:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36046, 4, '2012-11-02', '08:07:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36047, 4, '2012-11-02', '08:08:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36048, 2, '2012-11-02', '08:11:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36049, 7, '2012-11-02', '08:14:24', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36050, 6, '2012-11-02', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36051, 3, '2012-11-02', '09:04:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36052, 10, '2012-11-02', '14:34:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36053, 9, '2012-11-02', '15:12:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36054, 3, '2012-11-02', '16:00:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36055, 7, '2012-11-02', '16:00:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36056, 7, '2012-11-02', '16:00:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36057, 4, '2012-11-02', '17:50:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36058, 2, '2012-11-02', '18:07:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36059, 1, '2012-11-02', '18:08:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36060, 1, '2012-11-02', '18:08:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36061, 1, '2012-11-02', '19:49:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36062, 10, '2012-11-02', '19:49:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36063, 9, '2012-11-02', '19:50:33', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36064, 5, '2012-11-02', '19:50:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36065, 1, '2012-11-03', '07:49:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36066, 1, '2012-11-05', '07:21:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36067, 5, '2012-11-05', '07:21:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36068, 4, '2012-11-05', '08:05:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36069, 7, '2012-11-05', '08:05:16', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36070, 2, '2012-11-05', '08:44:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36071, 3, '2012-11-05', '10:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36072, 10, '2012-11-05', '12:34:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36073, 3, '2012-11-05', '17:33:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36074, 10, '2012-11-05', '17:34:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36075, 2, '2012-11-05', '17:35:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36076, 9, '2012-11-05', '17:36:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36077, 5, '2012-11-05', '17:36:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36078, 1, '2012-11-06', '07:01:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36079, 7, '2012-11-06', '07:49:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36080, 7, '2012-11-06', '07:49:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36081, 5, '2012-11-06', '07:53:32', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36082, 1, '2012-11-06', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36083, 2, '2012-11-06', '08:15:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36084, 5, '2012-11-06', '08:15:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36085, 4, '2012-11-06', '08:20:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36086, 3, '2012-11-06', '09:13:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36087, 9, '2012-11-06', '12:17:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36088, 10, '2012-11-06', '14:26:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36089, 1, '2012-11-06', '15:35:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36090, 4, '2012-11-06', '17:44:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36091, 2, '2012-11-06', '18:30:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36092, 10, '2012-11-06', '18:30:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36093, 1, '2012-11-06', '18:31:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36094, 9, '2012-11-06', '18:32:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36095, 1, '2012-11-07', '07:17:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36096, 5, '2012-11-07', '07:32:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36097, 4, '2012-11-07', '07:45:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36098, 7, '2012-11-07', '07:47:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36099, 7, '2012-11-07', '07:47:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36100, 2, '2012-11-07', '08:00:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36101, 3, '2012-11-07', '09:02:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36102, 2, '2012-11-07', '10:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36103, 9, '2012-11-07', '13:01:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36104, 10, '2012-11-07', '14:30:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36105, 2, '2012-11-07', '17:57:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36106, 10, '2012-11-07', '17:57:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36107, 3, '2012-11-07', '17:58:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36108, 5, '2012-11-07', '18:01:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36109, 9, '2012-11-07', '18:03:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36110, 1, '2012-11-07', '18:23:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36111, 5, '2012-11-08', '08:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36112, 7, '2012-11-08', '08:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36113, 4, '2012-11-08', '08:14:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36114, 1, '2012-11-08', '10:43:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36115, 10, '2012-11-08', '12:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36116, 9, '2012-11-08', '13:47:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36117, 9, '2012-11-08', '13:47:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36118, 4, '2012-11-08', '16:17:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36119, 2, '2012-11-08', '17:45:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36120, 10, '2012-11-08', '17:46:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36121, 4, '2012-11-08', '17:47:42', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36122, 1, '2012-11-08', '17:47:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36123, 1, '2012-11-09', '07:05:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36124, 2, '2012-11-09', '07:53:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36125, 6, '2012-11-09', '08:14:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36126, 7, '2012-11-09', '08:15:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36127, 7, '2012-11-09', '08:15:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36128, 4, '2012-11-09', '08:39:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36129, 4, '2012-11-09', '10:10:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36130, 2, '2012-11-09', '12:04:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36131, 10, '2012-11-09', '12:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36132, 6, '2012-11-09', '12:37:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36133, 2, '2012-11-09', '13:59:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36134, 7, '2012-10-26', '08:52:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36135, 4, '2012-10-26', '08:55:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36136, 1, '2012-10-26', '08:56:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36137, 6, '2012-10-26', '08:56:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36138, 7, '2012-10-26', '08:56:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36139, 3, '2012-10-26', '09:21:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36140, 4, '2012-10-26', '09:29:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36141, 4, '2012-10-26', '09:31:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36142, 6, '2012-10-26', '17:26:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36143, 4, '2012-10-26', '17:57:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36144, 1, '2012-10-26', '19:44:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36145, 5, '2012-10-26', '19:45:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36146, 9, '2012-10-26', '19:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36147, 9, '2012-10-26', '19:47:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36148, 10, '2012-10-26', '19:48:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36149, 9, '2012-10-26', '19:48:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36150, 1, '2012-10-29', '08:17:25', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36151, 6, '2012-10-29', '08:17:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36152, 7, '2012-10-29', '08:17:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36153, 4, '2012-10-29', '08:27:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36154, 2, '2012-10-29', '09:18:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36155, 3, '2012-10-29', '09:19:05', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36156, 5, '2012-10-29', '09:25:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36157, 10, '2012-10-29', '12:48:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36158, 10, '2012-10-29', '12:49:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36159, 9, '2012-10-29', '15:50:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36160, 2, '2012-10-29', '16:34:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36161, 5, '2012-10-29', '16:52:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36162, 9, '2012-10-29', '16:52:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36163, 3, '2012-10-29', '16:52:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36164, 9, '2012-10-29', '16:53:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36165, 10, '2012-10-29', '16:54:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36166, 4, '2012-10-29', '16:56:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36167, 1, '2012-10-30', '07:12:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36168, 5, '2012-10-30', '07:32:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36169, 6, '2012-10-30', '07:39:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36170, 7, '2012-10-30', '07:40:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36171, 1, '2012-10-30', '07:40:44', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36172, 7, '2012-10-30', '07:40:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36173, 2, '2012-10-30', '08:16:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36174, 4, '2012-10-30', '08:22:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36175, 4, '2012-10-30', '08:37:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36176, 3, '2012-10-30', '09:17:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36177, 4, '2012-10-30', '10:34:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36178, 1, '2012-10-30', '12:03:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36179, 4, '2012-10-30', '13:05:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36180, 2, '2012-10-30', '13:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36181, 10, '2012-10-30', '13:47:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36182, 1, '2012-10-30', '14:39:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36183, 1, '2012-10-30', '15:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36184, 3, '2012-10-30', '17:18:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36185, 8, '2012-10-30', '17:19:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36186, 2, '2012-10-30', '17:26:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36187, 4, '2012-10-30', '17:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36188, 10, '2012-10-30', '18:04:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36189, 9, '2012-10-30', '18:04:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36190, 5, '2012-10-30', '18:04:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36191, 1, '2012-10-30', '18:05:13', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36192, 1, '2012-10-31', '06:55:45', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36193, 5, '2012-10-31', '07:29:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36194, 6, '2012-10-31', '08:10:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36195, 4, '2012-10-31', '08:45:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36196, 2, '2012-10-31', '09:40:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36197, 3, '2012-10-31', '09:41:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36198, 8, '2012-10-31', '13:28:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36199, 9, '2012-10-31', '13:29:03', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36200, 10, '2012-10-31', '14:28:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36201, 2, '2012-10-31', '16:44:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36202, 8, '2012-10-31', '17:12:15', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36203, 10, '2012-10-31', '18:55:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36204, 5, '2012-10-31', '18:56:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36205, 9, '2012-10-31', '18:56:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36206, 7, '2012-11-01', '07:59:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36207, 1, '2012-11-01', '08:00:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36208, 5, '2012-11-01', '08:25:41', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36209, 4, '2012-11-01', '08:27:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36210, 3, '2012-11-01', '09:11:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36211, 6, '2012-11-01', '09:22:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36212, 4, '2012-11-01', '10:52:07', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36213, 10, '2012-11-01', '12:25:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36214, 8, '2012-11-01', '12:36:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36215, 9, '2012-11-01', '13:50:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36216, 8, '2012-11-01', '17:21:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36217, 3, '2012-11-01', '17:22:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36218, 6, '2012-11-01', '17:23:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36219, 2, '2012-11-01', '17:33:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36220, 10, '2012-11-01', '18:16:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36221, 1, '2012-11-02', '07:12:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36222, 5, '2012-11-02', '07:41:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36223, 4, '2012-11-02', '08:07:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36224, 4, '2012-11-02', '08:08:18', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36225, 2, '2012-11-02', '08:11:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36226, 7, '2012-11-02', '08:14:24', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36227, 6, '2012-11-02', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36228, 3, '2012-11-02', '09:04:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36229, 10, '2012-11-02', '14:34:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36230, 9, '2012-11-02', '15:12:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36231, 3, '2012-11-02', '16:00:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36232, 7, '2012-11-02', '16:00:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36233, 7, '2012-11-02', '16:00:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36234, 4, '2012-11-02', '17:50:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36235, 2, '2012-11-02', '18:07:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36236, 1, '2012-11-02', '18:08:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36237, 1, '2012-11-02', '18:08:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36238, 1, '2012-11-02', '19:49:00', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36239, 10, '2012-11-02', '19:49:48', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36240, 9, '2012-11-02', '19:50:33', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36241, 5, '2012-11-02', '19:50:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36242, 1, '2012-11-03', '07:49:30', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36243, 1, '2012-11-05', '07:21:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36244, 5, '2012-11-05', '07:21:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36245, 4, '2012-11-05', '08:05:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36246, 7, '2012-11-05', '08:05:16', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36247, 2, '2012-11-05', '08:44:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36248, 3, '2012-11-05', '10:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36249, 10, '2012-11-05', '12:34:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36250, 3, '2012-11-05', '17:33:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36251, 10, '2012-11-05', '17:34:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36252, 2, '2012-11-05', '17:35:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36253, 9, '2012-11-05', '17:36:14', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36254, 5, '2012-11-05', '17:36:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36255, 1, '2012-11-06', '07:01:28', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36256, 7, '2012-11-06', '07:49:31', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36257, 7, '2012-11-06', '07:49:35', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36258, 5, '2012-11-06', '07:53:32', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36259, 1, '2012-11-06', '08:14:54', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36260, 2, '2012-11-06', '08:15:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36261, 5, '2012-11-06', '08:15:26', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36262, 4, '2012-11-06', '08:20:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36263, 3, '2012-11-06', '09:13:52', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36264, 9, '2012-11-06', '12:17:01', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36265, 10, '2012-11-06', '14:26:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36266, 1, '2012-11-06', '15:35:40', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36267, 4, '2012-11-06', '17:44:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36268, 2, '2012-11-06', '18:30:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36269, 10, '2012-11-06', '18:30:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36270, 1, '2012-11-06', '18:31:46', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36271, 9, '2012-11-06', '18:32:09', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36272, 1, '2012-11-07', '07:17:55', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36273, 5, '2012-11-07', '07:32:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36274, 4, '2012-11-07', '07:45:04', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36275, 7, '2012-11-07', '07:47:17', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36276, 7, '2012-11-07', '07:47:20', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36277, 2, '2012-11-07', '08:00:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36278, 3, '2012-11-07', '09:02:49', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36279, 2, '2012-11-07', '10:47:51', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36280, 9, '2012-11-07', '13:01:34', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36281, 10, '2012-11-07', '14:30:12', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36282, 2, '2012-11-07', '17:57:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36283, 10, '2012-11-07', '17:57:59', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36284, 3, '2012-11-07', '17:58:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36285, 5, '2012-11-07', '18:01:06', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36286, 9, '2012-11-07', '18:03:29', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36287, 1, '2012-11-07', '18:23:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36288, 5, '2012-11-08', '08:04:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36289, 7, '2012-11-08', '08:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36290, 4, '2012-11-08', '08:14:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36291, 1, '2012-11-08', '10:43:02', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36292, 10, '2012-11-08', '12:10:27', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36293, 9, '2012-11-08', '13:47:53', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36294, 9, '2012-11-08', '13:47:56', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36295, 4, '2012-11-08', '16:17:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36296, 2, '2012-11-08', '17:45:50', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36297, 10, '2012-11-08', '17:46:10', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36298, 4, '2012-11-08', '17:47:42', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36299, 1, '2012-11-08', '17:47:47', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36300, 1, '2012-11-09', '07:05:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36301, 2, '2012-11-09', '07:53:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36302, 6, '2012-11-09', '08:14:57', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36303, 7, '2012-11-09', '08:15:08', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36304, 7, '2012-11-09', '08:15:11', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36305, 4, '2012-11-09', '08:39:19', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36306, 4, '2012-11-09', '10:10:21', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36307, 2, '2012-11-09', '12:04:37', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36308, 10, '2012-11-09', '12:04:43', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36309, 6, '2012-11-09', '12:37:23', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36310, 2, '2012-11-09', '13:59:36', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);
INSERT INTO att_logs_temporal VALUES (36311, 2, '2012-11-09', '14:32:39', 'd538ddb6fb5ae3b5c24c776a631b0617229eb9b5', 5, 5);


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
INSERT INTO seguridad_bitacora VALUES (2568, '2012-11-09', '08:31:40', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.101', 1, '');
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
INSERT INTO seguridad_bitacora VALUES (2569, '2012-11-09', '08:31:48', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.101', 1, '');
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
INSERT INTO seguridad_bitacora VALUES (2558, '2012-11-06', '14:32:10', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2559, '2012-11-06', '14:32:46', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 11, '');
INSERT INTO seguridad_bitacora VALUES (2560, '2012-11-06', '17:27:10', '', '', 'Apertura de Sesi&oacute;n', '201.238.13.215', 11, '');
INSERT INTO seguridad_bitacora VALUES (2561, '2012-11-07', '10:02:54', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2562, '2012-11-08', '06:48:00', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 1, '');
INSERT INTO seguridad_bitacora VALUES (2563, '2012-11-08', '06:52:46', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 1, '');
INSERT INTO seguridad_bitacora VALUES (2564, '2012-11-08', '07:17:53', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 1, '');
INSERT INTO seguridad_bitacora VALUES (2565, '2012-11-08', '13:03:07', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 1, '');
INSERT INTO seguridad_bitacora VALUES (2566, '2012-11-08', '13:16:03', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 1, '');
INSERT INTO seguridad_bitacora VALUES (2567, '2012-11-09', '08:24:56', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2570, '2012-11-09', '08:32:49', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2571, '2012-11-09', '08:32:56', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2572, '2012-11-09', '08:34:32', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2573, '2012-11-09', '08:37:01', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2574, '2012-11-09', '08:38:30', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2575, '2012-11-09', '08:38:40', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.101', 1, '');
INSERT INTO seguridad_bitacora VALUES (2576, '2012-11-09', '10:43:22', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2577, '2012-11-09', '10:43:27', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2578, '2012-11-09', '10:57:53', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2579, '2012-11-09', '10:58:22', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2580, '2012-11-09', '10:58:55', '', '', 'Cierre de Sesi&oacute;n', '192.168.1.105', 1, '');
INSERT INTO seguridad_bitacora VALUES (2581, '2012-11-09', '10:58:59', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.105', 1, '');


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
INSERT INTO seguridad_usuarios VALUES (11, '9420867', 'luisf', '81dc9bdb52d04dc20036dbd8313ed055', 'Activo', '2012-10-30', '061e7474d23cf60fb8c2619030576d15');
INSERT INTO seguridad_usuarios VALUES (1, '0000000', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Activo', '2009-04-24', '0dced2f920808b3c9fca7c0747438a88');


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
-- Name: att_logs_pkey_temporal; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY att_logs_temporal
    ADD CONSTRAINT att_logs_pkey_temporal PRIMARY KEY (id);


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

