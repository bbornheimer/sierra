select sierra_view.bib_view.bcode2, sierra_view.user_defined_bcode2_myuser.name, count(bib_view.id)
from sierra_view.bib_view, sierra_view.bib_record_location,sierra_view.user_defined_bcode2_myuser
where bib_view.id=bib_record_location.bib_record_id
and bib_view.bcode2 = user_defined_bcode2_myuser.code
and bib_view.bcode3 !='s' and bib_view.bcode1 != 'w'
and bib_record_location.location_code='l'
and bib_view.cataloging_date_gmt < '2021-07-01 00:00:00'
group by bib_view.bcode2, user_defined_bcode2_myuser.name