  -- 1454_Glue_Groups [G][3] [Search User Details]
  -- g3_groups_search_user_details_vw
 
 {{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'time', 'data_type': 'timestamp','granularity': 'year'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["Group_Name"],
    tags=['incremental']
  )
}}


SELECT Time, Analytics_Version, Event, Is_Admin_Request, Is_System_Generated, Hostname, Org_ID, Platform, Platform_Version_Number, Results_Count, Search_Query, User_Agent, User_ID, User_Full_Name, Email, Time_Account_Created, User_Account_Status, Group_ID, Group_Name, Group_Status, Excluded_From_Leaderboard, External_ID FROM 
(
  SELECT * FROM {{ref('se1_searches_search_user_details_vw')}} as text_form
  
  LEFT OUTER JOIN 
  
  (
    SELECT Group_ID, Group_Name, Group_Status, User_ID AS User_ID_1, Group_User_Role FROM
      {{ ref('g2_groups_users_vw') }}) g1
  ON
    text_form.User_ID = g1.User_ID_1 )
 

