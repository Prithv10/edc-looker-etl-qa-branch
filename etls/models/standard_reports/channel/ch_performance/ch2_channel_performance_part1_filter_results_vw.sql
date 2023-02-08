-- 1. Channel Performance - Combine Filter Results
-- Part-1 : Filter results
-- Channels [CH][2] [Channel Performance Data Explorer]
-- ch2_channel_performance_part1_filter_results_vw
-- Model Name : ch_performance.ch2_channel_performance_part1_filter_results_vw
-- dbt run --select  channel.ch_performance.ch2_channel_performance_part1_filter_results_vw 


SELECT  DISTINCT time,channel_id,platform,user_id,org_id_s,event,performance_metric FROM
  (
    SELECT user_id,channel_id,event,curator_id,collaborator_id,platform,channel_follower_id,Time,org_id_s,'Total Visits' AS performance_metric
  FROM {{ ref('ch0_channel_core_event_vw') }}
  WHERE event='channel_visited'
  )

UNION ALL

--- 1.2 channel_visited -- Total Distinct User Visits

SELECT DISTINCT time,channel_id,platform,user_id,org_id_s,'Channel_first_visited' AS event,performance_metric FROM
(
  SELECT  *,RANK() OVER (PARTITION BY user_id,channel_id ORDER BY TIME ASC) AS rankcol FROM (
    SELECT user_id,channel_id,event,curator_id,collaborator_id,platform,channel_follower_id,Time,org_id_s,'Total Distinct User Visits' AS performance_metric
    FROM {{ ref('ch0_channel_core_event_vw') }}
    WHERE event='channel_visited'
  )
qualify rankcol=1
)

UNION ALL

--- 1.3 channel_collaborator_added or removed -- Current Colloborators
SELECT DISTINCT time,channel_id,platform,User_ID,org_id_s,event,performance_metric FROM
(
  SELECT * FROM (SELECT  *,RANK() OVER (PARTITION BY channel_id,User_ID ORDER BY TIME DESC) AS rankcol FROM (
    SELECT channel_id,event,curator_id,collaborator_id AS User_ID,platform,channel_follower_id,Time,org_id_s,'Current Collaborators' AS performance_metric
    FROM {{ ref('ch0_channel_core_event_vw') }}
    WHERE event='channel_collaborator_added' OR event='channel_collaborator_removed'
  )
qualify rankcol=1)
WHERE event='channel_collaborator_added'
)

UNION ALL

--- 1.4 channel_curator added or removed -- Current Curators
SELECT DISTINCT time,channel_id,platform,User_ID,org_id_s,event,performance_metric FROM
(
  SELECT * FROM (SELECT  *,RANK() OVER (PARTITION BY channel_id,User_ID ORDER BY TIME DESC) AS rankcol FROM (
    SELECT channel_id,event,curator_id AS User_ID,collaborator_id,platform,channel_follower_id,Time,org_id_s,'Current Curators' AS performance_metric
    FROM {{ ref('ch0_channel_core_event_vw') }}
    WHERE event='channel_curator_added' OR event='channel_curator_removed'
  )
qualify rankcol=1)
WHERE event='channel_curator_added'
)

UNION ALL

--- 1.5.1 follow -- Channel Followed

 SELECT DISTINCT *  FROM
(
  SELECT DISTINCT time,channel_id,platform,User_ID,org_id_s,event,performance_metric FROM
  (
    SELECT  *,RANK() OVER (PARTITION BY channel_id,User_ID ORDER BY TIME  DESC) AS rankcol FROM (
      SELECT channel_id,event,curator_id,collaborator_id,platform,channel_follower_id as User_ID,Time,org_id_s,'Current Followers' AS performance_metric
      FROM {{ ref('ch0_channel_core_event_vw') }}
      WHERE event='channel_followed' OR event='channel_unfollowed'
    )
    qualify rankcol=1 and event ='channel_followed'
  )
  UNION ALL
    --- 1.5.2 (JOIN 3)
  SELECT DISTINCT * EXCEPT(rankcol2) FROM 
  (    
    SELECT  *,RANK() OVER (PARTITION BY CAST(user_id as INT64),channel_id ORDER BY `Time` DESC) AS rankcol2 FROM 
    (
      SELECT DISTINCT time,channel_id,platform,user_id,org_id_s,event,'Current Followers' AS performance_metric FROM
      (
        SELECT DISTINCT a152.*,b152.* FROM (
          SELECT *,RANK() OVER (PARTITION BY channel_id,group_id ORDER BY time DESC) As rankcol  FROM
            ( SELECT platform,event,team_id as group_id,channel_id,time,org_id_s FROM
            {{ ref('u0_usercards_event_vw') }}
            WHERE event='group_channel_followed' OR event='group_channel_unfollowed'
            )
          QUALIFY rankcol=1 and event ='group_channel_followed'
        ) AS a152
        LEFT JOIN
        (SELECT user_id,group_id FROM {{ ref('g2_groups_users_vw') }}) AS b152
            ON a152.group_id = b152.group_id 
      )  
    ) a1521 qualify rankcol2=1
  )
)