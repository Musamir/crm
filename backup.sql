PGDMP     (    *                y            commodity business    12.3    12.3 �    \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            _           1262    41520    commodity business    DATABASE     �   CREATE DATABASE "commodity business" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
 $   DROP DATABASE "commodity business";
                postgres    false            �            1259    42361    accounts    TABLE     �   CREATE TABLE public.accounts (
    id integer NOT NULL,
    business_owner_id integer NOT NULL,
    balance integer NOT NULL,
    currency integer NOT NULL,
    last_update date NOT NULL
);
    DROP TABLE public.accounts;
       public         heap    postgres    false            �            1259    42359    accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public          postgres    false    247            `           0    0    accounts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
          public          postgres    false    246            �            1259    42121    batch_of_products    TABLE     m  CREATE TABLE public.batch_of_products (
    id integer NOT NULL,
    product integer NOT NULL,
    purchase_date date NOT NULL,
    amount integer NOT NULL,
    remaining_amount integer NOT NULL,
    prime_cost integer NOT NULL,
    sale_price integer NOT NULL,
    status integer NOT NULL,
    cost_currency integer NOT NULL,
    sale_currency integer NOT NULL
);
 %   DROP TABLE public.batch_of_products;
       public         heap    postgres    false            �            1259    42119    batch_of_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.batch_of_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.batch_of_products_id_seq;
       public          postgres    false    227            a           0    0    batch_of_products_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.batch_of_products_id_seq OWNED BY public.batch_of_products.id;
          public          postgres    false    226            �            1259    42111    batch_status    TABLE     g   CREATE TABLE public.batch_status (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);
     DROP TABLE public.batch_status;
       public         heap    postgres    false            �            1259    42109    batch_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.batch_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.batch_status_id_seq;
       public          postgres    false    225            b           0    0    batch_status_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.batch_status_id_seq OWNED BY public.batch_status.id;
          public          postgres    false    224            �            1259    41995    business    TABLE     �   CREATE TABLE public.business (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500),
    start_date date,
    status integer
);
    DROP TABLE public.business;
       public         heap    postgres    false            �            1259    42343    business_accounts    TABLE     �   CREATE TABLE public.business_accounts (
    id integer NOT NULL,
    business_id integer NOT NULL,
    balance integer NOT NULL,
    currency integer NOT NULL,
    last_update date
);
 %   DROP TABLE public.business_accounts;
       public         heap    postgres    false            �            1259    42341    business_accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.business_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.business_accounts_id_seq;
       public          postgres    false    245            c           0    0    business_accounts_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.business_accounts_id_seq OWNED BY public.business_accounts.id;
          public          postgres    false    244            �            1259    41993    business_id_seq    SEQUENCE     �   CREATE SEQUENCE public.business_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.business_id_seq;
       public          postgres    false    211            d           0    0    business_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.business_id_seq OWNED BY public.business.id;
          public          postgres    false    210            �            1259    42328    business_owner_type    TABLE     n   CREATE TABLE public.business_owner_type (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);
 '   DROP TABLE public.business_owner_type;
       public         heap    postgres    false            �            1259    42326    business_owner_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.business_owner_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.business_owner_type_id_seq;
       public          postgres    false    243            e           0    0    business_owner_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.business_owner_type_id_seq OWNED BY public.business_owner_type.id;
          public          postgres    false    242            �            1259    41982    business_owners    TABLE     w   CREATE TABLE public.business_owners (
    id integer NOT NULL,
    user_id integer,
    owner_type integer NOT NULL
);
 #   DROP TABLE public.business_owners;
       public         heap    postgres    false            �            1259    41980    business_owners_id_seq    SEQUENCE     �   CREATE SEQUENCE public.business_owners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.business_owners_id_seq;
       public          postgres    false    209            f           0    0    business_owners_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.business_owners_id_seq OWNED BY public.business_owners.id;
          public          postgres    false    208            �            1259    42379    business_status    TABLE     k   CREATE TABLE public.business_status (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
 #   DROP TABLE public.business_status;
       public         heap    postgres    false            �            1259    42377    business_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.business_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.business_status_id_seq;
       public          postgres    false    249            g           0    0    business_status_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.business_status_id_seq OWNED BY public.business_status.id;
          public          postgres    false    248            �            1259    42101    consumer    TABLE     *  CREATE TABLE public.consumer (
    id integer NOT NULL,
    fullname character varying(20),
    phone character varying(15) NOT NULL,
    address character varying(30) NOT NULL,
    address_on_map character varying(30),
    contacts character varying(50),
    description character varying(200)
);
    DROP TABLE public.consumer;
       public         heap    postgres    false            �            1259    42099    consumer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.consumer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.consumer_id_seq;
       public          postgres    false    223            h           0    0    consumer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.consumer_id_seq OWNED BY public.consumer.id;
          public          postgres    false    222            �            1259    42318    currency    TABLE     c   CREATE TABLE public.currency (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public.currency;
       public         heap    postgres    false            �            1259    42316    currency_id_seq    SEQUENCE     �   CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.currency_id_seq;
       public          postgres    false    241            i           0    0    currency_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;
          public          postgres    false    240            �            1259    42158 
   deliveries    TABLE     �   CREATE TABLE public.deliveries (
    id integer NOT NULL,
    address character varying(30) NOT NULL,
    description character varying(300),
    deliveryman integer NOT NULL,
    transaction_id integer NOT NULL,
    status integer
);
    DROP TABLE public.deliveries;
       public         heap    postgres    false            �            1259    42156    deliveries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.deliveries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.deliveries_id_seq;
       public          postgres    false    231            j           0    0    deliveries_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;
          public          postgres    false    230            �            1259    42416    deliveries_status    TABLE     l   CREATE TABLE public.deliveries_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
 %   DROP TABLE public.deliveries_status;
       public         heap    postgres    false            �            1259    42414    deliveries_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.deliveries_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.deliveries_status_id_seq;
       public          postgres    false    251            k           0    0    deliveries_status_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.deliveries_status_id_seq OWNED BY public.deliveries_status.id;
          public          postgres    false    250            �            1259    42196 
   owner_list    TABLE     |   CREATE TABLE public.owner_list (
    id integer NOT NULL,
    user_id integer NOT NULL,
    business_id integer NOT NULL
);
    DROP TABLE public.owner_list;
       public         heap    postgres    false            �            1259    42194    owner_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.owner_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.owner_list_id_seq;
       public          postgres    false    233            l           0    0    owner_list_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.owner_list_id_seq OWNED BY public.owner_list.id;
          public          postgres    false    232            �            1259    42296    product_belonging    TABLE     �   CREATE TABLE public.product_belonging (
    id integer NOT NULL,
    product_id integer NOT NULL,
    subsection_id integer NOT NULL
);
 %   DROP TABLE public.product_belonging;
       public         heap    postgres    false            �            1259    42294    product_belonging_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_belonging_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.product_belonging_id_seq;
       public          postgres    false    239            m           0    0    product_belonging_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.product_belonging_id_seq OWNED BY public.product_belonging.id;
          public          postgres    false    238            �            1259    42021    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200)
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    42019    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    213            n           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    212            �            1259    42046    provider    TABLE     h   CREATE TABLE public.provider (
    id integer NOT NULL,
    information integer,
    product integer
);
    DROP TABLE public.provider;
       public         heap    postgres    false            �            1259    42036    provider_contacts    TABLE     #  CREATE TABLE public.provider_contacts (
    id integer NOT NULL,
    fullname character varying(30),
    phone character varying(15),
    contacts character varying(30),
    address character varying(100),
    description character varying(300),
    address_on_map character varying(100)
);
 %   DROP TABLE public.provider_contacts;
       public         heap    postgres    false            �            1259    42034    provider_contacts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.provider_contacts_id_seq;
       public          postgres    false    215            o           0    0    provider_contacts_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.provider_contacts_id_seq OWNED BY public.provider_contacts.id;
          public          postgres    false    214            �            1259    42044    provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.provider_id_seq;
       public          postgres    false    217            p           0    0    provider_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.provider_id_seq OWNED BY public.provider.id;
          public          postgres    false    216            �            1259    42066    providers_price    TABLE     �   CREATE TABLE public.providers_price (
    id integer NOT NULL,
    provider integer,
    amount integer,
    price integer,
    currency integer NOT NULL
);
 #   DROP TABLE public.providers_price;
       public         heap    postgres    false            �            1259    42064    providers_price_id_seq    SEQUENCE     �   CREATE SEQUENCE public.providers_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.providers_price_id_seq;
       public          postgres    false    219            q           0    0    providers_price_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.providers_price_id_seq OWNED BY public.providers_price.id;
          public          postgres    false    218            �            1259    42221    sections    TABLE     c   CREATE TABLE public.sections (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.sections;
       public         heap    postgres    false            �            1259    42219    sections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sections_id_seq;
       public          postgres    false    235            r           0    0    sections_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;
          public          postgres    false    234            �            1259    41957    sex    TABLE     ^   CREATE TABLE public.sex (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public.sex;
       public         heap    postgres    false            �            1259    41955 
   sex_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.sex_id_seq;
       public          postgres    false    206            s           0    0 
   sex_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.sex_id_seq OWNED BY public.sex.id;
          public          postgres    false    205            �            1259    42281    subsections    TABLE     �   CREATE TABLE public.subsections (
    id integer NOT NULL,
    section_id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.subsections;
       public         heap    postgres    false            �            1259    42279    subsections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subsections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.subsections_id_seq;
       public          postgres    false    237            t           0    0    subsections_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.subsections_id_seq OWNED BY public.subsections.id;
          public          postgres    false    236            �            1259    42091    transaction_status    TABLE     m   CREATE TABLE public.transaction_status (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);
 &   DROP TABLE public.transaction_status;
       public         heap    postgres    false            �            1259    42089    transaction_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.transaction_status_id_seq;
       public          postgres    false    221            u           0    0    transaction_status_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.transaction_status_id_seq OWNED BY public.transaction_status.id;
          public          postgres    false    220            �            1259    42426    transaction_type    TABLE     k   CREATE TABLE public.transaction_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
 $   DROP TABLE public.transaction_type;
       public         heap    postgres    false            �            1259    42424    transaction_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transaction_type_id_seq;
       public          postgres    false    253            v           0    0    transaction_type_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.transaction_type_id_seq OWNED BY public.transaction_type.id;
          public          postgres    false    252            �            1259    42135    transactions    TABLE     *  CREATE TABLE public.transactions (
    id integer NOT NULL,
    t_date date NOT NULL,
    batch integer NOT NULL,
    amount integer NOT NULL,
    consumer integer NOT NULL,
    status integer NOT NULL,
    last_update date,
    price integer,
    currency integer,
    transaction_type integer
);
     DROP TABLE public.transactions;
       public         heap    postgres    false            �            1259    42133    transactions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.transactions_id_seq;
       public          postgres    false    229            w           0    0    transactions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;
          public          postgres    false    228            �            1259    41947    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    pass character varying(100) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    41551    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false            �            1259    41945    users_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users_id_seq1;
       public          postgres    false    204            x           0    0    users_id_seq1    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.users_id_seq1 OWNED BY public.users.id;
          public          postgres    false    203            �            1259    41965 
   users_info    TABLE     �   CREATE TABLE public.users_info (
    id integer NOT NULL,
    fullname character varying(30),
    sex integer,
    date_of_birth date,
    profile_photo character varying(50)
);
    DROP TABLE public.users_info;
       public         heap    postgres    false            ,           2604    42364    accounts id    DEFAULT     j   ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            "           2604    42124    batch_of_products id    DEFAULT     |   ALTER TABLE ONLY public.batch_of_products ALTER COLUMN id SET DEFAULT nextval('public.batch_of_products_id_seq'::regclass);
 C   ALTER TABLE public.batch_of_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            !           2604    42114    batch_status id    DEFAULT     r   ALTER TABLE ONLY public.batch_status ALTER COLUMN id SET DEFAULT nextval('public.batch_status_id_seq'::regclass);
 >   ALTER TABLE public.batch_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225                       2604    41998    business id    DEFAULT     j   ALTER TABLE ONLY public.business ALTER COLUMN id SET DEFAULT nextval('public.business_id_seq'::regclass);
 :   ALTER TABLE public.business ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            +           2604    42346    business_accounts id    DEFAULT     |   ALTER TABLE ONLY public.business_accounts ALTER COLUMN id SET DEFAULT nextval('public.business_accounts_id_seq'::regclass);
 C   ALTER TABLE public.business_accounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            *           2604    42331    business_owner_type id    DEFAULT     �   ALTER TABLE ONLY public.business_owner_type ALTER COLUMN id SET DEFAULT nextval('public.business_owner_type_id_seq'::regclass);
 E   ALTER TABLE public.business_owner_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243                       2604    41985    business_owners id    DEFAULT     x   ALTER TABLE ONLY public.business_owners ALTER COLUMN id SET DEFAULT nextval('public.business_owners_id_seq'::regclass);
 A   ALTER TABLE public.business_owners ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            -           2604    42382    business_status id    DEFAULT     x   ALTER TABLE ONLY public.business_status ALTER COLUMN id SET DEFAULT nextval('public.business_status_id_seq'::regclass);
 A   ALTER TABLE public.business_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    249    249                        2604    42104    consumer id    DEFAULT     j   ALTER TABLE ONLY public.consumer ALTER COLUMN id SET DEFAULT nextval('public.consumer_id_seq'::regclass);
 :   ALTER TABLE public.consumer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            )           2604    42321    currency id    DEFAULT     j   ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);
 :   ALTER TABLE public.currency ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            $           2604    42161    deliveries id    DEFAULT     n   ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);
 <   ALTER TABLE public.deliveries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            .           2604    42419    deliveries_status id    DEFAULT     |   ALTER TABLE ONLY public.deliveries_status ALTER COLUMN id SET DEFAULT nextval('public.deliveries_status_id_seq'::regclass);
 C   ALTER TABLE public.deliveries_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250    251            %           2604    42199    owner_list id    DEFAULT     n   ALTER TABLE ONLY public.owner_list ALTER COLUMN id SET DEFAULT nextval('public.owner_list_id_seq'::regclass);
 <   ALTER TABLE public.owner_list ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            (           2604    42299    product_belonging id    DEFAULT     |   ALTER TABLE ONLY public.product_belonging ALTER COLUMN id SET DEFAULT nextval('public.product_belonging_id_seq'::regclass);
 C   ALTER TABLE public.product_belonging ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239                       2604    42024    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213                       2604    42049    provider id    DEFAULT     j   ALTER TABLE ONLY public.provider ALTER COLUMN id SET DEFAULT nextval('public.provider_id_seq'::regclass);
 :   ALTER TABLE public.provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                       2604    42039    provider_contacts id    DEFAULT     |   ALTER TABLE ONLY public.provider_contacts ALTER COLUMN id SET DEFAULT nextval('public.provider_contacts_id_seq'::regclass);
 C   ALTER TABLE public.provider_contacts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                       2604    42069    providers_price id    DEFAULT     x   ALTER TABLE ONLY public.providers_price ALTER COLUMN id SET DEFAULT nextval('public.providers_price_id_seq'::regclass);
 A   ALTER TABLE public.providers_price ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            &           2604    42224    sections id    DEFAULT     j   ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);
 :   ALTER TABLE public.sections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235                       2604    41960    sex id    DEFAULT     `   ALTER TABLE ONLY public.sex ALTER COLUMN id SET DEFAULT nextval('public.sex_id_seq'::regclass);
 5   ALTER TABLE public.sex ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            '           2604    42284    subsections id    DEFAULT     p   ALTER TABLE ONLY public.subsections ALTER COLUMN id SET DEFAULT nextval('public.subsections_id_seq'::regclass);
 =   ALTER TABLE public.subsections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237                       2604    42094    transaction_status id    DEFAULT     ~   ALTER TABLE ONLY public.transaction_status ALTER COLUMN id SET DEFAULT nextval('public.transaction_status_id_seq'::regclass);
 D   ALTER TABLE public.transaction_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            /           2604    42429    transaction_type id    DEFAULT     z   ALTER TABLE ONLY public.transaction_type ALTER COLUMN id SET DEFAULT nextval('public.transaction_type_id_seq'::regclass);
 B   ALTER TABLE public.transaction_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            #           2604    42138    transactions id    DEFAULT     r   ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);
 >   ALTER TABLE public.transactions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229                       2604    41950    users id    DEFAULT     e   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq1'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            S          0    42361    accounts 
   TABLE DATA           Y   COPY public.accounts (id, business_owner_id, balance, currency, last_update) FROM stdin;
    public          postgres    false    247   @      ?          0    42121    batch_of_products 
   TABLE DATA           �   COPY public.batch_of_products (id, product, purchase_date, amount, remaining_amount, prime_cost, sale_price, status, cost_currency, sale_currency) FROM stdin;
    public          postgres    false    227   |      =          0    42111    batch_status 
   TABLE DATA           0   COPY public.batch_status (id, name) FROM stdin;
    public          postgres    false    225   �      /          0    41995    business 
   TABLE DATA           M   COPY public.business (id, name, description, start_date, status) FROM stdin;
    public          postgres    false    211         Q          0    42343    business_accounts 
   TABLE DATA           \   COPY public.business_accounts (id, business_id, balance, currency, last_update) FROM stdin;
    public          postgres    false    245   S      O          0    42328    business_owner_type 
   TABLE DATA           7   COPY public.business_owner_type (id, name) FROM stdin;
    public          postgres    false    243   �      -          0    41982    business_owners 
   TABLE DATA           B   COPY public.business_owners (id, user_id, owner_type) FROM stdin;
    public          postgres    false    209   �      U          0    42379    business_status 
   TABLE DATA           3   COPY public.business_status (id, name) FROM stdin;
    public          postgres    false    249   �      ;          0    42101    consumer 
   TABLE DATA           g   COPY public.consumer (id, fullname, phone, address, address_on_map, contacts, description) FROM stdin;
    public          postgres    false    223         M          0    42318    currency 
   TABLE DATA           ,   COPY public.currency (id, name) FROM stdin;
    public          postgres    false    241   q      C          0    42158 
   deliveries 
   TABLE DATA           c   COPY public.deliveries (id, address, description, deliveryman, transaction_id, status) FROM stdin;
    public          postgres    false    231   �      W          0    42416    deliveries_status 
   TABLE DATA           5   COPY public.deliveries_status (id, name) FROM stdin;
    public          postgres    false    251   �      E          0    42196 
   owner_list 
   TABLE DATA           >   COPY public.owner_list (id, user_id, business_id) FROM stdin;
    public          postgres    false    233   �      K          0    42296    product_belonging 
   TABLE DATA           J   COPY public.product_belonging (id, product_id, subsection_id) FROM stdin;
    public          postgres    false    239         1          0    42021    products 
   TABLE DATA           9   COPY public.products (id, name, description) FROM stdin;
    public          postgres    false    213   O      5          0    42046    provider 
   TABLE DATA           <   COPY public.provider (id, information, product) FROM stdin;
    public          postgres    false    217   �      3          0    42036    provider_contacts 
   TABLE DATA           p   COPY public.provider_contacts (id, fullname, phone, contacts, address, description, address_on_map) FROM stdin;
    public          postgres    false    215   �      7          0    42066    providers_price 
   TABLE DATA           P   COPY public.providers_price (id, provider, amount, price, currency) FROM stdin;
    public          postgres    false    219   �      G          0    42221    sections 
   TABLE DATA           ,   COPY public.sections (id, name) FROM stdin;
    public          postgres    false    235   �      *          0    41957    sex 
   TABLE DATA           '   COPY public.sex (id, name) FROM stdin;
    public          postgres    false    206   G      I          0    42281    subsections 
   TABLE DATA           ;   COPY public.subsections (id, section_id, name) FROM stdin;
    public          postgres    false    237   q      9          0    42091    transaction_status 
   TABLE DATA           6   COPY public.transaction_status (id, name) FROM stdin;
    public          postgres    false    221   �      Y          0    42426    transaction_type 
   TABLE DATA           4   COPY public.transaction_type (id, name) FROM stdin;
    public          postgres    false    253   �      A          0    42135    transactions 
   TABLE DATA           �   COPY public.transactions (id, t_date, batch, amount, consumer, status, last_update, price, currency, transaction_type) FROM stdin;
    public          postgres    false    229         (          0    41947    users 
   TABLE DATA           0   COPY public.users (id, login, pass) FROM stdin;
    public          postgres    false    204   �      +          0    41965 
   users_info 
   TABLE DATA           U   COPY public.users_info (id, fullname, sex, date_of_birth, profile_photo) FROM stdin;
    public          postgres    false    207   L       y           0    0    accounts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.accounts_id_seq', 2, true);
          public          postgres    false    246            z           0    0    batch_of_products_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.batch_of_products_id_seq', 1, true);
          public          postgres    false    226            {           0    0    batch_status_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.batch_status_id_seq', 3, true);
          public          postgres    false    224            |           0    0    business_accounts_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.business_accounts_id_seq', 2, true);
          public          postgres    false    244            }           0    0    business_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.business_id_seq', 2, true);
          public          postgres    false    210            ~           0    0    business_owner_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.business_owner_type_id_seq', 2, true);
          public          postgres    false    242                       0    0    business_owners_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.business_owners_id_seq', 2, true);
          public          postgres    false    208            �           0    0    business_status_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.business_status_id_seq', 2, true);
          public          postgres    false    248            �           0    0    consumer_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.consumer_id_seq', 11, true);
          public          postgres    false    222            �           0    0    currency_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.currency_id_seq', 2, true);
          public          postgres    false    240            �           0    0    deliveries_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.deliveries_id_seq', 12, true);
          public          postgres    false    230            �           0    0    deliveries_status_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.deliveries_status_id_seq', 3, true);
          public          postgres    false    250            �           0    0    owner_list_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.owner_list_id_seq', 3, true);
          public          postgres    false    232            �           0    0    product_belonging_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.product_belonging_id_seq', 4, true);
          public          postgres    false    238            �           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 2, true);
          public          postgres    false    212            �           0    0    provider_contacts_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.provider_contacts_id_seq', 2, true);
          public          postgres    false    214            �           0    0    provider_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.provider_id_seq', 1, true);
          public          postgres    false    216            �           0    0    providers_price_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.providers_price_id_seq', 5, true);
          public          postgres    false    218            �           0    0    sections_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sections_id_seq', 11, true);
          public          postgres    false    234            �           0    0 
   sex_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.sex_id_seq', 2, true);
          public          postgres    false    205            �           0    0    subsections_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.subsections_id_seq', 25, true);
          public          postgres    false    236            �           0    0    transaction_status_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.transaction_status_id_seq', 3, true);
          public          postgres    false    220            �           0    0    transaction_type_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.transaction_type_id_seq', 2, true);
          public          postgres    false    252            �           0    0    transactions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transactions_id_seq', 12, true);
          public          postgres    false    228            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    202            �           0    0    users_id_seq1    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq1', 4, true);
          public          postgres    false    203                       2606    42366    accounts accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            postgres    false    247            _           2606    42126 (   batch_of_products batch_of_products_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.batch_of_products
    ADD CONSTRAINT batch_of_products_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.batch_of_products DROP CONSTRAINT batch_of_products_pkey;
       public            postgres    false    227            [           2606    42118 "   batch_status batch_status_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.batch_status
    ADD CONSTRAINT batch_status_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.batch_status DROP CONSTRAINT batch_status_name_key;
       public            postgres    false    225            ]           2606    42116    batch_status batch_status_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.batch_status
    ADD CONSTRAINT batch_status_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.batch_status DROP CONSTRAINT batch_status_pkey;
       public            postgres    false    225            }           2606    42348 (   business_accounts business_accounts_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.business_accounts
    ADD CONSTRAINT business_accounts_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.business_accounts DROP CONSTRAINT business_accounts_pkey;
       public            postgres    false    245            =           2606    42005    business business_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.business DROP CONSTRAINT business_name_key;
       public            postgres    false    211            y           2606    42335 0   business_owner_type business_owner_type_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.business_owner_type
    ADD CONSTRAINT business_owner_type_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.business_owner_type DROP CONSTRAINT business_owner_type_name_key;
       public            postgres    false    243            {           2606    42333 ,   business_owner_type business_owner_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.business_owner_type
    ADD CONSTRAINT business_owner_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.business_owner_type DROP CONSTRAINT business_owner_type_pkey;
       public            postgres    false    243            ;           2606    41987 $   business_owners business_owners_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.business_owners
    ADD CONSTRAINT business_owners_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.business_owners DROP CONSTRAINT business_owners_pkey;
       public            postgres    false    209            ?           2606    42003    business business_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pkey;
       public            postgres    false    211            �           2606    42386 (   business_status business_status_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.business_status
    ADD CONSTRAINT business_status_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.business_status DROP CONSTRAINT business_status_name_key;
       public            postgres    false    249            �           2606    42384 $   business_status business_status_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.business_status
    ADD CONSTRAINT business_status_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.business_status DROP CONSTRAINT business_status_pkey;
       public            postgres    false    249            W           2606    42108    consumer consumer_phone_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_phone_key UNIQUE (phone);
 E   ALTER TABLE ONLY public.consumer DROP CONSTRAINT consumer_phone_key;
       public            postgres    false    223            Y           2606    42106    consumer consumer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.consumer DROP CONSTRAINT consumer_pkey;
       public            postgres    false    223            u           2606    42325    currency currency_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.currency DROP CONSTRAINT currency_name_key;
       public            postgres    false    241            w           2606    42323    currency currency_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.currency DROP CONSTRAINT currency_pkey;
       public            postgres    false    241            c           2606    42163    deliveries deliveries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.deliveries DROP CONSTRAINT deliveries_pkey;
       public            postgres    false    231            �           2606    42423 ,   deliveries_status deliveries_status_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.deliveries_status
    ADD CONSTRAINT deliveries_status_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.deliveries_status DROP CONSTRAINT deliveries_status_name_key;
       public            postgres    false    251            �           2606    42421 (   deliveries_status deliveries_status_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.deliveries_status
    ADD CONSTRAINT deliveries_status_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.deliveries_status DROP CONSTRAINT deliveries_status_pkey;
       public            postgres    false    251            e           2606    42201    owner_list owner_list_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.owner_list
    ADD CONSTRAINT owner_list_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.owner_list DROP CONSTRAINT owner_list_pkey;
       public            postgres    false    233            g           2606    42203 -   owner_list owner_list_user_id_business_id_key 
   CONSTRAINT     x   ALTER TABLE ONLY public.owner_list
    ADD CONSTRAINT owner_list_user_id_business_id_key UNIQUE (user_id, business_id);
 W   ALTER TABLE ONLY public.owner_list DROP CONSTRAINT owner_list_user_id_business_id_key;
       public            postgres    false    233    233            q           2606    42301 (   product_belonging product_belonging_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.product_belonging
    ADD CONSTRAINT product_belonging_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.product_belonging DROP CONSTRAINT product_belonging_pkey;
       public            postgres    false    239            s           2606    42303 @   product_belonging product_belonging_product_id_subsection_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.product_belonging
    ADD CONSTRAINT product_belonging_product_id_subsection_id_key UNIQUE (product_id, subsection_id);
 j   ALTER TABLE ONLY public.product_belonging DROP CONSTRAINT product_belonging_product_id_subsection_id_key;
       public            postgres    false    239    239            A           2606    42315 !   products products_description_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_description_key UNIQUE (description);
 K   ALTER TABLE ONLY public.products DROP CONSTRAINT products_description_key;
       public            postgres    false    213            C           2606    42028    products products_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_name_key;
       public            postgres    false    213            E           2606    42026    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    213            G           2606    42043 G   provider_contacts provider_contacts_fullname_phone_contacts_address_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.provider_contacts
    ADD CONSTRAINT provider_contacts_fullname_phone_contacts_address_key UNIQUE (fullname, phone, contacts, address);
 q   ALTER TABLE ONLY public.provider_contacts DROP CONSTRAINT provider_contacts_fullname_phone_contacts_address_key;
       public            postgres    false    215    215    215    215            I           2606    42041 (   provider_contacts provider_contacts_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.provider_contacts
    ADD CONSTRAINT provider_contacts_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.provider_contacts DROP CONSTRAINT provider_contacts_pkey;
       public            postgres    false    215            K           2606    42053 )   provider provider_information_product_key 
   CONSTRAINT     t   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_information_product_key UNIQUE (information, product);
 S   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_information_product_key;
       public            postgres    false    217    217            M           2606    42051    provider provider_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_pkey;
       public            postgres    false    217            O           2606    42071 $   providers_price providers_price_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.providers_price
    ADD CONSTRAINT providers_price_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.providers_price DROP CONSTRAINT providers_price_pkey;
       public            postgres    false    219            Q           2606    42398 B   providers_price providers_price_provider_amount_price_currency_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.providers_price
    ADD CONSTRAINT providers_price_provider_amount_price_currency_key UNIQUE (provider, amount, price, currency);
 l   ALTER TABLE ONLY public.providers_price DROP CONSTRAINT providers_price_provider_amount_price_currency_key;
       public            postgres    false    219    219    219    219            i           2606    42228    sections sections_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_name_key;
       public            postgres    false    235            k           2606    42226    sections sections_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    235            5           2606    41964    sex sex_name_key 
   CONSTRAINT     K   ALTER TABLE ONLY public.sex
    ADD CONSTRAINT sex_name_key UNIQUE (name);
 :   ALTER TABLE ONLY public.sex DROP CONSTRAINT sex_name_key;
       public            postgres    false    206            7           2606    41962    sex sex_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.sex
    ADD CONSTRAINT sex_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.sex DROP CONSTRAINT sex_pkey;
       public            postgres    false    206            m           2606    42286    subsections subsections_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subsections
    ADD CONSTRAINT subsections_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subsections DROP CONSTRAINT subsections_pkey;
       public            postgres    false    237            o           2606    42288 +   subsections subsections_section_id_name_key 
   CONSTRAINT     r   ALTER TABLE ONLY public.subsections
    ADD CONSTRAINT subsections_section_id_name_key UNIQUE (section_id, name);
 U   ALTER TABLE ONLY public.subsections DROP CONSTRAINT subsections_section_id_name_key;
       public            postgres    false    237    237            S           2606    42098 .   transaction_status transaction_status_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.transaction_status
    ADD CONSTRAINT transaction_status_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.transaction_status DROP CONSTRAINT transaction_status_name_key;
       public            postgres    false    221            U           2606    42096 *   transaction_status transaction_status_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.transaction_status
    ADD CONSTRAINT transaction_status_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.transaction_status DROP CONSTRAINT transaction_status_pkey;
       public            postgres    false    221            �           2606    42433 *   transaction_type transaction_type_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.transaction_type
    ADD CONSTRAINT transaction_type_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.transaction_type DROP CONSTRAINT transaction_type_name_key;
       public            postgres    false    253            �           2606    42431 &   transaction_type transaction_type_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.transaction_type
    ADD CONSTRAINT transaction_type_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transaction_type DROP CONSTRAINT transaction_type_pkey;
       public            postgres    false    253            a           2606    42140    transactions transactions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public            postgres    false    229            9           2606    41969    users_info users_info_id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_id_key UNIQUE (id);
 F   ALTER TABLE ONLY public.users_info DROP CONSTRAINT users_info_id_key;
       public            postgres    false    207            1           2606    41954    users users_login_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_login_key;
       public            postgres    false    204            3           2606    41952    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204            �           2606    42372 (   accounts accounts_business_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_business_owner_id_fkey FOREIGN KEY (business_owner_id) REFERENCES public.business_owners(id);
 R   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_business_owner_id_fkey;
       public          postgres    false    2875    209    247            �           2606    42367    accounts accounts_currency_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_currency_fkey FOREIGN KEY (currency) REFERENCES public.currency(id);
 I   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_currency_fkey;
       public          postgres    false    247    2935    241            �           2606    42127 /   batch_of_products batch_of_products_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batch_of_products
    ADD CONSTRAINT batch_of_products_status_fkey FOREIGN KEY (status) REFERENCES public.batch_status(id);
 Y   ALTER TABLE ONLY public.batch_of_products DROP CONSTRAINT batch_of_products_status_fkey;
       public          postgres    false    2909    225    227            �           2606    42354 4   business_accounts business_accounts_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business_accounts
    ADD CONSTRAINT business_accounts_business_id_fkey FOREIGN KEY (business_id) REFERENCES public.business(id);
 ^   ALTER TABLE ONLY public.business_accounts DROP CONSTRAINT business_accounts_business_id_fkey;
       public          postgres    false    245    211    2879            �           2606    42349 1   business_accounts business_accounts_currency_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business_accounts
    ADD CONSTRAINT business_accounts_currency_fkey FOREIGN KEY (currency) REFERENCES public.currency(id);
 [   ALTER TABLE ONLY public.business_accounts DROP CONSTRAINT business_accounts_currency_fkey;
       public          postgres    false    2935    241    245            �           2606    41988 ,   business_owners business_owners_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business_owners
    ADD CONSTRAINT business_owners_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.business_owners DROP CONSTRAINT business_owners_user_id_fkey;
       public          postgres    false    2867    204    209            �           2606    42164 &   deliveries deliveries_deliveryman_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_deliveryman_fkey FOREIGN KEY (deliveryman) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.deliveries DROP CONSTRAINT deliveries_deliveryman_fkey;
       public          postgres    false    204    2867    231            �           2606    42169 )   deliveries deliveries_transaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transactions(id);
 S   ALTER TABLE ONLY public.deliveries DROP CONSTRAINT deliveries_transaction_id_fkey;
       public          postgres    false    231    229    2913            �           2606    42399 /   batch_of_products fk_batch_of_products_currency    FK CONSTRAINT     �   ALTER TABLE ONLY public.batch_of_products
    ADD CONSTRAINT fk_batch_of_products_currency FOREIGN KEY (cost_currency) REFERENCES public.currency(id);
 Y   ALTER TABLE ONLY public.batch_of_products DROP CONSTRAINT fk_batch_of_products_currency;
       public          postgres    false    227    241    2935            �           2606    42404 4   batch_of_products fk_batch_of_products_sale_currency    FK CONSTRAINT     �   ALTER TABLE ONLY public.batch_of_products
    ADD CONSTRAINT fk_batch_of_products_sale_currency FOREIGN KEY (sale_currency) REFERENCES public.currency(id);
 ^   ALTER TABLE ONLY public.batch_of_products DROP CONSTRAINT fk_batch_of_products_sale_currency;
       public          postgres    false    241    227    2935            �           2606    42387 $   business fk_business_business_status    FK CONSTRAINT     �   ALTER TABLE ONLY public.business
    ADD CONSTRAINT fk_business_business_status FOREIGN KEY (status) REFERENCES public.business_status(id);
 N   ALTER TABLE ONLY public.business DROP CONSTRAINT fk_business_business_status;
       public          postgres    false    2947    211    249            �           2606    42336 6   business_owners fk_business_owners_business_owner_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.business_owners
    ADD CONSTRAINT fk_business_owners_business_owner_type FOREIGN KEY (owner_type) REFERENCES public.business_owner_type(id);
 `   ALTER TABLE ONLY public.business_owners DROP CONSTRAINT fk_business_owners_business_owner_type;
       public          postgres    false    243    209    2939            �           2606    42392 +   providers_price fk_providers_price_currency    FK CONSTRAINT     �   ALTER TABLE ONLY public.providers_price
    ADD CONSTRAINT fk_providers_price_currency FOREIGN KEY (currency) REFERENCES public.currency(id);
 U   ALTER TABLE ONLY public.providers_price DROP CONSTRAINT fk_providers_price_currency;
       public          postgres    false    219    2935    241            �           2606    42409 %   transactions fk_transactions_currency    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transactions_currency FOREIGN KEY (currency) REFERENCES public.currency(id);
 O   ALTER TABLE ONLY public.transactions DROP CONSTRAINT fk_transactions_currency;
       public          postgres    false    2935    241    229            �           2606    42434 -   transactions fk_transactions_transaction_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transactions_transaction_type FOREIGN KEY (transaction_type) REFERENCES public.transaction_type(id);
 W   ALTER TABLE ONLY public.transactions DROP CONSTRAINT fk_transactions_transaction_type;
       public          postgres    false    2955    253    229            �           2606    42209 &   owner_list owner_list_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.owner_list
    ADD CONSTRAINT owner_list_business_id_fkey FOREIGN KEY (business_id) REFERENCES public.business(id);
 P   ALTER TABLE ONLY public.owner_list DROP CONSTRAINT owner_list_business_id_fkey;
       public          postgres    false    211    233    2879            �           2606    42204 "   owner_list owner_list_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.owner_list
    ADD CONSTRAINT owner_list_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.owner_list DROP CONSTRAINT owner_list_user_id_fkey;
       public          postgres    false    204    233    2867            �           2606    42309 3   product_belonging product_belonging_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_belonging
    ADD CONSTRAINT product_belonging_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 ]   ALTER TABLE ONLY public.product_belonging DROP CONSTRAINT product_belonging_product_id_fkey;
       public          postgres    false    2885    239    213            �           2606    42304 6   product_belonging product_belonging_subsection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_belonging
    ADD CONSTRAINT product_belonging_subsection_id_fkey FOREIGN KEY (subsection_id) REFERENCES public.subsections(id);
 `   ALTER TABLE ONLY public.product_belonging DROP CONSTRAINT product_belonging_subsection_id_fkey;
       public          postgres    false    239    2925    237            �           2606    42054 "   provider provider_information_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_information_fkey FOREIGN KEY (information) REFERENCES public.provider_contacts(id);
 L   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_information_fkey;
       public          postgres    false    2889    215    217            �           2606    42059    provider provider_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_product_fkey FOREIGN KEY (product) REFERENCES public.products(id);
 H   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_product_fkey;
       public          postgres    false    217    213    2885            �           2606    42074 -   providers_price providers_price_provider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.providers_price
    ADD CONSTRAINT providers_price_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id);
 W   ALTER TABLE ONLY public.providers_price DROP CONSTRAINT providers_price_provider_fkey;
       public          postgres    false    2893    219    217            �           2606    42289 '   subsections subsections_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subsections
    ADD CONSTRAINT subsections_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id);
 Q   ALTER TABLE ONLY public.subsections DROP CONSTRAINT subsections_section_id_fkey;
       public          postgres    false    2923    237    235            �           2606    42141 $   transactions transactions_batch_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_batch_fkey FOREIGN KEY (batch) REFERENCES public.batch_of_products(id);
 N   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_batch_fkey;
       public          postgres    false    229    2911    227            �           2606    42146 '   transactions transactions_consumer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_consumer_fkey FOREIGN KEY (consumer) REFERENCES public.consumer(id);
 Q   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_consumer_fkey;
       public          postgres    false    2905    229    223            �           2606    42151 %   transactions transactions_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_status_fkey FOREIGN KEY (status) REFERENCES public.transaction_status(id);
 O   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_status_fkey;
       public          postgres    false    221    2901    229            �           2606    41970    users_info users_info_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_id_fkey FOREIGN KEY (id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.users_info DROP CONSTRAINT users_info_id_fkey;
       public          postgres    false    204    2867    207            �           2606    41975    users_info users_info_sex_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_sex_fkey FOREIGN KEY (sex) REFERENCES public.sex(id);
 H   ALTER TABLE ONLY public.users_info DROP CONSTRAINT users_info_sex_fkey;
       public          postgres    false    2871    207    206            S   ,   x�3�4�4400�4�4202�50�54�r8MA��1z\\\ �i�      ?   -   x�3�4�4202�50�54�445�440�4��45�4A�=... �C�      =   8   x�3��Q�wS�w��2�ts��qt�qU��
s:;�9�����p��qqq U�       /   B   x�3��.M��KWpI-ɯ��
%���FF��f��&��\F���ER�9���4'UI� v��      Q   (   x�3�4�4500 RFF��f��f\F�F���1z\\\ ��      O   )   x�3���s��t	u��2��rw��r�������� ���      -      x�3�4�4�2�4�1z\\\ A      U      x�3��p�su�2�t��2b���� <��      ;   I  x�U�1N�0E��)|��ر}	�mh�(��>� !DK�D��ee����F|o��ر�����3�((�	&�Ɔ�����iq6��J;g����=.�#�<��to������T��c���������@ym��x�o�5o��'�b��.���.K��7��J�-�!.�]�w�H�R�R���u��d�RJ���+�e%�J�?���`��)^\r����1�f��	�kl����v�F�*�r�$�R�s�Y�d�H�i`�܁\Y�s���{�wB�~�V�+��d�9b�yJI �SZ���d}�`Ã�A �6d��(�_��]      M      x�3��
�2�v����� v      C     x�m�=N�@�뷧x'@^c'�%�)R#�s ')@B��)X�9�8W�w#f�� Q�V����/x�5.8�#�RV7R��J�ζ��΄�}�*dܵ����u��w�Iⷫ���s�_,�L�m���.��z�J��#��1��'�&��6�I�-9�ǢQ���=o6z�t,�K:��2�@�6y׆R���R�$��RΨ�����t&R��cZqG�S�J`<�#���k����l����mcҫ+��/w��$      W   /   x�3�tq��sru�2���Q��"]C��9���]}��1z\\\ �
�      E      x�3�4�4�2�4��@�W� !��      K   $   x�3�4�42�2�B.cϔ�H�s��qqq I0A      1   k   x�3��.M��KWIM�440P�K,)-J�QHI-ɯP(IM�2��/O-��/�L��J��
ɉť9�
i�E
婙�%
鉙yz
�� Y�
�0U�\1z\\\ 	�%P      5      x�3�4�4����� �X      3   �   x�-ͱ� ���⼀XJ��f'�c���kRi`����/9��(.��4Z�r]UH�/��pn��	�E�1��;�P���),��eŲ�1��{<�i�	9��El�'<i��)-�P�F����.~���.�      7   #   x�3�4�445�460�4�2�@,C07F��� S��      G   y   x�ɻ
1�z�Wle)Ʒ�/�Xڄ݁�M2�L�ޭNqٖ��E=Wl�z��ҙ]�v�Kb��y�"9��E�ݢ{6-A�d�Ɗ�E�y�%�	fE�#Ea���r�{	��$T      *      x�3��M�I�2�tK�1b���� ;�      I     x�]�=o�0��
O�V��16(�CREe���u.`��6���=Ԓ��c�=�E$�#6�>:���+ӖL���D�Z�sh8�P΍��wR�5ަ4�>�lſ#�
�lI2���X>����#� C�(2JH|��|?X<u��Q�@u��ss����	i��o4��&R:�܀���+s�[��`A�噲�Ē��\'W$����9�x {���eXc�-� /*�ӷ��4�A�����ӎa�͗�;gz�k�ړc2��k�h�LYy�+�2���:�ޟc�Ŝ�'      9   -   x�3�p�s��s�2�tv�sv��qu�2�uvv����� ��      Y   $   x�3�tq��s��2����Q���qqq �N      A   �   x�m�A� @ѵ�ŉ�`�K��Έ�6�~�� 	+B�\�>����2z��022�Y��X�g핱7��#crg��uocN�c�jR����l�ņ��d�T��uD���z��O�� zd��>���9_�hIP      (   �   x��1n0 ��~L�3v蘩��(�J������v���6G'2���d��B�Y \���v�{���ۆ�鲜'J��`鸋���Q���_�y�i�#_��4D1���.�{1��}��G���k �d����:h͚cS���o���6�      +   }   x�mʱ�  ���
~�wV-#CG�X�.DLz%�i�_�&o|�p���� l� U�G���C�}I�v�H���C�K�d�E"���w�Z�%��=�+ҭ�~�W?y�����]��I)�a�.B     