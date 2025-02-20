PGDMP  1                    |           sis123    16.2    16.2 $    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    42499    sis123    DATABASE        CREATE DATABASE sis123 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Portugal.1252';
    DROP DATABASE sis123;
                postgres    false            �            1259    42500    cursosf    TABLE     �  CREATE TABLE public.cursosf (
    id_ano integer NOT NULL,
    alunofem integer NOT NULL,
    id_educacao integer NOT NULL,
    id_artes integer NOT NULL,
    id_ciencias_sociais_comercio_e_direito integer NOT NULL,
    id_ciencias_matematica_e_informatica integer NOT NULL,
    id_engenharia_industrias_transformadoras_e_construcao integer NOT NULL,
    id_agricultura integer NOT NULL,
    id_saude_e_protecao_social integer NOT NULL,
    id_servicos integer NOT NULL
);
    DROP TABLE public.cursosf;
       public         heap    postgres    false            �            1259    42503    cursosm    TABLE     �  CREATE TABLE public.cursosm (
    id_ano integer NOT NULL,
    alunomas integer NOT NULL,
    id_educacao integer NOT NULL,
    id_artes integer NOT NULL,
    id_ciencias_sociais_comercio_e_direito integer NOT NULL,
    id_ciencias_matematica_e_informatica integer NOT NULL,
    id_engenharia_industrias_transformadoras_e_construcao integer NOT NULL,
    id_agricultura integer NOT NULL,
    id_saude_e_protecao_social integer NOT NULL,
    id_servicos integer NOT NULL
);
    DROP TABLE public.cursosm;
       public         heap    postgres    false            �            1259    42506     TodosCursosPorAno    VIEW     Z  CREATE VIEW public." TodosCursosPorAno" AS
 SELECT c.id_ano,
    'Educação'::text AS curso,
    c.id_educacao AS alunos_masculinos,
    f.id_educacao AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
UNION ALL
 SELECT c.id_ano,
    'Artes'::text AS curso,
    c.id_artes AS alunos_masculinos,
    f.id_artes AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
UNION ALL
 SELECT c.id_ano,
    'Ciências Sociais, Comércio e Direito'::text AS curso,
    c.id_ciencias_sociais_comercio_e_direito AS alunos_masculinos,
    f.id_ciencias_sociais_comercio_e_direito AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
UNION ALL
 SELECT c.id_ano,
    'Ciências, Matemática e Informática'::text AS curso,
    c.id_ciencias_matematica_e_informatica AS alunos_masculinos,
    f.id_ciencias_matematica_e_informatica AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
UNION ALL
 SELECT c.id_ano,
    'Engenharia, Indústrias Transformadoras e Construção'::text AS curso,
    c.id_engenharia_industrias_transformadoras_e_construcao AS alunos_masculinos,
    f.id_engenharia_industrias_transformadoras_e_construcao AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
UNION ALL
 SELECT c.id_ano,
    'Agricultura'::text AS curso,
    c.id_agricultura AS alunos_masculinos,
    f.id_agricultura AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
UNION ALL
 SELECT c.id_ano,
    'Saúde e Proteção Social'::text AS curso,
    c.id_saude_e_protecao_social AS alunos_masculinos,
    f.id_saude_e_protecao_social AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
