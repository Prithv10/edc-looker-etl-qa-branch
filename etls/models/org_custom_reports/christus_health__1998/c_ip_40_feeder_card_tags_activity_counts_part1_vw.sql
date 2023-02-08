-- C-OP-40 [FEEDER] CARD + TAGS + ACTIVITY COUNTS
-- c_ip_40_feeder_card_tags_activity_counts_part1_vw
(
    select
        card_id,
        card_title,
        event,
        LOWER(REPLACE(REPLACE(REPLACE(TRIM(performance_metric),' ','_'),'(',''),')','')) AS performance_metric,
        time,
        cast(comment_message as string) as comment_message
    from
        {{ref('u2_users_performance_part5_final_results_vw')}}
)