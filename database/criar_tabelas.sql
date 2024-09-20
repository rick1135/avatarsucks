CREATE TABLE LABORATORIO (
    SIGLA VARCHAR(10) PRIMARY KEY,
    TAMANHO NUMBER,
    NOME VARCHAR(50),
    FINALIDADE VARCHAR(100)
);

CREATE TABLE RESIDENCIA (
    SIGLA VARCHAR(10) PRIMARY KEY,
    TAMANHO NUMBER,
    NOME VARCHAR(50),
    QTD_CAMA INT,
    QTD_BANHEIRO INT
);

CREATE TABLE DEPOSITO (
    SIGLA VARCHAR(10) PRIMARY KEY,
    TAMANHO NUMBER,
    NOME VARCHAR(50),
    TIPO_MATERIAL VARCHAR(20),
    CONSTRAINT CHK_TIPO_MATERIAL CHECK (TIPO_MATERIAL IN ('MINERA��O', 'MATERIAL_B�LICO'))
);

CREATE TABLE COLONIA (
    SIGLA VARCHAR(10) PRIMARY KEY,
    APELIDO VARCHAR(20),
    TIPO VARCHAR(20),
    ID_EMPRESA INT,
    ID_JAZIDA INT
);

CREATE TABLE COLONIA_FORMADA_LAB (
    SIGLA_LAB VARCHAR(10),
    SIGLA_COLONIA VARCHAR(10),
    PRIMARY KEY (SIGLA_LAB, SIGLA_COLONIA)
);

CREATE TABLE COLONIA_FORMADA_RES (
    SIGLA_RESID VARCHAR(10),
    SIGLA_COLONIA VARCHAR(10),
    PRIMARY KEY (SIGLA_RESID, SIGLA_COLONIA)
);

CREATE TABLE COLONIA_FORMADA_DEP (
    SIGLA_DEP VARCHAR(10),
    SIGLA_COLONIA VARCHAR(10),
    PRIMARY KEY (SIGLA_DEP, SIGLA_COLONIA)
);

CREATE TABLE MINERADOR (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100),
    FUNCAO VARCHAR(50),
    ID_EXPLORACAO INT
);

CREATE TABLE MILITAR (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100),
    ESPECIALIZACAO VARCHAR(50),
    ID_EXPLORACAO INT
);

CREATE TABLE CIENTISTA (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100),
    ESPECIALIZACAO VARCHAR(50),
    SIGLA_LAB VARCHAR(10),
    ID_EXPLORACAO INT
);

CREATE TABLE AVATAR (
    ID INT,
    ID_CIENT INT,
    MATERIAL_GENETICO VARCHAR(255),
    CONTROLADOR VARCHAR(100),
    PRIMARY KEY (ID, ID_CIENT)
);

CREATE TABLE PESQUISA (
    NOME VARCHAR(50) PRIMARY KEY,
    RESULTADO CHAR(1), --1 caractere para boolean (T e F, Y ou N, etc)
    QTD_EQUIP INT,
    NOME_EQUIP VARCHAR(50),
    UTILIDADE VARCHAR(100),
    CONSUMO_ENERGIA NUMBER, 
    ID_CIENTISTA INT,
    SIGLA_LAB VARCHAR(10),
    CONSTRAINT UQ_PESQUISA UNIQUE (ID_CIENTISTA, SIGLA_LAB)
);

CREATE TABLE EXPLORACAO (
    ID INT PRIMARY KEY,
    MODELO_MAQ VARCHAR(50),
    ID_JAZIDA INT,
    CONSTRAINT UQ_EXPLORACAO UNIQUE (ID_JAZIDA, MODELO_MAQ)
);

CREATE TABLE EMPRESA (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100)
);

CREATE TABLE MAQUINARIO (
    MODELO VARCHAR(50) PRIMARY KEY,
    PESO_OPERACIONAL VARCHAR(50),
    POTENCIA INT
);

