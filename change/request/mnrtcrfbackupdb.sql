PGDMP                         z            mandems #   12.9 (Ubuntu 12.9-0ubuntu0.20.04.1) #   12.9 (Ubuntu 12.9-0ubuntu0.20.04.1) f    2           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            3           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            4           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            5           1262    34011    mandems    DATABASE     y   CREATE DATABASE mandems WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE mandems;
                postgres    false            �            1259    34404    changerequests    TABLE     ,  CREATE TABLE public.changerequests (
    id bigint NOT NULL,
    request_type character varying(255) NOT NULL,
    request_desc character varying(100) NOT NULL,
    priority character varying(255) NOT NULL,
    deadline date,
    reason character varying(100),
    inst_approval character varying(255),
    inst_comment character varying(255),
    mnrt_approval character varying(255),
    mnrt_comment character varying(255),
    condition character varying(255),
    created_by character varying(100),
    institution_id integer,
    mnrtsystem_id integer,
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
 "   DROP TABLE public.changerequests;
       public         heap    postgres    false            �            1259    34402    changerequests_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.changerequests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.changerequests_id_seq;
       public          postgres    false    228            6           0    0    changerequests_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.changerequests_id_seq OWNED BY public.changerequests.id;
          public          postgres    false    227            �            1259    34066    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    34073    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    202            7           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    203            �            1259    34099    institutions    TABLE       CREATE TABLE public.institutions (
    id bigint NOT NULL,
    inst_name character varying(50) NOT NULL,
    vote_code integer,
    sub_vote_no integer,
    vote_name character varying(50),
    sub_vote_name character varying(50),
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
     DROP TABLE public.institutions;
       public         heap    postgres    false            �            1259    34103    institutions_id_seq    SEQUENCE     |   CREATE SEQUENCE public.institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.institutions_id_seq;
       public          postgres    false    204            8           0    0    institutions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.institutions_id_seq OWNED BY public.institutions.id;
          public          postgres    false    205            �            1259    34111 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    34114    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    206            9           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    207            �            1259    34380    mnrtsystems    TABLE     �   CREATE TABLE public.mnrtsystems (
    id bigint NOT NULL,
    mnrtsystem_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.mnrtsystems;
       public         heap    postgres    false            �            1259    34378    mnrtsystems_id_seq    SEQUENCE     {   CREATE SEQUENCE public.mnrtsystems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.mnrtsystems_id_seq;
       public          postgres    false    222            :           0    0    mnrtsystems_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.mnrtsystems_id_seq OWNED BY public.mnrtsystems.id;
          public          postgres    false    221            �            1259    34131    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false            �            1259    34137    permissions    TABLE     �  CREATE TABLE public.permissions (
    id bigint NOT NULL,
    permission_code character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            �            1259    34144    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    209            ;           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    210            �            1259    34146    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false            �            1259    34152    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    211            <           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    212            �            1259    34396 
   priorities    TABLE     �   CREATE TABLE public.priorities (
    id bigint NOT NULL,
    priority_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.priorities;
       public         heap    postgres    false            �            1259    34394    priorities_id_seq    SEQUENCE     z   CREATE SEQUENCE public.priorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.priorities_id_seq;
       public          postgres    false    226            =           0    0    priorities_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.priorities_id_seq OWNED BY public.priorities.id;
          public          postgres    false    225            �            1259    34388    requestcategories    TABLE       CREATE TABLE public.requestcategories (
    id bigint NOT NULL,
    category_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
 %   DROP TABLE public.requestcategories;
       public         heap    postgres    false            �            1259    34386    requestcategories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.requestcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.requestcategories_id_seq;
       public          postgres    false    224            >           0    0    requestcategories_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.requestcategories_id_seq OWNED BY public.requestcategories.id;
          public          postgres    false    223            �            1259    34160    roles    TABLE     �  CREATE TABLE public.roles (
    id bigint NOT NULL,
    role_title character varying(50) NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    34164    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    213            ?           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    214            �            1259    34166    rolespermissions    TABLE     �  CREATE TABLE public.rolespermissions (
    id bigint NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
 $   DROP TABLE public.rolespermissions;
       public         heap    postgres    false            �            1259    34169    rolespermissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rolespermissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.rolespermissions_id_seq;
       public          postgres    false    215            @           0    0    rolespermissions_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.rolespermissions_id_seq OWNED BY public.rolespermissions.id;
          public          postgres    false    216            �            1259    34177    targets    TABLE     �  CREATE TABLE public.targets (
    id bigint NOT NULL,
    target_code character varying(255) NOT NULL,
    target_desc character varying(255) NOT NULL,
    objective_id integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.targets;
       public         heap    postgres    false            �            1259    34184    targets_id_seq    SEQUENCE     w   CREATE SEQUENCE public.targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.targets_id_seq;
       public          postgres    false    217            A           0    0    targets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.targets_id_seq OWNED BY public.targets.id;
          public          postgres    false    218            �            1259    34186    users    TABLE       CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    institution_id integer NOT NULL,
    role_id integer NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    status boolean DEFAULT false NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    34193    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    219            B           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    220            s           2604    34407    changerequests id    DEFAULT     v   ALTER TABLE ONLY public.changerequests ALTER COLUMN id SET DEFAULT nextval('public.changerequests_id_seq'::regclass);
 @   ALTER TABLE public.changerequests ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            b           2604    34239    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            d           2604    34243    institutions id    DEFAULT     r   ALTER TABLE ONLY public.institutions ALTER COLUMN id SET DEFAULT nextval('public.institutions_id_seq'::regclass);
 >   ALTER TABLE public.institutions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            e           2604    34245    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            p           2604    34383    mnrtsystems id    DEFAULT     p   ALTER TABLE ONLY public.mnrtsystems ALTER COLUMN id SET DEFAULT nextval('public.mnrtsystems_id_seq'::regclass);
 =   ALTER TABLE public.mnrtsystems ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            g           2604    34248    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            h           2604    34249    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            r           2604    34399    priorities id    DEFAULT     n   ALTER TABLE ONLY public.priorities ALTER COLUMN id SET DEFAULT nextval('public.priorities_id_seq'::regclass);
 <   ALTER TABLE public.priorities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            q           2604    34391    requestcategories id    DEFAULT     |   ALTER TABLE ONLY public.requestcategories ALTER COLUMN id SET DEFAULT nextval('public.requestcategories_id_seq'::regclass);
 C   ALTER TABLE public.requestcategories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            j           2604    34251    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            k           2604    34252    rolespermissions id    DEFAULT     z   ALTER TABLE ONLY public.rolespermissions ALTER COLUMN id SET DEFAULT nextval('public.rolespermissions_id_seq'::regclass);
 B   ALTER TABLE public.rolespermissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            m           2604    34254 
   targets id    DEFAULT     h   ALTER TABLE ONLY public.targets ALTER COLUMN id SET DEFAULT nextval('public.targets_id_seq'::regclass);
 9   ALTER TABLE public.targets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            o           2604    34255    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            /          0    34404    changerequests 
   TABLE DATA             COPY public.changerequests (id, request_type, request_desc, priority, deadline, reason, inst_approval, inst_comment, mnrt_approval, mnrt_comment, condition, created_by, institution_id, mnrtsystem_id, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    228   �                 0    34066    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    202   ��                 0    34099    institutions 
   TABLE DATA           �   COPY public.institutions (id, inst_name, vote_code, sub_vote_no, vote_name, sub_vote_name, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    204   ��                 0    34111 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    206   p�       )          0    34380    mnrtsystems 
   TABLE DATA           ^   COPY public.mnrtsystems (id, mnrtsystem_name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    222   ��                 0    34131    password_resets 
   TABLE DATA           C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public          postgres    false    208   R�                 0    34137    permissions 
   TABLE DATA           �   COPY public.permissions (id, permission_code, description, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    209   �                 0    34146    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
    public          postgres    false    211   Յ       -          0    34396 
   priorities 
   TABLE DATA           [   COPY public.priorities (id, priority_name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    226   4�       +          0    34388    requestcategories 
   TABLE DATA           b   COPY public.requestcategories (id, category_name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    224   ��                  0    34160    roles 
   TABLE DATA              COPY public.roles (id, role_title, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    213   ��       "          0    34166    rolespermissions 
   TABLE DATA           �   COPY public.rolespermissions (id, role_id, permission_id, created_by, updated_by, deleted_by, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    215   ��       $          0    34177    targets 
   TABLE DATA           �   COPY public.targets (id, target_code, target_desc, objective_id, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    217   �       &          0    34186    users 
   TABLE DATA           �   COPY public.users (id, name, email, institution_id, role_id, email_verified_at, password, status, remember_token, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    219   ��       C           0    0    changerequests_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.changerequests_id_seq', 2, true);
          public          postgres    false    227            D           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    203            E           0    0    institutions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.institutions_id_seq', 7, true);
          public          postgres    false    205            F           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 75, true);
          public          postgres    false    207            G           0    0    mnrtsystems_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.mnrtsystems_id_seq', 10, true);
          public          postgres    false    221            H           0    0    permissions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.permissions_id_seq', 1, true);
          public          postgres    false    210            I           0    0    personal_access_tokens_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 372, true);
          public          postgres    false    212            J           0    0    priorities_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.priorities_id_seq', 6, true);
          public          postgres    false    225            K           0    0    requestcategories_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.requestcategories_id_seq', 2, true);
          public          postgres    false    223            L           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 12, true);
          public          postgres    false    214            M           0    0    rolespermissions_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.rolespermissions_id_seq', 208, true);
          public          postgres    false    216            N           0    0    targets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.targets_id_seq', 10, true);
          public          postgres    false    218            O           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 29, true);
          public          postgres    false    220            �           2606    34413 "   changerequests changerequests_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.changerequests
    ADD CONSTRAINT changerequests_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.changerequests DROP CONSTRAINT changerequests_pkey;
       public            postgres    false    228            v           2606    34271    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    202            x           2606    34273 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    202            z           2606    34283    institutions institutions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_pkey;
       public            postgres    false    204            |           2606    34287    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    206            �           2606    34385    mnrtsystems mnrtsystems_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.mnrtsystems
    ADD CONSTRAINT mnrtsystems_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.mnrtsystems DROP CONSTRAINT mnrtsystems_pkey;
       public            postgres    false    222                       2606    34293    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    209            �           2606    34295 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    211            �           2606    34297 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    211            �           2606    34401    priorities priorities_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.priorities DROP CONSTRAINT priorities_pkey;
       public            postgres    false    226            �           2606    34393 (   requestcategories requestcategories_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.requestcategories
    ADD CONSTRAINT requestcategories_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.requestcategories DROP CONSTRAINT requestcategories_pkey;
       public            postgres    false    224            �           2606    34301    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    213            �           2606    34303 &   rolespermissions rolespermissions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.rolespermissions
    ADD CONSTRAINT rolespermissions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.rolespermissions DROP CONSTRAINT rolespermissions_pkey;
       public            postgres    false    215            �           2606    34307    targets targets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.targets DROP CONSTRAINT targets_pkey;
       public            postgres    false    217            �           2606    34309    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    219            �           2606    34311    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            }           1259    34312    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public            postgres    false    208            �           1259    34313 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    211    211            /   �   x�m��
�0Dϛ���$�X1���c/�M�&m�i�~B���`�)P���8�����Zsd|z�ov�g�@������6_ ��7�������.���[uEi��VS���2K.��㐦1�X��n!����8���HI�l��XCUV��I�l>�            x������ � �         �   x����
� �s|���#��v�dc���R�^z����'l�P"�~I�5�� !�(�6�z#�&��N����)��0���kv��I�W����׃��m�exWq��qkQl�}7K�k]�q\��!���������ڢ��*�r|۴7iN����[S�vVJ�zo[�         )  x�m�An� E��03@�w���3Mhm�V���l�,����O�AZ���u�1��d.���6R��lv��N�DUˍ��A�p~������'^��O�SX�d�8R*J�������,
�8n�_R�y�>4�y�#�g�D4����⭗�~@Ƕk*�_�aB�[kQ��wEg��.-A]<��������r9��>��
 g�P��r���K��7e�[cô8e�R�\��R�c9�B�m�b`Z4#$4�}�s�eɥ:.�����-7z=�`�o��?k��2      )   �   x�3���
Q�/*I��4202�50�54S02�2��21��".#N��Ԣ<*�9��2�2��(2�t�H�KOUJ-,M-.Q�,.I�ţ����Ԥ�̒T<
�8}�\��@�ZZ@Zp:{��Cx K��ĴĢLX(�%b���� �"D{         �   x�+��ɩtH�M���K���L/)4�*
��t�LI6�H+M+/��p,M�LM��p
0��*��46�)p3�
wH�J�1wt.ȍ+	3�����)p324H�4�4202�54�50W04�2��25����� %b         �  x��TMO�0=��b�@��[`�[qY�E�7�������?�$�a��7��7�硄���{�d��i�-d�k��!�� %Ͽ��V1��lI7PU�җcv>�:+KpE����F`�+bX����Z�,��Xߣᢓ�<�%lӺ��O���V�b���֑� "0AE<�`��㵓{��CMM�M��m+��B���1\D~�D�P��:�7)i7�<4ޢI2 $����íq%B�;i�V��C�a�)"�&W��(�&�9ŉҔ��h����݅E0b�]g��>%H+�h!�zp@D�V�ێ�$��2���:�|<���0�[�q*�������B����F�=O/�@x�Jiw�X�j�6��Z�x55љ`��=��1[Vtɪ��eω����u��y��xx�p�Tv�U$Yim3w�����3.��<1ʙceT,O�����Ns#�<I�&�����b�� J �            x���ˮe9�\�u������~�L �4Ri��D�����C��}�{�g讬��Ȥ_n����tڿ��������\��������o����������\��o���v)-�jC�)N�G��.�\l��m�෽������l��5�������������o�8���a��m����N����f�5z��x�s���V�=�Ԗs>�5��y�l{15��u��6L�����|9��ƛ�zM>�X�&��s���هw����v�T�^-7k˜x�s�!��n���d{�o|����v��S�bKv�nF1;��w,u,��~�4�ӻz�R�#���o�����23��uq��hӍ�[�m���3�f����]]6��,�;o���H7ތ�I9Y��1fڹ���:kr-����t��4�^,q�\��Qk��7����d{�7�kO��w�ά�(f��k�wӚ������i�le�T*5>᛹������(w{J����M֧�%��K�WֲW����^�%>">u����ƛ����=���Y�n��|ݱ�^�݌TZM���:��3��a�+�Vs;�[o����=����%�j\�kF����U[���
�������*�j���2��o�Il:���!���f����lv�T�._v-�ӫ�z��/U��ѽw��qqG�����f3��d�ֻ���a�pɧp���� M�1��bZs��!�}�5Ă��aOx����S�� �խ�]���A�r2v��e6[a3��?�W�لw�8�Ǽ�s����mu8vɶ`�����{e��4�vI��4�2cV�&���>���;w<�u)_���C�<L�)�P/����^UA23I�����[��m�;��f�Dd�v��ΝP�0����w���K5�hSi#T�rA��/G����f�l}�h�8"l+��fl{��=��$Ю�Qjem�-��u�s���QWO-y&'E�Q�o�w�D���κl{�{�C=��6��% 5���f$B� ����`u��Yw5|�w��?�u)_��=���숰��,���^��9[RM>�,0O�����Z��U8M8;��n��������P���J.f�W�	d)9V�l��C[�Ts01�Yg\s��H6�)�_C;�������S�43���2�����Su��V�vA�{�`x��՗٧��=�?���S���t���9|����M�^|�X�jN������������S@���sǒaņU�G�3��t�tD��C�`5�HR�&�UL���jg�=t8�����Ֆ'T���	>o����iƲ��2��|���	*�x�Y�CǓ���P�&�Pqƀw;D\�����g[�iYb<z�[�˃ e�;ܹC嶳�ε��
QZ��"h�����H�F�j�cӁ��gl'j�1�����pw��Ӆ
i�1��Bk	�
�I�+f��qЗ4Y��������$��֝pX;�Z;w�7ћU0!Yce�C|A74��g��/��P6��րkԡ�;��`|�{�=�-W.=�m�i�R���P���J��|1;g ��ȍ��	�w�Ŭ�ßP��cM8��g��gBy���3X�RO��k؀������;򉜦���ow~lB�/ŵ�7��O3{ԛ5�e�ʫG|Ctpε�Ǜ�O�:�9�������'T�r�Vf�Fvu$
�
r����j�f�)��K*�	5�Gw���y�`���cY*'��ߡrE� �͂�K-���[���"�,��c3N�r�	T$޺�R�ZL�d{�*�/�>'��[}E\�M�l��=��Z�Y�b�?e��<ج\�kݻY�{wʯ�Ώ��O���NB��%A�|5�0P �
�w��]�(�Y��63j���a9�S�B=�������I�4#���JH��`@����
��س_�9;Vz��%�lB���N`����^)׍�3�����:�>3l�	ڃ�,)�w��->�S�����'���r���5��	}�U%;j����+l6�4	������|��̉�~�	'��ߡ�2}����@��3xb�������\��v̦deEaK	�|��_T�39��=�WR��JU�'`��z�������.2U|�ѧ��Z|��ٱ,���;��+�14��lgoA7�.���`0ލD�*��*N|ޕzv����Ll�pǕ%�=��(:(���#��bG�_�66���1�ӞTh���K���w�D����)���s~O_�$��"a d�B�=����( ��6�������=�W�P<8p��nA'"�V�/�3!��k���j������
��GO��c���~���+��sw�]r"Vv6x�|�������/����S�
��<����ٝ"~�?�G�C�jQzEZen��	������*ȏJ
����5`v��Dݳ����d{�*�w�ݳR�C&~�D=m��S�\n�� 
,Z����c����=����1	�-@�8r��}o��3�<���ݛ�Y2r���l��;ʺ�_��c{�;TV��1:�3h���;J��sd��}ᓥ��fY�)[n�#�������#ޡrBs���J�fN�x�q}�t0+��#��0��B��������C[��/��c{�;T��B���Lf#��r6y�~�"=�'��vB���&zbI��X��~��#�f0:��9L,�9��`�ì�m�P-@Wcr�� �`�2�����\4����d{�;T�ϛ����1��pDN#f�Eh`P���<
�Wb�v���tSQ���C>���,ئ��L�W;#K����B\��_�@�D�x3+�c;�kh�ٓ�O���Zí��ѻ��ڻ�2[LY)��x�·�!�!��6k������}���l�x����k������RFJm$��7��m�2�ggU�R�ʾ{@ӭ�+���?�G�C����C�
�ԱA�@Yj�+�r�ٹ�sk���� ��;U���v����w�\��ߺX�+dT��G@�7�;,�C�[F��A?��[c�o_�ݱN�!�l�x���/`a)l1=��S�����6ӻ*��23Wv�(8&��r9�d{��ӾmP����t�>k�5�G�@?�@�!�MB4�d=�;=|,kċ}y6O�G�C�(i9BT��-d/��%4g�:��!�` �Z��r!�y��{k6�������=����!&��ZlJ�����V�� 7�(Q�X �/��Z�a u�in�l��'�d{���o=+x��C����ū� �J3�q:���v`����c�+=P_���=�*�	o0��P]���<z��U��LK�C�PK �|�r
%�uJ7}-����e{�;��X0m�9�̽k�BQ�\÷'[*�_�h�=E��۲�-�E���	��-'�#ݡ2�t�
��(��V1s��s�ۃ�l)�ې�	�tǅ��9Jh����6�W~�=�	���;���fS��l��q#�AU�+p�$|�@��̥�c�����]d��'�#ݣr��f����#:�
�̲q+���8i$U��R2�ҭ��u��\�G:�����P��֌���,j�k��%�iO�E�TDɐf6����	�������w��������pd�St;n�	��b���`��Y;"�TM��E0�JB>�V�:�����kg��kD�}�S��]fmP���9=N��>bC5G_��k|�Nx��y�=�mI\��)�G��3�q��e�Mp�D��t�|�H���ޡ�J\��&���������1%��]	�]�cN�8k� ��u�	����Q��A����[w as�=�*G��N	U���ۂ$�D�Pm �o�N�����|���sHL�;w������w��{0藠=5�����ǜ���;���Ѕ�$�O�h�w��P��>���Xw�j����'�"xnG�Q�,��A�Xrp���]�<�u���O�G>���Ϊqt�d��,a�2#�'�R��D��l��Y"�.U����B�ٝ�    ���d{�;Tv��n�dd-� vW���C�Ħ�I]�� ,K?�S���пdߓ�O��u&����s�ǳ0\fOA$J�_�#�&�����{�7k�ϳ�l�rB寏}����(��'���o�f���p{��s�2�nJ睥�ۯ�'ۣ�f0**����cv�tr�c��g�J����c`1Q6d�!�6�z�����!\�x�=�	��>����P�P�7�Q�i�	!�M�q����K����ع"�N�4�]I@U��l�rB寏�S'Z%ʜ� ��`�c�8O���5��8���0
�l"F`:O���_���(w�\LV}UY���d���)�:�oT73qы��"���W/۫��DN�T�	���i{��Ӿ��iZ�I%�T�2p�dAeaJt=�ƭ���;��/��8Ŭ "�Ԓ;����2!g��B�����,糯F��PX<������Z��W��~���ʒ����('T���Ҡ�Q�)���+:+�Bh�b���%�9C�*��6��q��d{��re�y�ۄ�Ӟ�mOJR�Bp0K;tJ�-�s�I�8 �޹ò}�`<�����۞���[0���@¦��:Ĺ��3�X'ȇm}S��ux�XI�����_O�G��ʹdtp6���eg�jTAƾ2<� R�ԟH>��2��+�]�	�?��ϧ}O�G���W�&��|�
�R���*+- ������eQb�@��:�~M@p'ۣޡ2Rez(�^U���|�xC�����<g�Wdh���Qcp{��)��1�����\�G���M� ��Zrj���SH]��ضKM��`A�h��jc�Q��N�?�����O�G�Ce��d�J�PȦU� ��9i�8+�>搝{�@��cT�~
�i��|D�d{�;�\�J����-gel�t��T���؝��,��s�|RE�1�J����gٙ�'ۣ��+»���j��َ��#f�3�
m|���ˁ�UW�)g�n"��������wyeVkd!����V��,�φs�Qd,�
r�X����[C��q�+k�|ݥI'ۣ�P�kg���u[���NP�V����V�^�]_�����ǣ��F\��1���d{Ի�2��3:��v�/"oX��)X"R�U�c������*���d�[w�s���������SZ^˕�"t�}.ul��p"F�۴��!�����x���c��ϓ����+l�ژ�P�9Ȅ���8M��B>\^@�k���w^��Q�!�~���S*O6�9��k�LD�ι[ۻ&�7�<�@(e8�$��-!�b
�����5�Á~��;��dß2}/�`T�8/-����bB!x..�b�.��4�0UV+�����|�힫�l�sͬ���u%Ch�6�J��W�"�����T�b��9��O��c��s�_,�Ɇ?w��ldyV��QRc��=;)ǫ��� iL�5�f����MO�w�c�Ɇ?��e�U�	E�4�r&S��Ѥt}L����*����p�XtK����B՟iϓ��9i	��"�����[�� �Ng�:�����R0���UXh,��?����ϧ�ao���h�z�L�Ս�����"/�;���c:ga�l�:���	a;��p���ܓ���^XW��]Rha;?
�tzb;M���5��q%��j�-w�ehl���tS�Ɇ?wI�@��:W�Kg�Dq#&�b�x���
�d�t��9-�����i���rI'��1�	��y�9��с��T)h����.�7�})�T$s&���e�p�__%�֞l�s/|�0��t��,�a�Ba��窭:����:U���)u�����t���iß;�ޕ�E�i��?:��@�n�ڶA�˫�D��"^h];0珱=�/�l�s�?�0ш�������Q��#�|�嚮�,hhǆ�%�W8����v~X�!�l�s�IM�gf~�KJ��Heߪ��E�U �4�P���t�%Bʭ��Ɵp����!�30!��&;{g�Pꆩ�9�.
9��E���k&�x([D�S*�cl����|���l�@��Ju6]��H��W|�(�x^�x�Uє���!L� ?���x�i{�c9����S�t��SA��@l\�K�8Y�뺭��	Z��/��̚s�/4vxN�?���N��!Sq��)����а �e�̨��0m:�_�U\�;�@�x��>ƶ'��	w>�VM'��e���US��Ų�b��4�xV��s�Yt�p��96\ٝl�s�ٽM9�=+���[Rt&MxWc���G�`�@����#�!i�����?w�.ӈ��eZTD�j�,eVY=,�]c�J��n�����TS�+��^�9��d{�cMX���U�J(.FW"
�S!��͈��T茄j�Y4sY�n�a$���� �8��t@�`:�k/sG�T��5=6�[�s%͓��!c#��g����b����-��+B�E�aM�M.�Mp�7|�c�̏l�s���x��Z�"/��Ј�B�8�|]��v��N@]1��!�e�ҡX�I/�s�W��l�s��o��W�9�Vߦd "2��#?�h9�RV):��x��Ԣ���ϱ0�;q�62Hss�[=f��8.~���S譫bV�>LNꨟ�f�G�m>��������MF�+V1�0�V]�?�J/ɪ���f��Ndu)�������iß;�.1���q4�D8�ivl6O����y{��'�C���}ЧK&;_�˝l�s{��N��%*� �1͡i�1��[/�h]m�*��L��C��?{��Y�ޞl�s�ϝ�e�� mLV�P�EW0AV��+@� �^�|��s����ϕ;p�dß��0�/ .AR�;����(��te�:Y2y���G&3I�
�;���'�cy�w�REu�[`4���Y���Y�>���9��J�z�Ŵ�֟���?m�s[��!�խV�nf{ P��*�궐:c܉X[��Є:�QNh��;�y.y���>G�����&�	2��
��+�	�Wu��Ȝ�NS��X��>��^�X�l�sǟ�-��)�U\!�Y"�Kw]eP�5��,z4�h�=����5�k|��=�D쇯*>d�v�Ĳ�SёSP�6[ϖ]SU	1�p�J�N׸>�./��ˆ?'|N��+0�,a�bG
���u��u��x�~w3X4an|&e|YO�"}�.��׏���:��Qmx�a�D;T�U�;g��f[a�n ���tty�'\�!M�ux�cß>� 5l� �=L�u7dt��j2���W�kJ�M�>��#[��8���}��+��cß>���:��u�	㺼�t���B����>Ղă	hA�;�K�־	i�S\w]�4����Ɇ?w�9uV0�UC\Ν�Pg蕕�����yÒ^�_����p}5���Cu�l{,��^��G�����u�|���Gdm#� T�&�����:�4)y{ʯ~�m���<������a�Y�u�@Fvw��L3@6ު"���Ag �J����^�ח��yV�xf+{���YH�Mϩ��t&vD��F`f����	>�ο�?6�9�����lX����낝n�Z��"���t�֧W�����Xـ��,��N5��c��;?��=�}���a�,]ڷ���WY-��D۠���m.��]�������f���;���'����6�P�h]U�����Lr��J�|���G/��
[�n��0?��E$O6�9����*�d���q��"�,�KH�PF!!���8��b�6Oz�c��+�����^���k�%Ҟ�һoLB��m�
ې�ņ�K�5��G)�Q���x���ss�'������@Hapy�܃s&8��+E� n9��˲���}��t�X�N��_c���~�����ssX�N=��ڦ�,���bK��*�+�&>ٽ]`=��W��@�����?������0/�
ߖӝ���a�q喻��ݑ̥oְ+�o�,�_������]��v��lO:�d��إ�ߞ�&�
�	mV_�b��{�QZ�->��f<����_��v��a�J�(�4*�M�s�����63    ʈ�����r���������Ǔ�ƚ�Wƀ�)���@�ͩDaW�Y{����� �XR�5�Lϗ?���\�l{,���Q=̢G���a���J]W�TZW�U���+�ע�� k���I������.����]�=q�%���T�%��e�@�3qm�X%�+�6X�(D<�g��qh_��eß;|v�B�:���ĚPQ��~����Ёr	�T5�."�,��C������u]6�9��7_E�/��DPv��h�؈_xu9"���rr���l�vʲW�7|UW ��S=��X:�=?�^ڜ`Ɏ��F��F n��1��|�C�ZJ�#A��ޟ_a�l�s��I�6"��ܮ���<�H�4���Jes[���0��u����������iß>�/��0�V�����7tUPO��-�	-���I�;�φ��SEbʎ� c�_�?6����S�5��!2�zN�Z�:�+�T�k�ELM�&� ��':t�:)���w��ǆ?wE�I-�԰�!7;mV5��#um/�{Yc�z�o��|G���;t+��l�sǟ59��oΙ�{���[��r�!~���h�L ���G=�2���1�d{�c������	���]���P� �Ql-�Ak(3��/:��Y5�����7}��ˆ?'|��;��*�0Ne��N��|��l�d^y��B�E�m��o }���r�Ɇ?'|��_���6@Ge�ԁ�y$2�Գ����=��.©�ͩ(���b����.�ܝ2�а�6�A��3����r
��LE��Ew�T���³�_�B����~�����.���7��j��2�
!W��mD�͹S��=�`"FA^@"�C�O�4�U��>m�s����ZX��ڰlm�N�3���NR]��j�#���b�5>���	�q�'�T�?���x>h��J
�pD��5��W+`8Z��79�IW����y{���8]����K�O6���+��3��n��DD��g��YD+)h���Q]@x0�Z�� Ч� �5A%�XT��pT+�dh�:�F�*Tb:������>�D������Ч���/�|⻘�{�*�,��{��O�C���!4Z(��9��*3 ��C�]>_�|�=ܹS�W��z�F�yz�W���y�����_�Mo!�Ģ%%&���o����?7�z�����{M�qݣHkH���*]f���L�S��z�f��ǫ.��߈�z],M'���Y��W����)¹�UY�$���Q�W媚[�d�>�*_��`�;T�B��������{�x��W��4�֑
JX�"6�J-v���Nݪ6PV0%�ߤ9�7��P�p��6Zt�[��:t^�*�PgI�uN�#��]Y�����\V�1�_h����@��W0a�h=D�u�`� �� <�"�����㚥B�7a�c�x���=L����-eݡy�1#��u�ce=߱�ZU�(����b�u��Osp(��E��D�ɆC��0���c�A����S�z�$�"�b������0X��ă>�v��"l�s�Q�}�廩,׎��86�R+}�j���V� �-.+:�
�NP����ɆC'�����!]Q�WX۩@���-������F�u!I��ُE�Mﮌv:���e/�+��c{�c��/f2jT�T����Z�\q�?V�U��2�L5Kv4�.�ͅ[�Ɇ?� �l�i��:;�� ���aoe~э�:=΂L� V(e��}�a�2w��ju�d{�s��/L�,fݯ�&3Acϙ����4�#��PUQ:�_��&TB�tv9E���ïTǏ�G��ِ�2��	j^�
8&�ɭ��uୡ'�JuR�Τ�p'�ƶ��,>��箔CY�	�[<å<ve��������� �62��E�.]}�t�h�������Wi���0��:�蝢�2 ��;xfZ*�wL�W�R㈇I�d�/��ƞl�s���QG[���̚1#t_F�c��UTz۪1L��c%���g��A��2c��~.��[��!�6�]iT��;��^�h:�l�y��F����)�f��Zʜ�����/߫^�=��OXF�\=�M�j6�^"��z�z�$U�	jr�X�Qg���#�E���f����.M�ҋ4]Ml�|��T�����X�3p��bH���ʶ����ҸƎ��s���E�k~�:��1b��@��
J��j+��^6�ɡҐ�������
r���~	��ܥ���"����2ְ��|Y�B+��tW���P	�fz<���?��Ɠn栻L���^.E]SF�$�j�!u����db��7:#�~���?X�U;�cá�Z�<G�1L�]�gti���Z�l� �Vo8�*��vQ�;�m���e������J&���[B9H	ϢFZ
�מp55��{�*^0}�^<�a�ow<|�/}�p蘌�&�o6X)U5t�k�,�t�f�`ۨ�4�t��;��vo3����>�p�H��f(u*��'�'��տ�v�~�}��ހ�[}���L�n_%��+�赑N6:�ە��
F=w!Z���r�^�/��,b� 
��?Ñ��*3!jp�.|�������<�k���m݅E�L!��0����M�]'�5�}��U���:���:H|��~�����T�+�ٚ�ꄗ�w��S)���^�D�{�GH�*�T 7 �W����6�_֐lw�Q�V��DK6�D(��Ȉ�[,�B�xU����7�2��0��h�s���ߏ�D�k��ģ ���&�BQ�i=rA���nB�RF0�ղ:�7��ݦo���^p'��6�)��);���jk���鑚8����=�E��o ��D�?��q�ӆ?�&��J��)5���p2'��Hsf��wY��E8%]��թ�B���M�P1����ݝ�R���t�!�U�$K�!��q]	C��M��;Ͻ�p��9��8+��?���֓�}��&���k5�C�^��Y89w�1�_�F�.۞��ƄF�CV���s����O��;^*�.��D*��lͪ�g�l �Z���2��x֎h/ �Ǯ���3�S�����.IO6�9>���<
���yd��_�����346^s^�g�UPu�\M�t]|2�������U?m8tBi�}��Wݏ�9y��W;	m�>2ƪO�S30y#d�o��V���`3�A�"��������G~RЙ��/��Uc��>^YaPo�: R<�R��t����}��t�繅ʓ���
�ɫ�,R��ف4e_��{6�l�N�Z�vUU�iPY�(i��Ug�/��ӆ?�7��&%-ݦބ];
��k�=)�ʼ����cȕP��I�:�\�[���>m8t|����.8�\��NPg F�)M՝X6���ݳ��i��Y�D���;�*]��?m8t���'ϲ��Ay�]-hm�hK�>�Q�|3����l��."���[�¯�.?6��I7��z����Ű��ד���IeBav���#�	�j���x�&l\mq_��������XU-��^���ȃC���C�k��5�f�g�r�;ƾ�'�]�N��_6:��7wmz�e4�s�jf��W��*[s"���^�����sB�8���~ղ����.'m�
x��7���gtj&r�u U[7fȡKK=����$\�i����ֽ��/���F���������bS]RvY(K�`�� ����o�-L�����P�|&7����R���1�X2R���'z��ړz����D���j�p�]����>a������=��n�wBq�Id�+1|�����*EtbF��:���qH�9}��?=�����!����6��-�t|�AU~1��-L���H`�>t��Q�O�����v�W�ݏn�FG��*���"lݫ�*P_)�yu9�[�u(1� '�m<}�7�����j���eu,߅HG�W�lAYqя\��5�;��A��W��K:������]����]Bz0��p�I�v�	ܵ��=7���d���z����M/f(R<�F��b~����fV�h�7����갵 7�n    02{���M��lJv�Q����S������>{���N	��C���P�1[����n������{�&��Wb��������?6��KH=�9�n0'��/��U��^���F����L�ؓ���Ʉ}zd�sl����ǆ?w��#K85�P5��|+%Lз���k�se����zpU�̝k�>��][�cß�ڻ���
�Wڈ�UNیqZ�6	��ʾ�Z�ngd���R
�x�1v�UK�c{�����ZɒT��݂ɏ�+$� ^��Je=� G�y9=�����c���tuƝl�sW{g �F����\����=��n[�ҁ�Sx�7$��Ϩ�7��z���]����މ �@YD�bT�؎�zD��zV{�����N���~��ׯ#�'���oޫb-��i���u��ZW�9P�"6Gþ����s�-H8���O��dß[|n���_A!r�C���N�b����^�J��7����|�s�����Ɇ?'|��^iX�I��K�AG��\��\{��Wm1�FЅ­���?x�1���ԓ��w���u��Q�9Ew��m�K�/�jO�:.�yC�7NYC����N�a}����O6�9��w"��:���S���cC�X�Ew�M�����iL���Z;�[��0JX��'=��'���su&)�l�z5����*`�ziU�^=�b�m,�tм;q�f��cl����������g��[M��%���	P3��X`�"��"[�4�UϢ
ս�ݻz����p��蝚�Du�j��6^�'���������i��R�R�O|�~L)0��k��ח��Y/�6�ɴ����V�,���WS��pgU��gse�]]B>d�>��}��Ɇ?w�讄%��}Z���q"FMQ%��#b�h��j}����8��g���ќl�s˟���by�sܱ�����1e$(1s���J�̭l���N-��t������5'����u_&�3���٫)Qj�t3P�c��b��N{�'颅�>��9v}�O6�9������N��,���+�j�W7�X2,V�&AՆJ���.�|�?�/�?����o�}�W�����:tc���dD&�vՊ{��)�^o�.��� ��g��I���Nk���Ն?ww����s/z�mC�T���V��S�#�!��N�I��w�ͨG~�o��za�Ն?ww��Nml��2x�����g��6�d��]]�\����S���xw�=��n�w�-l���t^w����`׬	��:&�L��f�����m�zb�7,���G����p��� ���0!f�D�.H�T:;����ʇU���v-Ģ����E��VAd8����n�m���L�4�ukw��α���L [�J��Ռ�������N����6�Ch��n0����d?�&��Z"/�GN4�y�!o%�^�x;~*�W�ܕ܅��
ũ�V���h>U-���g�C[U��D��ye�3;��O�:E���N
��[��ʀ+[V��an��V�amj��L'�z�g�u��[)�?�z�ϝl�s,��vT�bYd4��Mvy�l��zF ���Im-��k��˃�_��n>Rv�6����zP����#��7Ⱥ7�9��K!��ΰ�`Qw�;��1�c�xpHe����9U�f��W��U�WEJ�j��� (b�56���������p8�>K�?ޛy���m]�C����:��U4i���D'�+hy� "��&xp�קÿO��)�dáH_ݶ!�KC�Y<����L��Y�G5��:�C-�!c*��F1�w��ڃ;��x��t5���3�F��T` Dꩨ�K��ozLw�~x��R��<v�l��jßF͏�Q��>o�mI%���Ί
z�WJE����#GmGg�H���c�?�S��l�s��喇�{G���+ౢ}��l��%��Cɨi�h�7�%���۫���5���K�jß�J�5��0����z,`����wP����}�$T�4��5�^s��!<�p����)���z���f�钪w<���Z{D�n&�y��.c�@̦��y�菱��z������2p9����C��o�c:�L %�S{E'���&F�G6��ٟ+�`�Ɇ?'�~jh��6��8�:�&v�+���b�J�P��z��!��x��j�N6��Kr��Y}蚣�d�S	3���J�mB)��0��TAqx��^�Z�Ǯ��.�6�9��!�S��s&�n�]{=B���z­0wz��#��6]Չ�D�D�;��5�-'���sՅK)��c�@n�l}V-v�]z�w��u���� U6�����_�̯��?�.�N*����4@�j 1"Ţ*��ƓC��bQ��"��*D]��>㡚���"�W������Duɒ�`�m���j�F�*��qK)|?�k����ė�����g��W���~'}��j��&a>�$�_43�M�as#������Ӫ{Y�V�����^�ח���%��/6Iy����ݪI/v��D�oS�+}D^��ֽY?�* �'����,ku��?��0j֡���d�)�;u��fF�O�K��V�^�z���-�W���3K��U�aG5M�z�"�(�O�>��5�������6�G��g~�n�x���]���NmX�vt������ř�(�+`�A1X�	9k����ذ�+^����Ϣ�W�����K���3T�h_��%�OT�P�|V�B�"a}O|�K����A����>�YϙfJo�z����V�"n�ا	�K3��H%\�s�D�"��$�W,n�Ɇ?��<���mAݦ#�pˌ�Ҟz+)mU�U���_���F!��?��������
��}��y�.�nuG�m�T�B�V�/��T,kY�{���	�u�e~������f�v==�t�j�B�/{��Rݰ��u�W�,�lҴ��\���[�g�߫��y��7�&�'���bQ��W�R[�5UW�Ú����/J����U�O6���� ڐ�h*����
�U�9W�?NY��n�(]��H�{�~>�'���3���eդ_�}��D��	[��a"E�R	r�Qх��j:���;�Jj���箈���u�����1k�E�cb��K%f�:#͈R�Ga��ث�7������֨�`�,Vf�E2f=�f�:�l�z����$�-BF;ŋ�Y@��?6��{`�e)�pé�pTu*����Lϐ�4Cq�RTi_ԅ�]�Z�:ŋt%3���cß�V�cI�+RnV������V�, ��<
*Vx�*Մyx���BL��l:��瘄��G��j\j� -#����^�k.ja9�U����Z�D��=	��y�ʙ���o�ơ�_j���DU�[��{wI��$'��3f��jF\�F�=	����1�U��6��;%�@�1K�Fsys�i���l��V"�h�X��#,��[f8�5�w��W��Uq�V� ��0"�U�,�K}<ޠO�ԭ�6��y[]�"�]=���u[��dßco��2�aB�M�k L���)&ո������]a��A���)���y������	�W�~���(�Z��szd3�Vj�e��E����zfnƚ�:S�'
�����ɆC�,��۳Z�x���ܮ�֚��)D2��.���gT�	��-�e�0:}��r���Fw����u�4��z��uH�
b(2u�q�zGX,-R�ǗB��˯c���at�ӳ��X��0��-*t��"6z5=wꟴlW�_���6���zeړ�I�6g�d=ґ���\V1�Qg�^�Q�t8�R/Ъ� �Π*�L?��������6:���fы �Ê�#�g�Mn���L�
��k�]�d`z�1�Dd���>3>!�l~���g`��5r���U�U	�e��u�
�z2J�z�W�.��KH�(�dá�Q��'S����LW�4��+�]��{7��z��V&�h��*�J��=�~��~����P�1��{�k�(0��T�*������&Njf�=$*񁐔�VO�w��^$�u� ;  ]6�#��*I�Y�ZI���R��z����ѫ�U�n���F�$=ω���i�7D�� �W��oU�4�^�]7.�V_ ������F��B�D��W���|�dß�N� ��ׁ����nL������Y_�2���2�Ȃ�$`�Kg҇-���*_�����]�#��sR��HCGuIʬ�V�H��%~���f��ƮK��U��9v~O6��=)4z�	ƕ�a�@Gf���QO�>J�*����Eo��YYW��3c۫r�)�dß�j�\�b5��Q�{��L���U#K�K`b�Z�*U��Id?��B1��^��ˆ?w�UVav�W�>�2�{kDו	^
��g�f�
��%Թ�m������˓��ooڬ��FNM䠆aC��K���.�h��a!��mRС��ȑ�y�Oz>xz���	��:�X��e�(�a^�Y�]g�;��Jω-@Y�|PeE>������Ҝl�sW˱����<��L8��ʲ��(W>V�A������M���g��t�`[��>_^x�=��>�wm�[�k��^�:�҂q�����ڤ&Ȧޑe��re�.�:��~:{������:�.V/떦�zK�c�'t������0X�=��~�&5�ޛ��խ���:�v�����ŗ��<Q]�21U=�U�{�l$AD8�W#�g=ǋ����%:��	��'	zT/���j��@�v3v���f�����Ii�6��q;���c�烧'��U���P��#�{�x���	�,3��_���/cþ�~�[ה�8��ϱU�=����c��~�R���7
KQ�j#ahFO�z�]eTg�v8(���+�Νl�s��^e�p��f'`"|A���৬���f��K�v<��Cj�H8��@5vT��L}�=��6��KOC�캦�<{���"��V�x���v��p(ȡ����
>������m"��������l��`e>����U+Y�}K�-k�b"��~56y��w5�����^�vP�w$soJ�4ww�B����Z%����k�5�no�9^���dßۃ®�Q�م�{ݖ%;܀�s���zN��i"�-$���u��_����m!G�Qӽ�Z	+/6�V�!DX��{u�R�8k��@]$��3?�ؿ�O��?�&�>��,!����㪭1g�%��zƢ��u-�NH]E��kъ����/,.'��5�X.B�`�jƬ,T��^���xh:Ү��M��P;�~%�{ko�j�n����s�:�^�N{;�s��J"����V B�!}Z��eU�l__��;|vsx*�}���>��"���~���Wu(�ͩ���U�]�����q����p����*J0υ[O��?�&�����< Q�@��	�`��R-k�c�=#�V[��:�P���J��|p�d{��ۄz�6"A��G��ڮ��~�ǨX�*����3��ªƧ��ޟz���&yPy$F�Kh������T,�Xݦ���ɭC�7>���|��S>�Ɇ?w�Y;���z�f�Ϋ���f_�tݥ�,�i}�O�Z�$8v���1��{����z<��U�      -   c   x�3�t.�,�LN��� .#N���ߘ�75%�4!b��_���q��U*���r�&%�$��$*�g�&�@%���t�u-���+F��� 7�#�      +   <   x�3�t��H�KN�M�+�4202�50�54W00�25�26��".#N�Դ�d|Jb����            �   x������0�ϓ��io��4ikn��A���^JM����t��M�� Y�]aN_��3� ��U�v($�@D\}��#�h�|�SӞ��N˳):[}�i����w�)����Lm����\�'[Y�����s�ꎦ�.��0r1�V����X���DҨ|�!���4��1��F>Ɛ�R]7b���6��/�gYV�i�.�a��aE���i�gWE���c�ʯ�      "     x���[r�(E���n��#��G|N'6�@ĕ|��^AB��/�?�}�:���?�~�?|=�޴`Ȕf�?��
Ϡ���D�����x@�4� �t[��f���1<�Ut0 #�k���R�*�+:@m�7� >����O���Y�JR�J��+=�*R��,'U*YJ�p��xd��ұ�T�J�X�dnX��^�uM�,��	�%��a��]sG���f\��K��B���f0t��Q��V�Q�1ƫ/��	��)�xql+Y��v�ϤÖU��� ��2��L>lXՌ�ϱ�ղ<�ɽ?�fP��~P��,� ˫Y��Ҍ�L�3u��|Gi&Dfl�>��mUwXA��57��$�#VJ3����z�������/\د�hOjƉ�+���>��v������}���5]��f%5�]Nmߚ�Yda=,���L,"��Q��1�����+��H>>T��#�j&dŤ�� ���0J3���l�R`���3yU3�M��!7�ܳ>��x�4��6F�U�1�l�vq�{�t�dn���r�v�}7n��L�6;� ���ѬV���g�u�d����G3�l�ȱĺױ�X���f�$F�Is��%ֽ�5�{oZ����G3eV�V��K�ʳ|��0�Q8x�3�u�ob?�����^�Ѭȴk��^��G5+?cy0��\�>+^P||�R��&%�4�!�j����?�5��6�<,�ɾ��G�ϗ�OߚI���V�s��Z�Oi�Ti:Ա�W�ms;f��Bi����턕�ڙ�������w��5������o�[�*X��J��a
¸�bVfaj`u&i��f ���
�050봓�0-B��X҈Sͽe]CX��X-����J+Rδ�*�I��u�G3��b�:��p`8�FJC��',̆��&kd`�m�,Ka*a��3�0�=E���oa����Z鬤�h����>k�^`O^J�x�ձ��/c=B�4�U!gz��l�w�x{�����!m���;���`���w�x�r����!L�Z=��-�5=M��!C݈��y��!L�O=L�O=��&}ͥ�E�[*�<���˷���2j�؂�����0Oc?)�Ћʾ��k���L��S@��~u�BiH��-;��Т��-�w�l��~9���3�!l�����A��hc��Qy��uo�/�Ms�'�M3���O����1�7?��p@i��'5-��i+�3'qlɺ��D�J��x��ɮ^?tP���Ө���Ƿ�+�3����u��v|�[�q\�W����Q�7������Qr���QrV`s�x�M�B~e��a�;�3X�F��|�^�P(a��̶IO�>K܂fK��ܖz�V��+Ƴ�Ә�u��mغ��\��o�6#�v����}Gͧ+�q�>�nn�|��<����ِes����gw��9�|�LiH?�,�[�_�����}�P����Bm�����=,GD�����?��n���"��2�����������=Z?�#x���Х��&���������?Ss+qH�,���\������c��Ѩ-H      $   �   x�%�1�0���W����K(�]���vq��W��$/B��M���;N�h;u��|�I��	Lp���4%p���3�������W|/pF�)Z
\�́��Qk�O��vp�n��(�g���PU��US���R��k+�      &   �  x�u�I�����ԯpP�f�d�;z�`���≚$���I�����Խr�"MV��Z;soIl�E��(�����/BA��I�A`���Ox�	��S��gs���j�\d�9���^�܇�N�P�8���U��{�X�x$ ��/@~D�#���~��ضL�l 8Qc�c��,���5�jq��e���Ɣ֗�J�+xi�\�̄�/;�P5�2C��ߺ\� bD�#���Z.����)�Q8��,Ob�u�y�>o;��|Jq>[8]Jp�_�H����\�W�f(�c�a�������.Y�֒����␽Z�l�j��[�.��FvҤ��¨��_�G|CW8��5*���Dn�+M����Q A)�NE� ?�L���"��p3I�<�|9&�I�7~ss��;ׅ�T	H��jw�<c�͖���&c�n�,�9S�Q�Sm5�#H�j&�I~����&�	3�������^}�U�jJU^&�qz��P��[\�j�ر�2����Z�`{�"�"�M�7��o�v���$�*����5���5��$�0R.���1^�8a;-2[�+�;; �͏HЫ=ȸ?d��{ �;����9y�3"9 =2#��ri���bH����*�����~GR=����hm�����Y[p_x�jvk�q�M��aq��!���&��D���m��+BOk��=_�2O��D;�r�ӫ�\�����+�S|���DZ*�-�5�9�'�b��(������#�UR��o��L��M�j&�d��٢��Iw�̉��0#q�e3�T���W.k�dlg�+p��b����2#�����	�L��#݉�Q��9Ǳn]f�e��霛��R��I���x���0�9��o���uOy�og{,c�X�`rtS���eعA4���[��|:��-�M�*/�Jj��"���j��\f�L��"��� �bz�L,ֆ�؍��ֵ3�@�K�.#_��5TD�b�	$��6R��U��|�{����KzA����3im��l�&��j-�l���چ�-<��/@c+�p.ʷǒTk��*���^[�&���PϚW��i0�7�JM��M5j�����)�F}����Z������������`��k�������:cA��q���*�oi��OT0��h���7�W{0���G�B�@�cX",���	� ��H=UMS�yH.���m�[w:S����4��Ѳ��bl�OG�h�ʤ
��N�WJ�`�܈�{�ǩ�IQ[`��3c�`Q���_���*Z��놢���]�l`ٗR�+��p.g�,>���)��<�o��om�����٭3�qJ �p�;b��~@�����~,;�Q/���OY�QN7N��U�Dt
ʕ3�A��㍩�˂��=�ӹ��ȡ�}����2}Ӟ������2��@��S`�٣ #7���8����x�a8$�;+��UW�T�{B�;���u�߶��	F�S|���ߴ7Gl�i���0��cY��%M���_, �ۂO�Q*��"D�������$>B۷ڂ�#�����NM_��k�g��󳛿7]O�t��n�u�|4'����I�����x_�G-�gl��yy���0���Ag��j���sU^��^^�ë��7mz׈�lί��2�q#?/&�^�^��] ��4�o�����F���s���{���E>q������v��\Km�$�/�Y�/���灰�H�o��E+��5ګD]�m��ɿio���?~�j�     