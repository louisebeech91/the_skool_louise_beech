CREATE TABLE IF NOT EXISTS ansokningar (
    utbildningsomrade           VARCHAR2(100 CHAR),
    sun5_inriktning             VARCHAR2(20 CHAR),
    sun5_inriktning_namn        VARCHAR2(200 CHAR),
    utbildningsnamn             VARCHAR2(200 CHAR),
    beslut                      VARCHAR2(20 CHAR),
    diarienummer                VARCHAR2(30 CHAR),
    flera_kommuner              VARCHAR2(3 CHAR),
    antal_kommuner              NUMBER(3),
    lan                         VARCHAR2(50 CHAR),
    kommun                      VARCHAR2(100 CHAR),
    yh_poang                    NUMBER(4),
    studieform                  VARCHAR2(20 CHAR),
    studietakt_procent          NUMBER(3),
    examenstyp                  VARCHAR2(100 CHAR),
    seqf_niva                   NUMBER(1),
    smalt_yrkesomrade           VARCHAR2(50 CHAR),
    utbildningsanordnare        VARCHAR2(200 CHAR),
    huvudmannatyp               VARCHAR2(30 CHAR),
    sokta_omgangar              NUMBER(2),
    beviljade_omgangar          NUMBER(2),
    sokta_platser_per_omgang    NUMBER(4),
    sokta_platser_totalt        NUMBER(5),
    beviljade_platser_omgang_1  NUMBER(4),
    beviljade_platser_omgang_2  NUMBER(4),
    beviljade_platser_omgang_3  NUMBER(4),
    beviljade_platser_omgang_4  NUMBER(4),
    beviljade_platser_omgang_5  NUMBER(4),
    beviljade_platser_totalt    NUMBER(5)
); 

EXIT