CREATE TABLE ESCAVADEIRA (
    MODELO_MAQ VARCHAR(50) PRIMARY KEY,
    CAPACIDADE_PA NUMBER
);

CREATE TABLE CAMINHAO (
    MODELO_MAQ VARCHAR(50) PRIMARY KEY,
    CAPACIDADE_CACAMBA NUMBER
);

CREATE TABLE REALIZA (
    ID_EXPLORACAO INT,
    ID_EMPRESA INT,
    PRIMARY KEY (ID_EXPLORACAO, ID_EMPRESA)
);

CREATE TABLE JAZIDA (
    ID INT PRIMARY KEY,
    LATITUDE NUMBER,
    ALTURA NUMBER,
    LONGITUDE NUMBER,
    BASE NUMBER,
    ID_VALE INT,
    ID_MONTANHA INT,
    ID_PLANICIE INT
);

CREATE TABLE PLANICIE (
    ID INT PRIMARY KEY,
    TIPO_FLORA VARCHAR(255),
    POSSUI_RIO CHAR(1)
);

CREATE TABLE DIREHORSE (
    ID INT PRIMARY KEY,
    PATAS INT,
    ANTENAS INT,
    ID_VALE INT
);

CREATE TABLE DIREHORSE_HABITA_PLANICIE (
    ID_DIREHORSE INT,
    ID_PLANICIE INT,
    PRIMARY KEY (ID_DIREHORSE, ID_PLANICIE)
);

CREATE TABLE MONTANHA (
    ID INT PRIMARY KEY,
    ALTURA NUMBER,
    MOVIMENTA CHAR(1) --booleano
);

CREATE TABLE VALE (
    ID INT PRIMARY KEY,
    PROFUNDIDADE NUMBER,
    POSSUI_AGUA CHAR(1) --booleano
);

CREATE TABLE NAVI (
    ID INT PRIMARY KEY,
    ALTURA NUMBER,
    TAM_CALDA NUMBER,
    NOME VARCHAR(100),
    LIDER_CLA VARCHAR(100),
    ID_JAZIDA INT,
    LOCALIZACAO_ARVORE VARCHAR(100)
);

CREATE TABLE BIOLUMINESCENTES (
    ID_NAVI INT,
    BIOLUMINESCENTE VARCHAR(20),
    PRIMARY KEY (ID_NAVI, BIOLUMINESCENTE)
);

CREATE TABLE LEONOPTERYX (
    ID INT PRIMARY KEY,
    TAMANHO_ASA NUMBER,
    ID_VALE INT
);

CREATE TABLE LEONOPTERYX_HABITA_VALE (
    ID_LEONOPTERYX INT,
    ID_VALE INT,
    PRIMARY KEY (ID_LEONOPTERYX, ID_VALE)
);

CREATE TABLE CORES_LEONOPTERYX (
    ID_LEONOPTERYX INT,
    COR VARCHAR(50),
    PRIMARY KEY (ID_LEONOPTERYX, COR)
);

CREATE TABLE THANATORS (
    ID INT PRIMARY KEY,
    FORCA VARCHAR(50),
    VELOCIDADE_MAXIMA NUMBER,
    ID_VALE INT
);

CREATE TABLE THANATORS_HABITA_VALE (
    ID_THANATORS INT,
    ID_VALE INT,
    PRIMARY KEY (ID_THANATORS, ID_VALE)
);

CREATE TABLE BANSHEE (
    ID INT PRIMARY KEY,
    ALTURA_VOO NUMBER,
    COR VARCHAR(50),
    ID_MONTANHA INT
);

CREATE TABLE DOMA (
    ID_BANSHEE INT,
    ID_NAVI INT,
    PRIMARY KEY (ID_BANSHEE, ID_NAVI)
);

CREATE TABLE CLA (
    LIDER VARCHAR(100) PRIMARY KEY,
    NOME VARCHAR(50)
);

