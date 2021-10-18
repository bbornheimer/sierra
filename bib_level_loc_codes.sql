SELECT 
 
  bib_record_location.location_code,  count (location_code)
 
FROM 
  sierra_view.bib_view, 
  sierra_view.bib_record_location
  
WHERE 
  bib_record_location.bib_record_id = bib_view.id
 
  and bib_view.bcode3 != 's' and bib_view.bcode1 != 'w'

  group by location_code;

