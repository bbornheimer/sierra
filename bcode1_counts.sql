SELECT 
 
  bib_view.bcode1,  count (bcode1)
 
FROM 
  sierra_view.bib_view, 
  sierra_view.bib_record_location
  
WHERE 
  bib_record_location.bib_record_id = bib_view.id
  and bib_record_location.location_code='l'


  group by bcode1;
