-- Users [U][3][User Metrics Data Explorer]
-- u3_users_user_metrics_data_explorer_vw
with
    select_columns_2 as (
        select
            event, time, cast(user_id as float64) as user_id, cast(card_id as float64) as card_id, card_state, title as card_title, badge_title, attributes, badge_type, badge_id, channel_id
        from {{ ref("u0_usercards_event_vw") }}
    ),

    append_rows as (
        -- select_columns
        select
            event, time, search_query, user_id, null as channel_name, null as channel_status, null as channel_id, null as card_id, null as card_state, null as card_title, null as badge_title, null as attributes, null as badge_type, null as badge_id
        from {{ ref("se1_searches_search_user_details_vw") }}
        union all
        -- filter_rows_1
        select
            event, time, null as search_query, user_id, channel_name, channel_status, channel_id, null as card_id, null as card_state, null as card_title, null as badge_title, null as attributes, null as badge_type, null as badge_id
        from {{ ref("ch2_channel_performance_part2_final_results_vw") }}
        where event = 'channel_visited'
        union all
        -- filter_rows_8
        select
            event, time, null as search_query, user_id, null as channel_name, null as channel_status, channel_id, card_id, card_state, card_title, badge_title, attributes, badge_type, badge_id
        from select_columns_2
        where
            event = 'card_liked'
            or event = 'card_bookmarked'
            or event = 'card_marked_as_complete'
            or event = 'card_shared'
            or event = 'card_comment_created'
            or event = 'card_published'
            or event = 'card_source_visited'
            or event = 'user_badge_shared_on_social'
            or event = 'user_badge_completed'
        union all
        -- filter rows 14
        select event, time, null as search_query, user_id, null as channel_name, null as channel_status, channel_id, card_id, card_state, card_title, badge_title, attributes, badge_type, badge_id FROM (
            select
                *
            from select_columns_2
            WHERE card_id IS NOT NULL 
            and user_id IS NOT NULL 
            and event = 'card_viewed')
        WHERE attributes IS NULL
        or attributes like '%standalone%'
        or attributes = 'Empty String'

    ),
    remove_duplicates_5_2_4 as (

     SELECT distinct user_id, '4.Engaged Users' as metrics, badge_title, badge_type, badge_id, time, event FROM append_rows
     UNION ALL 
     -- filter rows3
     SELECT distinct user_id, '5.Engaged Users - contributor' as metrics, badge_title, badge_type, badge_id, time, event FROM (
     SELECT * FROM select_columns_2
     WHERE event = 'card_published'
     or event = 'card_comment_created'
     or event = 'card_liked'
     or event = 'card_source_visited'
     or event = 'card_added_to_channel')
     UNION ALL 
     -- filter rows 2
     SELECT distinct user_id, '6.Engaged Users - finisher' as metrics, badge_title, badge_type, badge_id, time, event from(
     SELECT * FROM select_columns_2
     WHERE event = 'card_marked_as_complete')
     UNION ALL 
     -- filter rows 4
     SELECT distinct user_id, '8.Employer Advocacy (Badge/Certification Shared)' as metrics, badge_title, badge_type, badge_id, time, event from( 
     SELECT * FROM select_columns_2
     WHERE event = 'user_badge_shared_on_social'
     and badge_type = 'CardBadging')
     
    ),

    remove_duplicates_3 as(
     -- filter rows 7
     SELECT distinct badge_title, user_id, badge_type, '7.Badge/Certificate Earners' as metrics, badge_id, time, event  from( 
     SELECT * FROM select_columns_2
     WHERE event = 'user_badge_completed'
     and badge_type = 'CardBadging')
    ),

    remove_duplicates_1 as(
        SELECT distinct CAST(user_id as float64) as user_id, '3.Active users' as metrics, 
        badge_title, badge_type, badge_id, time, event  FROM(
        SELECT * FROM(
        SELECT * FROM {{ ref('u0_usercards_event_vw') }}
        WHERE NOT(platform LIKE '%edc-lms%') 
        and NOT(platform LIKE '%lrs-xapi%') 
        and NOT(platform LIKE '%lxp-scormservice%'))
        WHERE NOT(user_agent LIKE '%postman%')
        and NOT(user_agent LIKE '%ruby%')
        and NOT(user_agent LIKE '%python%')
        and NOT(user_agent LIKE '%branch metrics%')
        and NOT(user_agent LIKE '%sfdc%')
        and NOT(user_agent LIKE '%java%')
        and NOT(user_agent LIKE '%cloudfront%')
        and NOT(user_agent LIKE '%faraday%')
        and NOT(user_agent LIKE '%ahc%')
        and NOT(user_agent LIKE '%node%')
        and NOT(user_agent LIKE '%curl%'))
        WHERE event = 'user_activity_window_started'
        and NOT(user_agent LIKE '%Branch Metrics API%')
        and user_id IS NOT NULL 
        and NOT(user_agent LIKE '%Java%')
        and user_agent != 'Ruby'
    ),

    select_column_6 as(
        SELECT time, user_id, event, '2.Users On-boarded' as metrics, badge_title, badge_type, badge_id FROM {{ref('u0_usercards_event_vw')}}
        where event = 'user_onboarding_completed'
    ),

    append_rows_2 as(

    SELECT user_id, metrics, badge_title, badge_type, badge_id, time, event FROM remove_duplicates_5_2_4
    UNION ALL 
    SELECT user_id, metrics, badge_title, badge_type, badge_id, time, event FROM remove_duplicates_3
    UNION ALL 
    SELECT user_id, metrics, badge_title, badge_type, badge_id, time, event FROM remove_duplicates_1
    UNION ALL 
    SELECT user_id, metrics, badge_title, badge_type, badge_id, time, event FROM select_column_6 
    ), 

    select_column_13 as( 
    SELECT * FROM append_rows_2 
    -- SELECT user_id, metrics, email, user_full_name, badge_title, badge_id FROM append_rows_2 
    LEFT OUTER JOIN 
    (SELECT user_id as user_id_1, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id 
    FROM {{ref('u1_users_latest_metadata_vw')}}) u1_lat
    ON append_rows_2.user_id = u1_lat.user_id_1
    ),

    select_column_9 as(
        SELECT user_id, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created as time,
        '1.Users Invited' as metrics, 'user_created' as event 
    FROM {{ref('u1_users_latest_metadata_vw')}}
    ),

    append_rows_1 as(
        select user_id, event, metrics, email, user_full_name, User_Account_Status, Excluded_From_Leaderboard, badge_title, badge_id
        -- time, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id
        FROM select_column_13
        UNION ALL 
        select user_id, event, metrics, email, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, null as badge_title, null as badge_id
        FROM select_column_9
    )

    SELECT * FROM append_rows_1
   

