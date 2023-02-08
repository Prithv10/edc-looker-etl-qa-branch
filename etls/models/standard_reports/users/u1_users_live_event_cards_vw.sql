  -- 1454_Glue Users [U][1] [Live Event Cards]
  -- u1_users_live_event_cards_vw
WITH
  set_column_type AS(
  SELECT
    Time, CAST(card_id AS float64) AS card_id, CAST(user_id AS float64) AS user_id, event, 
    training_registration_id, training_registration_state
  FROM
    {{ref('u0_usercards_event_vw')}}
  WHERE
    event = 'card_training_registered'
    OR event = 'card_training_unregistered'
    OR event = 'card_training_registration_approved'
    OR event = 'card_training_registration_denied'),
  -- select columns 3
  value_mapper_table AS(
  SELECT
    Time,
    training_registration_id,
    CASE
      WHEN training_registration_state = 'approved' THEN 'Approved'
      WHEN training_registration_state = 'unregistered' THEN 'UnRegistered'
      WHEN training_registration_state = 'pending' THEN 'Pending'
      WHEN training_registration_state = 'rejected' THEN 'Rejected'
    ELSE
    training_registration_state
  END
    AS training_registration_state,
    event, card_id, user_id_1 AS user_id
  FROM (
      -- Rank window and filter rows 1
    SELECT
      Time, training_registration_id, training_registration_state, event, user_id, card_id
    FROM (
      SELECT
        *,
        RANK() OVER(PARTITION BY training_registration_id ORDER BY Time DESC) AS rank1
      FROM
        set_column_type QUALIFY rank1 = 1) ) current_registration_state
  INNER JOIN
    -- Rank window 1 and filter rows 2
    (
    SELECT
      user_id AS user_id_1,
      training_registration_id AS training_registration_id_1
    FROM (
      SELECT
        *,
        RANK() OVER(PARTITION BY training_registration_id ORDER BY Time ASC) AS rank1
      FROM
        set_column_type QUALIFY rank1 = 1 )) user_id_based_on_registration_id
  ON
    current_registration_state.training_registration_id = user_id_based_on_registration_id.training_registration_id_1)
  -- SELECT COLUMNS 2
SELECT
  Time, training_end_date, training_start_date, training_registration_id, training_registration_state, 
  event, card_id, user_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, 
  ecl_source_name, is_public, content_structure, card_author_id, card_author_full_name, user_full_name, email, 
  time_account_created, sign_in_count, user_account_status, excluded_from_leaderboard, registration_limit, 
  registration_type, time_zone, conferencing_tool, last_registration_date, card_level, average_rating, 
  standard_card_type, published_at, external_id, current_content_owner_full_name
FROM
  -- SELECT COLUMNS 1
  (
  SELECT
    Time, training_end_date, training_start_date, training_registration_id, training_registration_state, event, 
    card_id, user_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, 
    ecl_source_name, is_public, content_structure, card_author_id,card_author_full_name, registration_limit, registration_type, 
    time_zone, conferencing_tool, last_registration_date, card_level, average_rating, standard_card_type, 
    published_at, current_content_owner_full_name
  FROM (
      -- SELECT COLUMN 6
    SELECT
      training_start_date, registration_type, conferencing_tool, card_id, last_registration_date, 
      registration_limit, time_zone, time, training_registration_id, training_registration_state, event, 
      user_id, training_end_date
    FROM
      {{ref('c0_training_cards_latest_metadata_part4_final_vw')}} c0_training
      -- JOIN DATA 4
    LEFT OUTER JOIN (
      SELECT
        Time, training_registration_id, training_registration_state, event, card_id AS card_id_1, user_id
      FROM
        value_mapper_table) value_mapper
    ON
      c0_training.card_id = value_mapper.card_id_1) select_columns_6
    -- JOIN DATA 1
  LEFT OUTER JOIN (
    SELECT
      card_id AS card_id_1, current_content_owner_id as card_author_id, current_content_owner_full_name, card_state, card_subtype, 
      card_type, ecl_id, ecl_source_name, is_public, Duration_HHMM, Duration_seconds, published_at, card_title, 
      created_at, updated_at, card_level, average_rating, standard_card_type, card_resource_url, 
      content_structure, org_id_s, author_id, card_author_full_name
    FROM
      {{ref('c1_content_latest_metadata_vw')}}) c1_latest
  ON
    select_columns_6.card_id = c1_latest.card_id_1) select_columns_1
LEFT OUTER JOIN (
  SELECT
    user_id AS user_id_1, user_full_name, user_account_status, excluded_from_leaderboard, email, 
    time_account_created, sign_in_count, time_account_suspended, external_id
  FROM
    {{ref('u1_users_latest_metadata_vw')}}) u1_latest
ON
  select_columns_1.user_id = u1_latest.user_id_1