PGDMP     *    '                {         	   proyecto2    15.2    15.2 t    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17624 	   proyecto2    DATABASE     �   CREATE DATABASE proyecto2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Guatemala.1252';
    DROP DATABASE proyecto2;
                diego    false            �            1255    17829 "   registrar_modificacion_pacientes()    FUNCTION     ~  CREATE FUNCTION public.registrar_modificacion_pacientes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    tipo_modificacion VARCHAR(255);
    descripcion_modificacion TEXT;
BEGIN
    IF (TG_OP = 'INSERT') THEN
        tipo_modificacion := 'Inserción';
        descripcion_modificacion := 'Se creó nuevo paciente';
    ELSIF (TG_OP = 'UPDATE') THEN
        tipo_modificacion := 'Actualización';
        descripcion_modificacion := 'Se actualizó la informacion del paciente';
    ELSIF (TG_OP = 'DELETE') THEN
        tipo_modificacion := 'Borrado';
        descripcion_modificacion := 'Se borró el registro del paciente';
    END IF;

    INSERT INTO bitacora (id_paciente, tipo_modificacion, fecha_hora_modificacion, descripcion_modificacion)
    VALUES (COALESCE(OLD.paciente_id, NEW.paciente_id), tipo_modificacion, NOW(), descripcion_modificacion);

    RETURN NEW;
