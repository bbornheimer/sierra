SELECT 

  varfield_view.field_content, 
  patron_record_fullname.last_name,
  patron_record_fullname.first_name,
  fine.invoice_num,
  fine.title,
  CASE WHEN fine.charge_code = '1' THEN 'manual charge'
WHEN fine.charge_code = '1' THEN 'manual charge'
WHEN fine.charge_code = '2' THEN 'overdue'
WHEN fine.charge_code = '3' THEN 'replacement'
WHEN fine.charge_code = '4' THEN 'overdueX'
WHEN fine.charge_code = '5' THEN 'lost'
WHEN fine.charge_code = '6' THEN 'overdue ren'


            ELSE 'undetermined' END AS ChargeType,
            
  sum (fine.item_charge_amt + 
  fine.processing_fee_amt +
  fine.billing_fee_amt-fine.paid_amt) as owed_amt,

CASE WHEN location.branch_code_num = '1' THEN 'c'
            WHEN location.branch_code_num = '2' THEN 'l'
            WHEN location.branch_code_num = '5' THEN 'c'
            ELSE 'unrecognized' END AS ChargeLoc
  
FROM 
  sierra_view.patron_view, 
  sierra_view.patron_record_fullname, 
  sierra_view.fine, 
  sierra_view.varfield_view,
  sierra_view.location
WHERE 
  patron_record_fullname.patron_record_id = patron_view.id AND
  fine.patron_record_id = patron_view.id AND
  varfield_view.record_id = patron_view.id AND
  location.code=fine.charge_location_code
  and varfield_view.record_type_code='p'
  and varfield_view.varfield_type_code='u'

  and (patron_view.ptype_code='14' or patron_view.ptype_code='22' or patron_view.ptype_code='28') 
   and (location.branch_code_num='1' or location.branch_code_num='2' or location.branch_code_num='5') 

   
   group by varfield_view.field_content, patron_record_fullname.last_name,
  patron_record_fullname.first_name, chargeloc, fine.invoice_num,
  fine.title, fine.charge_code
    having sum (fine.item_charge_amt + 
  fine.processing_fee_amt +
  fine.billing_fee_amt-fine.paid_amt) >= 5
   order by patron_record_fullname.last_name
   ;