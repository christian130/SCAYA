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

SELECT pg_catalog.setval('att_logs_id_seq', 31023, true);


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

SELECT pg_catalog.setval('att_personas_gid_seq', 156, true);


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
-- Name: listing_files; Type: TABLE; Schema: public; Owner: cbiometrico; Tablespace: 
--

CREATE TABLE listing_files (
    id integer NOT NULL,
    path character varying(300),
    description character varying(300),
    id_other character varying(300)
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

SELECT pg_catalog.setval('listing_files_id_seq', 1, true);


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

SELECT pg_catalog.setval('seguridad_bitacora_idbitacora_seq', 2198, true);


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

SELECT pg_catalog.setval('seguridad_usuarios_idusuario_seq', 10, true);


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

SELECT pg_catalog.setval('seguridad_usuarios_programas_privilegios_idusuarios_programas_p', 1128, true);


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



--
-- Data for Name: att_personas; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO att_personas VALUES (149, 5, 'CHRISTIAN VIVAS', 17176888, true, 1, true, 1, 5, true, NULL);
INSERT INTO att_personas VALUES (150, 8, 'YULIETH MENDOZA', 18734582, true, 6, true, 3, 5, true, NULL);
INSERT INTO att_personas VALUES (151, 5, 'THAIS MENDOZA', 11025797, true, 5, true, 4, 5, true, NULL);
INSERT INTO att_personas VALUES (152, 9, 'ISRAEL FRANQUIZ', 27235515, true, 5, true, 3, 5, true, NULL);
INSERT INTO att_personas VALUES (153, 10, 'MOISES FRANQUIZ', 999999999, true, 5, true, 3, 5, true, NULL);
INSERT INTO att_personas VALUES (154, 4, 'NESTOR MONTAñO', 17311603, true, 1, true, 1, 5, true, NULL);
INSERT INTO att_personas VALUES (155, 6, 'JONATHAN MERLANO', 23184005, true, 1, true, 2, 5, true, NULL);
INSERT INTO att_personas VALUES (156, 7, 'DELKIMET MERLANO', 22964529, true, 1, true, 2, 5, true, NULL);
INSERT INTO att_personas VALUES (148, 1, 'LUIS FRANQUIZ', 9420867, true, 1, true, 1, 5, true, NULL);


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
-- Data for Name: listing_files; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO listing_files VALUES (1, 'asedsadsadsaadq431', 'asdsadsd', '111');


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
INSERT INTO seguridad_bitacora VALUES (2179, '2012-10-29', '08:26:05', '', '', 'Apertura de Sesi&oacute;n', '192.168.1.104', 1, '');
INSERT INTO seguridad_bitacora VALUES (2180, '2012-10-29', '08:52:31', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2181, '2012-10-29', '12:13:59', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2182, '2012-10-31', '09:38:34', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2183, '2012-10-31', '14:08:43', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2184, '2012-11-01', '06:50:29', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2185, '2012-11-01', '09:03:01', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2186, '2012-11-01', '09:03:32', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2187, '2012-11-01', '09:03:52', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2188, '2012-11-01', '11:15:12', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2189, '2012-11-01', '11:49:52', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2190, '2012-11-01', '12:18:54', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2191, '2012-11-01', '12:24:41', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2192, '2012-11-01', '12:49:36', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2193, '2012-11-01', '12:49:49', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2194, '2012-11-01', '13:12:39', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2195, '2012-11-01', '13:12:56', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2196, '2012-11-01', '13:18:41', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2197, '2012-11-01', '13:25:51', '', '', 'Apertura de Sesi&oacute;n', '127.0.0.1', 1, '');
INSERT INTO seguridad_bitacora VALUES (2198, '2012-11-01', '13:35:18', '', '', 'Cierre de Sesi&oacute;n', '127.0.0.1', 1, '');


--
-- Data for Name: seguridad_modulos; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_modulos VALUES (1, 'Seguridad', 2);
INSERT INTO seguridad_modulos VALUES (7, 'SCAYA', 1);


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

INSERT INTO seguridad_programas VALUES (1, 'Registro de Privilegios', 1, '../../seguridad/registro_privilegios/privilegios_form.php', NULL, 'Mantenimiento de Privilegios', 2);
INSERT INTO seguridad_programas VALUES (4, 'Registro de M&oacute;dulos', 1, '../../seguridad/registro_modulos/configuracion_menu_form.php', NULL, ' Registro de M&oacute;dulos para la Configuraci&oacute;n del Men&uacute;', 1);
INSERT INTO seguridad_programas VALUES (3, 'Registro de Sucesos del Sistema', 1, '../../seguridad/registro_sucesos/bitacora_form.php', NULL, 'Gestor de Reportes del Registro Suceos del Sistema', 3);
INSERT INTO seguridad_programas VALUES (5, 'Registro de Usuarios', 3, '../../seguridad/registro_privilegios_usuarios/configuracion_usuarios_form.php', NULL, 'Registro de Privilegios de Usuarios sobre los Programas', 2);
INSERT INTO seguridad_programas VALUES (14, 'Horas Extras entre fechas', 1, '../../seca/reportes/horas_extras_fechas/consulta_form.php', '', 'Calculo de Horas extras entre Fechas', 14);
INSERT INTO seguridad_programas VALUES (15, 'Horas Extras Compacto', 2, '../../seca/reportes/he_fechas_comp/consulta_form.php', '', 'Reporte Compacto de Horas Extras', 14);
INSERT INTO seguridad_programas VALUES (12, 'Carga de Archivos', 1, '../../seca/mantenimientos/carga_asist_file/carga_asistencia_form.php', '', 'Carga Archivos de Info del Biometrico', 12);
INSERT INTO seguridad_programas VALUES (13, 'Asistencia de una Fecha', 1, '../../seca/reportes/asist_fecha/consulta_form.php', '', 'Asistencia tomada en una fecha', 13);
INSERT INTO seguridad_programas VALUES (19, 'Admon. Accesos', 2, '../../seca/mantenimientos/adm_accesos/accesos_form.php', '', '', 12);
INSERT INTO seguridad_programas VALUES (18, 'Admon. Equipos', 1, '../../seca/mantenimientos/adm_devices/devices_form.php', '', '', 11);
INSERT INTO seguridad_programas VALUES (20, 'Asistencia entre Fechas', 2, '../../seca/reportes/asist_entrefch/consulta_form.php', '', 'Reportes de Asistencia de Personal entre Fechas', 13);
INSERT INTO seguridad_programas VALUES (21, 'Grafico de Horas Extras', 1, '../../seca/reportes/grafico_he_fechas/consulta_form.php', '', 'Grafico de Horas Extras de Personal Entre Fechas', 17);
INSERT INTO seguridad_programas VALUES (22, 'Inasistencias y Retardos', 3, '../../seca/reportes/retardos_fechas/consulta_form.php', '', 'Inasistencias y Retardos del personal entre fechas', 14);
INSERT INTO seguridad_programas VALUES (23, 'Grafico de Retrasos e Inasistencias', 2, '../../seca/reportes/graf_ret_fechas/consulta_form.php', '', 'Escala de Inasistencias y Retardos por departamento', 17);
INSERT INTO seguridad_programas VALUES (24, 'Control de Asistencia entre Fechas Para un solo Empleado o Funcionario', 12, '../../seca/reportes/asist_fecha_perso/consulta_form.php', '', '', 13);
INSERT INTO seguridad_programas VALUES (25, 'Horas Extras Compacto Personalizado', 33, '../../seca/reportes/he_fechas_comp_perso/consulta_form.php', '', 'Horas extras personalizado para un solo empleado en detalle', 14);
INSERT INTO seguridad_programas VALUES (17, 'Admon. Horarios', 2, '../../seca/mantenimientos/adm_horarios/horarios_form.php', '', 'Maneja y Administra los Horarios Disponible', 10);
INSERT INTO seguridad_programas VALUES (16, 'Ficha de Personal', 1, '../../seca/mantenimientos/adm_personal/personal_form.php', '', '', 10);
INSERT INTO seguridad_programas VALUES (26, 'Descarga de Datos', 99, '../../seca/mantenimientos/adm_descargadatos/form.php', '', '', 11);


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

INSERT INTO seguridad_submodulos VALUES (1, 'Configuraci&oacute;n Intranet', 1, 1);
INSERT INTO seguridad_submodulos VALUES (5, 'Bitacora', 2, 1);
INSERT INTO seguridad_submodulos VALUES (6, 'Registro', 1, 7);
INSERT INTO seguridad_submodulos VALUES (7, 'Reportes', 2, 7);
INSERT INTO seguridad_submodulos VALUES (8, 'Graficos', 3, 7);


--
-- Data for Name: seguridad_usuarios; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_usuarios VALUES (7, '12569085', 'Karen Blanco', '25d55ad283aa400af464c76d713c07ad', 'Inactivo', '2009-08-12', NULL);
INSERT INTO seguridad_usuarios VALUES (8, '125690850', 'bkaren', '25d55ad283aa400af464c76d713c07ad', 'Activo', '2009-08-12', 'bc7c23d033e99b04edecb3080ac45495');
INSERT INTO seguridad_usuarios VALUES (6, '1234', 'jcamacaro', '25d55ad283aa400af464c76d713c07ad', 'Activo', '2009-08-03', '4b05601d9a23e5cb7610d69d96d38705');
INSERT INTO seguridad_usuarios VALUES (10, '14992789', 'vaguilar', '19df377dbd63116e66ea3b806cf05ca7', 'Activo', '2009-12-07', 'caf16e69f0b97b637f3432e1c74343e4');
INSERT INTO seguridad_usuarios VALUES (9, '12343330', 'psilvera', '72a6c20f8cfefee0f5441e3118d677b1', 'Activo', '2009-09-03', '');
INSERT INTO seguridad_usuarios VALUES (5, '15819078', 'mmorales', '25d55ad283aa400af464c76d713c07ad', 'Activo', '2009-07-31', '');
INSERT INTO seguridad_usuarios VALUES (1, '18638506', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Activo', '2009-04-24', '');


--
-- Data for Name: seguridad_usuarios_programas_privilegios; Type: TABLE DATA; Schema: public; Owner: cbiometrico
--

INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1124, 1, 26, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1125, 1, 26, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1126, 1, 26, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1127, 1, 26, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (1128, 1, 26, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (516, 7, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (517, 7, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (518, 7, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (519, 7, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (520, 7, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (3, 1, 7, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (521, 7, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (522, 7, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (523, 7, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (524, 7, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (525, 7, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (526, 7, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (527, 7, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (528, 7, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (529, 7, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (530, 7, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (531, 7, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (532, 7, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (533, 7, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (534, 7, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (535, 7, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (536, 7, 17, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (537, 7, 17, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (538, 7, 17, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (539, 7, 17, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (540, 7, 17, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (541, 7, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (542, 7, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (543, 7, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (544, 7, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (545, 7, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (546, 7, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (547, 7, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (548, 7, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (549, 7, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (550, 7, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (551, 7, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (552, 7, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (553, 7, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (554, 7, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (555, 7, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (556, 7, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (557, 7, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (558, 7, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (559, 7, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (560, 7, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (561, 7, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (562, 7, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (563, 7, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (564, 7, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (565, 7, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (566, 7, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (567, 7, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (568, 7, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (569, 7, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (570, 7, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (571, 7, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (572, 7, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (573, 7, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (574, 7, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (575, 7, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (366, 6, 1, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (367, 6, 1, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (368, 6, 1, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (369, 6, 1, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (370, 6, 1, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (371, 6, 4, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (372, 6, 4, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (373, 6, 4, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (374, 6, 4, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (375, 6, 4, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (376, 6, 3, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (377, 6, 3, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (378, 6, 3, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (379, 6, 3, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (380, 6, 3, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (381, 6, 5, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (382, 6, 5, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (383, 6, 5, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (384, 6, 5, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (385, 6, 5, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (386, 6, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (387, 6, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (388, 6, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (389, 6, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (390, 6, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (391, 6, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (392, 6, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (393, 6, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (394, 6, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (395, 6, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (396, 6, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (397, 6, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (398, 6, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (399, 6, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (400, 6, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (401, 6, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (402, 6, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (403, 6, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (404, 6, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (405, 6, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (411, 6, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (412, 6, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (413, 6, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (414, 6, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (415, 6, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (416, 6, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (417, 6, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (418, 6, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (419, 6, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (420, 6, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (421, 6, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (422, 6, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (423, 6, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (424, 6, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (425, 6, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (426, 6, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (427, 6, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (428, 6, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (429, 6, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (430, 6, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (431, 6, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (432, 6, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (433, 6, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (434, 6, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (435, 6, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (436, 6, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (437, 6, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (438, 6, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (439, 6, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (440, 6, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (441, 6, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (442, 6, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (443, 6, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (444, 6, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (445, 6, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (446, 5, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (447, 5, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (448, 5, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (449, 5, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (450, 5, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (451, 5, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (452, 5, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (453, 5, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (454, 5, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (455, 5, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (456, 5, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (457, 5, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (458, 5, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (459, 5, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (460, 5, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (461, 5, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (462, 5, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (463, 5, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (464, 5, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (465, 5, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (466, 5, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (467, 5, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (468, 5, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (469, 5, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (470, 5, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (471, 5, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (472, 5, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (473, 5, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (474, 5, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (475, 5, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (476, 5, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (477, 5, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (478, 5, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (479, 5, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (480, 5, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (576, 8, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (577, 8, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (578, 8, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (579, 8, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (580, 8, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (581, 8, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (582, 8, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (583, 8, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (584, 8, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (585, 8, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (586, 8, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (587, 8, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (588, 8, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (589, 8, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (590, 8, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (591, 8, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (592, 8, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (593, 8, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (594, 8, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (595, 8, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (596, 8, 17, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (597, 8, 17, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (598, 8, 17, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (599, 8, 17, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (600, 8, 17, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (601, 8, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (602, 8, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (603, 8, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (604, 8, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (605, 8, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (606, 8, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (607, 8, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (608, 8, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (609, 8, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (610, 8, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (611, 8, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (612, 8, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (613, 8, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (614, 8, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (615, 8, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (616, 8, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (617, 8, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (618, 8, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (619, 8, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (620, 8, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (621, 8, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (622, 8, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (623, 8, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (624, 8, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (625, 8, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (626, 8, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (627, 8, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (628, 8, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (629, 8, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (630, 8, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (631, 8, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (632, 8, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (633, 8, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (634, 8, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (635, 8, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (874, 10, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (873, 9, 24, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (875, 10, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (876, 10, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (877, 10, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (878, 10, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (879, 10, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (880, 10, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (881, 10, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (882, 10, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (883, 10, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (884, 10, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (885, 10, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (886, 10, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (887, 10, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (888, 10, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (889, 10, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (890, 10, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (891, 10, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (892, 10, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (893, 10, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (894, 10, 17, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (895, 10, 17, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (896, 10, 17, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (897, 10, 17, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (898, 10, 17, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (899, 10, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (900, 10, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (901, 10, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (902, 10, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (903, 10, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (904, 10, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (905, 10, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (906, 10, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (907, 10, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (676, 5, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (677, 5, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (678, 5, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (679, 5, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (680, 5, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (681, 5, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (682, 5, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (683, 5, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (684, 5, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (685, 5, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (775, 10, 1, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (776, 10, 1, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (777, 10, 1, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (778, 10, 1, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (779, 10, 1, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (780, 10, 4, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (781, 10, 4, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (782, 10, 4, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (783, 10, 4, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (784, 10, 4, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (785, 10, 3, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (786, 10, 3, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (787, 10, 3, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (788, 10, 3, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (789, 10, 3, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (790, 10, 5, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (791, 10, 5, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (792, 10, 5, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (793, 10, 5, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (794, 10, 5, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (908, 10, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (796, 5, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (802, 9, 14, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (803, 9, 14, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (804, 9, 14, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (805, 9, 14, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (806, 9, 14, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (807, 9, 15, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (808, 9, 15, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (809, 9, 15, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (810, 9, 15, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (811, 9, 15, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (812, 9, 12, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (813, 9, 12, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (814, 9, 12, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (815, 9, 12, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (816, 9, 12, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (817, 9, 13, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (818, 9, 13, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (819, 9, 13, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (820, 9, 13, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (821, 9, 13, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (822, 9, 17, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (823, 9, 17, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (824, 9, 17, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (825, 9, 17, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (826, 9, 17, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (827, 9, 19, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (828, 9, 19, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (829, 9, 19, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (830, 9, 19, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (831, 9, 19, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (832, 9, 16, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (833, 9, 16, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (834, 9, 16, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (835, 9, 16, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (836, 9, 16, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (837, 9, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (838, 9, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (839, 9, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (840, 9, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (841, 9, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (842, 9, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (843, 9, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (844, 9, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (845, 9, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (846, 9, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (847, 9, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (848, 9, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (849, 9, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (850, 9, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (851, 9, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (852, 9, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (853, 9, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (854, 9, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (855, 9, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (856, 9, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (857, 9, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (858, 9, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (859, 9, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (860, 9, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (861, 9, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (909, 10, 18, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (910, 10, 18, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (911, 10, 18, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (912, 10, 18, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (913, 10, 18, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (914, 10, 20, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (915, 10, 20, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (916, 10, 20, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (917, 10, 20, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (918, 10, 20, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (919, 10, 21, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (920, 10, 21, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (921, 10, 21, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (922, 10, 21, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (923, 10, 21, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (924, 10, 22, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (925, 10, 22, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (926, 10, 22, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (927, 10, 22, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (928, 10, 22, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (929, 10, 23, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (930, 10, 23, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (931, 10, 23, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (932, 10, 23, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (933, 10, 23, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (934, 10, 24, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (935, 10, 24, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (936, 10, 24, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (937, 10, 24, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (938, 10, 24, 2);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (939, 10, 25, 1);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (940, 10, 25, 5);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (941, 10, 25, 3);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (942, 10, 25, 4);
INSERT INTO seguridad_usuarios_programas_privilegios VALUES (943, 10, 25, 2);
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
-- Name: p_key; Type: CONSTRAINT; Schema: public; Owner: cbiometrico; Tablespace: 
--

ALTER TABLE ONLY listing_files
    ADD CONSTRAINT p_key PRIMARY KEY (id);


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

