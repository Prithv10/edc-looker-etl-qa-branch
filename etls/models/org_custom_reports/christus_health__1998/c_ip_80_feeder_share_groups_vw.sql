-- C-IP-80 [FEEDER] SHARE + GROUPS
-- c_ip_80_feeder_share_groups_vw


select
    shared_by_id, shared_by_name, shared_card_id, shared_card_title, event, shared_date, group_user_id as shared_to_user_id, 
    group_user_full_name as shared_to_user_full_name, shared_to_group_id, shared_to_group_name, share_type
from
    (
        select
            user_id as shared_by_id, user_full_name as shared_by_name, card_id as shared_card_id, card_title as shared_card_title,
            event, time as shared_date, shared_to_group_id, shared_to_group_name, 'Shared via Group' as share_type
        from {{ ref("u2_users_performance_part5_final_results_vw") }}
        where event = 'card_shared' and shared_to_group_id is not null
    ) add_share_type
left outer join
    (
        select
            group_id as group_group_id, user_id as group_user_id, user_full_name as group_user_full_name
        from {{ ref("c_op_00_master_group_dataset_vw") }}
    ) select_columns_1
    on add_share_type.shared_to_group_id = select_columns_1.group_group_id
