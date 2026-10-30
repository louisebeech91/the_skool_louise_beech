SET PAGESIZE 100

-- Vilka utbildningsområden har högst andel beviljade?

SELECT utbildningsomrade, COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslagna,
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.00 / COUNT(*)) || '%' AS andel_beviljade,
    ROUND(COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) * 100.00 / COUNT(*)) || '%' AS andel_avslag
FROM ansokningar
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

-- Skiljer det sig mellan privat och kommun, per område?

-- Offentliga aktörer (kommun och region sammanslaget)
SELECT utbildningsomrade, COUNT(*) AS antal_ansokningar,
    'Offentlig' AS aktorstyp,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslagna,
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.00 / COUNT(*)) || '%' AS andel_beviljade,
    ROUND(COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) * 100.00 / COUNT(*)) || '%' AS andel_avslag
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
    ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.00 / COUNT(*)) || '%' AS andel_beviljade,
    ROUND(COUNT(CASE WHEN beslut = 'Avslag' THEN 1 END) * 100.00 / COUNT(*)) || '%' AS andel_avslag
FROM ansokningar
WHERE huvudmannatyp = 'Privat'
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;


-- Omgångar och platser, beviljat jämfört med sökt?



-- Vad har beviljade ansökningar gemensamt?


-- Skiljer det sig mellan distans eller bunden, per område?


-- Lucka på högre SeQF-nivåer?



EXIT
