SET PAGESIZE 100
DESC system.ansokningar;

-- a) Antal ansökningar per utbildningsområde, sorterat på flest ansökningar

SELECT utbildningsomrade, 
    COUNT(*) AS antal_ansokningar
FROM ansokningar
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;


-- b) Antal BEVILJADE ansökningar per utbildningsområde

SELECT utbildningsomrade,
    COUNT(*) AS antal_beviljade
FROM ansokningar
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade
ORDER BY antal_beviljade DESC;
 

-- c) Antal AVSLAGNA ansökningar per utbildningsområde

SELECT utbildningsomrade,
    COUNT(*) AS antal_avslagna
FROM ansokningar
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade
ORDER BY antal_avslagna DESC;

-- b,c)

SELECT utbildningsomrade,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslagna
FROM ansokningar
GROUP BY utbildningsomrade
ORDER BY antal_beviljade DESC;


-- d) Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT

SELECT utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokningar
WHERE beslut = 'Beviljad'
    AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn 
ORDER BY antal_beviljade DESC;


-- e) Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT

SELECT utbildningsnamn,
    COUNT(*) AS antal_avslagna
FROM ansokningar
WHERE beslut = 'Avslag'
    AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn 
ORDER BY antal_avslagna DESC;


-- f) Antal BEVILJADE ansökningar per utbildningsanordnare administrativ enhet & utbildningsnamn, inom Data/IT

SELECT 
    utbildningsnamn,
    utbildningsanordnare,
    COUNT(*) AS antal_beviljade
FROM ansokningar
WHERE beslut = 'Beviljad'
    AND utbildningsomrade = 'Data/IT'
GROUP BY 
    utbildningsnamn,
    utbildningsanordnare  
ORDER BY antal_beviljade DESC;


-- g) Topp 5 län efter antal beviljade ansökningar

SELECT lan,
    COUNT(*) AS antal_beviljade
FROM ansokningar
WHERE beslut = 'Beviljad'
GROUP BY lan
ORDER BY antal_beviljade DESC
FETCH FIRST 5 ROWS ONLY;

-- 'flera kommuner' exkluderad

SELECT lan,
    COUNT(*) AS antal_beviljade
FROM ansokningar
WHERE beslut = 'Beviljad'
    AND lan <> 'Flera kommuner'
GROUP BY lan
ORDER BY antal_beviljade DESC
FETCH FIRST 5 ROWS ONLY;


-- h) Andel distans och andel bundna utbildningar inom respektive utbildingsområde


-- i) Antal utbildningar som innehåller ordet AI



EXIT
