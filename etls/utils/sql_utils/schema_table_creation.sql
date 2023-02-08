
--- badgings

CREATE TABLE `gcp-us-central-1-qa-04-323821`.bank_of_canada_dataset.badgings_dim_m ( id INT64, 
badge_title STRING(65535), badgeable_card_id INT64, badge_id INT64, badge_type STRING(65535), target_steps INT64, 
all_quizzes_answered BOOLEAN, time_badge_created TIMESTAMP, time_badge_last_updated TIMESTAMP, org_id_s INT64, `minute` INT64, 
record_insert_time STRING(65535)
);

CREATE OR REPLACE VIEW `gcp-us-central-1-qa-04-323821`.bank_of_canada_dataset.badgings_dim_m_v as SELECT * FROM `gcp-us-central-1-qa-04-323821`.bank_of_canada_dataset.badgings_dim_m

-- clc

CREATE TABLE `gcp-us-central-1-qa-04-323821`.audible_dataset.clcs_dim_m ( id INT64, entity_id INT64, 
entity_type STRING(65535), from_date DATE, to_date DATE, target_score INT64, target_steps STRING(65535), deleted_at TIMESTAMP, 
created_at TIMESTAMP, updated_at TIMESTAMP, name STRING(65535), status INT64, org_id_s INT64, `minute` INT64, record_insert_time STRING(65535)
);

CREATE OR REPLACE VIEW `gcp-us-central-1-qa-04-323821`.audible_dataset.clcs_dim_m_v as SELECT * FROM `gcp-us-central-1-qa-04-323821`.audible_dataset.clcs_dim_m

-- groups_assignments_performance_i


CREATE TABLE `gcp-us-central-1-qa-04-323821`.audible_dataset.group_assignments_performance_i ( card_id INT64, 
title STRING(65535), card_message STRING(65535), duration STRING(65535), card_type STRING(65535), card_level STRING(65535), 
card_author_full_name STRING(65535), card_author_id INT64, card_author_email STRING(65535), card_author_handle STRING(65535), 
assignor_name STRING(65535), assignor_handle STRING(65535), assignor_id INT64, group_id INT64, team_name STRING(65535), 
assigned_user_id INT64, assigned_user_full_name STRING(65535), assigned_user_handle STRING(65535), assignment_state STRING(65535), 
record_insert_time STRING(65535), time_assignment_started TIMESTAMP, time_completed TIMESTAMP, assignment_due_date TIMESTAMP, 
time_assignment_created TIMESTAMP, time_assigned TIMESTAMP, card_source_name STRING(65535), org_id_s INT64
);


CREATE OR REPLACE VIEW `gcp-us-central-1-qa-04-323821`.audible_dataset.group_assignments_performance_i_v as SELECT * FROM `gcp-us-central-1-qa-04-323821`.audible_dataset.group_assignments_performance_i

