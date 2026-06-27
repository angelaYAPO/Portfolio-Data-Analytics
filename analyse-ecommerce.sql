-- Analyse E-commerce Sales Dataset
-- Auteur : Mirabelle N'Guessan
-- Outils : PostgreSQL / pgAdmin4

-- 1. Revenue total par pays
SELECT Country,
       SUM(CAST(Quantity AS NUMERIC) * CAST(UnitPrice AS NUMERIC)) AS Revenue
FROM ventes
WHERE CustomerID IS NOT NULL
AND CustomerID != ''
AND StockCode != 'POST'
GROUP BY Country
ORDER BY Revenue DESC;

-- 2. Top 10 produits les plus vendus
SELECT Description,
       SUM(CAST(Quantity AS NUMERIC)) AS TotalVendu
FROM ventes
WHERE StockCode != 'POST'
GROUP BY Description
ORDER BY TotalVendu DESC
LIMIT 10;

-- 3. Panier moyen en France
SELECT ROUND(AVG(CAST(Quantity AS NUMERIC) * CAST(UnitPrice AS NUMERIC)), 2) AS PanierMoyen
FROM ventes
WHERE Country = 'France';

-- 4. Nombre de commandes distinctes en France
SELECT COUNT(DISTINCT InvoiceNo) AS NombreCommandes
FROM ventes
WHERE Country = 'France';