CREATE TABLE ARVORE_LAR (
    LOCALIZACAO VARCHAR(100) PRIMARY KEY,
    IDADE INT,
    ALTURA NUMBER
);

CREATE TABLE MORAM (
    LOCALIZACAO_ARVORE VARCHAR(100),
    LIDER_CLA VARCHAR(100),
    PRIMARY KEY (LOCALIZACAO_ARVORE, LIDER_CLA)
);

CREATE TABLE LEONOPTERYX_RELACIONA (
    ID_LEONOPTERYX1 INT,
    ID_LEONOPTERYX2 INT,
    PRIMARY KEY (ID_LEONOPTERYX1, ID_LEONOPTERYX2)
);

CREATE TABLE THANATORS_RELACIONA (
    ID_THANATORS1 INT,
    ID_THANATORS2 INT,
    PRIMARY KEY (ID_THANATORS1, ID_THANATORS2)
);

CREATE TABLE BANSHEE_RELACIONA (
    ID_BANSHEE1 INT,
    ID_BANSHEE2 INT,
    PRIMARY KEY (ID_BANSHEE1, ID_BANSHEE2)
);

CREATE TABLE NAVI_RELACIONA (
    ID_NAVI1 INT,
    ID_NAVI2 INT,
    PRIMARY KEY (ID_NAVI1, ID_NAVI2)
);

CREATE TABLE DIREHORSE_RELACIONA (
    ID_DIREHORSE1 INT,
    ID_DIREHORSE2 INT,
    PRIMARY KEY (ID_DIREHORSE1, ID_DIREHORSE2)
);

CREATE TABLE ARVORE_DA_ALMA (
    LOCALIZACAO VARCHAR(100) PRIMARY KEY,
    IDADE INT
);

CREATE TABLE ARVORE_DAS_VOZES (
    LOCALIZACAO VARCHAR(100) PRIMARY KEY,
    BIOLUMINESCENTES NUMBER
);

CREATE TABLE ARVORE_DA_VIDA (
    LOCALIZACAO VARCHAR(100) PRIMARY KEY,
    GERA_SEMENTES CHAR(1) --booleano
);

CREATE TABLE PROPRIEDADES_ARVORE_DA_VIDA (
    LOCALIZACAO_ARV VARCHAR(100),
    PROPRIEDADE VARCHAR(50),
    PRIMARY KEY (LOCALIZACAO_ARV, PROPRIEDADE)
);

CREATE TABLE ARVORE_DA_ALMA_CONECTA_THANATORS (
    LOCALIZACAO_ARV VARCHAR(100),
    ID_THANATORS INT,
    PRIMARY KEY (LOCALIZACAO_ARV, ID_THANATORS)
);

CREATE TABLE ARVORE_DA_ALMA_CONECTA_LEONOPTERYX (
    LOCALIZACAO_ARV VARCHAR(100),
    ID_LEONOPTERYX INT,
    PRIMARY KEY (LOCALIZACAO_ARV, ID_LEONOPTERYX)
);

CREATE TABLE ARVORE_DA_ALMA_CONECTA_DIREHORSE (
    LOCALIZACAO_ARV VARCHAR(100),
    ID_DIREHORSE INT,
    PRIMARY KEY (LOCALIZACAO_ARV, ID_DIREHORSE)
);

CREATE TABLE ARVORE_DA_ALMA_CONECTA_BANSHEE (
    LOCALIZACAO_ARV VARCHAR(100),
    ID_BANSHEE INT,
    PRIMARY KEY (LOCALIZACAO_ARV, ID_BANSHEE)
);

CREATE TABLE ARVORE_DA_ALMA_CONECTA_NAVI (
    LOCALIZACAO_ARV VARCHAR(100),
    ID_NAVI INT,
    PRIMARY KEY (LOCALIZACAO_ARV, ID_NAVI)
);

