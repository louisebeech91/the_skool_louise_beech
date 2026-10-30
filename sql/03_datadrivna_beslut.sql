SET PAGESIZE 100

-- Ett urval av frågor som utifrån 2025 års ansökningsresultat från MYH ska hjälpa The Skool att utforma ansökningar med större chans att beviljas. En träffsäker ansökan kan kan bespara dem betydande kostnader i form av arbetstid och förberedelser.    

-- FRÅGA 1. Vilka utbildningsområden har högst andel beviljade?
-- Intressant att se om man kan se högre andel beviljade ansökningar inom ett eller flera specifika områden. Att titta extra på är Data/IT som nämndes vara ett mättat område.

SELECT utbildningsomrade, COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslagna,
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*)) || '%' AS andel_beviljade,
    ROUND(COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) * 100 / COUNT(*)) || '%' AS andel_avslag
FROM ansokningar
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

-- SLUTSATS: Data/IT är området med lägst andel beviljade ansökningar (14%) vilket man skulle kunna tolka som att området är mättat, särskilt om man ser till andra större områden där andelen beviljade är högre.


-- FRÅGA 2. Skiljer det sig mellan privat och kommun, per område?
-- Som privat aktör är det intressant att undersöka skillnader mellan beviljade ansökningar per utbildningsområde för privata respektive offentliga aktörer. Visar om akademin konkurrerar med aktörer som har andra förutsättningar.
-- OBS kommun och region har slagits ihop till "offentlig aktör" pga region endast stod för 24 ansökningar och det är jämförelsen mellan privat och offentlig som är viktig. 

-- Offentliga aktörer (kommun och region sammanslaget)
SELECT utbildningsomrade, COUNT(*) AS antal_ansokningar,
    'Offentlig' AS aktorstyp,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslagna,
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*)) || '%' AS andel_beviljade,
    ROUND(COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) * 100 / COUNT(*)) || '%' AS andel_avslag
FROM ansokningar
WHERE huvudmannatyp = 'Kommun'
    OR huvudmannatyp = 'Region'
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

-- Privata aktörer
SELECT utbildningsomrade, COUNT(*) AS antal_ansokningar,
    'Privat' AS aktorstyp,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslagna,
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*)) || '%' AS andel_beviljade,
    ROUND(COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) * 100 / COUNT(*)) || '%' AS andel_avslag
FROM ansokningar
WHERE huvudmannatyp = 'Privat'
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

-- SLUTSATS: Konkurrensen från offentliga aktörer är hårdast i Teknik & tillverkning och Hälso- sjukvård & socialt arbete, så där är det svårare att nå samma nivå. Andelen beviljade ansökningar inom Data/IT är bland de lägsta även för offentlig aktör.
-- Det är lite svårt att jämföra offentligt mot privat då antalet ansökningar skiljer sig nämnvärt.


-- FRÅGA 3. Skiljer det sig mellan distans eller bunden, per område?
-- Beroende på vilket utbildningsområde, är det intressant att se om det är fördelaktigt att hålla en utbildning på distans eller på plats.

SELECT
    utbildningsomrade, 
    studieform, 
    COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslagna,
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*)) AS andel_beviljade_procent,
    ROUND(COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) * 100 / COUNT(*)) AS andel_avslagna_procent
FROM ansokningar
GROUP BY utbildningsomrade,studieform
ORDER BY andel_beviljade_procent DESC;

-- SLUTSATS: Platsbunden har högre andel beviljade i alla områden där båda formerna har rimligt många ansökningar. Inom Data/IT är båda låga (16 % mot 7 %), så även om bunden är bättre, så är området svårt oavsett studieform. Eftersom The Skool har resurser att hyra lokal och är flexibla med plats, så är platsbunden utbildning en rekommendation, det ökar chansen i alla områden vi kan jämföra. 


-- FRÅGA 4. Hur skiljer det sig geografiskt över Sveriges län?
-- För att följa upp rekommendationen om att välja platsbunden utbildning kommer här en tabell på geografisk fördelning beroende på vilket utbildningsområde man väljer att rikta in sig mot. 


SELECT lan,
       COUNT(*) AS antal_ansokningar,
       COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
       ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*)) AS andel_beviljade_procent
FROM ansokningar
GROUP BY lan
ORDER BY andel_beviljade_procent DESC;

-- SLUTSATS: Mest konkurrens finns i storstäderna (Malmö, Göteborg och Stockholm) om man ser till antalet ansökningar per län (Skåne,Västra Götaland och Stockholm), men beviljandegraden är högre i andra län, dock betydligt färre ansökningar.

-- Län med högst beviljandegrad inom utbildningsområden med minst 10 ansökningar:

SELECT
    lan,
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*)) AS andel_beviljade_procent
FROM ansokningar
GROUP BY lan, utbildningsomrade
HAVING COUNT(*) >= 10
ORDER BY lan, andel_beviljade_procent DESC; 

-- SLUTSATS: Skillnaderna mellan länen verkar inte bara bero på geografi utan också på vilka utbildningsområden ansökningarna gäller. Min rekommendation till The Skool för att maximera sina chanser till ett beviljande hade varit att i första hand överväga platsbundna utbildningar inom tex hälso- och sjukvård, teknik och tillverkning eller samhällsbyggnad. Data/IT verkar vara ett betydligt mer konkurrensutsatt område och eventuellt "mättat" utbildningsområde, vilket innebär att en ansökan behöver vara särskilt stark eller kraftigt nischad för att beviljas. Geografiskt kan det även vara värt att undersöka möjligheter utanför de största storstadsregionerna där beviljandegraden ofta är högre.

EXIT
