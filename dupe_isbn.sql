SELECT 
       content
  FROM sierra_view.subfield_view
   where marc_tag='020'
  group by content
 having count(*) > 1;