CREATE TABLE PLANICIE_POSSUI_ARV_LAR (
    ID_PLANICIE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_PLANICIE, LOCALIZACAO_ARVORE)
);

CREATE TABLE MONTANHA_POSSUI_ARV_LAR (
    ID_MONTANHA INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_MONTANHA, LOCALIZACAO_ARVORE)
);

CREATE TABLE VALE_POSSUI_ARV_LAR (
    ID_VALE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_VALE, LOCALIZACAO_ARVORE)
);

CREATE TABLE PLANICIE_POSSUI_ARV_VIDA (
    ID_PLANICIE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_PLANICIE, LOCALIZACAO_ARVORE)
);

CREATE TABLE MONTANHA_POSSUI_ARV_VIDA (
    ID_MONTANHA INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_MONTANHA, LOCALIZACAO_ARVORE)
);

CREATE TABLE VALE_POSSUI_ARV_VIDA (
    ID_VALE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_VALE, LOCALIZACAO_ARVORE)
);

CREATE TABLE PLANICIE_POSSUI_ARV_VOZES (
    ID_PLANICIE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_PLANICIE, LOCALIZACAO_ARVORE)
);

CREATE TABLE MONTANHA_POSSUI_ARV_VOZES (
    ID_MONTANHA INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_MONTANHA, LOCALIZACAO_ARVORE)
);

CREATE TABLE VALE_POSSUI_ARV_VOZES (
    ID_VALE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_VALE, LOCALIZACAO_ARVORE)
);

CREATE TABLE PLANICIE_POSSUI_ARV_ALMA (
    ID_PLANICIE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_PLANICIE, LOCALIZACAO_ARVORE)
);

CREATE TABLE MONTANHA_POSSUI_ARV_ALMA (
    ID_MONTANHA INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_MONTANHA, LOCALIZACAO_ARVORE)
);

CREATE TABLE VALE_POSSUI_ARV_ALMA (
    ID_VALE INT,
    LOCALIZACAO_ARVORE VARCHAR(100),
    PRIMARY KEY (ID_VALE, LOCALIZACAO_ARVORE)
);

ALTER TABLE COLONIA ADD CONSTRAINT FK_ID_EMPRESA FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(ID);
ALTER TABLE COLONIA ADD CONSTRAINT FK_ID_JAZIDA FOREIGN KEY (ID_JAZIDA) REFERENCES JAZIDA(ID);

ALTER TABLE COLONIA_FORMADA_LAB ADD CONSTRAINT SIGLA_LAB FOREIGN KEY (SIGLA_LAB) REFERENCES LABORATORIO(SIGLA);
ALTER TABLE COLONIA_FORMADA_LAB ADD CONSTRAINT SIGLA_COLONIA FOREIGN KEY (SIGLA_COLONIA) REFERENCES COLONIA(SIGLA);

ALTER TABLE COLONIA_FORMADA_RES ADD CONSTRAINT SIGLA_RESID FOREIGN KEY (SIGLA_RESID) REFERENCES RESIDENCIA(SIGLA);
ALTER TABLE COLONIA_FORMADA_RES ADD CONSTRAINT SIGLA_COLONIA_CFR FOREIGN KEY (SIGLA_COLONIA) REFERENCES COLONIA(SIGLA);

ALTER TABLE COLONIA_FORMADA_DEP ADD CONSTRAINT SIGLA_DEP_CFD FOREIGN KEY (SIGLA_DEP) REFERENCES DEPOSITO(SIGLA);
ALTER TABLE COLONIA_FORMADA_DEP ADD CONSTRAINT SIGLA_COLONIA_CFD FOREIGN KEY (SIGLA_COLONIA) REFERENCES COLONIA(SIGLA);

ALTER TABLE MINERADOR ADD CONSTRAINT ID_EXPLORACAO_MINERADOR FOREIGN KEY (ID_EXPLORACAO) REFERENCES EXPLORACAO(ID);

