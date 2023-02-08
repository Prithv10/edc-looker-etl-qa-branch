  -- 1454_Glue Users [U][1] [Last Session]
  -- u1_users_last_session_vw
SELECT DISTINCT Time, Event, User_ID FROM 
(
  SELECT *, RANK() OVER (PARTITION BY User_ID ORDER BY Time DESC) AS rank FROM 
  (
    SELECT CAST(Time AS TIMESTAMP) AS Time, Event, CAST(User_ID AS STRING) AS User_ID, FROM 
    (
      SELECT Event, User_ID,Time_original AS Time FROM 
      (
        SELECT DISTINCT CAST(Time AS TIMESTAMP) AS Time, User_ID, Event, User_Agent, Platform, Time AS Time_original FROM 
        (
          SELECT Time_rounded AS Time, Event, User_ID, User_Agent, Platform, Time AS Time_original FROM 
          (
            SELECT CONCAT(Time_stripped_min_sec, rounded_hour) AS Time_rounded, * FROM
             (
              SELECT SUBSTRING(Time, 1, 14) AS Time_stripped_min_sec, '00:00' AS rounded_hour, * FROM 
              (
                SELECT CAST(Time AS string) AS Time, event AS Event, platform AS Platform, user_agent AS User_Agent, CAST(user_id AS float64) AS User_ID FROM
                  {{ ref('u0_usercards_event_vw') }}
                WHERE
                  Platform NOT IN ("edc-lms", "lrs-xapi", "lxp-scormservice")
                  AND User_Agent NOT IN ("postman", "ruby", "python", "branch_metrics", "sfdc", "java", "cloudfront", "faraday", "ahc", "node", "curl")
                  AND Event = "user_activity_window_started"
                  AND User_Agent NOT IN ("Branch_Metrics_API", "Java", "EDC-LMS")
                  AND User_Agent IS NOT NULL
                  AND User_Agent != "Ruby" ))))))) QUALIFY rank = 1)
 