UNION ALL
 SELECT c.id_ano,
    'Serviços'::text AS curso,
    c.id_servicos AS alunos_masculinos,
    f.id_servicos AS alunos_femininos
   FROM (public.cursosm c
     JOIN public.cursosf f ON ((c.id_ano = f.id_ano)))
  ORDER BY 1, 2;
 '   DROP VIEW public." TodosCursosPorAno";
       public          postgres    false    216    216    215    215    215    215    215    215    215    215    215    216    216    216    216    216    216    216            �            1259    42511    alunoregiao    TABLE     �   CREATE TABLE public.alunoregiao (
    id_alunoregiao integer NOT NULL,
    numeroalunos integer NOT NULL,
    id_ano integer NOT NULL,
    id_regiao integer NOT NULL
);
    DROP TABLE public.alunoregiao;
       public         heap    postgres    false            �            1259    42514    regiao    TABLE     �   CREATE TABLE public.regiao (
    id_regiao integer NOT NULL,
    nome character(100) NOT NULL,
    populacao integer NOT NULL
);
    DROP TABLE public.regiao;
       public         heap    postgres    false            �            1259    42517    MediaAlunosPorRegiao    VIEW     �   CREATE VIEW public."MediaAlunosPorRegiao" AS
 SELECT r.nome AS regiao,
    avg(ar.numeroalunos) AS mediaalunos
   FROM (public.regiao r
     JOIN public.alunoregiao ar ON ((r.id_regiao = ar.id_regiao)))
  GROUP BY r.nome;
 )   DROP VIEW public."MediaAlunosPorRegiao";
       public          postgres    false    219    219    218    218            �            1259    42521    NumeroAlunosPorRegiao    VIEW     �   CREATE VIEW public."NumeroAlunosPorRegiao" AS
 SELECT r.nome AS regiao,
    ar.numeroalunos
   FROM (public.regiao r
     JOIN public.alunoregiao ar ON ((r.id_regiao = ar.id_regiao)))
  ORDER BY ar.numeroalunos;
 *   DROP VIEW public."NumeroAlunosPorRegiao";
       public          postgres    false    219    218    218    219            �            1259    42525    ano    TABLE     S   CREATE TABLE public.ano (
    id_ano integer NOT NULL,
    ano integer NOT NULL
);
    DROP TABLE public.ano;
       public         heap    postgres    false            �            1259    42528 
   totalaluno    TABLE     �   CREATE TABLE public.totalaluno (
    id_totalaluno integer NOT NULL,
    alunofem integer NOT NULL,
    alunomas integer NOT NULL,
    populatotal integer NOT NULL,
    id_ano integer NOT NULL
);
    DROP TABLE public.totalaluno;
       public         heap    postgres    false            �            1259    42531    TotalAlunosFMPorAno    VIEW     �   CREATE VIEW public."TotalAlunosFMPorAno" AS
 SELECT a.ano,
    ta.alunomas AS totalalunosmasculino,
    ta.alunofem AS totalalunosfeminino
   FROM (public.ano a
     JOIN public.totalaluno ta ON ((a.id_ano = ta.id_ano)));
 (   DROP VIEW public."TotalAlunosFMPorAno";
       public          postgres    false    223    222    222    223    223                       0    42511    alunoregiao 
   TABLE DATA           V   COPY public.alunoregiao (id_alunoregiao, numeroalunos, id_ano, id_regiao) FROM stdin;
    public          postgres    false    218   �7       "          0    42525    ano 
   TABLE DATA           *   COPY public.ano (id_ano, ano) FROM stdin;
    public          postgres    false    222   �;                 0    42500    cursosf 
   TABLE DATA             COPY public.cursosf (id_ano, alunofem, id_educacao, id_artes, id_ciencias_sociais_comercio_e_direito, id_ciencias_matematica_e_informatica, id_engenharia_industrias_transformadoras_e_construcao, id_agricultura, id_saude_e_protecao_social, id_servicos) FROM stdin;
    public          postgres    false    215   �;                 0    42503    cursosm 
   TABLE DATA             COPY public.cursosm (id_ano, alunomas, id_educacao, id_artes, id_ciencias_sociais_comercio_e_direito, id_ciencias_matematica_e_informatica, id_engenharia_industrias_transformadoras_e_construcao, id_agricultura, id_saude_e_protecao_social, id_servicos) FROM stdin;
    public          postgres    false    216   �>       !          0    42514    regiao 
   TABLE DATA           <   COPY public.regiao (id_regiao, nome, populacao) FROM stdin;
    public          postgres    false    219   �@       #          0    42528 
   totalaluno 
   TABLE DATA           \   COPY public.totalaluno (id_totalaluno, alunofem, alunomas, populatotal, id_ano) FROM stdin;
    public          postgres    false    223   �A       x           2606    42536    alunoregiao alunoregiao_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.alunoregiao
    ADD CONSTRAINT alunoregiao_pkey PRIMARY KEY (id_alunoregiao);
 F   ALTER TABLE ONLY public.alunoregiao DROP CONSTRAINT alunoregiao_pkey;
       public            postgres    false    218            |           2606    42538    ano ano_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.ano
    ADD CONSTRAINT ano_pkey PRIMARY KEY (id_ano);
 6   ALTER TABLE ONLY public.ano DROP CONSTRAINT ano_pkey;
       public            postgres    false    222            t           2606    42540    cursosf cursosf_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.cursosf
    ADD CONSTRAINT cursosf_pkey PRIMARY KEY (id_ano, alunofem);
 >   ALTER TABLE ONLY public.cursosf DROP CONSTRAINT cursosf_pkey;
       public            postgres    false    215    215            v           2606    42542    cursosm cursosm_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.cursosm
    ADD CONSTRAINT cursosm_pkey PRIMARY KEY (id_ano, alunomas);
 >   ALTER TABLE ONLY public.cursosm DROP CONSTRAINT cursosm_pkey;
       public            postgres    false    216    216            z           2606    42544    regiao regiao_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.regiao
    ADD CONSTRAINT regiao_pkey PRIMARY KEY (id_regiao);
 <   ALTER TABLE ONLY public.regiao DROP CONSTRAINT regiao_pkey;
       public            postgres    false    219            ~           2606    42546 "   totalaluno totalaluno_alunofem_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.totalaluno
    ADD CONSTRAINT totalaluno_alunofem_key UNIQUE (alunofem);
 L   ALTER TABLE ONLY public.totalaluno DROP CONSTRAINT totalaluno_alunofem_key;
       public            postgres    false    223            �           2606    42548 "   totalaluno totalaluno_alunomas_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.totalaluno
    ADD CONSTRAINT totalaluno_alunomas_key UNIQUE (alunomas);
 L   ALTER TABLE ONLY public.totalaluno DROP CONSTRAINT totalaluno_alunomas_key;
       public            postgres    false    223            �           2606    42550    totalaluno totalaluno_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.totalaluno
    ADD CONSTRAINT totalaluno_pkey PRIMARY KEY (id_totalaluno);
 D   ALTER TABLE ONLY public.totalaluno DROP CONSTRAINT totalaluno_pkey;
       public            postgres    false    223            �           2606    42551    cursosf fk_alunofem_cursosf    FK CONSTRAINT     �   ALTER TABLE ONLY public.cursosf
    ADD CONSTRAINT fk_alunofem_cursosf FOREIGN KEY (alunofem) REFERENCES public.totalaluno(alunofem);
 E   ALTER TABLE ONLY public.cursosf DROP CONSTRAINT fk_alunofem_cursosf;
       public          postgres    false    223    4734    215            �           2606    42556    cursosm fk_alunomas_cursosm    FK CONSTRAINT     �   ALTER TABLE ONLY public.cursosm
    ADD CONSTRAINT fk_alunomas_cursosm FOREIGN KEY (alunomas) REFERENCES public.totalaluno(alunomas);
 E   ALTER TABLE ONLY public.cursosm DROP CONSTRAINT fk_alunomas_cursosm;
       public          postgres    false    216    4736    223            �           2606    42561    alunoregiao fk_ano    FK CONSTRAINT     r   ALTER TABLE ONLY public.alunoregiao
    ADD CONSTRAINT fk_ano FOREIGN KEY (id_ano) REFERENCES public.ano(id_ano);
 <   ALTER TABLE ONLY public.alunoregiao DROP CONSTRAINT fk_ano;
       public          postgres    false    222    218    4732            �           2606    42566    totalaluno fk_ano    FK CONSTRAINT     q   ALTER TABLE ONLY public.totalaluno
    ADD CONSTRAINT fk_ano FOREIGN KEY (id_ano) REFERENCES public.ano(id_ano);
 ;   ALTER TABLE ONLY public.totalaluno DROP CONSTRAINT fk_ano;
       public          postgres    false    223    222    4732            �           2606    42571    cursosf fk_ano_cursosf    FK CONSTRAINT     v   ALTER TABLE ONLY public.cursosf
    ADD CONSTRAINT fk_ano_cursosf FOREIGN KEY (id_ano) REFERENCES public.ano(id_ano);
 @   ALTER TABLE ONLY public.cursosf DROP CONSTRAINT fk_ano_cursosf;
       public          postgres    false    222    215    4732            �           2606    42576    cursosm fk_ano_cursosm    FK CONSTRAINT     v   ALTER TABLE ONLY public.cursosm
    ADD CONSTRAINT fk_ano_cursosm FOREIGN KEY (id_ano) REFERENCES public.ano(id_ano);
 @   ALTER TABLE ONLY public.cursosm DROP CONSTRAINT fk_ano_cursosm;
       public          postgres    false    222    216    4732            �           2606    42581    alunoregiao fk_regiao    FK CONSTRAINT     ~   ALTER TABLE ONLY public.alunoregiao
    ADD CONSTRAINT fk_regiao FOREIGN KEY (id_regiao) REFERENCES public.regiao(id_regiao);
 ?   ALTER TABLE ONLY public.alunoregiao DROP CONSTRAINT fk_regiao;
       public          postgres    false    219    4730    218            �           2606    42586 !   totalaluno totalaluno_id_ano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.totalaluno
    ADD CONSTRAINT totalaluno_id_ano_fkey FOREIGN KEY (id_ano) REFERENCES public.ano(id_ano);
 K   ALTER TABLE ONLY public.totalaluno DROP CONSTRAINT totalaluno_id_ano_fkey;
       public          postgres    false    222    4732    223                �  x�=�K�!׼�8@�w����Fr��U5��D�g�1��h��>~����ӳ�}�6�^hcB[Oo�0m?����{�=�G��������W���>=��S2��g�Afd�[Yҙ�cl�9ǝ�th�}�E2�PXsc@�����{�
��(��<Wc2����dk���dͲ��p�Yf�ق��#o?b�1g�G�v�8�ȣ���}<��hgo?�<�0?x[O}[�2��o�� ���g�ȣ��>�H�S����p�pǺ�Cg_I��	���=��1N��w&rb�Պ�s)�wO��'V�� )�n�� �w��II	r6�/W]#�o���댇������`�=&��Ҹ�r����6��4t췓/�Щ��~�1X|���Q�`��*�8���d#�n����z�a�Euy����=�UŅ�e^g��V/�8
�{}��Nw�ď3����G���+ G�c�mdf�^y8�p���X?*�8�� �/���~��|e��9��K?�h�QY	ͼ��Ӡ�G'���<:�x����h��Ĉ�q�q��gDQq�9���Q��eH�ڌy�9�zե�F�<Sȅ)s�5�J�P��xc��;i,�%%|��`j87�2��TW0��S�1i�Zյ�2S��ϙ�����	-�y)O-s$�Z��	-��,s�|�-�i�A�L؛Ư'GY9��թ�2��_3Yep�]���X��/c�M�6Q���EҖ�3i�8j��]d�}����K\W�����tF|m��Q�ri@;�gi~:k��m꣺K��'W�KG��&mi��|�m��x�V���ܺ����Rd����Q_��HE���B~M�R���Җ;�p�T����\Wn����z4��R�|�=aˠ���"a� |��J�>t�+���>"LݞUZ0y�]�F�xi`��>��Z�σ-K5�[�t�[(wT�ʭ�CE\:o���KuI*$��D��"CG�]*�RL/��t��I�y�H�2HʿI	[�T�̈́-c�pG��?���.T�:      "   Z   x�α!���*ƳZ��zq�u�){#?]%�4#�d��œ<�ds�Û�X����l���PN���`n���p^'^��O�n:^~_��D_         t  x�%���0D�T1y�A�������9 f!��{��ܻu"�=����Z����O�v������n�|n�����`X�����D��3f�%�q�S���ۂ����[F��}�x���i��c'_.��b�Rր�2E�y�I�u6�|�!��ɬ�������ۚn5�T��,Z}"��v��<��&����B��b�F��ڹ�T��Ug�.�d�C�fȔ.���]v�?;��7`5W}�*��\ 6U�n�QΜq���2g� =4G�5%��S�e3�s �ѨGf݀
��&����:% _��qV� �?��M����s� 'ؕw��M��K�e��Ob6����B�@>���*���GDx�-f�:aKs�'\�]%�+C3�p�������D�Y�Ni̶�����Ɯ �\����:k���	�h�o�Tޤ_�}� ���/p�x�u(��J6��� ')>_I �G��Oz*��%���@�8>(.�X���	�ƿ��+)k)U��W:9|�sQ���䖽_n5��M��BUT=��~a���{�S���V8HJ�$�U:��P
�,Ir�[
Ծ6��Jqm���V_�f���#�; uc���m�4�N��JA��F������ע��         e  x�=T�q�@����}���� {⏵FZ�  >k/O9�Ӛ�r��V�jߐ�4����� ���2C�jWJw�h7Rr3eQ\F3.�?n�Z�B(fy�V꒥#W�Լ(��x���%�\:vF���e��Q�������w
Tm�t����a�͞G"�V^GT4f�����
_�q�֖���\%��!��¢c8���x�ٲ}����&1_�-�:��C�e/�x�pB��nNk�Y���s�0���|f�OE�I�����e��s"8�7�cX�=�Ms��Qh�����Q�[����l=|1(�0F?{=G
�Q� %l�CQ���4��3̴�R�1>���2Wlҥ��I���K��R2�7�㙠�[ �����-HÕ�]`@���e(�S��[*u�!���^]���C����d��rU�?.�_��/�1+���潾��BUA����q�_�`�-#�ѳ�;f'�Í����dtg���⎷����NmJ�ҿ�O���=����[O�O��u��
�͸�*��y4����������q�����ȧ�'��ò�įE���tA��Yܡ$���	<����{�e�      !   �   x���=!��N�	�[nl������;�E�/��.s�'߼JJ�N���Ǵ��KǕ�����L�E ��M�l�����G*q�bBqH��vbFy�D��G���+�W
�6�Vp���7$3nth�cg�S$1�-���U�7ʸn� �?X��	S�,a-���e�9�D�      #   +  x�MR��%1�M1{����X�d�D62B�c���Ł��2;;�k�x��L����4�?�%꫄|�+$�0�.��>(�R�i��v���+uL�feD�~P	O��벟Y-�.T��D���mQg,Ψ��t��  #jE�1�y��6��vp҂�XQ&Lô+��٘�� V�e���b��"dߎO<���h��N�r�ݐ�/HE[���Z�/�P�K������,�q�-؀4�[v�FiGh�V��W\�˼��Y��-20�j�ZE+�f� �4��'"��k3     