ALTER TABLE MILITAR ADD CONSTRAINT ID_EXPLORACAO_MILITAR FOREIGN KEY (ID_EXPLORACAO) REFERENCES EXPLORACAO(ID);

ALTER TABLE CIENTISTA ADD CONSTRAINT SIGLA_LAB_CIENTISTA FOREIGN KEY (SIGLA_LAB) REFERENCES LABORATORIO(SIGLA);
ALTER TABLE CIENTISTA ADD CONSTRAINT ID_EXPLORACAO_CIENTISTA FOREIGN KEY (ID_EXPLORACAO) REFERENCES EXPLORACAO(ID);

ALTER TABLE AVATAR ADD CONSTRAINT ID_CIENT_AVATAR FOREIGN KEY (ID_CIENT) REFERENCES CIENTISTA(ID);

ALTER TABLE PESQUISA ADD CONSTRAINT ID_CIENTISTA_PESQUISA FOREIGN KEY (ID_CIENTISTA) REFERENCES CIENTISTA(ID);
ALTER TABLE PESQUISA ADD CONSTRAINT SIGLA_LAB_PESQUISA FOREIGN KEY (SIGLA_LAB) REFERENCES LABORATORIO(SIGLA);

ALTER TABLE EXPLORACAO ADD CONSTRAINT MODELO_MAQ_EXPLORACAO FOREIGN KEY (MODELO_MAQ) REFERENCES MAQUINARIO(MODELO);
ALTER TABLE EXPLORACAO ADD CONSTRAINT ID_JAZIDA_EXPLORACAO FOREIGN KEY (ID_JAZIDA) REFERENCES JAZIDA(ID);

ALTER TABLE ESCAVADEIRA ADD CONSTRAINT MODELO_MAQ_ESCAVADEIRA FOREIGN KEY (MODELO_MAQ) REFERENCES MAQUINARIO(MODELO);

ALTER TABLE CAMINHAO ADD CONSTRAINT MODELO_MAQ_CAMINHAO FOREIGN KEY (MODELO_MAQ) REFERENCES MAQUINARIO(MODELO);

ALTER TABLE REALIZA ADD CONSTRAINT ID_EXPLORACAO_REALIZA FOREIGN KEY (ID_EXPLORACAO) REFERENCES EXPLORACAO(ID);
ALTER TABLE REALIZA ADD CONSTRAINT ID_EMPRESA_REALIZA FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(ID);

ALTER TABLE JAZIDA ADD CONSTRAINT ID_VALE_JAZIDA FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);
ALTER TABLE JAZIDA ADD CONSTRAINT ID_MONTANHA_JAZIDA FOREIGN KEY (ID_MONTANHA) REFERENCES MONTANHA(ID);
ALTER TABLE JAZIDA ADD CONSTRAINT ID_PLANICIE_JAZIDA FOREIGN KEY (ID_PLANICIE) REFERENCES PLANICIE(ID);

ALTER TABLE DIREHORSE ADD CONSTRAINT ID_VALE_DIREHORSE FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);

ALTER TABLE DIREHORSE_HABITA_PLANICIE ADD CONSTRAINT ID_DIREHORSE_DHP FOREIGN KEY (ID_DIREHORSE) REFERENCES DIREHORSE(ID);
ALTER TABLE DIREHORSE_HABITA_PLANICIE ADD CONSTRAINT ID_PLANICIE_DHP FOREIGN KEY (ID_PLANICIE) REFERENCES PLANICIE(ID);

ALTER TABLE LEONOPTERYX ADD CONSTRAINT ID_VALE_LEONOPTERYX FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);

