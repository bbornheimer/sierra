SELECT 
 itype_property.code_num, itype_property_name.name
FROM 
  
  sierra_view.itype_property
  LEFT JOIN sierra_view.item_record on sierra_view.itype_property.code_num=sierra_view.item_record.itype_code_num
  LEFT JOIN sierra_view.itype_property_name  on sierra_view.itype_property_name.itype_property_id=itype_property.id 
  WHERE sierra_view.item_record.itype_code_num IS NULL