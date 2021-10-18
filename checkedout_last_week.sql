SELECT barcode, items_display_order, due_gmt, 
       loanrule_code_num, checkout_gmt, renewal_count, overdue_count, 
       overdue_gmt, recall_gmt, ptype
  FROM sierra_view.checkout, sierra_view.item_view
  where sierra_view.checkout.item_record_id=sierra_view.item_view.id
  and sierra_view.checkout.checkout_gmt >  (CURRENT_DATE - interval '7 days');