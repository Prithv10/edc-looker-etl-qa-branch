connection: "gcp_concord_dawn_qa"

include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/gcp_dashboards/*.dashboard.lookml"






#connection: "us-east-1-qa-01"


#omtest24thjan8:15pm


#gcp_spark_edcast
#spark_edcast_dev
#spark_edcast_qa

#testing pull request 10th jan 12:25pm

#include: "/edcast_project/views/*.view.lkml"
include: "/edcast_project/views/old_mock_views/*.view.lkml"
include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/views/original_views/content_analytics/*.view.lkml"
include: "/edcast_project/views/original_views/channel_analytics/*.view.lkml"
include: "/edcast_project/views/original_views/group_analytics/*.view.lkml"
include: "/edcast_project/views/original_views/user_analytics/*.view.lkml"
include: "/edcast_project/views/original_views/search_analytics/*.view.lkml"
include: "/edcast_project/dashboards/*.dashboard.lookml"
include: "/edcast_project/views/original_views/structured_content_analytics/*.view.lkml"
include: "/edcast_project/views/original_views/welcome_to_spark/*.view.lkml"
include: "/edcast_project/views/original_views/skill_passport/*.view.lkml"
include: "/edcast_project/views/original_views/user_adoption_and_clc/*.view.lkml"
include: "/edcast_project/views/original_views/feature_reports/*.view.lkml"
include: "/edcast_project/views/original_views/leaderboard/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"
#include: "/edcast_project/south_east_2/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"
# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

#Search Analytics Explores--------------------
#dbt_searches_se1_search_user_details


explore: se1_searches_search_user_details {
  label: "Search Analytics"
  view_label: "Search Data"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${se1_searches_search_user_details.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }

}


#Channel Analytics Explores--------------------

#mock_channel_performance Referring to new view dbt_channel_ch2_performance_vw

explore: ch2_channel_performance_part2_final_results_vw {
  label: "Channel Analytics"
  view_label: "Channel Data"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ch2_channel_performance_part2_final_results_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

#User Analytics Explores--------------------
#mock_users_u2_skills_learning_goals Referring to new view  dbt_users_u2_skills_Learninggoals_vw

explore: user_card_performance_reporting_i_v {
  label: "User Card Performance Reporting"
  view_label: "User Card Performance Reporting"
  persist_for: "1 hour"

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${user_card_performance_reporting_i_v.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: u3_users_user_metrics_data_explorer_vw {
  label: "User Analytics - User Metrics Data Explorer"
  view_label: "User Metrics Data Explorer"
  persist_for: "1 hour"

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u3_users_user_metrics_data_explorer_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore:  u1_users_latest_metadata_vw {
  label: "User Analytics - U1 Latest Metadata"
  view_label: "User Latest Metadata"
  persist_for: "1 hour"

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u1_users_latest_metadata_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}


explore: u2_users_skills_learninggoals_vw {
  label: "User Analytics-Skills and Learning Goals"
  view_label: "User Data"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u2_users_skills_learninggoals_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}
explore: u3_overall_onboarding_status_part4_final_vw {
  label: "User Analytics - Onboarding Status"
  view_label: "Onboarding Status"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u3_overall_onboarding_status_part4_final_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: u0_usercards_event_vw {
  label: "User Analytics - Usercards"
  view_label: "Usercards"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u0_usercards_event_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore:u2_users_lxp_roles_vw  {
  label: "User Analytics - LXP Roles"
  view_label: "LXP Roles"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u2_users_lxp_roles_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore:u2_users_performance_part5_final_results_vw {
  label: "User Analytics - User Performance"
  view_label: "User Performance"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u2_users_performance_part5_final_results_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore:u3_users_structured_content_performance_data_explorer_vw {
  label: "User Analytics - Structure Content Performance"
  view_label: "User Analytics Structure Content Performance"
  persist_for: "1 hour"

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u3_users_structured_content_performance_data_explorer_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

#Group Analytics Explores-------------------



explore:g3_groups_channel_performance_vw {
  label: "Group Analytics - Channel Performance "
  view_label: "Groups Channel Performance"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_channel_performance_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: g3_groups_assignment_status_vw{
  label: "Group Analytics - Assignment Status"
  view_label: "Assignment Status [Data Explorer]"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_assignment_status_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: g3_groups_search_user_details_vw {
  label: "Group Analytics - Top 20 Searches"
  view_label: "Top 20 Searches"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_search_user_details_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}


explore: g3_groups_skills_learninggoals_vw {
  label: "Group Analytics - Top 20 Skills and Learning Goals"
  view_label: "Top 20 Skills and Learning Goals"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_skills_learninggoals_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

# explore: derived_table_top_25_channels {
#   label: "Group Analytics - Others - Top 20 Searches Sorted"
#   view_label: "Top 20 Searches with Others"
#   persist_for: "1 hour"
# }

explore: g3_groups_performance_data_explorer_vw {
  label: "Group Analytics - Groups Performance Data Explorer"
  view_label: "Group Analytics - Groups Performance Data Explorer"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_performance_data_explorer_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: g3_groups_overall_onboarding_status_vw {
  label: "Group Analytics - Overall Onboarding Status"
  view_label: "Group Analytics - Overall Onboarding Status [Filter Group]"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_overall_onboarding_status_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

#Content Analytics Explores-------------------

explore: c1_content_latest_metadata_vw{
  label: "Content Analytics"
  view_label: "Content Data"
  persist_for: "1 hour"

  join: derived_table_standard_card_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${c1_content_latest_metadata_vw.standard_card_type} = ${derived_table_standard_card_type.standard_card_type} ;;
  }
}

explore:u2_users_assignment_status_vw {
  label: "User Analytics - Assignment Status"
  view_label: "User Performance"
  persist_for: "1 hour"

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u2_users_assignment_status_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}


#Structured Content Analytics Explores-------------------

explore: c2_content_structure_metadata_vw {
  label: "Structured Content Analytics"
  view_label: "Structured Content Data"
  persist_for: "1 hour"

  join: derived_table_top_25_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${c2_content_structure_metadata_vw.channel_name} = ${derived_table_top_25_channels.channel_name} ;;
  }

  join: derived_table_top_13_carousels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${c2_content_structure_metadata_vw.carousel_name} = ${derived_table_top_13_carousels.carousel_name} ;;
  }

}



explore: g3_groups_structured_content_performance_data_explorer_vw {
  label: "Structured_Content_Performance"
  view_label: "Structured Content Performance Data"
  persist_for: "1 hour"


  #joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_structured_content_performance_data_explorer_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }

}

explore: g3_groups_structured_journey_progression_data_explorer_vw {
  label: "Structured_Journey_Progression Data Explorer"
  view_label: "Structured Journey Progression Data Explorer"
  persist_for: "1 hour"

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_structured_journey_progression_data_explorer_vw.user_id_1}=${cf_0_latest_user_details_vw.user_id} ;;
  }

}

explore: g3_groups_structured_pathway_progression_data_explorer_vw {
  label: "Structured_Pathway_Progression Data Explorer"
  view_label: "Structured Pathway Progression Data Explorer"
  persist_for: "1 hour"

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g3_groups_structured_pathway_progression_data_explorer_vw.user_id_1}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: g4_groups_structured_journey_progression_overview_vw {
  label: "Structured_Journey_Progression Overview"
  view_label: "Structured Journey Progression Overview"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g4_groups_structured_journey_progression_overview_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: g4_groups_structured_pathway_progression_overview_vw {
  label: "Structured_Pathway_Progression Overview"
  view_label: "Structured Pathway Progression Overview"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${g4_groups_structured_pathway_progression_overview_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

#Welcome to Spark Explores--------------------

explore: u3_users_user_funnel_data_explorer_vw{
  label: "Welcome to Spark - User Funnel Data Explorer"
  view_label: "User Funnel Data Explorer"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u3_users_user_funnel_data_explorer_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}


#Skill Passport Explores--------------------

explore: u1_users_skills_vw {
  label: "Skill_Passport"
  view_label: "Skill Passport"
  persist_for: "1 hour"

  # join: derived_table_Top_10_Skills_Added_by_Users {
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${u1_users_skills_vw.skill_name} = ${derived_table_Top_10_Skills_Added_by_Users.skill_name};;
  # }

#joining refinement view to get custom attributes for individual customer

  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u1_users_skills_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

#User Adoption and CLC Explore--------------------

explore: clc_2_0_vw {
  label: "User Adoption and CLC"
  view_label: "User Adoption and CLC"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${clc_2_0_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: u3_users_adoption_details_vw {
  label: "User Adoption Details"
  view_label: "User Adoption Details"
  persist_for: "1 hour"

  #joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u3_users_adoption_details_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}


#Feature Reports Explores--------------------

explore: u1_users_live_event_cards_vw {
  label: "Feature Reports - Users Live Events Cards"
  view_label: "Feat. Reps. Users Live Events Cards"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u1_users_live_event_cards_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: u1_users_project_cards_vw {
  label: "Feature Reports - Users Project Cards"
  view_label: "Feat. Reps. Users Project Cards"
  persist_for: "1 hour"
}
explore: u2_quiz_data_explorer_part3_final_vw {
  label: "Feature Reports - Quiz Data Explorer"
  view_label: "Feat. Reps. Quiz Data Explorer"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u2_quiz_data_explorer_part3_final_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }

}

explore: u2_users_scorm_data_explorer_vw{
  label: "Feature Reports - SCORM Data Explorer"
  view_label: "Feat. Reps. - SCORM Data Explorer"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u2_users_scorm_data_explorer_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: u2_users_quiz_and_poll_responses_vw {
  label: "Feature Reports - Quiz and Poll Responses"
  view_label: "Feat. Reps. - Quiz and Poll Responses"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${u2_users_quiz_and_poll_responses_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

#Leaderboard Explores--------------------

explore: leaderboard_data_part2_final_vw {
  label: "Leaderboard Data"
  view_label: "Leaderboard Data"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${leaderboard_data_part2_final_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }
}

explore: leaderboard_user_agg_score_vw {
  label: "Leaderboard User Aggregate Score"
  view_label: "Leaderboard User Aggregate Score"
  persist_for: "1 hour"

#joining refinement view to get custom attributes for individual customer
  join: cf_0_latest_user_details_vw {
    type: left_outer
    relationship: many_to_one
    sql_on: ${leaderboard_user_agg_score_vw.user_id}=${cf_0_latest_user_details_vw.user_id} ;;
  }



}
