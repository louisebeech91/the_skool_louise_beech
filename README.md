# the_skool_louise_beech

SQL analysis of the 2025 YH application round (MYH) for The Skool, exploring which education programs get approved or rejected in order to make relevant data-driven decisions.

## Uppgift 0 – Förberedelser och dataimport

- Skapade repot the_skool_louise_beech på GitHub, samt [.gitignore](https://github.com/louisebeech91/the_skool_louise_beech/blob/main/.gitignore) 
- Laddade ned Tabell 3 från Excel som CSV UTF-8 (för att å, ä och ö ska bli rätt). 
- Rensade CSV-filen: 
    - Tog bort de sex översta raderna (titel, beskrivning, tomma rader) så att rubrikraden hamnade på rad 1.
    - Bytte kolumnnamn till endast gemener utan å/ä/ö och utan mellanslag för att slippa skriva citattecken i SQL. 
    - Noterade att 17 rader i kolumnen för seqf nivå är tomma. 
- Repot ligger på en Oracle Linux-VM (VirtualBox). Filen skickades dit med scp och versionshanteras därifrån med git.
- SQLcl körs i en container via orac och ser bara mappar som är monterade i compose.yaml. 
- Monterade mitt repo i sqlcl-tjänsten (...the_skool_louise_beech:/the_skool:Z), så att skript och data syns i containern.  
- [Skapade tabell](sql/create_table.sql).
- [Importerade data](https://github.com/louisebeech91/the_skool_louise_beech/blob/main/sql/load_data.sql).

## Uppgift 1 – Grundläggande EDA

[sql/01_EDA.sql](sql/01_EDA.sql)

a) Antal ansökningar per utbildningsområde, sorterat på flest ansökningar
b) Antal BEVILJADE ansökningar per utbildningsområde
c) Antal AVSLAGNA ansökningar per utbildningsområde
d) Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT
e) Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT
f) Antal BEVILJADE ansökningar per utbildningsanordnare administrativ enhet & utbildningsnamn, inom Data/IT
g) Topp 5 län efter antal beviljade ansökningar
h) Andel distans och andel bundna utbildningar inom respektive utbildingsområde
i) Antal utbildningar som innehåller ordet AI

### Utdrag 


## Uppgift 2 – Intervju med domänexpert

*"En stakeholder och domänexpert kommer gästa klassen och du får möjliget att ställa frågor."* 

Anteckningar --> [notes/stakeholder_interview.md](https://github.com/louisebeech91/the_skool_louise_beech/tree/main/notes)

## Uppgift 3 – Datadrivna beslut

[sql/03_datadrivna_beslut.sql](sql/03_datadrivna_beslut.sql)

Ett urval av frågor som utifrån 2025 års ansökningsresultat från MYH ska hjälpa The Skool att utforma ansökningar med större chans att beviljas. En träffsäker ansökan kan kan bespara dem betydande kostnader i form av arbetstid och förberedelser.    

1. Vilka utbildningsområden har högst andel beviljade?
2. Skiljer det sig mellan privat och kommun, per område?
3. Skiljer det sig mellan distans eller bunden, per område?
4. Hur skiljer det sig geografiskt över Sveriges län?

__SLUTSATS:__ Skillnaderna mellan länen verkar inte bara bero på geografi utan också på vilka utbildningsområden ansökningarna gäller. Min rekommendation till The Skool för att maximera sina chanser till ett beviljande hade varit att i första hand överväga platsbundna utbildningar inom tex hälso- och sjukvård, teknik och tillverkning eller samhällsbyggnad. Data/IT verkar vara ett betydligt mer konkurrensutsatt område och eventuellt "mättat" utbildningsområde, vilket innebär att en ansökan behöver vara särskilt stark eller kraftigt nischad för att beviljas. Geografiskt kan det även vara värt att undersöka möjligheter utanför de största storstadsregionerna där beviljandegraden ofta är högre.

## Uppgift 4 – Datamodell (bonus)
--

## Video och presentation
Länk till presentation.

## Kom igång

### Du behöver
- Oracle26ai Free och SQLcl, körda i containrar med podman (`podman-compose`)
- Git

### Steg
1. Klona repot med `git clone`
2. Montera repot i SQLcl-containern. Lägg till raden nedan under `volumes:`
   för sqlcl-tjänsten i din `compose.yaml` (byt ut sökvägen mot var du klonade repot):
   ```
   - /sökväg/till/the_skool_louise_beech:/the_skool:Z
   ```
   Skripten förutsätter att repot heter `/the_skool` i containern.
3. Starta databasen och SQLcl.
4. Kör skripten i denna ordning, från SQLcl:
   ```
   @/the_skool/sql/create_table.sql
   @/the_skool/sql/load_data.sql
   @/the_skool/sql/01_eda.sql
   @/the_skool/sql/03_data_driven_decisions.sql
   ```

## Användning av LLM
Claude har främst använts som bollplank för frågor och felsökning men även:
- Generera kolumnnamn i gemener utan å/ä/ö, mellanslag och specialtecken.
- Diskutera olika sätt att matcha ordet AI (LIKE mot REGEXP_LIKE). 
- Hjälp med tillvägagångssätt för att montera repo i SQLcl-tjänsten.
