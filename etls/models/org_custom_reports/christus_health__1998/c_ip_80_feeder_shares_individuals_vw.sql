-- C-IP-80 [FEEDER] SHARES + INDIVIDUALS
-- c_ip_80_feeder_shares_individuals_vw

SELECT user_id as shared_by_id, user_full_name as shared_by_name, card_id as shared_card_id, card_title as shared_card_title, event, time as shared_date, shared_to_user_id, INITCAP(shared_to_user_full_name) AS shared_to_user_full_name, 
shared_to_group_id, shared_to_group_name, 'Shared To Individual' AS share_type
FROM
  {{ref('u2_users_performance_part5_final_results_vw')}}
WHERE
  event = 'card_shared'
  AND shared_to_group_id IS NULL