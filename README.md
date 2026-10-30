# the_skool_louise_beech
SQL analysis of the 2025 YH application round (MYH) for The Skool, exploring which education programs get approved or rejected in order to make relevant data-driven decisions.

## Uppgift 0 – Förberedelser och dataimport
- Skapade repot the_skool_louise_beech på GitHub, samt [.gitignore](https://github.com/louisebeech91/the_skool_louise_beech/blob/main/.gitignore) 
- Laddade ned Tabell 3 från Excel som CSV UTF-8 (för att å, ä och ö ska bli rätt). 
- Rensade CSV-filen: 
    - tog bort de sex översta raderna (titel, beskrivning, tomma rader) så att rubrikraden hamnade på rad 1.
    - bytte kolumnnamn till endast gemener utan å/ä/ö och utan mellanslag för att slippa skriva citattecken i SQL. 
    - Noterade att 17 rader i kolumnen för seqf nivå är tomma. 
- Repot ligger på en Oracle Linux-VM (VirtualBox). Filen skickades dit med scp och versionshanteras därifrån med git. 
- [Skapade tabell](sql/create_table.sql)
- [Importerade data](https://github.com/louisebeech91/the_skool_louise_beech/blob/main/sql/load_data.sql)

## Uppgift 1 – Grundläggande EDA


## Uppgift 2 – Intervju med domänexpert
Länk till `notes/stakeholder_interview.md`.

## Uppgift 3 – Datadrivna beslut

## Uppgift 4 – Datamodell (bonus)

## Video och presentation
Länk till presentation.

## Användning av LLM
Claude har använts som bollplank för frågor och felsökning.

