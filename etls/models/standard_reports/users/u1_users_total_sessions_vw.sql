  -- 1454_Glue Users [U][1] [Total Sessions]
  -- u1_users_total_sessions_vw
 
SELECT Time, Event, User_ID, User_Agent, Platform, User_Full_Name, Email, Time_Account_Created, User_Account_Status, Excluded_From_Leaderboard, Engagement_Metric FROM 
(
  SELECT * FROM 
  (
    SELECT DISTINCT CAST(Time AS TIMESTAMP) AS Time, Event, User_ID, User_Agent, Platform, "Total Sessions" AS Engagement_metric FROM 
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
              Platform NOT IN ("edc-lms", "lrs-xapi", "lxp-scormservice", "EDC-LMS")
              AND User_Agent NOT IN ("postman", "ruby", "python", "branch metrics", "sfdc", "java", "cloudfront", "faraday", "ahc", "node", "curl")
              AND Event = "user_activity_window_started"
              AND User_Agent NOT IN ("Branch Metrics API", "Java")
              AND User_Agent IS NOT NULL
              AND User_ID IS NOT NULL
              AND User_Agent != "Ruby" ))))) performance_metric_total_sessions
  INNER JOIN (
    SELECT User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email AS Email, Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id, user_id AS User_ID_1 FROM
     {{ ref('u1_users_latest_metadata_vw') }}) AS u1_latest_metadata
  ON
    performance_metric_total_sessions.User_ID = u1_latest_metadata.User_ID_1 )
