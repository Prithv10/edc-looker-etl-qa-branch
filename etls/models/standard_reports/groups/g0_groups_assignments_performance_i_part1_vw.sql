-- 1454_Glue_Groups[G][0] Group_Assignments_Performance_i
-- g0_groups_assignments_performance_i_part1_vw

SELECT card_id, title, card_message, card_source_name, duration, card_type, card_level, card_author_full_name, assignor_name, assignor_id, group_id, team_name, assigned_user_id, assigned_user_full_name, assigned_user_handle, assignor_handle, assignment_state, record_insert_time, time_assignment_started, time_completed, assignment_due_date, time_assignment_created, time_assigned, org_id_s
from (SELECT *, 
RANK() OVER(PARTITION BY card_id, assignor_id, assigned_user_id, group_id ORDER BY record_insert_time DESC) as rank
FROM
(SELECT card_id, title, card_message, card_source_name, duration, card_type, card_level, card_author_full_name, assignor_name, assignor_id, group_id, team_name, assigned_user_id, assigned_user_full_name, assigned_user_handle, assignor_handle, assignment_state, record_insert_time, time_assignment_started, time_completed, assignment_due_date, time_assignment_created, time_assigned, org_id_s
from {{get_db_source('group_assignments_performance_i_v')}} )
qualify rank = 1)