ALTER TABLE LEONOPTERYX_HABITA_VALE ADD CONSTRAINT ID_LEONOPTERYX_LHV FOREIGN KEY (ID_LEONOPTERYX) REFERENCES LEONOPTERYX(ID);
ALTER TABLE LEONOPTERYX_HABITA_VALE ADD CONSTRAINT ID_VALE_LHV FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);
ALTER TABLE CORES_LEONOPTERYX ADD CONSTRAINT ID_LEONOPTERYX_CL FOREIGN KEY (ID_LEONOPTERYX) REFERENCES LEONOPTERYX(ID);

ALTER TABLE THANATORS ADD CONSTRAINT ID_VALE_THANATORS FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);
ALTER TABLE THANATORS_HABITA_VALE ADD CONSTRAINT ID_THANATORS_THV FOREIGN KEY (ID_THANATORS) REFERENCES THANATORS(ID);
ALTER TABLE THANATORS_HABITA_VALE ADD CONSTRAINT ID_VALE_THV FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);

ALTER TABLE BANSHEE ADD CONSTRAINT ID_MONTANHA_BANSHEE FOREIGN KEY (ID_MONTANHA) REFERENCES MONTANHA(ID);

ALTER TABLE DOMA ADD CONSTRAINT ID_BANSHEE_ FOREIGN KEY (ID_BANSHEE) REFERENCES BANSHEE(ID);
ALTER TABLE DOMA ADD CONSTRAINT ID_NAVI_ FOREIGN KEY (ID_NAVI) REFERENCES NAVI(ID);

ALTER TABLE NAVI ADD CONSTRAINT LIDER_CLA_NAVI FOREIGN KEY (LIDER_CLA) REFERENCES CLA(LIDER);
ALTER TABLE NAVI ADD CONSTRAINT ID_JAZIDA_NAVI FOREIGN KEY (ID_JAZIDA) REFERENCES JAZIDA(ID);
ALTER TABLE NAVI ADD CONSTRAINT LOCALIZACAO_ARVORE_NAVI FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);
ALTER TABLE BIOLUMINESCENTES ADD CONSTRAINT ID_NAVI_BIOLUMINESCENTES FOREIGN KEY (ID_NAVI) REFERENCES NAVI(ID);

ALTER TABLE MORAM ADD CONSTRAINT LOCALIZACAO_ARVORE_MORAM FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_LAR(LOCALIZACAO);
ALTER TABLE MORAM ADD CONSTRAINT LIDER_CLA_MORAM FOREIGN KEY (LIDER_CLA) REFERENCES CLA(LIDER);

ALTER TABLE LEONOPTERYX_RELACIONA ADD CONSTRAINT ID_LEONOPTERYX1_LR FOREIGN KEY (ID_LEONOPTERYX1) REFERENCES LEONOPTERYX(ID);
ALTER TABLE LEONOPTERYX_RELACIONA ADD CONSTRAINT ID_LEONOPTERYX2_LR FOREIGN KEY (ID_LEONOPTERYX2) REFERENCES LEONOPTERYX(ID);

ALTER TABLE THANATORS_RELACIONA ADD CONSTRAINT ID_THANATORS1_TR FOREIGN KEY (ID_THANATORS1) REFERENCES THANATORS(ID);
ALTER TABLE THANATORS_RELACIONA ADD CONSTRAINT ID_THANATORS2_TR FOREIGN KEY (ID_THANATORS2) REFERENCES THANATORS(ID);

ALTER TABLE BANSHEE_RELACIONA ADD CONSTRAINT ID_BANSHEE1_BR FOREIGN KEY (ID_BANSHEE1) REFERENCES BANSHEE(ID);
ALTER TABLE BANSHEE_RELACIONA ADD CONSTRAINT ID_BANSHEE2_BR FOREIGN KEY (ID_BANSHEE2) REFERENCES BANSHEE(ID);

ALTER TABLE NAVI_RELACIONA ADD CONSTRAINT ID_NAVI1_NR FOREIGN KEY (ID_NAVI1) REFERENCES NAVI(ID);
ALTER TABLE NAVI_RELACIONA ADD CONSTRAINT ID_NAVI2_NR FOREIGN KEY (ID_NAVI2) REFERENCES NAVI(ID);

