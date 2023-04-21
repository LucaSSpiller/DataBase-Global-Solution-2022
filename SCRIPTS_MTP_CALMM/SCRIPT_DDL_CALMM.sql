/*
DROP TABLE t_mtp_banco CASCADE CONSTRAINTS;

DROP TABLE t_mtp_bicicleta CASCADE CONSTRAINTS;

DROP TABLE t_mtp_carro CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_banco CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_bicicleta CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_carro CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_estabelecimento CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_hospital CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_moto CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_patinete CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_posto_comb CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_posto_eletrico CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_rest CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hist_veiculo CASCADE CONSTRAINTS;

DROP TABLE t_mtp_hospital CASCADE CONSTRAINTS;

DROP TABLE t_mtp_locadora CASCADE CONSTRAINTS;

DROP TABLE t_mtp_moto CASCADE CONSTRAINTS;

DROP TABLE t_mtp_patinete CASCADE CONSTRAINTS;

DROP TABLE t_mtp_posto_combustivel CASCADE CONSTRAINTS;

DROP TABLE t_mtp_posto_eletrico CASCADE CONSTRAINTS;

DROP TABLE t_mtp_restaurante CASCADE CONSTRAINTS;

DROP TABLE t_mtp_usuario CASCADE CONSTRAINTS;
*/

CREATE TABLE t_mtp_banco (
    cd_banco  NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nm_banco  VARCHAR2(100) NOT NULL,
    nm_rua    VARCHAR2(100) NOT NULL,
    nm_bairro VARCHAR2(100) NOT NULL,
    nm_cidade VARCHAR2(100) NOT NULL,
    nr_numero NUMBER(5) NOT NULL,
    nr_cep    NUMBER(8) NOT NULL,
    st_status NUMBER(1) NOT NULL,
    nr_cnpj   NUMBER(14) NOT NULL
);

ALTER TABLE t_mtp_banco ADD CONSTRAINT pk_mtp_banco PRIMARY KEY ( cd_banco );

ALTER TABLE t_mtp_banco ADD CONSTRAINT un_mtp_banco_cnpj UNIQUE ( nr_cnpj );

CREATE TABLE t_mtp_bicicleta (
    cd_bicicleta  NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_locadora   NUMBER(5) NOT NULL,
    vl_valor_hora NUMBER(6, 2) NOT NULL,
    st_status     NUMBER(1) NOT NULL
);

ALTER TABLE t_mtp_bicicleta ADD CONSTRAINT pk_mtp_bicicleta PRIMARY KEY ( cd_bicicleta );

CREATE TABLE t_mtp_carro (
    cd_carro        NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_locadora     NUMBER(5) NOT NULL,
    nm_carro        VARCHAR2(50) NOT NULL,
    vl_valor_diario NUMBER(6, 2) NOT NULL,
    st_status       NUMBER(1) NOT NULL
);

ALTER TABLE t_mtp_carro ADD CONSTRAINT pk_mtp_carro PRIMARY KEY ( cd_carro );

CREATE TABLE t_mtp_hist_banco (
    cd_hist_banco NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_banco      NUMBER(5) NOT NULL,
    cd_hist_estab NUMBER(5) NOT NULL,
    cd_usuario    NUMBER(5) NOT NULL
);

