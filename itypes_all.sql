SELECT ipn.itype_property_id, ipn.name,  itp.code_num
  FROM sierra_view.itype_property_name as ipn
  inner join sierra_view.itype_property as itp
  on ipn.itype_property_id=itp.id
  ;