USE MannschaftDB;

# alle x
SELECT *
FROM players p;

# insgesamter Monatsbeitrag pro spieler
SELECT p.ID, p.firstname, SUM(c.price) as sum
FROM players p, monthlyPay mp, contributions c
WHERE p.ID = mp.playerID AND c.ID = mp.contributionID
GROUP BY p.ID
ORDER BY p.ID;

# maximaler insgesamter Monatsbeitrag
SELECT SUM(c.price) as sum
FROM contributions c
LIMIT 1;

# alle offenen Monatsbeiträge -> NOT ISNULL() für bezahlte
SELECT p.ID, p.firstname, c.price
FROM players p, monthlyPay mp, contributions c
WHERE p.ID = mp.playerID AND c.ID = mp.contributionID
AND ISNULL(mp.payed)
ORDER BY p.ID;

# Aufsummierte offene Monatsbeiträge -> NOT ISNULL() für bezahlte
# + p.prepayed für prepayed zur summe
SELECT p.ID, p.firstname, p.lastname, SUM(c.price) as sum
FROM players p, monthlyPay mp, contributions c
WHERE p.ID = mp.playerID AND c.ID = mp.contributionID
AND ISNULL(mp.payed)
GROUP BY p.ID
ORDER BY p.ID;

# spieler mit deren strafen 
SELECT p.ID, p.firstname, pe.penaltyName
FROM players p, receivesPenalty rp, penalties pe
WHERE p.ID = rp.playerID
AND pe.ID = rp.penaltyID
ORDER BY p.ID;

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

# Aufsummierte offene Strafen Kosten -> NOT ISNULL() für bezahlte
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

SELECT * FROM players p;
SELECT * FROM monthlyPay mp;