CREATE INDEX t_mtp_hist_banco__idx ON
    t_mtp_hist_banco (
        cd_hist_estab
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_banco ADD CONSTRAINT pk_mtp_hist_banco PRIMARY KEY ( cd_hist_banco );

CREATE TABLE t_mtp_hist_bicicleta (
    cd_hist_bicicleta NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_bicicleta      NUMBER(5) NOT NULL,
    cd_hist_veiculo   NUMBER(5) NOT NULL,
    cd_usuario        NUMBER(5) NOT NULL,
    dt_aluguel        DATE NOT NULL,
    hr_aluguel        NUMBER(3) NOT NULL
);

CREATE INDEX t_mtp__hist_bicicleta__idx ON
    t_mtp_hist_bicicleta (
        cd_hist_veiculo
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_bicicleta ADD CONSTRAINT pk_mtp_hist_bicicleta PRIMARY KEY ( cd_hist_bicicleta );

CREATE TABLE t_mtp_hist_carro (
    cd_hist_carro   NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_usuario      NUMBER(5) NOT NULL,
    cd_carro        NUMBER(5) NOT NULL,
    cd_hist_veiculo NUMBER(5) NOT NULL,
    dt_aluguel      DATE NOT NULL,
    hr_aluguel      NUMBER(3) NOT NULL
);

CREATE INDEX t_mtp_hist_carro__idx ON
    t_mtp_hist_carro (
        cd_hist_veiculo
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_carro ADD CONSTRAINT pk_mtp_hist_carro PRIMARY KEY ( cd_hist_carro );

CREATE TABLE t_mtp_hist_estabelecimento (
    cd_hist_estab NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_usuario    NUMBER(5) NOT NULL
);

CREATE UNIQUE INDEX t_mtp_hist_estab__idx ON
    t_mtp_hist_estabelecimento (
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_estabelecimento ADD CONSTRAINT pk_mtp_hist_estab PRIMARY KEY ( cd_hist_estab,
                                                                                      cd_usuario );

CREATE TABLE t_mtp_hist_hospital (
    cd_hist_hospital NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_hospital      NUMBER(5) NOT NULL,
    cd_hist_estab    NUMBER(5) NOT NULL,
    cd_usuario       NUMBER(5) NOT NULL
);

CREATE INDEX t_mtp_hist_hosp__idx ON
    t_mtp_hist_hospital (
        cd_hist_estab
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_hospital ADD CONSTRAINT pk_mtp_hist_hosp PRIMARY KEY ( cd_hist_hospital );

CREATE TABLE t_mtp_hist_moto (
    cd_hist_moto    NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_moto         NUMBER(5) NOT NULL,
    cd_hist_veiculo NUMBER(5) NOT NULL,
    cd_usuario      NUMBER(5) NOT NULL,
    dt_aluguel      DATE NOT NULL,
    hr_aluguel      NUMBER(3) NOT NULL
);

CREATE INDEX t_mtp_hist_moto__idx ON
    t_mtp_hist_moto (
        cd_hist_veiculo
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_moto ADD CONSTRAINT pk_mtp_hist_moto PRIMARY KEY ( cd_hist_moto );

CREATE TABLE t_mtp_hist_patinete (
    cd_hist_patinete NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_patinete      NUMBER(5) NOT NULL,
    cd_hist_veiculo  NUMBER(5) NOT NULL,
    cd_usuario       NUMBER(5) NOT NULL,
    dt_aluguel       DATE NOT NULL,
    hr_aluguel       NUMBER(3) NOT NULL
);

CREATE INDEX t_mtp_hist_patinete__idx ON
    t_mtp_hist_patinete (
        cd_hist_veiculo
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_patinete ADD CONSTRAINT pk_t_mtp_hist_patinete PRIMARY KEY ( cd_hist_patinete );

CREATE TABLE t_mtp_hist_posto_comb (
    cd_hist_posto_comb NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_posto_comb      NUMBER(5) NOT NULL,
    cd_hist_estab      NUMBER(5) NOT NULL,
    cd_usuario         NUMBER(5) NOT NULL
);

CREATE INDEX t_mtp_hist_posto_comb__idx ON
    t_mtp_hist_posto_comb (
        cd_hist_estab
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_posto_comb ADD CONSTRAINT pk_mtp_hist_posto_comb PRIMARY KEY ( cd_hist_posto_comb );

CREATE TABLE t_mtp_hist_posto_eletrico (
    cd_hist_posto_eletrico NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_posto_eletrico      NUMBER(5) NOT NULL,
    cd_hist_estab          NUMBER(5) NOT NULL,
    cd_usuario             NUMBER(5) NOT NULL
);

CREATE INDEX t_mtp_hist_posto_eletrico__idx ON
    t_mtp_hist_posto_eletrico (
        cd_hist_estab
    ASC,
        cd_usuario
    ASC );
    
ALTER TABLE t_mtp_hist_posto_eletrico ADD CONSTRAINT pk_mtp_hist_posto_eletrico PRIMARY KEY ( cd_hist_posto_eletrico );

CREATE TABLE t_mtp_hist_rest (
    cd_hist_rest  NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_rest       NUMBER(5) NOT NULL,
    cd_hist_estab NUMBER(5) NOT NULL,
    cd_usuario    NUMBER(5) NOT NULL
);

CREATE INDEX t_mtp_hist_rest__idx ON
    t_mtp_hist_rest (
        cd_hist_estab
    ASC,
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_rest ADD CONSTRAINT pk_mtp_hist_rest PRIMARY KEY ( cd_hist_rest );

CREATE TABLE t_mtp_hist_veiculo (
    cd_hist_veiculo NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_usuario      NUMBER(5) NOT NULL
);

CREATE UNIQUE INDEX t_mtp_hist_veiculo__idx ON
    t_mtp_hist_veiculo (
        cd_usuario
    ASC );

ALTER TABLE t_mtp_hist_veiculo ADD CONSTRAINT pk_mtp_hist_veiculo PRIMARY KEY ( cd_hist_veiculo,
                                                                                cd_usuario );

CREATE TABLE t_mtp_hospital (
    cd_hospital NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nm_hospital VARCHAR2(100) NOT NULL,
    nr_telefone NUMBER(11) NOT NULL,
    nm_rua      VARCHAR2(100) NOT NULL,
    nm_bairro   VARCHAR2(100) NOT NULL,
    nm_cidade   VARCHAR2(100) NOT NULL,
    nr_numero   NUMBER(5) NOT NULL,
    nr_cep      NUMBER(8) NOT NULL,
    nr_cnpj     NUMBER(14) NOT NULL
);

ALTER TABLE t_mtp_hospital ADD CONSTRAINT pk_mtp_hosp PRIMARY KEY ( cd_hospital );

ALTER TABLE t_mtp_hospital ADD CONSTRAINT un_mtp_hosp_cnpj UNIQUE ( nr_cnpj );

ALTER TABLE t_mtp_hospital ADD CONSTRAINT un_mtp_hosp_tel UNIQUE ( nr_telefone );

CREATE TABLE t_mtp_locadora (
    cd_locadora NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nm_locadora VARCHAR2(100) NOT NULL,
    nr_cnpj     NUMBER(14) NOT NULL
);

ALTER TABLE t_mtp_locadora ADD CONSTRAINT pk_mtp_locadora PRIMARY KEY ( cd_locadora );

ALTER TABLE t_mtp_locadora ADD CONSTRAINT un_mtp_locadora_cnpj UNIQUE ( nr_cnpj );

CREATE TABLE t_mtp_moto (
    cd_moto         NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_locadora     NUMBER(5) NOT NULL,
    nm_moto         VARCHAR2(50) NOT NULL,
    vl_valor_diario NUMBER(6, 2) NOT NULL,
    st_status       NUMBER(1) NOT NULL
);

ALTER TABLE t_mtp_moto ADD CONSTRAINT pk_mtp_moto PRIMARY KEY ( cd_moto );

CREATE TABLE t_mtp_patinete (
    cd_patinete   NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    cd_locadora   NUMBER(5) NOT NULL,
    vl_valor_hora NUMBER(6, 2) NOT NULL,
    st_status     NUMBER(1) NOT NULL
);

ALTER TABLE t_mtp_patinete ADD CONSTRAINT pk_t_mtp_patinete PRIMARY KEY ( cd_patinete );

CREATE TABLE t_mtp_posto_combustivel (
    cd_posto_combustivel NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nm_posto_combustivel VARCHAR2(14) NOT NULL,
    nm_rua               VARCHAR2(100) NOT NULL,
    nm_bairro            VARCHAR2(100) NOT NULL,
    nm_cidade            VARCHAR2(100) NOT NULL,
    nr_numero            NUMBER(5) NOT NULL,
    nr_cep               NUMBER(8) NOT NULL,
    st_status            NUMBER(1) NOT NULL,
    nr_cnpj              NUMBER(14) NOT NULL
);

ALTER TABLE t_mtp_posto_combustivel ADD CONSTRAINT pk_mtp_posto_comb PRIMARY KEY ( cd_posto_combustivel );

ALTER TABLE t_mtp_posto_combustivel ADD CONSTRAINT un_mtp_posto_comb_cnpj UNIQUE ( nr_cnpj );

CREATE TABLE t_mtp_posto_eletrico (
    cd_posto_eletrico NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nm_posto_eletrico VARCHAR2(100) NOT NULL,
    nm_rua            VARCHAR2(100) NOT NULL,
    nm_bairro         VARCHAR2(100) NOT NULL,
    nm_cidade         VARCHAR2(100) NOT NULL,
    nr_numero         NUMBER(10) NOT NULL,
    nr_cep            NUMBER(8) NOT NULL,
    nr_cnpj           NUMBER(14) NOT NULL
);

ALTER TABLE t_mtp_posto_eletrico ADD CONSTRAINT pk_mtp_posto_eletrico PRIMARY KEY ( cd_posto_eletrico );

ALTER TABLE t_mtp_posto_eletrico ADD CONSTRAINT un_mtp_posto_eletrico_cnpj UNIQUE ( nr_cnpj );

CREATE TABLE t_mtp_restaurante (
    cd_restaurante   NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nm_restaurante   VARCHAR2(100) NOT NULL,
    nr_quant_estrela NUMBER(5) NOT NULL,
    nr_telefone      NUMBER(11) NOT NULL,
    nm_rua           VARCHAR2(100) NOT NULL,
    nm_bairro        VARCHAR2(100) NOT NULL,
    nm_cidade        VARCHAR2(100) NOT NULL,
    nr_numero        NUMBER(10) NOT NULL,
    nr_cep           NUMBER(8) NOT NULL,
    st_status        NUMBER(1) NOT NULL,
    nr_cnpj          NUMBER(14) NOT NULL
);

ALTER TABLE t_mtp_restaurante ADD CONSTRAINT pk_mtp_rest PRIMARY KEY ( cd_restaurante );

ALTER TABLE t_mtp_restaurante ADD CONSTRAINT un_mtp_rest_cnpj UNIQUE ( nr_cnpj );

ALTER TABLE t_mtp_restaurante ADD CONSTRAINT un_mtp_rest_tel UNIQUE ( nr_telefone );

CREATE TABLE t_mtp_usuario (
    cd_usuario    NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nm_nome       VARCHAR2(50) NOT NULL,
    nm_sobrenome  VARCHAR2(100) NOT NULL,
    ds_email      VARCHAR2(100) NOT NULL,
    ds_senha      VARCHAR2(30) NOT NULL,
    nr_telefone   NUMBER(11) NOT NULL,
    dt_nascimento DATE NOT NULL
);

ALTER TABLE t_mtp_usuario
    ADD CONSTRAINT t_mtp_usuario_ck CHECK ( length(ds_senha) > 3 );

ALTER TABLE t_mtp_usuario ADD CONSTRAINT pk_mtp_usuario PRIMARY KEY ( cd_usuario );

ALTER TABLE t_mtp_hist_banco
    ADD CONSTRAINT fk_mtp_banco FOREIGN KEY ( cd_banco )
        REFERENCES t_mtp_banco ( cd_banco );

ALTER TABLE t_mtp_bicicleta
    ADD CONSTRAINT fk_mtp_bici_locadorav3 FOREIGN KEY ( cd_locadora )
        REFERENCES t_mtp_locadora ( cd_locadora );

ALTER TABLE t_mtp_carro
    ADD CONSTRAINT fk_mtp_carro_locadorav2 FOREIGN KEY ( cd_locadora )
        REFERENCES t_mtp_locadora ( cd_locadora );

ALTER TABLE t_mtp_hist_banco
    ADD CONSTRAINT fk_mtp_hist_banco_estab FOREIGN KEY ( cd_hist_estab,
                                                         cd_usuario )
        REFERENCES t_mtp_hist_estabelecimento ( cd_hist_estab,
                                                cd_usuario );

ALTER TABLE t_mtp_hist_bicicleta
    ADD CONSTRAINT fk_mtp_hist_bici_bicicleta FOREIGN KEY ( cd_bicicleta )
        REFERENCES t_mtp_bicicleta ( cd_bicicleta );

ALTER TABLE t_mtp_hist_bicicleta
    ADD CONSTRAINT fk_mtp_hist_bici_veiculov4 FOREIGN KEY ( cd_hist_veiculo,
                                                            cd_usuario )
        REFERENCES t_mtp_hist_veiculo ( cd_hist_veiculo,
                                        cd_usuario );

ALTER TABLE t_mtp_hist_carro
    ADD CONSTRAINT fk_mtp_hist_carro_carro FOREIGN KEY ( cd_carro )
        REFERENCES t_mtp_carro ( cd_carro );

ALTER TABLE t_mtp_hist_carro
    ADD CONSTRAINT fk_mtp_hist_carro_hist_veicv2 FOREIGN KEY ( cd_hist_veiculo,
                                                               cd_usuario )
        REFERENCES t_mtp_hist_veiculo ( cd_hist_veiculo,
                                        cd_usuario );

ALTER TABLE t_mtp_hist_estabelecimento
    ADD CONSTRAINT fk_mtp_hist_estab_usuario FOREIGN KEY ( cd_usuario )
        REFERENCES t_mtp_usuario ( cd_usuario );

ALTER TABLE t_mtp_hist_rest
    ADD CONSTRAINT fk_mtp_hist_estabv1 FOREIGN KEY ( cd_hist_estab,
                                                     cd_usuario )
        REFERENCES t_mtp_hist_estabelecimento ( cd_hist_estab,
                                                cd_usuario );

ALTER TABLE t_mtp_hist_posto_eletrico
    ADD CONSTRAINT fk_mtp_hist_estabv2 FOREIGN KEY ( cd_hist_estab,
                                                     cd_usuario )
        REFERENCES t_mtp_hist_estabelecimento ( cd_hist_estab,
                                                cd_usuario );

ALTER TABLE t_mtp_hist_hospital
    ADD CONSTRAINT fk_mtp_hist_estabv3 FOREIGN KEY ( cd_hist_estab,
                                                     cd_usuario )
        REFERENCES t_mtp_hist_estabelecimento ( cd_hist_estab,
                                                cd_usuario );

ALTER TABLE t_mtp_hist_posto_comb
    ADD CONSTRAINT fk_mtp_hist_estabv4 FOREIGN KEY ( cd_hist_estab,
                                                     cd_usuario )
        REFERENCES t_mtp_hist_estabelecimento ( cd_hist_estab,
                                                cd_usuario );

ALTER TABLE t_mtp_hist_hospital
    ADD CONSTRAINT fk_mtp_hist_hosp_hosp FOREIGN KEY ( cd_hospital )
        REFERENCES t_mtp_hospital ( cd_hospital );

ALTER TABLE t_mtp_hist_moto
    ADD CONSTRAINT fk_mtp_hist_moto_hist_veicv3 FOREIGN KEY ( cd_hist_veiculo,
                                                              cd_usuario )
        REFERENCES t_mtp_hist_veiculo ( cd_hist_veiculo,
                                        cd_usuario );

ALTER TABLE t_mtp_hist_moto
    ADD CONSTRAINT fk_mtp_hist_moto_moto FOREIGN KEY ( cd_moto )
        REFERENCES t_mtp_moto ( cd_moto );

ALTER TABLE t_mtp_hist_posto_eletrico
    ADD CONSTRAINT fk_mtp_hist_posto_elet FOREIGN KEY ( cd_posto_eletrico )
        REFERENCES t_mtp_posto_eletrico ( cd_posto_eletrico );

ALTER TABLE t_mtp_hist_posto_comb
    ADD CONSTRAINT fk_mtp_hist_posto_posto_comb FOREIGN KEY ( cd_posto_comb )
        REFERENCES t_mtp_posto_combustivel ( cd_posto_combustivel );

ALTER TABLE t_mtp_hist_rest
    ADD CONSTRAINT fk_mtp_hist_rest_rest FOREIGN KEY ( cd_rest )
        REFERENCES t_mtp_restaurante ( cd_restaurante );

ALTER TABLE t_mtp_hist_veiculo
    ADD CONSTRAINT fk_mtp_hist_veic_usuariov2 FOREIGN KEY ( cd_usuario )
        REFERENCES t_mtp_usuario ( cd_usuario );

ALTER TABLE t_mtp_moto
    ADD CONSTRAINT fk_mtp_moto_locadorav4 FOREIGN KEY ( cd_locadora )
        REFERENCES t_mtp_locadora ( cd_locadora );

ALTER TABLE t_mtp_hist_patinete
    ADD CONSTRAINT fk_t_mtp_hist_pat_hist_veic FOREIGN KEY ( cd_hist_veiculo,
                                                             cd_usuario )
        REFERENCES t_mtp_hist_veiculo ( cd_hist_veiculo,
                                        cd_usuario );

ALTER TABLE t_mtp_hist_patinete
    ADD CONSTRAINT fk_t_mtp_hist_pat_patinete FOREIGN KEY ( cd_patinete )
        REFERENCES t_mtp_patinete ( cd_patinete );

ALTER TABLE t_mtp_patinete
    ADD CONSTRAINT fk_t_mtp_locadora FOREIGN KEY ( cd_locadora )
        REFERENCES t_mtp_locadora ( cd_locadora );