ALTER TABLE DIREHORSE_RELACIONA ADD CONSTRAINT ID_DIREHORSE1_DR FOREIGN KEY (ID_DIREHORSE1) REFERENCES DIREHORSE(ID);
ALTER TABLE DIREHORSE_RELACIONA ADD CONSTRAINT ID_DIREHORSE2_DR FOREIGN KEY (ID_DIREHORSE2) REFERENCES DIREHORSE(ID);

ALTER TABLE ARVORE_DA_ALMA_CONECTA_THANATORS ADD CONSTRAINT LOCALIZACAO_ARV_ADACT FOREIGN KEY (LOCALIZACAO_ARV) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);
ALTER TABLE ARVORE_DA_ALMA_CONECTA_THANATORS ADD CONSTRAINT ID_THANATORS_ADACT FOREIGN KEY (ID_THANATORS) REFERENCES THANATORS(ID);

ALTER TABLE ARVORE_DA_ALMA_CONECTA_LEONOPTERYX ADD CONSTRAINT LOCALIZACAO_ARV_ADACL FOREIGN KEY (LOCALIZACAO_ARV) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);
ALTER TABLE ARVORE_DA_ALMA_CONECTA_LEONOPTERYX ADD CONSTRAINT ID_LEONOPTERYX_ADACL FOREIGN KEY (ID_LEONOPTERYX) REFERENCES LEONOPTERYX(ID);

ALTER TABLE ARVORE_DA_ALMA_CONECTA_DIREHORSE ADD CONSTRAINT LOCALIZACAO_ARV_ADACD FOREIGN KEY (LOCALIZACAO_ARV) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);
ALTER TABLE ARVORE_DA_ALMA_CONECTA_DIREHORSE ADD CONSTRAINT ID_DIREHORSE_ADACD FOREIGN KEY (ID_DIREHORSE) REFERENCES DIREHORSE(ID);

ALTER TABLE ARVORE_DA_ALMA_CONECTA_BANSHEE ADD CONSTRAINT LOCALIZACAO_ARV_ADACB FOREIGN KEY (LOCALIZACAO_ARV) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);
ALTER TABLE ARVORE_DA_ALMA_CONECTA_BANSHEE ADD CONSTRAINT ID_BANSHEE_ADACB FOREIGN KEY (ID_BANSHEE) REFERENCES BANSHEE(ID);

ALTER TABLE ARVORE_DA_ALMA_CONECTA_NAVI ADD CONSTRAINT LOCALIZACAO_ARV_ADACN FOREIGN KEY (LOCALIZACAO_ARV) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);
ALTER TABLE ARVORE_DA_ALMA_CONECTA_NAVI ADD CONSTRAINT ID_NAVI_ADACN FOREIGN KEY (ID_NAVI) REFERENCES NAVI(ID);

ALTER TABLE PLANICIE_POSSUI_ARV_LAR ADD CONSTRAINT ID_PLANICIE_PPAL FOREIGN KEY (ID_PLANICIE) REFERENCES PLANICIE(ID);
ALTER TABLE PLANICIE_POSSUI_ARV_LAR ADD CONSTRAINT LOCALIZACAO_ARVORE_PPAL FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_LAR(LOCALIZACAO);

ALTER TABLE MONTANHA_POSSUI_ARV_LAR ADD CONSTRAINT ID_MONTANHA_MPAL FOREIGN KEY (ID_MONTANHA) REFERENCES MONTANHA(ID);
ALTER TABLE MONTANHA_POSSUI_ARV_LAR ADD CONSTRAINT LOCALIZACAO_ARVORE_MPAL FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_LAR(LOCALIZACAO);

