PGDMP                      |         	   sherpurdb    16.2    16.2 e    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    16397 	   sherpurdb    DATABASE     �   CREATE DATABASE sherpurdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE sherpurdb;
                postgres    false            a           1247    16408    RoleType    TYPE     C   CREATE TYPE public."RoleType" AS ENUM (
    'ADMIN',
    'USER'
);
    DROP TYPE public."RoleType";
       public          postgres    false            �            1259    16465    Bank    TABLE     A  CREATE TABLE public."Bank" (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    contact text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "upazilaId" integer NOT NULL,
    "postId" integer
);
    DROP TABLE public."Bank";
       public         heap    postgres    false            �            1259    16464    Bank_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Bank_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Bank_id_seq";
       public          postgres    false    227            A           0    0    Bank_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Bank_id_seq" OWNED BY public."Bank".id;
          public          postgres    false    226            �            1259    16435    DistrictInfo    TABLE     �   CREATE TABLE public."DistrictInfo" (
    id integer NOT NULL,
    title text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "postId" integer
);
 "   DROP TABLE public."DistrictInfo";
       public         heap    postgres    false            �            1259    16434    DistrictInfo_id_seq    SEQUENCE     �   CREATE SEQUENCE public."DistrictInfo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."DistrictInfo_id_seq";
       public          postgres    false    221            B           0    0    DistrictInfo_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."DistrictInfo_id_seq" OWNED BY public."DistrictInfo".id;
          public          postgres    false    220            �            1259    16505    Doctor    TABLE     )  CREATE TABLE public."Doctor" (
    id integer NOT NULL,
    name text NOT NULL,
    designation text NOT NULL,
    contact text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "hospitalId" integer
);
    DROP TABLE public."Doctor";
       public         heap    postgres    false            �            1259    16504    Doctor_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Doctor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Doctor_id_seq";
       public          postgres    false    235            C           0    0    Doctor_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Doctor_id_seq" OWNED BY public."Doctor".id;
          public          postgres    false    234            �            1259    16485    EducationPlace    TABLE     K  CREATE TABLE public."EducationPlace" (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    contact text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "upazilaId" integer NOT NULL,
    "postId" integer
);
 $   DROP TABLE public."EducationPlace";
       public         heap    postgres    false            �            1259    16484    EducationPlace_id_seq    SEQUENCE     �   CREATE SEQUENCE public."EducationPlace_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."EducationPlace_id_seq";
       public          postgres    false    231            D           0    0    EducationPlace_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."EducationPlace_id_seq" OWNED BY public."EducationPlace".id;
          public          postgres    false    230            �            1259    16495    Hospital    TABLE     a  CREATE TABLE public."Hospital" (
    id integer NOT NULL,
    seats integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    contact text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "upazilaId" integer NOT NULL,
    "postId" integer
);
    DROP TABLE public."Hospital";
       public         heap    postgres    false            �            1259    16494    Hospital_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Hospital_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Hospital_id_seq";
       public          postgres    false    233            E           0    0    Hospital_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Hospital_id_seq" OWNED BY public."Hospital".id;
          public          postgres    false    232            �            1259    16425    Post    TABLE     \  CREATE TABLE public."Post" (
    id integer NOT NULL,
    content text NOT NULL,
    "bannerImg" text,
    "isVisible" boolean DEFAULT false NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "authorId" integer NOT NULL,
    "postTitle" text
);
    DROP TABLE public."Post";
       public         heap    postgres    false            �            1259    16424    Post_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Post_id_seq";
       public          postgres    false    219            F           0    0    Post_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Post_id_seq" OWNED BY public."Post".id;
          public          postgres    false    218            �            1259    16475 
   Restaurant    TABLE     G  CREATE TABLE public."Restaurant" (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    contact text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "upazilaId" integer NOT NULL,
    "postId" integer
);
     DROP TABLE public."Restaurant";
       public         heap    postgres    false            �            1259    16474    Restaurant_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Restaurant_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Restaurant_id_seq";
       public          postgres    false    229            G           0    0    Restaurant_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Restaurant_id_seq" OWNED BY public."Restaurant".id;
          public          postgres    false    228            �            1259    16515    TouristSpot    TABLE     H  CREATE TABLE public."TouristSpot" (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    contact text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "upazilaId" integer NOT NULL,
    "postId" integer
);
 !   DROP TABLE public."TouristSpot";
       public         heap    postgres    false            �            1259    16514    TouristSpot_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TouristSpot_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."TouristSpot_id_seq";
       public          postgres    false    237            H           0    0    TouristSpot_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."TouristSpot_id_seq" OWNED BY public."TouristSpot".id;
          public          postgres    false    236            �            1259    16455    Union    TABLE     �   CREATE TABLE public."Union" (
    id integer NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "upazilaId" integer NOT NULL
);
    DROP TABLE public."Union";
       public         heap    postgres    false            �            1259    16454    Union_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Union_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Union_id_seq";
       public          postgres    false    225            I           0    0    Union_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Union_id_seq" OWNED BY public."Union".id;
          public          postgres    false    224            �            1259    16445    Upazila    TABLE     (  CREATE TABLE public."Upazila" (
    id integer NOT NULL,
    name text NOT NULL,
    "geoLocation" text,
    "stationAddress" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "postId" integer
);
    DROP TABLE public."Upazila";
       public         heap    postgres    false            �            1259    16444    Upazila_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Upazila_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Upazila_id_seq";
       public          postgres    false    223            J           0    0    Upazila_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Upazila_id_seq" OWNED BY public."Upazila".id;
          public          postgres    false    222            �            1259    16414    User    TABLE     R  CREATE TABLE public."User" (
    id integer NOT NULL,
    name text,
    username text NOT NULL,
    password text NOT NULL,
    role public."RoleType" DEFAULT 'USER'::public."RoleType" NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false    865    865            �            1259    16413    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    217            K           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    216            �            1259    16398    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            a           2604    16468    Bank id    DEFAULT     f   ALTER TABLE ONLY public."Bank" ALTER COLUMN id SET DEFAULT nextval('public."Bank_id_seq"'::regclass);
 8   ALTER TABLE public."Bank" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            [           2604    16438    DistrictInfo id    DEFAULT     v   ALTER TABLE ONLY public."DistrictInfo" ALTER COLUMN id SET DEFAULT nextval('public."DistrictInfo_id_seq"'::regclass);
 @   ALTER TABLE public."DistrictInfo" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            i           2604    16508 	   Doctor id    DEFAULT     j   ALTER TABLE ONLY public."Doctor" ALTER COLUMN id SET DEFAULT nextval('public."Doctor_id_seq"'::regclass);
 :   ALTER TABLE public."Doctor" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235            e           2604    16488    EducationPlace id    DEFAULT     z   ALTER TABLE ONLY public."EducationPlace" ALTER COLUMN id SET DEFAULT nextval('public."EducationPlace_id_seq"'::regclass);
 B   ALTER TABLE public."EducationPlace" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            g           2604    16498    Hospital id    DEFAULT     n   ALTER TABLE ONLY public."Hospital" ALTER COLUMN id SET DEFAULT nextval('public."Hospital_id_seq"'::regclass);
 <   ALTER TABLE public."Hospital" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            X           2604    16428    Post id    DEFAULT     f   ALTER TABLE ONLY public."Post" ALTER COLUMN id SET DEFAULT nextval('public."Post_id_seq"'::regclass);
 8   ALTER TABLE public."Post" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            c           2604    16478    Restaurant id    DEFAULT     r   ALTER TABLE ONLY public."Restaurant" ALTER COLUMN id SET DEFAULT nextval('public."Restaurant_id_seq"'::regclass);
 >   ALTER TABLE public."Restaurant" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            k           2604    16518    TouristSpot id    DEFAULT     t   ALTER TABLE ONLY public."TouristSpot" ALTER COLUMN id SET DEFAULT nextval('public."TouristSpot_id_seq"'::regclass);
 ?   ALTER TABLE public."TouristSpot" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            _           2604    16458    Union id    DEFAULT     h   ALTER TABLE ONLY public."Union" ALTER COLUMN id SET DEFAULT nextval('public."Union_id_seq"'::regclass);
 9   ALTER TABLE public."Union" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            ]           2604    16448 
   Upazila id    DEFAULT     l   ALTER TABLE ONLY public."Upazila" ALTER COLUMN id SET DEFAULT nextval('public."Upazila_id_seq"'::regclass);
 ;   ALTER TABLE public."Upazila" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            U           2604    16417    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            0          0    16465    Bank 
   TABLE DATA           m   COPY public."Bank" (id, name, address, contact, "createdAt", "updatedAt", "upazilaId", "postId") FROM stdin;
    public          postgres    false    227   �~       *          0    16435    DistrictInfo 
   TABLE DATA           W   COPY public."DistrictInfo" (id, title, "createdAt", "updatedAt", "postId") FROM stdin;
    public          postgres    false    221   ր       8          0    16505    Doctor 
   TABLE DATA           j   COPY public."Doctor" (id, name, designation, contact, "createdAt", "updatedAt", "hospitalId") FROM stdin;
    public          postgres    false    235   ��       4          0    16485    EducationPlace 
   TABLE DATA           w   COPY public."EducationPlace" (id, name, address, contact, "createdAt", "updatedAt", "upazilaId", "postId") FROM stdin;
    public          postgres    false    231   �       6          0    16495    Hospital 
   TABLE DATA           x   COPY public."Hospital" (id, seats, name, address, contact, "createdAt", "updatedAt", "upazilaId", "postId") FROM stdin;
    public          postgres    false    233   ؇       (          0    16425    Post 
   TABLE DATA           z   COPY public."Post" (id, content, "bannerImg", "isVisible", "updatedAt", "createdAt", "authorId", "postTitle") FROM stdin;
    public          postgres    false    219   �       2          0    16475 
   Restaurant 
   TABLE DATA           s   COPY public."Restaurant" (id, name, address, contact, "createdAt", "updatedAt", "upazilaId", "postId") FROM stdin;
    public          postgres    false    229   ;      :          0    16515    TouristSpot 
   TABLE DATA           t   COPY public."TouristSpot" (id, name, address, contact, "createdAt", "updatedAt", "upazilaId", "postId") FROM stdin;
    public          postgres    false    237   p      .          0    16455    Union 
   TABLE DATA           R   COPY public."Union" (id, name, "createdAt", "updatedAt", "upazilaId") FROM stdin;
    public          postgres    false    225   �      ,          0    16445    Upazila 
   TABLE DATA           r   COPY public."Upazila" (id, name, "geoLocation", "stationAddress", "createdAt", "updatedAt", "postId") FROM stdin;
    public          postgres    false    223   �      &          0    16414    User 
   TABLE DATA           ^   COPY public."User" (id, name, username, password, role, "updatedAt", "createdAt") FROM stdin;
    public          postgres    false    217   �      $          0    16398    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    215   c      L           0    0    Bank_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Bank_id_seq"', 7, true);
          public          postgres    false    226            M           0    0    DistrictInfo_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."DistrictInfo_id_seq"', 8, true);
          public          postgres    false    220            N           0    0    Doctor_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Doctor_id_seq"', 10, true);
          public          postgres    false    234            O           0    0    EducationPlace_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."EducationPlace_id_seq"', 9, true);
          public          postgres    false    230            P           0    0    Hospital_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Hospital_id_seq"', 39, true);
          public          postgres    false    232            Q           0    0    Post_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Post_id_seq"', 16, true);
          public          postgres    false    218            R           0    0    Restaurant_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Restaurant_id_seq"', 4, true);
          public          postgres    false    228            S           0    0    TouristSpot_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."TouristSpot_id_seq"', 4, true);
          public          postgres    false    236            T           0    0    Union_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Union_id_seq"', 1, false);
          public          postgres    false    224            U           0    0    Upazila_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Upazila_id_seq"', 5, true);
          public          postgres    false    222            V           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 1, true);
          public          postgres    false    216            {           2606    16473    Bank Bank_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Bank"
    ADD CONSTRAINT "Bank_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Bank" DROP CONSTRAINT "Bank_pkey";
       public            postgres    false    227            u           2606    16443    DistrictInfo DistrictInfo_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."DistrictInfo"
    ADD CONSTRAINT "DistrictInfo_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."DistrictInfo" DROP CONSTRAINT "DistrictInfo_pkey";
       public            postgres    false    221            �           2606    16513    Doctor Doctor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Doctor"
    ADD CONSTRAINT "Doctor_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Doctor" DROP CONSTRAINT "Doctor_pkey";
       public            postgres    false    235                       2606    16493 "   EducationPlace EducationPlace_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."EducationPlace"
    ADD CONSTRAINT "EducationPlace_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."EducationPlace" DROP CONSTRAINT "EducationPlace_pkey";
       public            postgres    false    231            �           2606    16503    Hospital Hospital_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Hospital" DROP CONSTRAINT "Hospital_pkey";
       public            postgres    false    233            s           2606    16433    Post Post_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Post" DROP CONSTRAINT "Post_pkey";
       public            postgres    false    219            }           2606    16483    Restaurant Restaurant_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Restaurant"
    ADD CONSTRAINT "Restaurant_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Restaurant" DROP CONSTRAINT "Restaurant_pkey";
       public            postgres    false    229            �           2606    16523    TouristSpot TouristSpot_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."TouristSpot"
    ADD CONSTRAINT "TouristSpot_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."TouristSpot" DROP CONSTRAINT "TouristSpot_pkey";
       public            postgres    false    237            y           2606    16463    Union Union_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Union"
    ADD CONSTRAINT "Union_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Union" DROP CONSTRAINT "Union_pkey";
       public            postgres    false    225            w           2606    16453    Upazila Upazila_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Upazila"
    ADD CONSTRAINT "Upazila_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Upazila" DROP CONSTRAINT "Upazila_pkey";
       public            postgres    false    223            p           2606    16423    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    217            n           2606    16406 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    215            q           1259    16524    User_username_key    INDEX     Q   CREATE UNIQUE INDEX "User_username_key" ON public."User" USING btree (username);
 '   DROP INDEX public."User_username_key";
       public            postgres    false    217            �           2606    16691    Bank Bank_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bank"
    ADD CONSTRAINT "Bank_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public."Bank" DROP CONSTRAINT "Bank_postId_fkey";
       public          postgres    false    219    4723    227            �           2606    16550    Bank Bank_upazilaId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bank"
    ADD CONSTRAINT "Bank_upazilaId_fkey" FOREIGN KEY ("upazilaId") REFERENCES public."Upazila"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 F   ALTER TABLE ONLY public."Bank" DROP CONSTRAINT "Bank_upazilaId_fkey";
       public          postgres    false    4727    223    227            �           2606    16651 %   DistrictInfo DistrictInfo_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DistrictInfo"
    ADD CONSTRAINT "DistrictInfo_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."DistrictInfo" DROP CONSTRAINT "DistrictInfo_postId_fkey";
       public          postgres    false    219    221    4723            �           2606    16716    Doctor Doctor_hospitalId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Doctor"
    ADD CONSTRAINT "Doctor_hospitalId_fkey" FOREIGN KEY ("hospitalId") REFERENCES public."Hospital"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Doctor" DROP CONSTRAINT "Doctor_hospitalId_fkey";
       public          postgres    false    4737    235    233            �           2606    16701 )   EducationPlace EducationPlace_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EducationPlace"
    ADD CONSTRAINT "EducationPlace_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."EducationPlace" DROP CONSTRAINT "EducationPlace_postId_fkey";
       public          postgres    false    219    4723    231            �           2606    16570 ,   EducationPlace EducationPlace_upazilaId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EducationPlace"
    ADD CONSTRAINT "EducationPlace_upazilaId_fkey" FOREIGN KEY ("upazilaId") REFERENCES public."Upazila"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public."EducationPlace" DROP CONSTRAINT "EducationPlace_upazilaId_fkey";
       public          postgres    false    223    231    4727            �           2606    16706    Hospital Hospital_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Hospital" DROP CONSTRAINT "Hospital_postId_fkey";
       public          postgres    false    233    4723    219            �           2606    16580     Hospital Hospital_upazilaId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_upazilaId_fkey" FOREIGN KEY ("upazilaId") REFERENCES public."Upazila"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public."Hospital" DROP CONSTRAINT "Hospital_upazilaId_fkey";
       public          postgres    false    223    4727    233            �           2606    16646    Post Post_authorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public."Post" DROP CONSTRAINT "Post_authorId_fkey";
       public          postgres    false    4720    217    219            �           2606    16696 !   Restaurant Restaurant_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Restaurant"
    ADD CONSTRAINT "Restaurant_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Restaurant" DROP CONSTRAINT "Restaurant_postId_fkey";
       public          postgres    false    229    4723    219            �           2606    16560 $   Restaurant Restaurant_upazilaId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Restaurant"
    ADD CONSTRAINT "Restaurant_upazilaId_fkey" FOREIGN KEY ("upazilaId") REFERENCES public."Upazila"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public."Restaurant" DROP CONSTRAINT "Restaurant_upazilaId_fkey";
       public          postgres    false    4727    229    223            �           2606    16711 #   TouristSpot TouristSpot_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TouristSpot"
    ADD CONSTRAINT "TouristSpot_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."TouristSpot" DROP CONSTRAINT "TouristSpot_postId_fkey";
       public          postgres    false    219    237    4723            �           2606    16595 &   TouristSpot TouristSpot_upazilaId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TouristSpot"
    ADD CONSTRAINT "TouristSpot_upazilaId_fkey" FOREIGN KEY ("upazilaId") REFERENCES public."Upazila"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public."TouristSpot" DROP CONSTRAINT "TouristSpot_upazilaId_fkey";
       public          postgres    false    4727    223    237            �           2606    16540    Union Union_upazilaId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Union"
    ADD CONSTRAINT "Union_upazilaId_fkey" FOREIGN KEY ("upazilaId") REFERENCES public."Upazila"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 H   ALTER TABLE ONLY public."Union" DROP CONSTRAINT "Union_upazilaId_fkey";
       public          postgres    false    225    223    4727            �           2606    16686    Upazila Upazila_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Upazila"
    ADD CONSTRAINT "Upazila_postId_fkey" FOREIGN KEY ("postId") REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Upazila" DROP CONSTRAINT "Upazila_postId_fkey";
       public          postgres    false    223    4723    219            0   -  x��T�n�0>+O��bC�[�C�	�0K��(��]
2��7�a�!}>�(�v3��]��i~�GR�o'�K�#_ ��w��F���Q�ᡍ]KAƏ�a�nEw��a��kNY8���_r�k�j.����"籐�*��*Wv��HTb"e��Je���&O'�Z\��%��W�������(������Y4%(��n6mCl����?���$���Pj����2�j;ϴQ��B%q�̤������S���"���O���t���d'�~���+�7Ʉ�yR_��+	�"�!-��l��0���?��U���qG�S��yz@w��E������hU�E��~�?��B0]���_:��Z���l5�u����O��Y��I�=��?�I����$���wf�$-�#����}�9te��AgfV�A�Lu؀m�K'z��:�)�6�v�gab���l�4~As9�� a(o(�����M��]~�!$�~��Zek>��lۮ�W !���r, �l��O��6j���+S�B'�N�+���D_ĳ��7:"�9      *   �   x���1!Ek8�^`	l8����F��11&6f0����^e�"��f�j30����1�pA�*�[�3�il��H6��R�Ǆ.���2�4��鼱���sz�k��HaF���γ���亏�/R{��X5���O�_v���n�)v9ބ���'\e9p�~�9a۟W@H�Any�R���U����L0�П6q�������#�9�H��      8   $  x��VKn�0][����"�?K��h�"h�\/jTH�F�*���q�£t8Cʶ>i��	rH��{���TZ}��N˭�����Z^��=�.�\�ı�r��V_|s؊6x\������\��Q���D�r_����V%��Z�%^�XE_�G�Z]�~�a�aCnv�Ύ����9��[��k<3�y��f��%,������f��4�I(2�L8��1��y��� ��<���qL��̝���EB���OУG����s\S0C�j�WN���3����
�n�mK�Pf"τ�u��K�,�F�',��a0	̞B�hyKN�H1�^��o�����r�7X0��IeT;Yr�/Ԙ��0y*�I�x'=~Zy�E���j�L�l��̻��#�s��\����.�a��ps��,��a�4��pT.�x4��8��-c�'�C��qoA�Ji����^3�p03Ѭ0�V��3����y�D"�=5A�Y�(vr/9H���عq,�r/x�	\P�,-��[&�I�L�H�Q��0E0��c/=��-�^[�X��[�:C�6�g瀁v���S����ڭ�������>���+�zo�;v)9�&�!��[de�q��Vyٓt༡��m�\[0���Do�����:u`m�Q�TL��S�9O�d��(�|T�������6�.� qX���a|�945W�ǆO_ 3��y?�
��Sk7����N�]�y!X��]�<�B6�gvϏm���>Ô�%ͶO�+�o/�3X:r�W�6��7����A�w?�vr�<���rCe      4   �  x��U�jA��<�\ZH����f�@|���P��V�;�`/$J!�Ll��\��y�yϜ�I6�l�f���3?�w�w�p��T��}%�)1P���ȁ)U���T�;%�����¬ky����"o�?`�iU�%�L�py	/��:\Q�Y����k̯�eQ̣�����J����� ��U�A<C���Ec����̔X�?���ց�R�N���J���ٹ�2�ki4b�;�K�H�#��%�UW�	��2�	Y�8�e9��K|��?�h����R��DI��Tr��\����,����X��O��ђZn��s�*ўc��M>�]����L����� ~#��Mp����X�HV�JGCg7��a=,&�e1�����= �NZ�S�����^��{O�g'���Wmz����R��7ݷ��y�Ճ'��;��#�X~|77tVnG!A	1�C�`�)��������1u���3�z���Zl#%~�j'=���)	0%�
n��q�6�����p��n�9�	f���-r��mQ��6�M)j��Xn10	�k���Gr�����O�g�{[�}�nS�У"k{�-�c4�M7y5e'Le]ڦ� ����j:�Ԣ�B�����T�]R�҃-�@t���8��	`cG��T6G�֮��*�Yd���sch��1�m�j�n���@A}d�Ы�<�"1/�����srkG��N�R��L4{      6     x����j1���S��B������-������P�Ň@Ni1)���BM(=��J����ئ��\6�2�ҙ��o�� ��o��六V	pcp%�9�S	���op�8q��w�(1�x%8W��	���x>��w����gxރ������O1@Cڴc�֙����E��4Mu%zݖ�8��CGg��_�X1�[�w�*H�ژ	p�N��@��/��:���8�rku�H!p|��a�C2M3�䣪,K�|y�le����oư���\��1�6����[�Y��P&���d�t|V�!��j(��4d����'BV(s>\�*��-�B�H�5���,6蔜жO��K�H�K�r���b��R���c�\�<Q*�u�&�l�7��#�~8F#^jnH	>\���^Ug�ݐk���u�U�tG%��lׅE�V���@)t��:x"_��?�{���M�Dt����������p@����w�.l��O�i��c�ia�ǒ�V��r/j�Z �k�      (      x���ko�W�&�9��� =1@�R|���Iu0�� =��a� Pb�V�-�R��O���8���r��(.�$MQ!4
(�@��B����^׽߽_^$;��r��{ٗ���Yk]|��{7>�l�Ƈz����������Ǖ��j��:�ԏ�+�?�qe�}up\��>4z�w\y ��+�����y\�?����Q;���+]w���������;֏+���N�7�^���~�j���n*�~{t\�_��-��We�����~��=�W����q�v\�s�Wq_�����}�T�G^����{e���#����	Oy�.�Q�[��{��5ݿ�#�ջ��~�7��z v��n9�ƭ�{8�ŮM��������n���q3��
��!�k{_=�u���+Rr��!�#Sks�.i���g��]7Y�j�7�V�����w땻��`gcp�Q}�֧�&��}wY�Q����6��vj�aJe��E���]G��+��roR^����͹?����ܿ�ѹ��c�/ܽ�0?;�dz���ܲ_�/����.�O?�?��_�Y�Y;w��/�n}�8k�/��ُ��q����i39{�zﷹ���̝����;��蜹���G�n/-ݻ?}����?�/,޺������f�.��܅����/��í�_\�xm���9ssfif���½�ť�����--~9�_�ܙ���?}1wgvl~�no8����s���i�ZX��5׻�7�B��-\����>[���27k�|��xsvq���us{v���%7m��ݵC��_�n��|5F+21��u����?��#�6c��=7��߻3��fn�No������f~!�Co`�gn.�1��I0���ħ�Ľ���������f>���Ņ/�oFyo��M�
�f�Co�/ A���є��Yf�J�����C �����^�/�eȬ�΄#�3
>��7I�m'�����㼶�H�ɬ�����.��ѭ�^ �I/��I�B\���_��;;+gg�M��Ռ�	4]f�8z�,���1�3��I����n10�}J�W����B�<���Nk���{���L��>U\�eR���ȴV ���Y�g�zF�o�Z���!w\��%	�u���gD{F�o�h;jծK��g$xF�o�{��7�a�ɥoI�Lt���[#�"Iz�f�K�݅��Q�[��M
��kԒ`Å	�gTxF�o�
�(�_'�L'L�3��B��� p�3�-AT�����-?�e����SaO��s����3B|��!Ȋ�Ef�g���U�e��?��/<�·F�_;.������k�|f����[��C�d ��G��Fߎ�UT߳xg����}j����� zhn��Ut,;����9���Ρ�`����	أ����<;&DK�3yu���&.^��r����ܛ����|0�����KcL���ӗ�LON�_�8��~����V�fa.��K^���j)�\�`�[�`+5{7��~Y8�8�݌�Ɛ��>����荕�#{cEy%�ὔ9P���;�uO����#���c����?�o��RsFMg�N'��*{c<��R����4�\{F|"����۫)-�%d�T`)�=e�[8���,�����s|���^����}�%n�m7n@$%o�8	�
P��(�� ��M���� �@���-w��4My.���?������T��*�C~��L�J��h�Z�(�ō�枾_{��կ����}ɭ�s2*U��{�Rt��o����*Ȇ�S��_�!(�fĖ�����Ʀߠ^?8BKn��5�P`�6���m��[z��ʗ�+5)�[Uj- n+D\* ����#�n%ZsY-��<�G���"Qn�	��ގJD���z�^�������U�,� 6��s�b�l-�
-7!V}b왬 ܊pk��.3��o���+����,14Ae8�:���r�.t�h���,��#̲��.��n�%����^��إ����6%�I�;0sH�d���>��[eo���&�7��9{����s�w��4�^3l �����,M�=��K�x%zps ��6ܷ%9~0�m���-�>���pu�U�9�w�fฯ�߁���[��~"M�[�#C颠+u�`��f���ʗߚt"�Jw7=9a'r�X[T��[���XV����$��fH�n1���/�4���u���6��G��� ����+GdH�,"v4�`�dNNz@`{� ��NV�ȩ�����Ȳ �K��������H�U�d�~�V�4��VͲh<�\�5��A�����3CЩ)p��9l�}�3�I�}�̄�Do���� �_�ED�ގ���c�5ň�Z'Î@[�{�v�@dE��^_�!y(�-�c���E垯y(.��O�S7���-~pO*� ^Q�H���H)��P��7���Pz�����kV8;��0��p�:�.@���L�e���IX⢡����)eso*ށ��1\�pI��D��j�m�s�t��e;�7{�L�Mb��S�����
���7���}`uZ��tě�L/L:�ɬ2�Y���`ͩ|.�Gܱ�x���N��m�Bh�x�r+Yz�a6����T�.cP�.�(+ab���Cn[�c��a;���CG[�ȃ�~�{C�l�bGXA�����sD��̘�C���dQ>�mI�G+�IG�-����\�	(���\/|�T��C��U�.<�mc#��X#���7uь��*T@�Kۧ���~��C;���*�Iܑ̝vD��؀��S4?O�ia¾2+���%���Gpk�*&].��W��ik�!9ت���}d�7*��Ӿ�g�^��8w�[:��+k`��V�QzQ�Yp
I�QQ*�-ף�����8�v�
����+P����|quC�r`�Ƌ�x�^���>�����_R��^�eY�ݕe-��(9R?�3��j;2� �#�`!)6�#Zd�.w@?4x������B˭M��1�k��@b;�խ��!�����]`(-�H�q��wh�����(��e0���$��cW�QA��A�7��z7n	+%�h]��-���&�&I���N�wm]+rI��/](A�0�:�ө��
�w6�Q���Z�"��҈�@�7*��D�H]��b�����b�}ȅ�6Y�Y6����I����%:u�sl�I��I�r�}~_���k�$s���x}�(�F��7�7�
���F��ȑ���L���>���ve\�C��6��D~�7_��sZ�*�?Ț�­<��ܧ�B���4��/�s7#��3��nǖ����N�x���*<�U~F�`˧�d�ϯ����3�H.6m�򶵊��^����z�l�����d�5ϓ`Q�24�{����&U1:XS�\N'�� ���Th7�Q�>)�l�`�&�~䨑�Y�MU��'��yE���q�8�\�������T0���Sؑ��+�(�>��|��T���<����Ɇ��΅�rF�z������T,/�p�@m01���5<J��hYy?�tpE�.�5^�#)(�����-
LRx���B$A7��R��h���=ro6����" +�{>[���[~`�s�a��pY�%F���H��W�/B(��%#��_	j��ٍ�oX,���eX�e�#��x�`&���$Q��p�����C�l�a֦h�Z���94��ԣ�2��_6I�Tz��̴�W��M7mOkGu��ȋI��64{�@?N�ad_��6�K�����Y��P]N�(���%�[^�� V�cq��v���"�[k� jp��&�Ɉ[�v�);g2.����
l����!�#�e�D�H�wƣe"`E�y�����N��@��lc�����w��ߑ�)xz �qޖ�T#���0�6�H�c���L*$�K�����'���Eg'E�E`����4��M���t�u��5q�wk�-`��@t��e�=����~xT80C��V��1�%)�}~��V ���w�P�^CC�"�5	�j+�-�E��HvO� `��j!�Vĝ(�'�V5��MO    ���U�ִ��y����rL8MD�~_xWo�� ��gڲ:��|�Z��>!4��٤����G)�4@�P�p�}�Әvit]u��4����k�����l5h
�b�ʆE�5�>�-�#eu2��8m6�@��a�L���>�)-�����m�$F�"#˃����ͩλ��C�?6���%���4,ʹ�l�����E֭��mJ(g�Z��啠�T�t�Na�W��z^�z��ü�[���V�1���v��9�{��1���`B�V�:�M�
ڙ(���D��7�"+�gv@h����w>����wl�؜�3���ۓ+�l�;����I�Pn��|��Q��P����7��81`I��ald��{6l���������|��Zb��3\�x����D>�����.^J~?���٣З�{�̼�ﻗ�Y�f�)�担�%��3m&?���9g�Y��s��{�6��.���a�x*�����\-�u������c$K��_���b��((qr�8"/s '��#E��ܽ�3:`O}��"�ʅ�+lqN���! m�y�L]�q�l�@Er;"*=kY�
�
����\+��6��(��!3��L��d�z�((N.��BQ�8I��3^�8n7�4/@��t��r���C�z��#;#In���+b��q����c;6�Cۢ`N5��;Y�!;���� �"������}���Qk����tvXv�,Q���ȑ�;��zB%>y�����zA{#�ې�Qb�QA�n�n����p��{�	����Ta�����bjlvz`<�s0�t� ~&r�i��D;+c�6A +��.�&1F���0	C�5�C+	�!9Ʉ;B,��p>R�CϮ)�?>��v�;^��&�D4�<�����&c�X�l�C�Ӳ�Xt�LfN Q��v����S#�� 3E� ����y�c��W�Z�|�L3�Z�
9���a$�NK��\F�=�D�*9�ɯ(���*�Ă൛�.�Ǭn�u�1 	*�GT�����Ѥ"������W�	e��J>l�I&�y�=ex��+�?�V��}w��0�[R��2�wK_�d��YW���"X߆>h�/�&s%H���*v�����@�Lo�E�N�Q^������aH����0^�#|��4�2��q6�ggK�&��<�E�8�5Z%E��(v��hə�=n�*��o�^o�ǲN
h�H����Tӷ�b;=.�a$HǪZ������Z�����2+s�-`#�U��w�}�8$�����u*]ֳ���F5���)��G�䔏�3��r��8a�^��0��U�����G]�lO>�5�W,=��q�+K���`YWbTlo���06��ze0�?�.�ܥ���j6_=�K�w:���Ik+��m%N|�i�Ш�4�#)��s�|�r�F�fM��\<oh�ILq�4^SP5�ހ����Ғvk���E�fO7�` �0v�	�ޖ�
0jҁ��?�U�[b_\�ru���Si���Dz2Ϡ�NZ�3���+�#R��catBE�E"$��A����]Zf�oU�"��QN�Ӡ�e�G��ڈ��c�w5F���ʜ闹Q������oЉbeS�x�(��J�/Y���u��wa]b3��f!Z=�l�+)���v��$����2�����kh��d(I��L�Ċ�N�i���dN�gXe-��p�ڍ�38�S�����·u}�V�u�}PM���Z���<��^&���r/u�MV��	\+чo�G�;d%�"�,
YF(�ū�)K 
<UHj� '�v`WKBɞA��$#5��!~nS6��T�b<碎�K�W#��0����}G�\&mLq{X
��s+�oi�m�[���s�����Rj�\
&&�^*���8O�Ed�!� z�*�|�p�b�2�9�!�q�e~G���AI�63���^����d������o�/��@J/��t�	�]�-���qK;�*��1F�ZfH�e���!��y���\)>� �V�&~@&T
�e첢�X�i�L��z:��a�}���?>Ie<�7�oǗg!QZ.� eiL6x�*�kO�S��2����C�({����a;Ya<�S!�Z�C灛|�;����+�OP��������M�S?�E�6BP�#�� �M���GR�<۽����M���G�H�m�hu=�_*	uw���w@j�8&UJc�A�8A���ʁ�aH���^+��t4�TN
_.��U?Ҝ�KZs�##+j����'�E��E$�P�<G4fzp����pc`PC�ް��$�F�U��M&�С�x�"/��Gb/5u4r�b_�bM�\mE���[P �e(k����(�F��^��s5J�ԇ���"����b�7[�TT��F�7f���X�M�z�|���!�?��%~�w�1t�Bm�}��>W��®JgCV�A<c'�D����o#�0��a�g�IQ"ãJO�����(�b���Ȍ��D<U�|�#�G��$<F�ƫ����H�kc��q2����J�W1��;��$W�@V*�K\3�C e��e�p*t�5�(�G����Y����1`VGU�]�aT�$?_2�2f�JL��&�W�,s�:PQ��9`�юƢ��<���'_F���4�U�_�Q�	&A�ߒ���X�
\a�C�61��	������,L�(Y	��i�s_K?ޮ�а��lR���&I{MWUF{�}�^⻞��.NXC_:C���+��Wʋ��i*F����u��H͒10Ӣ�a+T)'��{�6B���rG�X��
�nڔ�>�/^�)�)&�\#�o���
��]Kn�zK�6����a��R���纊{/�Z�b�c�H&P[`|WG}s����xׄ&�\�����`�E<0�6*�(�����VÐ��@�����p�{F.��������M&��ܞz��M�w�C�]M.��0�*�7l `1��U��W#�(i�P'
B��Nb�OԊ&�&���mU��(�M��e5�eՊڻ���M�v���B���P'���5���N��rx�:�v��᜽�>�9u���ǃ�q�~���-���*������H�h�U�1�����2�������Ib0�7���a�ؼ�rM��2���Oލ�=��J[xɞ)�|�N��7"���ȕ��ݡ�nF�j��i������C�q�^���?1�|�>�J;B�B�CC�U�h�k���=\5�Vd��N`j��lH{am�K�>��`6r��Bx�<��mp���=Y(%�sФ�n�d)����t#�Þ�*�3Mv9���Y�2}E^�gKA���$�ŵ]��R)���G��V�4�U�y� {��%�D��r�Wr�%��ͅ���Fe31��	Ɩ@:n�C�7xDo[9�Br�z�W�&9�����t�Pn��
��=�lX�E��]�x�q��"���)H7f���x��~[*�G�f-d�>;Q
Ix�K���=D��ĺo�M�
 �V�G�8���D|r"�e����U;�bl��M �m�^	�h�	�������)�c�la[�p�h��!���/|�ɦ@UȽh�=>�7u�}�D�����5|�P� ��լ��K�ە
��́Qn/d�e�z��Ud�<̵���EҠ#���'��¦I4��6�Z��L3��s��=�6��e��T>6�F%��C5Cٍt��Ke5�&a2k�-�+��@���(�!�v]|Rre<��S�:\�U^yj}��VD�xAGm+򿧎'��7G]����	���8�Œఖ[Ln2a����I��3�5��>�\��
��+C{������7Q�B�����4�}�� VZs��=7&/]>2����)�����J���(�Ѐ�D^,}��k�Ϡ�,c|/�h�i�H��.�g�����c�ݽ0j[��_�b
���˙�1V��#E�a/V�TB�z(�"�s`��Ը8C��J�/90�e��W�>@XR���7Km3Q�v�2�!���N4�������qIg��x^��    ���d�ӛP���,e�!Q�4H��ʑw��Y #M��рt�X���G�dW��F��H�Y�'J./�f�:�)�7�9Dza>
��>X�2�KE�^���|G�>�8�;r���▄�_���S<Z�]��_A�b�"�s��$���yg��Z�'|&�CX�:���2�[�^ ��� �`���k��S3�79�8��p+��Z|=V6���ŭ�`	�ܺfC2hQ��O��h�au�]��v1ZUi8���lu��O^�iV���.O3�L�ut��X�e� �	�o�s�������C[��{]��&n�y�qЮ��� cyŎ�xI#�V�d%���R[�a��X�k� ���B�q1�r{T�U�������3Q�dC9�<B���d,�=�U�>Hu7�RP��'N&��:h���Ee�Ŭ���0�	����E��c��50/�����󬴆/}��VwTU;��WX�έ!yy�Of�SZ4�j�䇧���̱��i���FY�P���z+��Ӕ9C*����%l�6�V���4�
��������^����}�,�5I;���m������Y@��7��?�N�z�0��]�C6ZW�4�b�$p��vIrd���7�M�=։�p#�ߑV.����&t��g"�_���� ��%�'T�K�YBe�������ֲ�#�wH{>�X�c�����{F�J�t��R�!r^����j�qW�]�u�#;*$_@=k�H�n��d�"�I�'^�T���Tf+G<�M�ʖ�ԅڻC<:��LW�`F�i����Y���������=���W{Q��߃��ayVS	��J�ֽ6Q�C���E����qvC�m�����eJ�2��
nR�w�T7
9`�EG�N{�zl���Q~Lr���m. ���pʻ��^��ZLb�h�f"�HP.H�eǗ�����j��f������N�q|�,�B�GH$y�����Qr�R�/�ى����6�Sd6()@Q��$��F)�a'T3`i�0_8c�	��l�O�2gҤ�-Ӽ������-2�@h�I}�χ���y ��E�<�D�~�m�Ӈ�jȹi�ufJ���P��U7��H���"�s|BА��^E!IM����<%�cCXː�%x�W��j�N�I �^�- 0���x��Ʋ��Pŭh��BZ�%�A�C��>-;�)�b��0��q4��$�R�9yЬ y��Znc��rD*(x5T�O���e�E�v�~톄7>4��ܱ[l��9{�7���5��vt��H+0ԯY/C8Nnz2vz��g1� �$��K���k2�0��Xf�z�R��$yf�dQ'�ojn�5�;����P����in����9pB8�'��c.ƶ��W n��'�?6������͑Yp���V�s�6_nC��G�����ڀ@V���$i�}:4S;b�͋ޞ�g�s�g����Ye��!�M_Ij�??7!�a�O�A��\�����D]��#1rj9Y�P7Y�K��L-����3/ZX�-�D =i
�"��IA�#ũ�7��PŞ'�]˛^�(��ga�N���U,o��A���]Jq�8kۦ-���z97��L#���+KW�d}�F��U3)T�J`R/�Z/}Qo?�Sj��@�oiNRO[��7t\����Cr�DԖ��"K#���@Ej�V]�pubD*��S+�*vm�$Zl5��.i���ᵴv��U�%�¥6�+\(�$���P�S�`Sw��Y*C�Z�8��n]�]�ƺ:�W�Ld k4��!�zǦ��M�8G�H=����8��:�wER>9��Ǫ<ua���2n3��]����$K㘊C�N���pd(�����h��Y��-��-�#@����7�f��\>�z�Ӕ��Til&�|�%�K*�M�l�6Y �2�����2�*Ŋ�[�È\�s��Hg$e�ɦ8�.�J|~��jH=�[y��<�o�U��"C<�%^I��W�)����7���.atP�s��e��i`�L�I �n�#�|��7d��b�GΊ���6M��\<��2��^��tm���R�ԑ%N�犛�(�@��}��'�F��i3!M�� Q.y�_)ޱ��ᒆ���p�v��$ɸ|i�Z�9��WŤ�o��G)�. �J;r�z�&&ɮT��J*'�e<�m���d�Ռ�Y	teO7��=���]���z���Ap���2�v���p����CT/}刐3��z�c.�}7�'�[p��s]^�4P�"f�D�K��<E5�ԖQ&L;
x���#)�l�˭��B�}�-�&�W��I�Oٺa8R2��N�4�������4���*o����}ʮ@�إ5�v��~��κ:_��� v���P��r>u2��êI6�Q��n�����7���.�J��H	���z(�Skԗ^�̩��`��%�h$y��l<h�������������W�LL�{�^���|u�ʵ���'�(<����}��k${iqa�֍�.?����Y�|���&�?���z\�88�û�lmT@����a÷�|"һ���@T��1���Ȇ�3漴v&]����!w�6�͸�r��")�N��=�F��\�=��p� <y�Ǟse{npx�koU��gU˗S!�R�9�h�+�t��͑�����O�zwD!I_-`�;A�����Ր��_�d��j�*{�!04e�G�Ow�H��d��LDlN�*z�8\'��4ߑ1�rL�I��#�/��b&�u񊖠
��*B�Ƈ��^�a��.�\�ի���AU�w��d�u���6�ꝇ�#e�K���� A��p��+�&�I���.T�rB P�]�����r��Ƶ�����$�f{^�5����D�U�jC��"88��)p⣀m���p<�S�OY�EB�Ӣi΢Zۙ(�W�E�q�
w�y��|+B��x`�:�X�*�ZQ�Z�O��P�U����M�!��mte�	�&Y�M�En���O���O'$6J�J���-r+����SK��W���<
#XOJ(�H�ٶ�&������R��<�Y�d8mp<Q�lS.�������p�w���af%�.�@��<������I@i*�c�-I?�5`�j���r�����$1��VjI_R�[Z�Z� �T%9O�
x��'�Z(�Ķ��.	m��P>�EŬJh5�*�Ȏ��3b�^*�)���?�3߮���L3�0N��{�Oy�a/9�����x�}�
']�k�g3H�@��6�/*GJ�-��=T����8��1�h���r�b[�%px���(��r�ģ�Q9��;̝	�z�����"1�Ȅ�0�1g�< "Or,9�F�1�.�a��X�v��e��գn�`cy�Z��1:� �:o�D',Z�"Me���g��答�I�a���]e��ǯ� ��ga�ޤ�㹦�RIz��k]����� sy��%^�e�C��A.����.F���֏(����3�%k��}�� ���*2�0��ȡ��Q���# �$��	K�>@��!h֊;8�CC�~{����q�o��#q'z�+
�"j�}�Ѻ��xkڷtR�R�I�A]J봰�Dm�`�%nb���<�z"	��6ThEM	-�Ʊ�h�Y��&�`ƫ�J�>��-��:P؅)Ƭ|Ϲ���nR�P�X)��"��^ڑR�2��l@*���,_���Ԗ�a����#I@��/�q�'$T�-!�M������(��������� *x�M^B����(2��;����������υ�-dѽS��P1&�� �d����a�_��mp��k=�M�9�~p����
�%�}"l^���OG)�\��whvɫd)ӂN���5�T�Q�<�yl8�΃��m�`H)�/b�M^�+�|I��7&Q�fit�/������s��!&�B<B��cim��6M|=��	e� ���C�&@!��m#hc�Bf��a"m�Dp�|ON���##��[/�&�P��U�2��þ$E��h����D�Gb����>'������y���'��E    �l�ݳ�xۻ��D��x����!�g�%?�ڶ�7� �ok���;a�LjLzeg₥��/Qy�H���r-j�`���F�`E-��d�?�{��'��y&��6>���aT�{uDS�\������;�}���O^�C/�Q���D'&�����m����~�u�����|��gؐ�)q�ܲT�R��ƥ=���.�<9$��a���,�=�ѕ�sp��zx�{���K���Jeƹ���څE���"���5G��ё���-zk2H�{8�H"S�"���W><_��2<{�\
�� xዋL���(/��@������e�ٴ���������N>^v>U���j�w~�X"e���5Ɵ4z�M/�e
T4x��T8*��(I�A�����+���G}��5_�ۻ4:Ѹ;�� �f8�h�ն6}�[KPB���e�㐱��
�$j`oB��/E�C=%.�A���G�IJ�/9�� T ��S`)�����4���#�G�Q�2:ٜNV�h�R �3g�&��qG%�ޢ`%���G��^)9�M��ѡ�;�D�a�֊:N��U��I���|���3TTG�p���Π��w�{�#G�(<)tS&A�g�OO��B�`��Gуq	vFFe���S��lt�W�����*L< �kS
��I�gr1R)s�$�Ⱦ��<�[�U�G����i�J������8�D�6�����rO!h��(�`j�I'�P�iv�H��t�B�"h;�u��n�jNU�q,#��jnҺ�1��Y�L^ʑB��J�&��]x��f�6W�g�:ОM%3����Je(�·����\a���G�ӡ~���لC1i�Dh�qp��1e0#?�q[%�&yE[Hsu��Gf5$��-��wY���y e��e�Ulϡ2�J>PvV����=���T �����:��Q
F{�x!p��*��@V����j��ő3��M�E�vI��r�1���fF�n�v%1J@����@W��y��5�MpU��'�����Q���n�ʛ�A�<�+{#jM�J�荁�D��手p�^�~�
 V��a�<��Wt7;���{,��Yď���mqVMd�c�܊R���Ώ"rM���m�Nʔ
H�0�"����T;W1ꬮIQ���8�0CDF�nExD��r}386RkNm������V3����#�RK��XS1т��6���ڙĳ�lqj��?�ٟ��!����7&k�h��h�V��ZpVu|(�����3�wA�!�4i��X�́1�Fw"W���R/_���Re������z��X��(���h���9V-�o��_k��F��5m�d��{.ൡ�b��Y�n/������y3�/�xykD������
C�|y"Z��/s�J�m��"���D����D���i�t��5`c�.�(�3�^�SU-z�?F���eL<�҄J�ژXF��n��K���kJ�
}�d
�YgW&���;��w���75����dL��J�n1n�xwe�~̔�^�d�֞"�#`=���5)��J�$�pzjI�D/Zu�
����_S��u�Fo��0M��h:"��O��>3th�ئ�j��%$B�&ZpfC���3шp��bJ
��e�����0�G �`�
��>:�s�e�ש���v�.�VHX�S%IBĀὢ����N�"鵉������]$El��繲���(��1vj�>�+-C�CH�\��\��'�`��D��w�S�;
��UX�� 7P������U�L�	�ÿF%Cz��;:�I*�mR��%��D�[=��T��� ��ѳ�N�����&5~X��9���\07Y
%W��ҟ��ߢo���:�:#kHګ��		�7az�%r�
I��,�D��[�?m���W�VҚ
���*�S�h���u~��?i����(��zm
7�)^��'�e;U�0�K*m�aD)m�A!j�ͦ��Ұ���uob�Bɨ�������-����N��B|\`�	��f^�5I7��v���̭�3TT}��F�+So#RG�Ft�^�t��D��/_��8��~�:nf�^uur\q�JT[hi�����;s��͝�/��q��=**����<�H� `�C�8���&�����dB+�-k#4�]fVZ���p$��ҳ޾�P��ج~p���Rx�;̇���Iӊ���C�Rf�f �b'����Ww��W|�1f�j�R~ۿ�*n5;5]FH���d�|k(e򁡌�'�����1Ơ�'�,F��]�����7� ���f/!���@�7TƗ���] ���l�� y�\��|�B����1!�8\��E�,*<(���jd��bp��N���ԊMȖ�����T�Eޙs#��+ة[�1uo|��+�әĠz_�U@����n�����_��ē�����]Ӱߵ�ߊ����]�X0�6��,�DB���ɟ��gs�+o�����q�Ȗ���-8��);�*��A7/(OX�cIQg��.�Ԧ+�S��R��͇.]�%"�SQ�j�SX��dS����J!���r_ڊ���.����HX'���3G'�������&r��V�D K�m�����SlZt�Dk�C09B��W�*��a'k�L"���5C��+:1j���v���{��nf�o�*U.������׭��P��K��)�
�]Ūe�\*ѓ�$!c� `$����f�=]t#�A|`er�&�eh:ha\�0�� �"�`�^�_{ҁ��b�m1AY{L�j��/N)���+�p{3����&��;U���j@9ᳵF��K�#�|჈���JJ}������������y����' UJ-�eR��v�aK+8x7f􋴅�䎡�ka�I�ǎ�"k,:�^_����3������k wIR���:t�F\��kk+�{�#9n��U��IJ~�tQ]nWI���g�GU��L�q'R̜����NN�XpH�E}�5���`�+�|���9zI1j28UD҃�S8wO96�3VD�j[���g��ʕ�Kjx�R���yz<&�zgW+<NkI��hq��!TZ�R��uJ_^c���L����59���F��X��g��*۠�\0�=����'F���K5�Huls���E�>���vSSW�N]Kx�.M_�2>5y-������ ߝҕ��ǂJ(�8(�BT�_�:��<U�
:�4(tKm��L�3p��n� ��9d�����7�J=�^�+2�a�%�'���M�J��x�V9����s�DE��CJ�TX�g�EO�=H�>"�� $:I�R�M����ۜ�X�3,���H�PF<~G��6�9;ez���с��+'k��W�F[��
�`+���j��^I:��vH��p�{��:�{��N�k�-��|d(i��!ק�%̰)K�T�k����<u�P'�cG�X$�<���h�E#}�!l���l�e��Z%�B�603��n;\+P�þ�z8��й���bE�~x<o.�ŠHjǱ�m�1ܮ���$��:�bu�Z����Fv��]`��L���� c	�����phwF8r�aǓB<��m򁶤��)��ӓ�� ��%�n|���z��8��}�u6Yq�(��=���V��PiD��u��ćW���$�U�=>F�B�A����(Q'd���I�e���o7�m1~i�qt��8��o�#p��H5�a!!12�J��q���+6*�TH�R��P�B���P~ଠ9�����Qcn�t���&#h���#�k*?9������ՈA=p@�W�� ">UM���Vַ�x��c�����ˁ,��=1"�&(���qg�)��+=
�Q
���l�h��ذ�Ő��7���5TN�WB#9k�b!���t]f��P|�'��Q%?�n�(��UJ�hm=Cy,]���� �>�t��	v�c���{j`=a�p⭆}�;����<���Q    �ꈑJ�Y��䴩�r/~�/��ͺ� '�� ���vq	��<9P���6I^I���l��hm�+Z��Z��JQX/zA��Z{Y�����6��n�����#���⮳�v6|��}�1���|&,*���<���Ъ�awՀ�ml��ǩJ��u%�hd�J��V�/�vԛ��E�%Yg�鄹�!���@�m~A~	�����(���r���X�flٝ�V�"Ȥ�ү��S;����,�?X���L�8����#;�rk(�*fcSi f"���깿����@&#��%0؝*�@/n�eFl�)�;4!k��R��y��2e�{w��<�c�ed�;��((���{�n��z����;i����-��Z!,;�Z���p����NT�t]�b!v�7o2�ehD���iEFɪLަ�Y�����C�J�5��1�q��\��@QCSgY�EZS#BGzss���ŚV��ƛ����BV<�D��{��<�3������݈���=X�!2^��'Y&�\�{�IL�)�?��i�d���K�Sm\ �q�����Rj�WeEd7O�m?uc�&�F�l-�L���o����g�C��;�j��My=:��(e1B�^O����Ks�B����'j&V�ъWW�=����''1Zʫ�r�U�2ګ�ڲO}c ���)63����2�GK�+,I5�HOU]�M�txL*jh��Z�z���CrҮ�$��rEL��\��Na�tۚ�p;:�i�&��ߎ{�W�D$��ͻ�'M��e���m�k�>q�!ĻVӜ�)�C�$,R��X�_B�K(���g�8@��������J�dh�K�ԥ] ؠY.�P; ��c$衢���� ���h����g��A@�i$5�|z�PT9��M��3��,����$r<<�	Ѥ��U�5*��z�^7T����H�RѨÃ%�]F���8%PʅcS��)���z����"���rEh&�5�����C%�cƍnߝ��3-@����x��wC� �UxD����ty���˗/N�g��;'�ĕ�6����d�{���f޽�|�Ѭ���D0�Xv;?R��sC���7���A)�:¤�~��0u�� ͔�OK9�X����^`��y�fn��ri�Ό�����,�����HB,W�x����DF��U5�D�/B�c<��R��e��!wh�>Z�P�AJR�r�f�D���t��*y��5j��������<��}G��5t6����=�#�f�&�&��Y�+ѥ0�6!d�*	l�ȯ�ꁉ/����0ή������@���qy�(�b�F�p��<�?��Z�ry��E��0�"B�A�����r�H(�b�c�>/�l|ė�B���#:��i}�Z��\���a�z&U���W�Wk{��mKu'X|��!��e0���f��c"�9��,�e�%֩�l@���[*�vV���ϜuU���p�bUv�N���ι*�X�����c��V�mG���A@��#�����k������M���څ��QJ��Ax*�墨�W.�J�袏�����5��`��L���_�ܰk^�������	ʻ9�A�q��~�3��x�at�)����tM�%�$2�n�S&� �$�K���9q���6��� E]�������]<�%3�QO�u\µ��C���2�`({V`��F+,���c����i�z�!���[cN��l$jP_��}�"���Q��Xf�X{�::��q���-{u��C�}� ���4@���fzZ4@�V�I� �P^�7��F1%bQ�^ ��/x���H=���Ta_:�)7_8�~�����oI�/!��	ʙ��rI��pz��S<����֪F���fr:%����-Z	u/��Ы6#�E�0�܈�`U6�<ea�P���GL26���u�\8C.��'
mf���譬lR����n��\��F�����ԡÐ�~�ȳ��1���	;ʁ|㑴B?� �`.�����	MG�uxZ��Ę�^�ħ���k��Ba�='���O3ju�C�������Y���צ._����B^�����ŋ���Ce����d��:TF��ʝuPaT%"R�E#s�fi^��s�N _�
���=��h���9�O3�g?�1����Y�3��e��yCʋV��|��W6R,Y���=��/��k�~��x���~���,k�H�r�����m�6|�!g^5�$M,�H�[L�WIE���xe</l86�Eu�g#Hl�t���>$��%4JVt�-��{��+��ĭg���u©��Kd ;ځ�qJf6�P�?�K��$![�s�b��	pm=���v�@w�nƽ"<*.���I:ȹ�H��"rSI��h����P���_%�)nɿq%����=�G����|Dt�b����{��I�^�9�J#�' 4N?��㳙
G^��NJ�#�n�mr��+j���|#��^��]1J�0ϗ��WH��}�Q�� ͨ�)�zE��;��m�a;�-U�t'=\L���:���B�X��<#�v����,q�<Py�����k�H��4�_Y�V�����ZiM�ڇ�\��^a������!J?M:�Uɮڥ�X6�`��Xhcˌ<�kt�]d�&�������"g����_�3��=���Y�����#ms��$b蒇�w�椈%��ܿ^۳ц��*Q�^U������P�t�a���\�ӧ��3F��ž�0x�f�x�
��`���C��[���GJ�T��t��a�q���&Pq��'wH��?gf�B���Es�=�_�rF#�dFf< �})q<������Q �"�L���>s˧@^L%YbB�Fq�V�S��'���Lj�F��𹠺��:�4a�Ƭwڵ�T�9���5jO-����E�Ϣ�?�h6L���Ag!����YH�,$B�?��C"�&/OM%��MON�O]���C"#���NN�������z�,���V$bS�T��V�XI�p�i�t䕨le��}ڕWN��y8i��q��3�����Y�_g����s603wsf�|2�8w�Dˬ�Y2�J�/�W�n���o.+�$��L[�"���:�*� w�+�
��!���L���-�9���[&��2PP���M(��
+"��?������ޭ)%��fC55Zi�+���~�����D����za�������@���=�)�{��v?��G�%�`��o�����U��jqx-�+��O��qNu��zg�ZS�`W;wS�}_�V9��<vF�nV�t� :���3Z�1Rwz"�H�l9���5�=zve!�|��d�u.U~��������ՏE��?Fk�Hųc��b�������N�P��Eɹy�S��"�j${��%>�?�Z���)�_.�f60�0�<D���}4������ʷ��L؈}��2�v�p�vV$��4�)R��i�'�}��湰���*/p,<N���5Fo�ƎI�C�C9�+����3T���5T\��AI���D���Pv4&�>sv�]G&���ɝ���!J����8���V-�K�&�^���.]����z-,}!�[�d����XK�ZXL�C����ݿ73O��?_���8mo}���
�����.������������6���}u�y�#� �s�� �X�;ֽA�w��s{q�����^Z�w�����8���{�7�f�o]��.��ۉ�>����5����k�q\}o�*~����o�d��33��M��	2̢���njO�%m�����m���N2�����	V��������M�)������xA�}JW�&����U���j��I�1Xho��Q�O�Q]M!^���2o'���P��s���I�t�p��^�8]|r��o�}3��i����t�c��ϖ��W*��9#SDa�5���ʞ
)��t�j��ǗNcq��"y��17ɬ���w�2��M�I��p�5��w�/�MY��^-���g��]�겫���*����W���2%Kaz�.N秙K!�6���#9�<%����O@|�    �]���d��>�S�<r�-��(�~-�B�:�}}F˙���Ȑ��L�4��I���93����S�+\;��4���T��6J�U��ޕO�-�*�*i�����=��6� ����nW�h>��o�R��_w����m߿d��4�b��7��}���z���{r9P���l:Ky.��J����*��*v�V����x�=]���M��o�\�l6����5�G/�ON}���d���E����ܞ����\��7*��¡hW]fo�	��C���I�(v���O�ߴ�����ݹ�*k��< �1,�6�6�%ge��J�,H��'��T�~B����m��Ff�������Re:i��{]�wɸ?9�Wsv���$c3���j�]"��d=�|�]u����guT>�y�@���_e/����E�G��!'�S�`�1*�>��,<��*m#����<��X3� ����s<��������O�r<d�9����\�cjU������8QQ%~K8~�F'y�$LA�`��1XI�
��zG�B�h��P+ރ£o��H�R��k�y�2�ŭw��=gf �غ{$:!g��O.��3���������mb�u����� �N(
�)�vi�y|�C�3�>��N���C�S�5�&fE������n/0/���R�O�R!��Aou�8Q�I��]�/�v6Uj�Ե|����v�+}�N�c���v�{r8���&�*����,���O �	Kz�#��>2h�H�X�	5�n�&�!�W�����ê��F�A6E�\O�h*nT!�H���q�Hv��H�^pLp0�=pR/�'�2��Z(�Q�Q�r�H8�k�c�Ёy�ɯ�����)
����� !gaw�>X��|D������b���uM�?]����	�����J�<eI��:�Ji9[i�9�|b;ari�P��:V��^V�,���&��l�@�<Xb���~��t_����A�<q�5�i*U�Ā&�8}C
��i��İ"�W�����h!����"T3]��ߙ�.�cS�H	���#)���pDE�*��=YZ�o!��P\h��d��?�(�@.[U�
���t�N��:���z �p�xIɲ��ܱ���O�F���W�Ln	r���p���r��T���>�л>�y�n:p��l9�����+�c�Ά�Ջ�X8(��]*�8t�>|����m�#>~����*�u=C�>�'/����/���J��6�??�[��t~aivlzr�����h��y�/���Ȅ��1x���,���9h�n�j�[!뿍�nzI�8��-4�7�l�����%G;�?��a|�~�b0�ʐaj�6���z@���O/E���՗)�d��t'�����ߑ�Ls��g��cT�����iOqպF��`'�vSuۈ�(�	�硧�ó�bl��(�U��4����RsKb_��� �F&S�$��I��&��eZ��>V�g`�׽[C��4mf��Yx���)�� ��}s�gVUI�R"%���v�"�v�t�6��#zI�c�lmԣvD�7Ng@J��۵|�9E��-v���U����I���3�����'g�g�ע@��]^��q�V�C#���/E.9RW"�2vF��j���{�	�E���̚d�.Y����6<0�0�ޤ��s��;sogÆx���^�e����;��n�WB����POy13�_?�.��]����̮}|����FeŞ���-o���mv�#��I&Y�Iny��!=�,����\���O0��<ӆ�9?mW�G�͌';WE�W«c�~���7լ[��M���rD��t�r�<ImWc�W�z�gA/;~9Q��꣛�\����V'�`E�O���d-3�r�G��S�{<�=2��sv�9�0�1�/��)���9�
#?9G��,�7}��(�o�����Cq�$�G��'���*���<�I:����jNIs�V����ZN�2?��I���Ե3��5����NF�롿P�^Պ��ݞ���Ÿ�KXQ[΂=:�\�� X���M���~A�/Q���N�4��iȋ����LU�Q\�ݬ�L�A��w�Uc(�?�������0�F��y � �W�
�<��O��p�f3{j*P\��I�������:7�{���U�B�YSy	�$�z�B@�ќ�7������W�R�祊h=�f�mMr�q��)l�\�	��s�ۧ���2>��(7Ej��HQ��R�f����;H�+v�W�ٌ���@�y�Z"ut�=�:��������h<��؏�#�n ݦd�{l��"��#�T�qs�G���l��8Y����^��J�K��؆��{`����>�WO��Z����>rѹ_���!��Ӵ
���i��n�ԓ������**�Qg��y(��Q$����d�X����	�0��y�p��	X�
R�J�eUG�9�o���?+��B�����M9v��}�3�z��ɔ��R�u��A���Ü.͕��������꯴�I+�4�HJx��Qo�Pha[��(��b�@����󶯃�<?W����[��P��LNs�`?�s�k�v�ŌfMX�7\��΀j?&\���+U��R,u�w{7�ɳ��$�.l�ŐsOݹu��7��UDm�����#M�}�8R-�H��EX�pj�����kW��ۂ�i�����w<�v�F��3�k>�9��0�ߙ���s��������g3����z��ߜ�j���{����ҝُ�q��wf>��{3�6wg�܍�����[���%���l�+[lcn�ִ�la����X���U��b��ܝ�6����`�if���dv��Lo�����~���s_��X�����K�z��37?;v{v����޷��޽n��,ޚ��6��r���4{�LڟT9��K3u�`�]<��q����i3���¹��9Z�ode�̈u��>ԅ׽;��(�d�y@~:e���y��c�j.ӆʢ��r.u�=����H�ʴ�IQ�'���O2&���*%��B���*U�3�3�:�ՊK��M�9yI�i�,�Q7R�Z�m��6>8+'����Ar�凳wo���|x����}�Ҫ�׍�Z�0���vY�o�CZ�_י��]wmy�C�=��L����� ��I�`�_�5e������!�廯Y��V_����N�V��Z�08@�(��W���5U.�s�^G�̘����48��s*�n{�q�kE��_<�.�I���ч��kݿ�q�)(���C�A�q=���s�:�r�:`;g��1���Vt֗�j�ș�t���G����`�w�~(�Jv/�ԹX�Ը2	�%���v��9�OT�-��Nv��4cg".H�����ZY�m=!��U{A�;���=>�p&L;w����D�����}�V������N�Nwj���L������H&�<y��_,_v�jn��p}��t�@�v԰��Snc�@{t��tL���F��1��(S��*�Ɯ���n�
��[��8���9��｟����eJJ�C&�Ԕj��W!I�T���LÚ��f���8K��N��o�ĥ�_���{1���@����^L�CQ�][�5p�m�h���ٻAU$��灱$^C�a�W��Z!�䨂�2i�5�!�Pgj������*���b��tr{Nō��I*t���RnP�sQ��ui�ih�AdX�gōօ�몫+���~LV�s�ΦOI�t�B������A�a�Q���POa�j�g�����H�h��v�(�k
XhU�O7�xC�8��HD	����ԝ��,Q�G�@q���d=�����,�Cl���:+����׎ڋ�*��{���j �C2�����.��=L����C-׊c돂��?�����`�u�[f�m3��[�	ﴗ4H����aԎ����l��=d'�#�5��i����+J���%�I�Ǖ�6����V�}��$�cǭTh־૨t��і���g����    ��~/�٠�ʞ�|4IA'KW�M�,x{b��q�T�t4�k�����a��N#�	���OrS1P�\��q8A����l��ns#�D7��xt��\�H��J����6qIVܮ�˃P� P��+m�T ����B<=d7�yoc�DO�\��:�R�׽}�G
�q1�թg�)����$ǁ: C˼3j���i*&�i� E�H4޼M��`�����6UL�`�K��Ȭ��|�:b�]a�@Q��[Z-��tk���#�4x��=\1��h�pc
̶��7��ɾ���.�wB�o����3ě��2d$ ,���)vۑQ+� ��(	z�1���n�X��2��fo��sO*���'��b�34)�Xꤐ��XpS[B+��2��G��R��w ��#K�4���-!�W�
���<
������]�t�J���k�@��̹7Ȉ�[!oJ+�0N��qW<�*8����Ҵ���/e��r�G������F7{�^	7�m��p�\�d�	A�HX��V�7
�Ⰹ�;px�ѥH�NX��Q]�"&Z�4vH��a�*4�4@���Jp)��L�,��%�o���c�io6���.��O]���"�Q�pm䆒Ґ�N��bA/� '"lV�4�F�����A�9�1�5=_QA=η}j�^�N��'GIC�e^��[냺a���c�{��G#ژ�����b;x�x��&����B#(��$W���R��C[#ˎ��~�lu�]ZԐd�b�y*��������ԣA�v�&��~�����#[���"u��^t�#4��H�Mbbbr"��M����ρ�6�|��vl����ǔ[��n�lUb�ɒ%��}ϯþ�RL}�Z�^��/�/�X�v3!�T߶�����˵y�K=�1�>0��I�����)�z�N�\��n|d����3��J=M[)��HQYH"�f�jt�Qc�#����2%��<P)[��2�g��9D]�M:pG�����#4�P�V�8=���� Z�Ӡ�UV�dq��/_�m�®P�qy\�R`}Xh���a��T���xr=T�������*i��綇��f^���45>q�����;�w'/eM���o�s���9w#��p�Fm���@������;�����N�,�5�&խ���CTԖ�Y�(���ώ}�p��������}��;s�~5�437?�h>���짟~qgafi��0߻�܍����������2�?���^ﲛ�<�z���B�w��_X�����.\�p����>���/���?�l�����W�}5~{���Y���9ssfif���½�ť�����--~9�_�ܙ���ƍ��b���������'+������~��8wk���~�_������Ҭ�gv���J���s\\pc��Zx�*_7����;0�isw���;�����7s�C�Z\�E�7�_>�r�%�{s�K���-�6���\�ߚ]�=���Ǘ�|���Y����E�ޙ������g�7s���{���Zg��6e�q��3w����񉩋?��O�M�O^�|���~z�9RqQ!�: v�r\�K?b�M ��!�xè�0M�f�H�C3Ut�E_��g����Ȃ�V���U,���O�H��c/���8�7�P8��}�F�њق��J��\X��,o$���(�w�j\�r�Y*���l����Gw�uÂ�\�>��_ud`�Qʑo2��}�Zĵ_I-ⷡ`�-N��d�⟡���%㹒?�"�?}��B���r�f)ge�Gm��IbϴZ��R����V-�����+�:zA�)�]Q��9���5�=I�¼&�S��9�$�Jݛ���ƌ����T6:�4��d���,�)��8�J l�pq�d��X�΁
��J]��`��	���=Q}ӌn$�L$�y�5�
q���H��i���T�N�R��R��;��e������/����T��q��i�����A#���dO��@nR`o�O���d���yp��+`�FD�^�X�V����ma0���k�
=�b����2�� ���<�'#�U�����v�"�����v���)�޻68tn_d�٦{7@{�}��В�Q�΋�O�n��gZ���
��f�,[��I�Dr�⼗X�j�[	1���+��V�>-k�r	xL����e�Yd�!"�	
RF�JS�.�>P����݁mC���3�|�����;���.��EEf �x��o6�oY���z�h�k�҇HU����T�!Ce(�XS���hU�FU�{2&��v1Y�;{א�w�E��j�k��Va��;+�|���������sք�1��:���؋׼<�[���������Ï��׀X?��x2,��̯��!�:Rz����h�S�o�MqԈ`�W���`�O~�n�P�Oe���XGT��L]�$UI���p�2����wǜs��jM�;K����R��3L��B��s�ݕq�e(�@�O�HӝD`����~m�lI&+�PZc���<Bt��^��2�E���(O�Z��I)q�J��%�a��{R����g1��O��{-����~��x�+��K"Bm���� �1�W���a�<P�E�T��TF���?,�H
�K�tA�:�WU�@ROO�^�˗y��6�'S�^����~�F.�>E�⪪���6@"�k�@�9)�K	L\���,!Gvd���u��UJk��m��"Y�n�wY��[`��4.�H?�.g� l�j�I>)N\ڥ(����4oIHT��#+��+zy�C�!�f�Rd2/:^�5�#C�+ m��)�*?@��8�6�`>-���k��q	����=dW�#Z�}��!�s�H����y�ݙ�y(I��mM<�x�T �*�gU=�T��J+{C��;��-���J���0�zV��
����'��۴R(��GX��?��g��y]�"�Rs��,��q�6����x�uB	m�������?�@�{���5���#��E��_��z�騻���|���z{:|`(7�ڤ�Mg�Y�Z�1%�b ��|�Rz�[r�goޙ���G��3�l��X�������{��xo�S������\�-Y��ڣ��%J�B���nt�X��%m�#��_��*T� )�m��eE��"�9�]b}s�����.�h�_�U�-�|2{�,����sU�� "b��t߁��9�.�B�萔)*��t,��+���D)�q@��ĕ��'�я�d�~ٞP���ً�u�I+ٽP�ʍ~"ًn7r�5�C�r�$�"�5.:�:w�0�3@g.)���+TХ%�����BK1/�7��}���yV[����⾇����y��İ̠
z��=8Ү�l�֏k�[��%{����4�n�z�Ԥ��IT���N����0Q�y��3yu�ҥ+��W�N�4�l���鋓�S�39��=����js�;y9۾�l@�K���P붛���{~��5_�A�@��kԲ�|��+�4_�ΧA�/��%~b%i�Ãj���Ͷ`s�L4aʈv��C��P-m���H7Oh�?$��,�h�U��f�Ro�=-�U �+��6��fF�#��k�;�&I�l^��tsH�ߋ�e����\�l0��5Tz��Be5f��ѩ]6\p�S���qa9�8�`�O�ZQ����>G�MX+��m���j'q�i�Q��+*kN�T-oM����}�0��ۂ�� %�=Ԩ�}@��`����B�o+���:��J��L��"����RTPǣ�TƔ���H�����L�`�)��A}80OH�h� �%!^���d-�k�T���v�)Vv ^b��5hъ����n�#%|�걪4~����mm�h�6i�'����4zR�N/~I�Έ�cȤQ�_7�#2t�b��MTɥJ��,���|����BE����(�qPx�J�@!SI֕��~']C�0��cvDfP�n"l��ѯZ[C	�Az|�,�ʖ�U�U8i��מ�v��A�f�o����T�|i,v��$^��t�x5��n���w�[�k(~�����Hۋע@���䉟R{�z�Fj�Q��_��; 	  -�H��<�0xsu���W�B�"�����*sL�4���+��B�ݾj:W��"�5<�m��q8҆�F[MnJ�^���#��a\�C<� M��h[������W%�� /l�� ��(����f�`12�rPg[���њ��u�=B�J�j���Gt�(O���&n�t� !UW׷#�I�J�b���M�I��i�EE<�'n��ZYشò�dӎu I7��C5��BӍZ�iG�/��i���iG��wjM;��އ�+o�i�.w	i�4���=h�Q�5���C���۴_��������[n�A:�4�Ed�yP�ܶ�?I�������:�4�P��1��
���EF�7F'l�A���[[TE7M6��r\T�5�h����n�࢞������ɽ;v.� N��Ů�J�#�%�2`�ۆn�W��NfV��lc�8����d��Ϥ�En�DG
񄬀�����r4�T��*�f�#��YDI}�{L"i"Ǝ
�g�vr�܃��ї��;v���	^�M]����7� +H�a�`�15��S2�3x�$[��f���d�[��^_qZn����+��1�.������!�B�ǽ7�8���;�22��z��d�ow���A�-W��X��dMR��<��ֱ���r���'��jl8��_�Z#����=H�Q�i� �v��?a���U7 q�=h>r*�C��Є�K��B���=l#>���9/��m�۞Tʶ',�iGS)��f,��?"����0Od�U�_4C����v'jw�cO�T�V��5�}Q��qŏ+Q`��7Ni;�Va���]�/b�����3^�3�2d��-4R!�쵉����˽�l�����W��[�lfjn^�N^�f�+�lQ�9jtq谿�7�G�3|e�>�vЩa���u�A1sw�οN�\XZ0�43�|2;k�����s������Ź/�r,}q��%۬�������ٹ[��zߎ0{�����79~i����?���S�
f�Z�\�x�����ͥ�����8�������FV�͌X��ho�u�k8�3'�Q�sqԍAqԞb���\u�W���H��(p3���T|g=�p�����
nf��&���)��� ��{�>#MMFx�W5��0�]�`�b�5��DL�8o�t�Ǆ��i���Fo�<д��H�����+�I
Q!������)J������PKRE=�=!vY���pe�M��[����Y7:Mdw���ֈ�]ϖ��I�e�<�d�c�j�v�8S_I�!Xg���C���FO /�v�f�S	H��`ý_E�v�3�W�	�Z��#0���~�WI9��̗'8a9h��.y��>ґk�x�b�1�לZ] ^�+�ᩱ��@ 'X��prU^��}n(Ԣ�L֡{=)�#[>p] ��M�L����A�\Ls����~N1,@1�/*���=���|	F=T�֯F]O.��!ߋ��;�b�UY�F�(���;Ϩ@��o2�8�VV.9�!(L���v��M�i��Ư������d�'�Rd��C�uﬨ����f�1h��W��Su��Wek8�g��VM�c��8�̓V� /��Z�XD3 u�.������׎27�b45F;Ke�~�cT�.gܤ��E�k�娂^���+U�	�ɢQN7�e�<_H�q�C�# �+}���`�!7Rx�w0�F;�Y�p-&�X`� ��A0�i�p3\�A��w���.�R8O�0N�+?�����6NBP%5jx6t�Bӣd���t�Om�:�?�[���A����2����OA��	p;4^�5x���x��0��}��u�d@�t��yjx���&���o/���'�����G�Ҕؕ�i����ϾA��/�0�u�n�l�����PȦSO{��Q��(j��N`��8�2�h�`�Q���Ȟ�>���yCC�}��3$���-��.���?��8�᡾e��r��N�88��=�J��
�~��$X�د	��ɀ�y��0�*��!+�r�a���
�\0�G���G%���w*��o[ZM(��Ӡ���A{�Ė��;
�	j��$
tw@�
��Z_ h�92�I�E ��e�C��j��}��� E��"E���&��������ZtoD�'���`>�'©�&*t��G�J�e����&��4�UG�ɥ�V�e�3	�D�G�z���2]N�����@�(�pX�u7P���<ʷ�4oə=���9���1��<��թ�kWx�+ӓS�\�L~o�ɩ��������?z�p      2   %  x���MJ�@�םS�L��t҇�s7���jvB�Jpi\�2^��bW�J�g�T����^W�@8`��a��".����0��X�Fxf-a�F���L��ʄ���E.9i�=��vX]��dT:([:�}p�(�J�J�H�D�U��˺��\�Wo|TG-1m�[b ���̓��Y�iR�Э�e�Zտ�5Q��*��sh;3�1��n*�*�'#k�u3dymmu&v��m?�	�������I��y7#~F���FNp[���@R�3af ����:�YUEQ|O�n      :   F  x�uR1N�0��W�\��ɑ�[x��
�h�� Z#���h�W�)��
��f=�3��T1=35Lo��-S�t`�bM�|��G&��K���U���t���%=�;�����Tf�|c��n+g��H��\��ԙ���<:�:��h��@�C�Aͪ`[�]8}ޣ���!�H�H��n���QpjI��ʊ�n5��N��>���]��N�2 ��ݤ���ྟ�#����� ���0��z��yF�lf�ϮJˤ�,V�J���<�E�m|��>�^&�������#�$,�6�O'�+k���y��Dk�ESz�      .      x������ � �      ,   �   x�}�1j1�Z:�^���H���9��T�\�4IgF!�0)�+�*s�h��bm���x�/r�?V_LO��V�[LϦڒ�>͇����c�\$@L�L%�g�D�=7���`�mz��L3LB+G�Q���ҝ�����oVw�d� ��Z%��F���yx�u�4�~lr�x�Zb+�'G⥙��ҹ��k��0q\��Pv�����_��      &   �   x�3�.-H-RpL���Sp��KLS�K��L�L�p�%����eg����e�DV�;Z�dT��G�X�滗U�Ue�;�[�{�V�:�fg�%r:��z�q����Y(�[�X���������� y)�      $   �  x����jIE��_1�PFRIUR>"_x�J%�66$&���0�ݽ�j���{��
��;�Ɔ�9�i�%7��N}z�	�H�PFLK��3"��B��gv���w�~��B@܀��?fx�.��_o�Aeȸޞn/��_^��|���xN������Mս	�4N�f���u6���ԁ�ɔa�&9� �ꋇ������E
@���W/]&�WO� t�q��S\O�^n�O������^�D4ۈ9j
lM�m�p�pݗ�e�1�Dr�nP�8�wC=�eL���G����'e�WQ>�|�ahĬחo����7s-�*G�;d�᫱NH�Kg�H����Cu��3��s҆sVaͥ9��"P?wUt�_�R�^���˷�`���0�B0:`#o,uZ�z=J����E�2W�)7s�B��
e��%���ңL�)��Z�q8��}�u�7���5o�!��&�w���� jeooܭ�1��ps?[J⾜��R�U��XB����[��(��P�b���!L�J]��UX�̿c�4������0��cQ*E�J�5�s��Jod,�8	/J�`w��U�<�Z��q��s���,z��؁cM�BKkM�]�+i��P5��p�����c U�9�@�>><<��6U�     