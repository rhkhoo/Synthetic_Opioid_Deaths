---- Find average opioid death per state and opioid deaths as a percentage of the total state population
SELECT 
	od."State",  
	od."Population", 
	od."Deaths",
	ROUND(AVG(od."Deaths"), 2) AS avg_death,
	(od."Deaths"::FLOAT / od."Population"::FLOAT) * 100 AS percent_deaths
FROM 
	overdoses AS od
GROUP BY
	od."State", 
	od."Population", 
	od."Deaths"
ORDER BY 
	percent_deaths DESC
;


----Find the average number of opioids prescribed per state
SELECT 
	pi."State",
	AVG(pi."ACETAMINOPHEN.CODEINE"
	+pi."FENTANYL"
	+ pi."HYDROCODONE.ACETAMINOPHEN"
	+ pi."HYDROMORPHONE.HCL"
	+ pi."METHADONE.HCL"
	+ pi."MORPHINE.SULFATE"
	+ pi."MORPHINE.SULFATE.ER"
	+ pi."OXYCODONE.ACETAMINOPHEN"
	+ pi."OXYCODONE.HCL"
	+ pi."OXYCONTIN"
	 + pi."TRAMADOL.HCL") AS total_opioids_prescribed
FROM 
	prescriber_info AS pi
WHERE 
	pi."Opioid.Prescriber" = 1
	AND pi."State" NOT IN ('PR', 'DC')
GROUP BY 
	pi."State"
HAVING COUNT
	(pi."State") > 10
ORDER BY
	total_opioids_prescribed DESC
;

----- Find the percent of opioid prescribers per state
SELECT
	pi."State",
	ROUND(AVG(pi."Opioid.Prescriber"), 3) AS avg_num_pres
FROM 
	prescriber_info AS pi
WHERE 
	pi."State" NOT IN ('PR', 'DC')
GROUP BY 
	pi."State"
HAVING COUNT
	(pi."State") > 10
ORDER BY avg_num_pres DESC
;

---- Find highest frequency specialties in WV
SELECT
	pi."Specialty",
	COUNT(pi."Specialty") AS n_specialists,
	pi."State"
FROM
	prescriber_info AS pi
WHERE pi."State" = 'WV'
GROUP BY pi."State", pi."Specialty"
ORDER BY n_specialists DESC
;

---- Find total opioid prescribed per specialty
SELECT 
	pi."Specialty",
	AVG(pi."ACETAMINOPHEN.CODEINE"
	+pi."FENTANYL"
	+ pi."HYDROCODONE.ACETAMINOPHEN"
	+ pi."HYDROMORPHONE.HCL"
	+ pi."METHADONE.HCL"
	+ pi."MORPHINE.SULFATE"
	+ pi."MORPHINE.SULFATE.ER"
	+ pi."OXYCODONE.ACETAMINOPHEN"
	+ pi."OXYCODONE.HCL"
	+ pi."OXYCONTIN"
	 + pi."TRAMADOL.HCL") AS total_opioids_prescribed
FROM 
	prescriber_info AS pi
WHERE 
	pi."Opioid.Prescriber" = 1
	AND pi."State" NOT IN ('PR', 'DC')
GROUP BY 
	pi."Specialty"
HAVING COUNT
	(pi."State") > 10
ORDER BY
	total_opioids_prescribed DESC
;

----Find proportion of each specialty