ALTER TABLE VALE_POSSUI_ARV_LAR ADD CONSTRAINT ID_VALE_VPAL FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);
ALTER TABLE VALE_POSSUI_ARV_LAR ADD CONSTRAINT LOCALIZACAO_ARVORE_VPAL FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_LAR(LOCALIZACAO);

ALTER TABLE PLANICIE_POSSUI_ARV_VIDA ADD CONSTRAINT ID_PLANICIE_PPAV FOREIGN KEY (ID_PLANICIE) REFERENCES PLANICIE(ID);
ALTER TABLE PLANICIE_POSSUI_ARV_VIDA ADD CONSTRAINT LOCALIZACAO_ARVORE_PPAV FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DA_VIDA(LOCALIZACAO);

ALTER TABLE MONTANHA_POSSUI_ARV_VIDA ADD CONSTRAINT ID_MONTANHA_MPAV FOREIGN KEY (ID_MONTANHA) REFERENCES MONTANHA(ID);
ALTER TABLE MONTANHA_POSSUI_ARV_VIDA ADD CONSTRAINT LOCALIZACAO_ARVORE_MPAV FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DA_VIDA(LOCALIZACAO);

ALTER TABLE VALE_POSSUI_ARV_VIDA ADD CONSTRAINT ID_VALE_VPAV FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);
ALTER TABLE VALE_POSSUI_ARV_VIDA ADD CONSTRAINT LOCALIZACAO_ARVORE_VPAV FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DA_VIDA(LOCALIZACAO);

ALTER TABLE PLANICIE_POSSUI_ARV_VOZES ADD CONSTRAINT ID_PLANICIE_PPAV2 FOREIGN KEY (ID_PLANICIE) REFERENCES PLANICIE(ID);
ALTER TABLE PLANICIE_POSSUI_ARV_VOZES ADD CONSTRAINT LOCALIZACAO_ARVORE_PPAV2 FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DAS_VOZES(LOCALIZACAO);

ALTER TABLE MONTANHA_POSSUI_ARV_VOZES ADD CONSTRAINT ID_MONTANHA_MPAV2 FOREIGN KEY (ID_MONTANHA) REFERENCES MONTANHA(ID);
ALTER TABLE MONTANHA_POSSUI_ARV_VOZES ADD CONSTRAINT LOCALIZACAO_ARVORE_MPAV2 FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DAS_VOZES(LOCALIZACAO);

ALTER TABLE VALE_POSSUI_ARV_VOZES ADD CONSTRAINT ID_VALE_VPAV2 FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);
ALTER TABLE VALE_POSSUI_ARV_VOZES ADD CONSTRAINT LOCALIZACAO_ARVORE_VPAV2 FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DAS_VOZES(LOCALIZACAO);

ALTER TABLE PLANICIE_POSSUI_ARV_ALMA ADD CONSTRAINT ID_PLANICIE_PPAV3 FOREIGN KEY (ID_PLANICIE) REFERENCES PLANICIE(ID);
ALTER TABLE PLANICIE_POSSUI_ARV_ALMA ADD CONSTRAINT LOCALIZACAO_ARVORE_PPAV3 FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);

ALTER TABLE MONTANHA_POSSUI_ARV_ALMA ADD CONSTRAINT ID_MONTANHA_MPAV3 FOREIGN KEY (ID_MONTANHA) REFERENCES MONTANHA(ID);
ALTER TABLE MONTANHA_POSSUI_ARV_ALMA ADD CONSTRAINT LOCALIZACAO_ARVORE_MPAV3 FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);

ALTER TABLE VALE_POSSUI_ARV_ALMA ADD CONSTRAINT ID_VALE_VPAV3 FOREIGN KEY (ID_VALE) REFERENCES VALE(ID);
ALTER TABLE VALE_POSSUI_ARV_ALMA ADD CONSTRAINT LOCALIZACAO_ARVORE_VPAV3 FOREIGN KEY (LOCALIZACAO_ARVORE) REFERENCES ARVORE_DA_ALMA(LOCALIZACAO);