END;
$$;
 9   DROP FUNCTION public.registrar_modificacion_pacientes();
       public          postgres    false            �            1259    17815    bitacora    TABLE       CREATE TABLE public.bitacora (
    modificacion_id integer NOT NULL,
    id_paciente integer NOT NULL,
    tipo_modificacion character varying(255) NOT NULL,
    fecha_hora_modificacion timestamp without time zone NOT NULL,
    descripcion_modificacion text
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    17814    bitacora_modificacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_modificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.bitacora_modificacion_id_seq;
       public          postgres    false    238            �           0    0    bitacora_modificacion_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.bitacora_modificacion_id_seq OWNED BY public.bitacora.modificacion_id;
          public          postgres    false    237            �            1259    17796    cirugias    TABLE       CREATE TABLE public.cirugias (
    cirugia_id integer NOT NULL,
    id_tratamiento integer NOT NULL,
    cirugia_practicada character varying(255) NOT NULL,
    id_medico_cirujano integer NOT NULL,
    descripcion text,
    fecha_hora_practica timestamp without time zone NOT NULL
);
    DROP TABLE public.cirugias;
       public         heap    postgres    false            �            1259    17795    cirugias_cirugia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cirugias_cirugia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.cirugias_cirugia_id_seq;
       public          postgres    false    236            �           0    0    cirugias_cirugia_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.cirugias_cirugia_id_seq OWNED BY public.cirugias.cirugia_id;
          public          postgres    false    235            �            1259    17721    enfermedades    TABLE     �   CREATE TABLE public.enfermedades (
    enfermedad_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    tasa_mortalidad numeric NOT NULL
);
     DROP TABLE public.enfermedades;
       public         heap    postgres    false            �            1259    17720    enfermedades_enfermedad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enfermedades_enfermedad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.enfermedades_enfermedad_id_seq;
       public          postgres    false    228            �           0    0    enfermedades_enfermedad_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.enfermedades_enfermedad_id_seq OWNED BY public.enfermedades.enfermedad_id;
          public          postgres    false    227            �            1259    17649    especialidades    TABLE     y   CREATE TABLE public.especialidades (
    especialidad_id integer NOT NULL,
    nombre character varying(255) NOT NULL
);
 "   DROP TABLE public.especialidades;
       public         heap    postgres    false            �            1259    17648 "   especialidades_especialidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.especialidades_especialidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.especialidades_especialidad_id_seq;
       public          postgres    false    219            �           0    0 "   especialidades_especialidad_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.especialidades_especialidad_id_seq OWNED BY public.especialidades.especialidad_id;
          public          postgres    false    218            �            1259    17679    historial_traslados    TABLE     �   CREATE TABLE public.historial_traslados (
    traslado_id integer NOT NULL,
    id_medico integer NOT NULL,
    id_institucion integer NOT NULL,
    fecha_ingreso date NOT NULL,
    fecha_salida date
);
 '   DROP TABLE public.historial_traslados;
       public         heap    postgres    false            �            1259    17678 #   historial_traslados_traslado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.historial_traslados_traslado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.historial_traslados_traslado_id_seq;
       public          postgres    false    222            �           0    0 #   historial_traslados_traslado_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.historial_traslados_traslado_id_seq OWNED BY public.historial_traslados.traslado_id;
          public          postgres    false    221            �            1259    17638    instituciones    TABLE     �   CREATE TABLE public.instituciones (
    institucion_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL
);
 !   DROP TABLE public.instituciones;
       public         heap    postgres    false            �            1259    17637     instituciones_institucion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instituciones_institucion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.instituciones_institucion_id_seq;
       public          postgres    false    217            �           0    0     instituciones_institucion_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.instituciones_institucion_id_seq OWNED BY public.instituciones.institucion_id;
          public          postgres    false    216            �            1259    17657    medicos    TABLE       CREATE TABLE public.medicos (
    id_usuario integer,
    apellido_nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    num_colegiado integer NOT NULL,
    especialidad_id integer NOT NULL
);
    DROP TABLE public.medicos;
       public         heap    postgres    false            �            1259    17696 	   pacientes    TABLE     �  CREATE TABLE public.pacientes (
    paciente_id integer NOT NULL,
    apellido_nombre character varying(255) NOT NULL,
    edad integer NOT NULL,
    sexo character varying(50) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    altura_m numeric NOT NULL,
    peso_kg numeric NOT NULL,
    enfermedades_hereditarias text,
    adicciones text
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    17695    pacientes_paciente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_paciente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_paciente_id_seq;
       public          postgres    false    224            �           0    0    pacientes_paciente_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pacientes_paciente_id_seq OWNED BY public.pacientes.paciente_id;
          public          postgres    false    223            �            1259    17707    suministros    TABLE       CREATE TABLE public.suministros (
    suministro_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    tipo_suministro character varying(255) NOT NULL,
    fecha_vencimiento date NOT NULL,
    cantidad_bodega integer NOT NULL,
    id_institucion integer NOT NULL
);
    DROP TABLE public.suministros;
       public         heap    postgres    false            �            1259    17706    suministros_suministro_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suministros_suministro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.suministros_suministro_id_seq;
       public          postgres    false    226            �           0    0    suministros_suministro_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.suministros_suministro_id_seq OWNED BY public.suministros.suministro_id;
          public          postgres    false    225            �            1259    17777    suministros_utilizados    TABLE     �   CREATE TABLE public.suministros_utilizados (
    uso_id integer NOT NULL,
    id_tratamiento integer NOT NULL,
    id_suministro_usado integer NOT NULL,
    cantidad integer NOT NULL,
    descripcion text
);
 *   DROP TABLE public.suministros_utilizados;
       public         heap    postgres    false            �            1259    17776 !   suministros_utilizados_uso_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suministros_utilizados_uso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.suministros_utilizados_uso_id_seq;
       public          postgres    false    234            �           0    0 !   suministros_utilizados_uso_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.suministros_utilizados_uso_id_seq OWNED BY public.suministros_utilizados.uso_id;
          public          postgres    false    233            �            1259    17761    tratamientos    TABLE     �   CREATE TABLE public.tratamientos (
    tratamiento_id integer NOT NULL,
    duracion text,
    descripcion text,
    "evolución" text,
    estado_paciente character varying(50) NOT NULL,
    id_visita integer NOT NULL
);
     DROP TABLE public.tratamientos;
       public         heap    postgres    false            �            1259    17760    tratamientos_tratamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tratamientos_tratamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tratamientos_tratamiento_id_seq;
       public          postgres    false    232            �           0    0    tratamientos_tratamiento_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tratamientos_tratamiento_id_seq OWNED BY public.tratamientos.tratamiento_id;
          public          postgres    false    231            �            1259    17627    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    usuario_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(50) NOT NULL,
    habilitado boolean NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    17626    usuarios_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_usuario_id_seq;
       public          postgres    false    215            �           0    0    usuarios_usuario_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_usuario_id_seq OWNED BY public.usuarios.usuario_id;
          public          postgres    false    214            �            1259    17732    visitas    TABLE     a  CREATE TABLE public.visitas (
    visita_id integer NOT NULL,
    id_paciente integer NOT NULL,
    id_institucion integer NOT NULL,
    id_medico integer NOT NULL,
    motivo_visita text NOT NULL,
    fecha_hora_atencion timestamp without time zone NOT NULL,
    id_enfermedad_diagnosticada integer NOT NULL,
    examenes text,
    diagnostico text
);
    DROP TABLE public.visitas;
       public         heap    postgres    false            �            1259    17731    visitas_visita_id_seq    SEQUENCE     �   CREATE SEQUENCE public.visitas_visita_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.visitas_visita_id_seq;
       public          postgres    false    230            �           0    0    visitas_visita_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.visitas_visita_id_seq OWNED BY public.visitas.visita_id;
          public          postgres    false    229            �           2604    17818    bitacora modificacion_id    DEFAULT     �   ALTER TABLE ONLY public.bitacora ALTER COLUMN modificacion_id SET DEFAULT nextval('public.bitacora_modificacion_id_seq'::regclass);
 G   ALTER TABLE public.bitacora ALTER COLUMN modificacion_id DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    17799    cirugias cirugia_id    DEFAULT     z   ALTER TABLE ONLY public.cirugias ALTER COLUMN cirugia_id SET DEFAULT nextval('public.cirugias_cirugia_id_seq'::regclass);
 B   ALTER TABLE public.cirugias ALTER COLUMN cirugia_id DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    17724    enfermedades enfermedad_id    DEFAULT     �   ALTER TABLE ONLY public.enfermedades ALTER COLUMN enfermedad_id SET DEFAULT nextval('public.enfermedades_enfermedad_id_seq'::regclass);
 I   ALTER TABLE public.enfermedades ALTER COLUMN enfermedad_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    17652    especialidades especialidad_id    DEFAULT     �   ALTER TABLE ONLY public.especialidades ALTER COLUMN especialidad_id SET DEFAULT nextval('public.especialidades_especialidad_id_seq'::regclass);
 M   ALTER TABLE public.especialidades ALTER COLUMN especialidad_id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17682    historial_traslados traslado_id    DEFAULT     �   ALTER TABLE ONLY public.historial_traslados ALTER COLUMN traslado_id SET DEFAULT nextval('public.historial_traslados_traslado_id_seq'::regclass);
 N   ALTER TABLE public.historial_traslados ALTER COLUMN traslado_id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    17641    instituciones institucion_id    DEFAULT     �   ALTER TABLE ONLY public.instituciones ALTER COLUMN institucion_id SET DEFAULT nextval('public.instituciones_institucion_id_seq'::regclass);
 K   ALTER TABLE public.instituciones ALTER COLUMN institucion_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    17699    pacientes paciente_id    DEFAULT     ~   ALTER TABLE ONLY public.pacientes ALTER COLUMN paciente_id SET DEFAULT nextval('public.pacientes_paciente_id_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN paciente_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    17710    suministros suministro_id    DEFAULT     �   ALTER TABLE ONLY public.suministros ALTER COLUMN suministro_id SET DEFAULT nextval('public.suministros_suministro_id_seq'::regclass);
 H   ALTER TABLE public.suministros ALTER COLUMN suministro_id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    17780    suministros_utilizados uso_id    DEFAULT     �   ALTER TABLE ONLY public.suministros_utilizados ALTER COLUMN uso_id SET DEFAULT nextval('public.suministros_utilizados_uso_id_seq'::regclass);
 L   ALTER TABLE public.suministros_utilizados ALTER COLUMN uso_id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    17764    tratamientos tratamiento_id    DEFAULT     �   ALTER TABLE ONLY public.tratamientos ALTER COLUMN tratamiento_id SET DEFAULT nextval('public.tratamientos_tratamiento_id_seq'::regclass);
 J   ALTER TABLE public.tratamientos ALTER COLUMN tratamiento_id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    17630    usuarios usuario_id    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuarios_usuario_id_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN usuario_id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    17735    visitas visita_id    DEFAULT     v   ALTER TABLE ONLY public.visitas ALTER COLUMN visita_id SET DEFAULT nextval('public.visitas_visita_id_seq'::regclass);
 @   ALTER TABLE public.visitas ALTER COLUMN visita_id DROP DEFAULT;
       public          postgres    false    230    229    230            �          0    17815    bitacora 
   TABLE DATA           �   COPY public.bitacora (modificacion_id, id_paciente, tipo_modificacion, fecha_hora_modificacion, descripcion_modificacion) FROM stdin;
    public          postgres    false    238   F�       �          0    17796    cirugias 
   TABLE DATA           �   COPY public.cirugias (cirugia_id, id_tratamiento, cirugia_practicada, id_medico_cirujano, descripcion, fecha_hora_practica) FROM stdin;
    public          postgres    false    236   ٛ       �          0    17721    enfermedades 
   TABLE DATA           N   COPY public.enfermedades (enfermedad_id, nombre, tasa_mortalidad) FROM stdin;
    public          postgres    false    228   ��       z          0    17649    especialidades 
   TABLE DATA           A   COPY public.especialidades (especialidad_id, nombre) FROM stdin;
    public          postgres    false    219   ؜       }          0    17679    historial_traslados 
   TABLE DATA           r   COPY public.historial_traslados (traslado_id, id_medico, id_institucion, fecha_ingreso, fecha_salida) FROM stdin;
    public          postgres    false    222   b�       x          0    17638    instituciones 
   TABLE DATA           P   COPY public.instituciones (institucion_id, nombre, tipo, direccion) FROM stdin;
    public          postgres    false    217   ӝ       {          0    17657    medicos 
   TABLE DATA           s   COPY public.medicos (id_usuario, apellido_nombre, direccion, telefono, num_colegiado, especialidad_id) FROM stdin;
    public          postgres    false    220   ͞                 0    17696 	   pacientes 
   TABLE DATA           �   COPY public.pacientes (paciente_id, apellido_nombre, edad, sexo, direccion, telefono, altura_m, peso_kg, enfermedades_hereditarias, adicciones) FROM stdin;
    public          postgres    false    224   5�       �          0    17707    suministros 
   TABLE DATA           �   COPY public.suministros (suministro_id, nombre, tipo_suministro, fecha_vencimiento, cantidad_bodega, id_institucion) FROM stdin;
    public          postgres    false    226   ?�       �          0    17777    suministros_utilizados 
   TABLE DATA           t   COPY public.suministros_utilizados (uso_id, id_tratamiento, id_suministro_usado, cantidad, descripcion) FROM stdin;
    public          postgres    false    234   �       �          0    17761    tratamientos 
   TABLE DATA           w   COPY public.tratamientos (tratamiento_id, duracion, descripcion, "evolución", estado_paciente, id_visita) FROM stdin;
    public          postgres    false    232   ,�       v          0    17627    usuarios 
   TABLE DATA           S   COPY public.usuarios (usuario_id, username, password, rol, habilitado) FROM stdin;
    public          postgres    false    215   I�       �          0    17732    visitas 
   TABLE DATA           �   COPY public.visitas (visita_id, id_paciente, id_institucion, id_medico, motivo_visita, fecha_hora_atencion, id_enfermedad_diagnosticada, examenes, diagnostico) FROM stdin;
    public          postgres    false    230   ��       �           0    0    bitacora_modificacion_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.bitacora_modificacion_id_seq', 3, true);
          public          postgres    false    237            �           0    0    cirugias_cirugia_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.cirugias_cirugia_id_seq', 1, false);
          public          postgres    false    235            �           0    0    enfermedades_enfermedad_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.enfermedades_enfermedad_id_seq', 15, true);
          public          postgres    false    227            �           0    0 "   especialidades_especialidad_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.especialidades_especialidad_id_seq', 11, true);
          public          postgres    false    218            �           0    0 #   historial_traslados_traslado_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.historial_traslados_traslado_id_seq', 10, true);
          public          postgres    false    221            �           0    0     instituciones_institucion_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.instituciones_institucion_id_seq', 5, true);
          public          postgres    false    216            �           0    0    pacientes_paciente_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pacientes_paciente_id_seq', 11, true);
          public          postgres    false    223            �           0    0    suministros_suministro_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.suministros_suministro_id_seq', 100, true);
          public          postgres    false    225            �           0    0 !   suministros_utilizados_uso_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.suministros_utilizados_uso_id_seq', 1, false);
          public          postgres    false    233            �           0    0    tratamientos_tratamiento_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tratamientos_tratamiento_id_seq', 1, false);
          public          postgres    false    231            �           0    0    usuarios_usuario_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_usuario_id_seq', 12, true);
          public          postgres    false    214            �           0    0    visitas_visita_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.visitas_visita_id_seq', 1, false);
          public          postgres    false    229            �           2606    17822    bitacora bitacora_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (modificacion_id);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    238            �           2606    17803    cirugias cirugias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.cirugias
    ADD CONSTRAINT cirugias_pkey PRIMARY KEY (cirugia_id);
 @   ALTER TABLE ONLY public.cirugias DROP CONSTRAINT cirugias_pkey;
       public            postgres    false    236            �           2606    17730 $   enfermedades enfermedades_nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.enfermedades
    ADD CONSTRAINT enfermedades_nombre_key UNIQUE (nombre);
 N   ALTER TABLE ONLY public.enfermedades DROP CONSTRAINT enfermedades_nombre_key;
       public            postgres    false    228            �           2606    17728    enfermedades enfermedades_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.enfermedades
    ADD CONSTRAINT enfermedades_pkey PRIMARY KEY (enfermedad_id);
 H   ALTER TABLE ONLY public.enfermedades DROP CONSTRAINT enfermedades_pkey;
       public            postgres    false    228            �           2606    17656 (   especialidades especialidades_nombre_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_nombre_key UNIQUE (nombre);
 R   ALTER TABLE ONLY public.especialidades DROP CONSTRAINT especialidades_nombre_key;
       public            postgres    false    219            �           2606    17654 "   especialidades especialidades_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (especialidad_id);
 L   ALTER TABLE ONLY public.especialidades DROP CONSTRAINT especialidades_pkey;
       public            postgres    false    219            �           2606    17684 ,   historial_traslados historial_traslados_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.historial_traslados
    ADD CONSTRAINT historial_traslados_pkey PRIMARY KEY (traslado_id);
 V   ALTER TABLE ONLY public.historial_traslados DROP CONSTRAINT historial_traslados_pkey;
       public            postgres    false    222            �           2606    17647 &   instituciones instituciones_nombre_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.instituciones
    ADD CONSTRAINT instituciones_nombre_key UNIQUE (nombre);
 P   ALTER TABLE ONLY public.instituciones DROP CONSTRAINT instituciones_nombre_key;
       public            postgres    false    217            �           2606    17645     instituciones instituciones_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.instituciones
    ADD CONSTRAINT instituciones_pkey PRIMARY KEY (institucion_id);
 J   ALTER TABLE ONLY public.instituciones DROP CONSTRAINT instituciones_pkey;
       public            postgres    false    217            �           2606    17667 #   medicos medicos_apellido_nombre_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_apellido_nombre_key UNIQUE (apellido_nombre);
 M   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_apellido_nombre_key;
       public            postgres    false    220            �           2606    17665    medicos medicos_id_usuario_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_id_usuario_key UNIQUE (id_usuario);
 H   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_id_usuario_key;
       public            postgres    false    220            �           2606    17663    medicos medicos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (num_colegiado);
 >   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_pkey;
       public            postgres    false    220            �           2606    17705 '   pacientes pacientes_apellido_nombre_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_apellido_nombre_key UNIQUE (apellido_nombre);
 Q   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_apellido_nombre_key;
       public            postgres    false    224            �           2606    17703    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (paciente_id);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    224            �           2606    17714    suministros suministros_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.suministros
    ADD CONSTRAINT suministros_pkey PRIMARY KEY (suministro_id);
 F   ALTER TABLE ONLY public.suministros DROP CONSTRAINT suministros_pkey;
       public            postgres    false    226            �           2606    17784 2   suministros_utilizados suministros_utilizados_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.suministros_utilizados
    ADD CONSTRAINT suministros_utilizados_pkey PRIMARY KEY (uso_id);
 \   ALTER TABLE ONLY public.suministros_utilizados DROP CONSTRAINT suministros_utilizados_pkey;
       public            postgres    false    234            �           2606    17770 '   tratamientos tratamientos_id_visita_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT tratamientos_id_visita_key UNIQUE (id_visita);
 Q   ALTER TABLE ONLY public.tratamientos DROP CONSTRAINT tratamientos_id_visita_key;
       public            postgres    false    232            �           2606    17768    tratamientos tratamientos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT tratamientos_pkey PRIMARY KEY (tratamiento_id);
 H   ALTER TABLE ONLY public.tratamientos DROP CONSTRAINT tratamientos_pkey;
       public            postgres    false    232            �           2606    17634    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usuario_id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    215            �           2606    17636    usuarios usuarios_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_username_key;
       public            postgres    false    215            �           2606    17739    visitas visitas_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_pkey PRIMARY KEY (visita_id);
 >   ALTER TABLE ONLY public.visitas DROP CONSTRAINT visitas_pkey;
       public            postgres    false    230            �           2620    17830 %   pacientes tr_modificaciones_pacientes    TRIGGER     �   CREATE TRIGGER tr_modificaciones_pacientes AFTER INSERT OR DELETE OR UPDATE ON public.pacientes FOR EACH ROW EXECUTE FUNCTION public.registrar_modificacion_pacientes();
 >   DROP TRIGGER tr_modificaciones_pacientes ON public.pacientes;
       public          postgres    false    250    224            �           2606    17823 "   bitacora bitacora_id_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(paciente_id);
 L   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_id_paciente_fkey;
       public          postgres    false    238    224    3268            �           2606    17809 )   cirugias cirugias_id_medico_cirujano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cirugias
    ADD CONSTRAINT cirugias_id_medico_cirujano_fkey FOREIGN KEY (id_medico_cirujano) REFERENCES public.medicos(num_colegiado);
 S   ALTER TABLE ONLY public.cirugias DROP CONSTRAINT cirugias_id_medico_cirujano_fkey;
       public          postgres    false    236    3262    220            �           2606    17804 %   cirugias cirugias_id_tratamiento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cirugias
    ADD CONSTRAINT cirugias_id_tratamiento_fkey FOREIGN KEY (id_tratamiento) REFERENCES public.tratamientos(tratamiento_id);
 O   ALTER TABLE ONLY public.cirugias DROP CONSTRAINT cirugias_id_tratamiento_fkey;
       public          postgres    false    3280    236    232            �           2606    17690 ;   historial_traslados historial_traslados_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_traslados
    ADD CONSTRAINT historial_traslados_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituciones(institucion_id);
 e   ALTER TABLE ONLY public.historial_traslados DROP CONSTRAINT historial_traslados_id_institucion_fkey;
       public          postgres    false    217    3252    222            �           2606    17685 6   historial_traslados historial_traslados_id_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_traslados
    ADD CONSTRAINT historial_traslados_id_medico_fkey FOREIGN KEY (id_medico) REFERENCES public.medicos(num_colegiado);
 `   ALTER TABLE ONLY public.historial_traslados DROP CONSTRAINT historial_traslados_id_medico_fkey;
       public          postgres    false    3262    220    222            �           2606    17673 $   medicos medicos_especialidad_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_especialidad_id_fkey FOREIGN KEY (especialidad_id) REFERENCES public.especialidades(especialidad_id);
 N   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_especialidad_id_fkey;
       public          postgres    false    3256    220    219            �           2606    17668    medicos medicos_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(usuario_id);
 I   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_id_usuario_fkey;
       public          postgres    false    220    215    3246            �           2606    17715 +   suministros suministros_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.suministros
    ADD CONSTRAINT suministros_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituciones(institucion_id);
 U   ALTER TABLE ONLY public.suministros DROP CONSTRAINT suministros_id_institucion_fkey;
       public          postgres    false    226    3252    217            �           2606    17790 F   suministros_utilizados suministros_utilizados_id_suministro_usado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.suministros_utilizados
    ADD CONSTRAINT suministros_utilizados_id_suministro_usado_fkey FOREIGN KEY (id_suministro_usado) REFERENCES public.suministros(suministro_id);
 p   ALTER TABLE ONLY public.suministros_utilizados DROP CONSTRAINT suministros_utilizados_id_suministro_usado_fkey;
       public          postgres    false    3270    226    234            �           2606    17785 A   suministros_utilizados suministros_utilizados_id_tratamiento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.suministros_utilizados
    ADD CONSTRAINT suministros_utilizados_id_tratamiento_fkey FOREIGN KEY (id_tratamiento) REFERENCES public.tratamientos(tratamiento_id);
 k   ALTER TABLE ONLY public.suministros_utilizados DROP CONSTRAINT suministros_utilizados_id_tratamiento_fkey;
       public          postgres    false    3280    234    232            �           2606    17771 (   tratamientos tratamientos_id_visita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT tratamientos_id_visita_fkey FOREIGN KEY (id_visita) REFERENCES public.visitas(visita_id);
 R   ALTER TABLE ONLY public.tratamientos DROP CONSTRAINT tratamientos_id_visita_fkey;
       public          postgres    false    232    3276    230            �           2606    17755 0   visitas visitas_id_enfermedad_diagnosticada_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_id_enfermedad_diagnosticada_fkey FOREIGN KEY (id_enfermedad_diagnosticada) REFERENCES public.enfermedades(enfermedad_id);
 Z   ALTER TABLE ONLY public.visitas DROP CONSTRAINT visitas_id_enfermedad_diagnosticada_fkey;
       public          postgres    false    230    228    3274            �           2606    17745 #   visitas visitas_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituciones(institucion_id);
 M   ALTER TABLE ONLY public.visitas DROP CONSTRAINT visitas_id_institucion_fkey;
       public          postgres    false    3252    217    230            �           2606    17750    visitas visitas_id_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_id_medico_fkey FOREIGN KEY (id_medico) REFERENCES public.medicos(num_colegiado);
 H   ALTER TABLE ONLY public.visitas DROP CONSTRAINT visitas_id_medico_fkey;
       public          postgres    false    3262    230    220            �           2606    17740     visitas visitas_id_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(paciente_id);
 J   ALTER TABLE ONLY public.visitas DROP CONSTRAINT visitas_id_paciente_fkey;
       public          postgres    false    3268    224    230            �   �   x�3�44���+N-J�<�9�����X��D��\��������D�����Ќ38U!�(��f���Բ|�����Լ�T.c���%��9�U�X���2��3�0���U4+'Q!3/-�(�1?O!%5ap� ��0�      �      x������ � �      �   �   x�UO;R�0�W��	�W� �&)�R�P�l�2hF�=�4�Mΐ#�bH	���}�-��Mbw&hj�N9 ��-za��^����� ��c��Cm�?Bo�?�-{��x��zq�ꋫ%[ZT���V���B?���"E��6[q���+!Dx�4���y#$ɐ�o���tb?%3��v0�BQG���^Tn��Y!~'KU�      z   z   x�3�tN,J����O?�6�ˈ�%�(7��7�t�K�O.�̃��p�'��敤�M9=R�t�qz楥&���~���0���j��V���54��/*�/HM�r9C�K������� }�C�      }   a   x�=���0��3��
H�c�N���h�ZH��vq3����09�8�������;�K�;9�Y���ȃ<�S:y�x/��:�d�Ͽ��n�s��r%'�      x   �   x�u��j�0��z�d�YܵǒB��moc�b���=�:�K�/V�,�6ڋ����J<���dX��6�-:x��0�aB��O���@�.2x�AeP�hМ��!�,Gy�}G{�0R�D���A��崷n`��&Z�ǃ�M���ӎ���tE�N_�L�[�xi�#��@������g�����]�Z�|�r����x��Ul�Zbaq��&�2���+�~��R� #x��      {   X  x�}ҽj�0���z���ö�1�6�S�"*Q�U�x��t̐)���)T��閻w�_�n�=���AX��]�i�$_ѷ0X*Vts��u�y��������8�B�
VD����f�)8��r2sS��e�:q$Q���#���/�T�4�2��JM�(R��_C�~�*;-��S�dtr*�HG�b�����Fu�k�T�%��$�P�����W��o��M�g:kMYC�$���hx�q������J�p����e5�8�����i��څ��d�-S(�D���q������;͢)�M�)s���0DpX�x�8���G`�VL�%����bjqN����!�k��T         �  x�u��N�0����)� �N�8G��Z8���Y�Jm�i�зḇ��y�/���rO�韱\t��ul�q;�݁T�¾:�d��u��B�3�#xd�]�a�k��l9��n�C(9B���ZA��������߄����2�ݏ#a%�k��>Y2[eQfK�Z�(E�V�ܸ7���n<xx��(a�~�c��!�⓪2KUQe���J�4I��Qt6M����Tѱ1]��i�����[�9�U�S��^5�U��i�4O�(��?�F�0���5Mn�&�]��Y@��&Ih���i�B�l��;n�}Z��O1:[uQgK�Z��&���R�1tXDߺ��1�HW����Y0��B=+��4�
(�x�K2p���Z�le�:��Gy*2�k�&{f�3ĉTd@��E���؅��Xj����D5�<3�<C�LYhY�L^��p�CD�~7�wiCͩG�%
!���b�*S�U�B|��G;]��]Ow:���.uމ�����b����RS      �   �  x����n�0 ���{������X@CL 7.^끥4���͎x��?{e�֬�|�;�������f�����N\��]���Pդ�'�e��T��zi�^��9�'���Vb1l���qUt��j�X��]�nDV�2��Dو76.�s;��c+-ˈ��[��y�j��u���r*>�����j�74����������B縥έ�fd����{�����z:��:�x�p�[�����}jT�]y��w��;��9��4��U?l_x Eڪ�j����~����f�C�tf_��<�4�9�������>��/��}0;q�&��ޘ�[q��m����m��>�6�T��C���������ė�K��ѿ�	n�x.>���9\)�[�����{ذ�HU�	��#��J*.,)[hFZ�T[I�mA2q�u�$�R���>[�ö�	�ՅT]pYu�yA�yyA�ysyEZS}�q}��5}r�R�����fMIIIVɆ/�;� �
� �0���0"�0h��h�XDt_��L`i�[�/8��Z�T_*Q*/86/Ќ��ɼ ��"��J����S�.`�.���0��.�.��늘?�����?����U<9�j9��c�j�>�`�������}�f���uX��ԓ�����$k�/�+0�0 
�,��������������ɯ�F���諑�^I)�"i�      �      x������ � �      �      x������ � �      v   �   x�u���0Ekj"�� ��a��4h9E6�Y,6RJi���Y�p��_`��i��y;�SAD�<nM���,� aU�f��G���3T���$s��(�B�u�P���c��+���n8mT�e-��<��N�~,�&%'z$*p<?��Cc�Pj�      �      x������ � �     