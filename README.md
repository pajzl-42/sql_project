Datová akademie ENGETO 04-2022 - SQL Projekt

Autor: Jan Tásler
E-mail: jan.tasler@gmail.com

Info k jednotlivým souborům:

main.sql
- SQL Skript postavený na záloze výukové databáze dostupné ke stažení z tohoto odkazu https://engeto.com/files/db_portal_template.sql
- při jeho postupném procházení se postupně vytvoří všechny potřebné podklady ke splnění zadání (zadání viz níže)
- vytvořeno pomocí MariaDB Ver 15.1 Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2 a programu DBeaver Version 22.0.5.202205220912

t_JAN_TASLER_project_SQL_primary_final.csv
- export tabulky ve formátu csv (sep - comma), výchozí tabulka ze které byly získávány odpovědi na všechny výzkumné otázky

t_JAN_TASLER_project_SQL_secondary_final.csv
- export tabulky ve formátu csv (sep - comma), druhá tabulka dle zadání

UKOL_X.csv
- exporty tabulek ve formátu csv (sep - comma), dle kterých byly zodpovězeny výzkumné otázky

vyzkumne_otazky.odt
- stručný komentář k jednotlivým výzkumným otázkám



Zadání projektu:

Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.
Datové sady, které je možné použít pro získání vhodného datového podkladu

Primární tabulky:

    czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
    czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
    czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
    czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
    czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
    czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
    czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

Číselníky sdílených informací o ČR:

    czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
    czechia_district – Číselník okresů České republiky dle normy LAU.

Dodatečné tabulky:

    countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
    economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

Výzkumné otázky

    Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
    Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
    Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
    Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
    Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

Výstup projektu

Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Tabulky pojmenujte t_{jmeno}_{prijmeni}_project_SQL_primary_final (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a t_{jmeno}_{prijmeni}_project_SQL_secondary_final (pro dodatečná data o dalších evropských státech).

Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

Na svém GitHub účtu vytvořte repozitář (může být soukromý), kam uložíte všechny informace k projektu – hlavně SQL skript generující výslednou tabulku, popis mezivýsledků (průvodní listinu) a informace o výstupních datech (například kde chybí hodnoty apod.).


