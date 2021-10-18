SELECT bib_view.id, 
  bib_record_location.location_code, 
  item_record.item_status_code, 
  bib_view.title
FROM 
  sierra_view.bib_record_item_record_link, 
  sierra_view.item_record, 
  sierra_view.bib_view, 
  sierra_view.bib_record_location
WHERE 
  bib_record_item_record_link.item_record_id = item_record.id AND
  bib_record_item_record_link.bib_record_id = bib_view.id AND
  bib_record_location.bib_record_id = bib_view.id AND
  bib_record_location.location_code = 'c' AND 
  (item_record.item_status_code = 'm' or
  item_record.item_status_code = 's' or
  item_record.item_status_code = 'z' or
  item_record.item_status_code = '$')
   ;