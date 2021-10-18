SELECT ptp.id, ptp.value, ppn.description
  FROM sierra_view.ptype_property as ptp
  inner join sierra_view.ptype_property_name as ppn
  on ptp.id=ppn.ptype_id
  order by value;