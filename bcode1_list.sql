select udc.code, udbcode1.code, udbcode1.name
from sierra_view.user_defined_category as udc
inner join sierra_view.user_defined_bcode1_myuser as udbcode1
on udc.id=udbcode1.user_defined_category_id;