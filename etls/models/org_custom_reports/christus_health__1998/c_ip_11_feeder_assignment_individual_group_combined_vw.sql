-- C-IP-11 [FEEDER] [ASSIGNMENT] Individual + Group Combined
-- c_ip_11_feeder_assignment_individual_group_combined_vw

WITH join_data AS 
  (
  SELECT * FROM 
  (
    SELECT user_id, user_full_name, card_id, card_title, assignment_progress, assignment_type, assignment_created_date, assigned_by_id, assigned_by_name, 
    assignment_started_date, assignment_completed_date, assignment_due_date,
      CASE
        WHEN `assignment_created_date`=`assignment_started_date` THEN 'Y'
      ELSE
      'N'
    END
      AS xyleme_integration_assigned
    FROM 
    (
      SELECT user_id, user_full_name, card_id, card_title, assignment_state AS assignment_progress, assignment_type, time_assignment_created AS 
      assignment_created_date, assignor_id AS assigned_by_id, assignor_full_name AS assigned_by_name, time_assignment_started AS assignment_started_date, 
      time_completed AS assignment_completed_date, assignment_due_date, 'N' AS xyleme_integration_assigned
      FROM
        {{ref('u2_users_assignment_status_vw')}})
    WHERE
      xyleme_integration_assigned = 'N'
      OR user_full_name NOT IN ('CHRISTUS')
      OR user_full_name NOT IN ('Training')
      OR user_full_name NOT IN ('Integration')
      OR card_id IS NOT NULL) AS user_filter
  LEFT OUTER JOIN (
    SELECT group_user_id, group_user_full_name, group_card_id, group_card_title, assigned_to_group_id, assigned_to_group_name, group_assignment_type FROM 
    (
      SELECT DISTINCT user_id AS group_user_id, user_full_name AS group_user_full_name, card_id AS group_card_id, card_title AS group_card_title, group_id AS 
      assigned_to_group_id, group_assignment_association AS assigned_to_group_name, assignment_type AS group_assignment_type
      FROM
        {{ref('g3_groups_assignment_status_vw')}} )
    WHERE
      group_user_full_name = 'CHRISTUS'
      AND group_user_full_name NOT IN ('Training')) AS group_filter
  ON
    user_filter.user_id = group_filter.group_user_id
    AND user_filter.card_id = group_filter.group_card_id)


SELECT user_id, user_full_name, card_id, card_title, content_received_as, assigned_to_group_id, assigned_to_group_name, assignment_progress, assignment_created_date, assigned_by_id, assigned_by_name, assignment_started_date, assignment_completed_date, assignment_due_date
FROM (
  SELECT user_id, user_full_name, card_id, card_title, assignment_progress, assignment_type, assignment_created_date, assigned_by_id, assigned_by_name, 
  assignment_started_date, assignment_completed_date, assignment_due_date, xyleme_integration_assigned, group_user_id, group_user_full_name, group_card_id, 
  group_card_title, assigned_to_group_id, assigned_to_group_name, group_assignment_type,
    CASE
      WHEN `group_assignment_type`= 'Assigned to Groups' THEN 'Assigned via Group'
      WHEN `assigned_by_id` = `user_id` THEN 'Self-Assigned'
    ELSE
    'Assigned as Individual'
  END
    AS content_received_as
  FROM (
    SELECT user_id, user_full_name, card_id, card_title, assignment_progress, assignment_type, assignment_created_date, assigned_by_id, assigned_by_name, 
    assignment_started_date, assignment_completed_date, assignment_due_date, xyleme_integration_assigned, 'Assigned via Individual' AS content_received_as, 
    group_user_id, group_user_full_name, group_card_id, group_card_title, assigned_to_group_id, assigned_to_group_name, group_assignment_type
    FROM
      join_data))