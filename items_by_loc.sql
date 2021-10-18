SELECT 
  l.code as code,
  n.name,
  count(i.location_code) as count
FROM 
  sierra_view.bool_set b
  JOIN sierra_view.item_record i ON b.record_metadata_id = i.record_id 
  JOIN sierra_view.location l ON i.location_code = l.code 
  JOIN sierra_view.location_name n ON l.id = n.location_id
GROUP BY 1,2
ORDER BY 1 asc;
