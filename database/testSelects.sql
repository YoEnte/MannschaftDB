USE MannschaftDB;

# spieler mit deren strafen 
SELECT p.firstname, pe.penaltyName
FROM players p, receivesPenalty rp, penalties pe
WHERE p.ID = rp.playerID
AND pe.ID = rp.penaltyID;

# anzahl spieler aller strafen
SELECT p.ID, p.firstname, COUNT(*)
FROM players p, receivesPenalty rp
WHERE p.ID = rp.playerID
GROUP BY p.ID;

# anzahl spieler nach strafen differenziert
SELECT p.ID, p.firstname, COUNT(*), rp.penaltyID, pe.penaltyName 
FROM players p, receivesPenalty rp, penalties pe
WHERE p.ID = rp.playerID
AND pe.ID = rp.penaltyID
GROUP BY p.ID, rp.penaltyID;

# insgesamter Monatsbeitrag pro spieler
SELECT p.ID, p.firstname, SUM(c.price) as sum
FROM players p, monthlyPay mp, contributions c
WHERE p.ID = mp.playerID AND c.ID = mp.contributionID
GROUP BY p.ID
ORDER BY p.ID;

# maximaler insgesamter Monatsbeitrag
SELECT SUM(c.price)
FROM contributions c
LIMIT 1;

# Aufsummierte offene Monatsbeiträge -> NOT ISNULL() für bezahlte
SELECT p.ID, p.firstname, SUM(c.price) as sum
FROM players p, monthlyPay mp, contributions c
WHERE p.ID = mp.playerID AND c.ID = mp.contributionID
AND ISNULL(mp.payed)
GROUP BY p.ID
ORDER BY p.ID;

# Aufsummierte offene Strafen -> NOT ISNULL() für bezahlte
SELECT p.ID, p.firstname, SUM(p2.price) as sum
FROM players p, receivesPenalty rp, penalties p2
WHERE p.ID = rp.playerID AND p2.ID = rp.penaltyID 
AND ISNULL(rp.served)
GROUP BY p.ID
ORDER BY p.ID;

# Aufsummierte sonstige Zahlungen
SELECT p.ID, p.firstname, SUM(sp.price) as sum
FROM players p, specialPay sp
WHERE p.ID = sp.playerID
GROUP BY p.ID
ORDER BY p.ID;

SELECT * FROM contributions c;