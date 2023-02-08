
-- users_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
	avatar_content_type,
	avatar_file_name,
	avatar_file_size,
    partition_id,
	TIMESTAMP(users.avatar_updated_at) as avatar_updated_at,
	bio,
	configs,
	TIMESTAMP(users.confirmation_sent_at) as confirmation_sent_at,
	TIMESTAMP(users.confirmed_at) as confirmed_at,
	coverimage_content_type,
	coverimage_file_name,
	coverimage_file_size,
	TIMESTAMP(users.coverimage_updated_at) as coverimage_updated_at,
	TIMESTAMP(users.created_at) as created_at,
	TIMESTAMP(users.current_sign_in_at) as current_sign_in_at,
	current_sign_in_ip,
	data_export_status,
	default_team_id,
	TIMESTAMP(users.deleted_at) as deleted_at,
	email,
	failed_attempts,
	federated_identifier,
	first_name,
	handle,
	id,
	job_role_id,
	TIMESTAMP(users.last_data_export_time) as last_data_export_time,
	last_name,
	TIMESTAMP(users.last_sign_in_at) as last_sign_in_at,
	last_sign_in_ip,
	location_id,
	TIMESTAMP(users.locked_at) as locked_at,
	CONCAT(first_name, ' ', last_name) as name,
	organization_id as org_id_s,
	organization_role,
	parent_user_id,
	sign_in_count,
	TIMESTAMP(users.sign_out_at) as sign_out_at,
	status,
	time_in_role,
	unconfirmed_email,
	TIMESTAMP(users.updated_at) as updated_at,
	welcome_token,
	cast(is_brand as bool) is_brand,
	cast(password_reset_required as bool) password_reset_required,
	cast(is_complete as bool) is_complete,
	cast(is_active as bool) is_active,
	cast(showcase as bool) showcase,
	cast(is_suspended as bool) is_suspended,
	cast(is_edcast_admin as bool) is_edcast_admin,
	cast(exclude_from_leaderboard as bool) exclude_from_leaderboard,
	cast(is_anonymized as bool) is_anonymized,
	cast(invitation_accepted as bool) invitation_accepted,
	cast(hide_from_leaderboard as bool) hide_from_leaderboard,
	FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S',
	TIMESTAMP_MILLIS(users.record_insert_time)) as record_insert_time,
	cast(yr as STRING) yr,
	cast(month as STRING) month,
	day,
	cast(hour as STRING) hour,
	organization_id,
	current_timestamp() AS etl_record_created_time
FROM
	{{get_master_db('users')}} users
where
	organization_id = {{var("var_cust_id")}}

-- only for incremental test
-- and updated_at <  '2023-01-01 00:00:00'


{% if is_incremental() %}
    and users.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
