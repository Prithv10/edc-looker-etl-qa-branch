- dashboard: 1___user_analytics
  title: 1. User Analytics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: EegHCDoxffa9JXGNMww4PY
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "### **User Trends**"
    row: 28
    col: 10
    width: 7
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "### **User Attributes**"
    row: 38
    col: 9
    width: 11
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h2","children":[{"text":"User Performance","bold":true}],"id":1663909109333,"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Top 20 Users
    title: Top 20 Users
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_column
    fields: [u2_users_performance_part5_final_results_vw.user_full_name, u2_users_performance_part5_final_results_vw.clc_badges_completed,
      u2_users_performance_part5_final_results_vw.current_bookmarks, u2_users_performance_part5_final_results_vw.current_likes,
      u2_users_performance_part5_final_results_vw.followers_users, u2_users_performance_part5_final_results_vw.following_users,
      u2_users_performance_part5_final_results_vw.total_badges_earned, u2_users_performance_part5_final_results_vw.total_badges_shared,
      u2_users_performance_part5_final_results_vw.total_bookmarks, u2_users_performance_part5_final_results_vw.total_comments,
      u2_users_performance_part5_final_results_vw.total_completions, u2_users_performance_part5_final_results_vw.total_content_source_visits,
      u2_users_performance_part5_final_results_vw.total_published_journeys, u2_users_performance_part5_final_results_vw.total_published_pathways,
      u2_users_performance_part5_final_results_vw.total_published_smartcards, u2_users_performance_part5_final_results_vw.total_ratings,
      u2_users_performance_part5_final_results_vw.total_shares_to_direct_users, u2_users_performance_part5_final_results_vw.total_shares_to_groups,
      u2_users_performance_part5_final_results_vw.total_unique_card_views, u2_users_performance_part5_final_results_vw.total_views,
      u2_users_performance_part5_final_results_vw.total_events]
    filters: {}
    sorts: [u2_users_performance_part5_final_results_vw.total_events desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${u2_users_performance_part5_final_results_vw.count}))

          ', label: Totals, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: totals, _type_hint: number, id: akeci7KHgI,
        is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: u2_users_performance_part5_final_results_vw.clc_badges_completed,
            id: u2_users_performance_part5_final_results_vw.clc_badges_completed,
            name: Clc Badges Completed}, {axisId: u2_users_performance_part5_final_results_vw.current_bookmarks,
            id: u2_users_performance_part5_final_results_vw.current_bookmarks, name: Current
              Bookmarks}, {axisId: u2_users_performance_part5_final_results_vw.current_likes,
            id: u2_users_performance_part5_final_results_vw.current_likes, name: Current
              Likes}, {axisId: u2_users_performance_part5_final_results_vw.followers_users,
            id: u2_users_performance_part5_final_results_vw.followers_users, name: Followers
              Users}, {axisId: u2_users_performance_part5_final_results_vw.following_users,
            id: u2_users_performance_part5_final_results_vw.following_users, name: Following
              Users}, {axisId: u2_users_performance_part5_final_results_vw.total_badges_earned,
            id: u2_users_performance_part5_final_results_vw.total_badges_earned, name: Total
              Badges Earned}, {axisId: u2_users_performance_part5_final_results_vw.total_badges_shared,
            id: u2_users_performance_part5_final_results_vw.total_badges_shared, name: Total
              Badges Shared}, {axisId: u2_users_performance_part5_final_results_vw.total_bookmarks,
            id: u2_users_performance_part5_final_results_vw.total_bookmarks, name: Total
              Bookmarks}, {axisId: u2_users_performance_part5_final_results_vw.total_comments,
            id: u2_users_performance_part5_final_results_vw.total_comments, name: Total
              Comments}, {axisId: u2_users_performance_part5_final_results_vw.total_completions,
            id: u2_users_performance_part5_final_results_vw.total_completions, name: Total
              Completions}, {axisId: u2_users_performance_part5_final_results_vw.total_content_source_visits,
            id: u2_users_performance_part5_final_results_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: u2_users_performance_part5_final_results_vw.total_published_journeys,
            id: u2_users_performance_part5_final_results_vw.total_published_journeys,
            name: Total Published Journeys}, {axisId: u2_users_performance_part5_final_results_vw.total_published_pathways,
            id: u2_users_performance_part5_final_results_vw.total_published_pathways,
            name: Total Published Pathways}, {axisId: u2_users_performance_part5_final_results_vw.total_published_smartcards,
            id: u2_users_performance_part5_final_results_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: u2_users_performance_part5_final_results_vw.total_ratings,
            id: u2_users_performance_part5_final_results_vw.total_ratings, name: Total
              Ratings}, {axisId: u2_users_performance_part5_final_results_vw.total_shares_to_direct_users,
            id: u2_users_performance_part5_final_results_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: u2_users_performance_part5_final_results_vw.total_shares_to_groups,
            id: u2_users_performance_part5_final_results_vw.total_shares_to_groups,
            name: Total Shares to Groups}, {axisId: u2_users_performance_part5_final_results_vw.total_unique_card_views,
            id: u2_users_performance_part5_final_results_vw.total_unique_card_views,
            name: Total Unique Card Views}, {axisId: u2_users_performance_part5_final_results_vw.total_views,
            id: u2_users_performance_part5_final_results_vw.total_views, name: Total
              Views}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    font_size: 10px
    series_colors:
      Total Ratings - u2_users_performance_part5_final_results_vw.count: "#aed41c"
      Total Views - u2_users_performance_part5_final_results_vw.count: "#9AC3E1"
      totals: "#F3BEB9"
      Total Content Source Visits - u2_users_performance_part5_final_results_vw.count: "#3E6897"
      Total Shares to Direct Users - u2_users_performance_part5_final_results_vw.count: "#FF746E"
      Total Badges Earned - u2_users_performance_part5_final_results_vw.count: "#774199"
      Total Bookmarks - u2_users_performance_part5_final_results_vw.count: "#FAECB4"
      Total Published SmartCards - u2_users_performance_part5_final_results_vw.count: "#9AE0C4"
      Total Shares to Groups - u2_users_performance_part5_final_results_vw.count: "#FFB4B0"
      Total Published Pathways - u2_users_performance_part5_final_results_vw.count: "#50B69E"
      CLC Badges Completed - u2_users_performance_part5_final_results_vw.count: "#E8E8E8"
      Current Bookmarks - u2_users_performance_part5_final_results_vw.count: "#F0AF65"
      Current Likes - u2_users_performance_part5_final_results_vw.count: "#C2E199"
      Followers (Users) - u2_users_performance_part5_final_results_vw.count: "#3AA2AF"
      Following (Users) - u2_users_performance_part5_final_results_vw.count: "#BFA2D7"
      Total Badges Shared - u2_users_performance_part5_final_results_vw.count: "#DAC1EB"
      Total Completions - u2_users_performance_part5_final_results_vw.count: "#429338"
      Total Published Journeys - u2_users_performance_part5_final_results_vw.count: "#006D66"
      u2_users_performance_part5_final_results_vw.total_views: "#D1E8FB"
      u2_users_performance_part5_final_results_vw.total_content_source_visits: "#205D8E"
      u2_users_performance_part5_final_results_vw.total_shares_to_direct_users: "#FF746E"
      u2_users_performance_part5_final_results_vw.total_bookmarks: "#FFE9A8"
      u2_users_performance_part5_final_results_vw.total_badges_earned: "#CBCBCB"
      u2_users_performance_part5_final_results_vw.total_published_smartcards: "#9AE0C4"
      u2_users_performance_part5_final_results_vw.total_shares_to_groups: "#FFB4B0"
      u2_users_performance_part5_final_results_vw.total_published_pathways: "#50B69E"
      u2_users_performance_part5_final_results_vw.clc_badges_completed: "#D6F2B5"
      u2_users_performance_part5_final_results_vw.total_published_journeys: "#006D66"
      u2_users_performance_part5_final_results_vw.current_bookmarks: "#FFA355"
      u2_users_performance_part5_final_results_vw.total_completions: "#429338"
      u2_users_performance_part5_final_results_vw.total_ratings: "#FF823A"
      u2_users_performance_part5_final_results_vw.total_comments: "#EA4C29"
      u2_users_performance_part5_final_results_vw.current_likes: "#AFF48B"
      u2_users_performance_part5_final_results_vw.total_unique_card_views: "#5EA7CF"
      u2_users_performance_part5_final_results_vw.total_badges_shared: "#E4E5E5"
      u2_users_performance_part5_final_results_vw.followers_users: "#8562B5"
      u2_users_performance_part5_final_results_vw.following_users: "#BFA2D7"
    label_color: [grey]
    defaults_version: 1
    hidden_fields: [u2_users_performance_part5_final_results_vw.total_events]
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Full Name: u2_users_performance_part5_final_results_vw.user_full_name
      ECL Source Name: u2_users_performance_part5_final_results_vw.ecl_source_name
    row: 2
    col: 0
    width: 12
    height: 10
  - name: User Performance [Overview]
    title: User Performance [Overview]
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_grid
    fields: [u2_users_performance_part5_final_results_vw.user_full_name, u2_users_performance_part5_final_results_vw.performance_metric,
      u2_users_performance_part5_final_results_vw.email, u2_users_performance_part5_final_results_vw.count]
    filters: {}
    sorts: [u2_users_performance_part5_final_results_vw.count desc]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", u2_users_performance_part5_final_results_vw.count,
      u2_users_performance_part5_final_results_vw.user_full_name, u2_users_performance_part5_final_results_vw.performance_metric,
      u2_users_performance_part5_final_results_vw.email]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      u2_users_performance_part5_final_results_vw.count: Total
    series_cell_visualizations:
      u2_users_performance_part5_final_results_vw.count:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Full Name: u2_users_performance_part5_final_results_vw.user_full_name
      ECL Source Name: u2_users_performance_part5_final_results_vw.ecl_source_name
    row: 2
    col: 12
    width: 12
    height: 10
  - name: User Performance [Data Explorer]
    title: User Performance [Data Explorer]
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_grid
    fields: [u2_users_performance_part5_final_results_vw.time_time, u2_users_performance_part5_final_results_vw.performance_metric,
      u2_users_performance_part5_final_results_vw.content_structure, u2_users_performance_part5_final_results_vw.user_full_name,
      u2_users_performance_part5_final_results_vw.card_title, u2_users_performance_part5_final_results_vw.followed_user_id,
      u2_users_performance_part5_final_results_vw.standard_card_type, u2_users_performance_part5_final_results_vw.following_user_full_name,
      u2_users_performance_part5_final_results_vw.follower_id, u2_users_performance_part5_final_results_vw.follower_user_full_name,
      u2_users_performance_part5_final_results_vw.shared_to_user_full_name, u2_users_performance_part5_final_results_vw.shared_to_group_name,
      u2_users_performance_part5_final_results_vw.event, u2_users_performance_part5_final_results_vw.card_author_full_name,
      u2_users_performance_part5_final_results_vw.card_resource_url, u2_users_performance_part5_final_results_vw.primary_key]
    filters: {}
    sorts: [u2_users_performance_part5_final_results_vw.time_time desc]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      u2_users_performance_part5_final_results_vw.time_time: Time
    series_text_format:
      u2_users_performance_part5_final_results_vw.time_account_created_time: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    hidden_fields: [u2_users_performance_part5_final_results_vw.primary_key]
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Full Name: u2_users_performance_part5_final_results_vw.user_full_name
      ECL Source Name: u2_users_performance_part5_final_results_vw.ecl_source_name
    row: 12
    col: 0
    width: 12
    height: 8
  - name: Current User LXP Roles
    title: Current User LXP Roles
    model: gcp_concord_dawn_qa
    explore: u2_users_lxp_roles_vw
    type: looker_grid
    fields: [u2_users_lxp_roles_vw.lxp_role, u2_users_lxp_roles_vw.user_full_name,
      u2_users_lxp_roles_vw.email, u2_users_lxp_roles_vw.user_id, u2_users_lxp_roles_vw.user_account_status,
      u2_users_lxp_roles_vw.time_account_created_time]
    filters: {}
    sorts: [u2_users_lxp_roles_vw.time_account_created_time desc]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    series_types: {}
    listen:
      User Account Status: u2_users_lxp_roles_vw.user_account_status
      Excluded From Leaderboard: u2_users_lxp_roles_vw.excluded_from_leaderboard
      User Full Name: u2_users_lxp_roles_vw.user_full_name
    row: 12
    col: 12
    width: 12
    height: 8
  - name: User Activity [Filter Performance Metric]
    title: User Activity [Filter Performance Metric]
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_line
    fields: [u2_users_performance_part5_final_results_vw.time_month, u2_users_performance_part5_final_results_vw.count,
      u2_users_performance_part5_final_results_vw.performance_metric]
    pivots: [u2_users_performance_part5_final_results_vw.performance_metric]
    fill_fields: [u2_users_performance_part5_final_results_vw.time_month]
    filters: {}
    sorts: [u2_users_performance_part5_final_results_vw.time_month desc, u2_users_performance_part5_final_results_vw.performance_metric]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: u2_users_performance_part5_final_results_vw.count,
            id: Current Bookmarks - u2_users_performance_part5_final_results_vw.count,
            name: Current Bookmarks}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Current Likes - u2_users_performance_part5_final_results_vw.count,
            name: Current Likes}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Followers (Users) - u2_users_performance_part5_final_results_vw.count,
            name: Followers (Users)}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Following (Users) - u2_users_performance_part5_final_results_vw.count,
            name: Following (Users)}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Badges Earned - u2_users_performance_part5_final_results_vw.count,
            name: Total Badges Earned}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Bookmarks - u2_users_performance_part5_final_results_vw.count,
            name: Total Bookmarks}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Comments - u2_users_performance_part5_final_results_vw.count,
            name: Total Comments}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Completions - u2_users_performance_part5_final_results_vw.count,
            name: Total Completions}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Content Source Visits - u2_users_performance_part5_final_results_vw.count,
            name: Total Content Source Visits}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Published Journeys - u2_users_performance_part5_final_results_vw.count,
            name: Total Published Journeys}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Published Pathways - u2_users_performance_part5_final_results_vw.count,
            name: Total Published Pathways}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Published SmartCards - u2_users_performance_part5_final_results_vw.count,
            name: Total Published SmartCards}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Shares to Direct Users - u2_users_performance_part5_final_results_vw.count,
            name: Total Shares to Direct Users}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Shares to Groups - u2_users_performance_part5_final_results_vw.count,
            name: Total Shares to Groups}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Unique Card Views - u2_users_performance_part5_final_results_vw.count,
            name: Total Unique Card Views}, {axisId: u2_users_performance_part5_final_results_vw.count,
            id: Total Views - u2_users_performance_part5_final_results_vw.count, name: Total
              Views}], showLabels: false, showValues: true, maxValue: 160000, minValue: -20000,
        valueFormat: '[>999999]#.0,,\M;[>999] 0,"K";0', unpinAxis: true, tickDensity: custom,
        tickDensityCustom: 33, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    font_size: 10px
    series_types: {}
    series_colors:
      Current Bookmarks - u2_users_performance_part5_final_results_vw.count: "#F0AF65"
      Current Likes - u2_users_performance_part5_final_results_vw.count: "#C3E29A"
      Total Bookmarks - u2_users_performance_part5_final_results_vw.count: "#FAECB4"
      Total Comments - u2_users_performance_part5_final_results_vw.count: "#D45F34"
      Total Completions - u2_users_performance_part5_final_results_vw.count: "#679B47"
      Total Content Source Visits - u2_users_performance_part5_final_results_vw.count: "#3E6897"
      Total Published Journeys - u2_users_performance_part5_final_results_vw.count: "#3C7672"
      Total Published Pathways - u2_users_performance_part5_final_results_vw.count: "#7DBCA9"
      Total Published SmartCards - u2_users_performance_part5_final_results_vw.count: "#BBE3CE"
      Total Ratings - u2_users_performance_part5_final_results_vw.count: "#D46156"
      Total Shares to Direct Users - u2_users_performance_part5_final_results_vw.count: "#ED857B"
      Total Shares to Groups - u2_users_performance_part5_final_results_vw.count: "#F3BEB9"
      Total Unique Card Views - u2_users_performance_part5_final_results_vw.count: "#9AC3E1"
      Total Views - u2_users_performance_part5_final_results_vw.count: "#DCEBFB"
    series_point_styles:
      CLC Badges Completed - u2_users_performance_part5_final_results_vw.count: triangle
      Current Bookmarks - u2_users_performance_part5_final_results_vw.count: diamond
      Total Comments - u2_users_performance_part5_final_results_vw.count: square
      Total Content Source Visits - u2_users_performance_part5_final_results_vw.count: square
      Total Published Pathways - u2_users_performance_part5_final_results_vw.count: diamond
      Total Published SmartCards - u2_users_performance_part5_final_results_vw.count: triangle
      Total Ratings - u2_users_performance_part5_final_results_vw.count: triangle
      Total Shares to Direct Users - u2_users_performance_part5_final_results_vw.count: diamond
      Total Shares to Groups - u2_users_performance_part5_final_results_vw.count: square
      Total Unique Card Views - u2_users_performance_part5_final_results_vw.count: triangle
      Total Views - u2_users_performance_part5_final_results_vw.count: triangle
    label_color: [gray]
    x_axis_datetime_label: "%Y-%B"
    x_axis_label_rotation: -90
    defaults_version: 1
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Full Name: u2_users_performance_part5_final_results_vw.user_full_name
      ECL Source Name: u2_users_performance_part5_final_results_vw.ecl_source_name
    row: 20
    col: 0
    width: 12
    height: 8
  - name: Users First Day of Active Engagement
    title: Users First Day of Active Engagement
    model: gcp_concord_dawn_qa
    explore: u3_overall_onboarding_status_part4_final_vw
    type: looker_line
    fields: [u3_overall_onboarding_status_part4_final_vw.count, u3_overall_onboarding_status_part4_final_vw.parsed_first_day_of_active_engagement_month]
    fill_fields: [u3_overall_onboarding_status_part4_final_vw.parsed_first_day_of_active_engagement_month]
    filters: {}
    sorts: [u3_overall_onboarding_status_part4_final_vw.parsed_first_day_of_active_engagement_month
        desc]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: u3_overall_onboarding_status_part4_final_vw.count,
            id: u3_overall_onboarding_status_part4_final_vw.count, name: Users}],
        showLabels: false, showValues: true, maxValue: !!null '', minValue: -500,
        valueFormat: '[<0] "-" 0;[>999] 0.0,"K";0', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 13, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_types:
      u3_overall_onboarding_status_part4_final_vw.count: area
    series_colors:
      u3_overall_onboarding_status_part4_final_vw.first_day_of_active_engagement_date: "#5C8BB6"
      u3_overall_onboarding_status_part4_final_vw.count: "#5C8BB6"
    series_labels:
      u3_overall_onboarding_status_part4_final_vw.count: Users
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    x_axis_label_rotation: -60
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    listen:
      User Account Status: u3_overall_onboarding_status_part4_final_vw.user_account_status
      Excluded From Leaderboard: u3_overall_onboarding_status_part4_final_vw.excluded_from_leaderboard
      User Full Name: u3_overall_onboarding_status_part4_final_vw.user_full_name
    row: 30
    col: 12
    width: 12
    height: 8
  - name: Active Users by Platform
    title: Active Users by Platform
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_grid
    fields: [u2_users_performance_part5_final_results_vw.platform, u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids]
    filters:
      u2_users_performance_part5_final_results_vw.platform: ios,web,android
      u2_users_performance_part5_final_results_vw.content_completion_sync: ''
    sorts: [u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids
        desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids:
        is_active: true
    value_labels: labels
    label_type: labVal
    series_colors:
      android: "#ACD47D"
      web: "#8970BB"
      ios: "#9AC3E1"
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Full Name: u2_users_performance_part5_final_results_vw.user_full_name
      ECL Source Name: u2_users_performance_part5_final_results_vw.ecl_source_name
    row: 40
    col: 0
    width: 12
    height: 9
  - name: Top 20 Skills & Learning Goals-User Analytics
    title: Top 20 Skills & Learning Goals-User Analytics
    model: gcp_concord_dawn_qa
    explore: u2_users_skills_learninggoals_vw
    type: looker_bar
    fields: [u2_users_skills_learninggoals_vw.topic_label, u2_users_skills_learninggoals_vw.count,
      u2_users_skills_learninggoals_vw.topic_type]
    pivots: [u2_users_skills_learninggoals_vw.topic_type]
    filters:
      u2_users_skills_learninggoals_vw.topic_type: Learning Goals,Skills
      u2_users_skills_learninggoals_vw.topic_label: ''
    sorts: [u2_users_skills_learninggoals_vw.topic_type, group_total desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${u2_users_skills_learninggoals_vw.count}))',
        label: Group Total, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: group_total, _type_hint: number,
        id: 0bI2QqsTTA}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: u2_users_skills_learninggoals_vw.count,
            id: Learning Goals - u2_users_skills_learninggoals_vw.count, name: Learning
              Goals}, {axisId: u2_users_skills_learninggoals_vw.count, id: Skills
              - u2_users_skills_learninggoals_vw.count, name: Skills}], showLabels: false,
        showValues: true, valueFormat: '0.0,"K"', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 3, type: linear}, {label: '', orientation: top, series: [
          {axisId: group_total, id: group_total, name: Group Total}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    font_size: 10px
    series_types: {}
    series_colors:
      Learning Goals - u2_users_skills_learninggoals_vw.count: "#93BCDA"
      Skills - u2_users_skills_learninggoals_vw.count: "#A3BD81"
      group_total: "#E9E9E9"
    series_labels:
      Skills - u2_users_skills_learninggoals_vw.count: Skills
      Learning Goals - u2_users_skills_learninggoals_vw.count: Learning Goals
    label_color: [grey]
    defaults_version: 1
    listen:
      Time: u2_users_skills_learninggoals_vw.time_date
      User Account Status: u2_users_skills_learninggoals_vw.user_account_status
      Excluded From Leaderboard: u2_users_skills_learninggoals_vw.excluded_from_leaderboard
      User Full Name: u2_users_skills_learninggoals_vw.user_full_name
    row: 40
    col: 12
    width: 12
    height: 9
  - name: Overall Onboarding Status
    title: Overall Onboarding Status
    model: gcp_concord_dawn_qa
    explore: u3_overall_onboarding_status_part4_final_vw
    type: looker_column
    fields: [u3_overall_onboarding_status_part4_final_vw.overall_onboarding_status,
      u3_overall_onboarding_status_part4_final_vw.count]
    pivots: [u3_overall_onboarding_status_part4_final_vw.overall_onboarding_status]
    filters:
      u3_overall_onboarding_status_part4_final_vw.overall_onboarding_status: ''
    sorts: [u3_overall_onboarding_status_part4_final_vw.count desc 0, u3_overall_onboarding_status_part4_final_vw.overall_onboarding_status]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: u3_overall_onboarding_status_part4_final_vw.count,
            id: '1: Never Signed-In, No Days of Active Engagement - u3_overall_onboarding_status_part4_final_vw.count',
            name: '1: Never Signed-In, No Days of Active Engagement'}, {axisId: u3_overall_onboarding_status_part4_final_vw.count,
            id: '2: Signed-In, No Days of Active Engagement - u3_overall_onboarding_status_part4_final_vw.count',
            name: '2: Signed-In, No Days of Active Engagement'}, {axisId: u3_overall_onboarding_status_part4_final_vw.count,
            id: '3: Signed-In, 1 Day of Active Engagement - u3_overall_onboarding_status_part4_final_vw.count',
            name: '3: Signed-In, 1 Day of Active Engagement'}, {axisId: u3_overall_onboarding_status_part4_final_vw.count,
            id: '4: Signed-In, Multiple Days of Active Engagement - u3_overall_onboarding_status_part4_final_vw.count',
            name: '4: Signed-In, Multiple Days of Active Engagement'}], showLabels: false,
        showValues: true, valueFormat: '[>999999]#.0,,\M;[>999] 0,"K";0', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_colors:
      '1: Never Signed-In, No Days of Active Engagement - u3_overall_onboarding_status_part4_final_vw.count': "#1e324a"
    label_color: [grey]
    column_spacing_ratio: 0.3
    show_dropoff: false
    defaults_version: 1
    listen:
      User Account Status: u3_overall_onboarding_status_part4_final_vw.user_account_status
      Excluded From Leaderboard: u3_overall_onboarding_status_part4_final_vw.excluded_from_leaderboard
      User Full Name: u3_overall_onboarding_status_part4_final_vw.user_full_name
    row: 49
    col: 0
    width: 12
    height: 8
  - name: Actively Engaged Users
    title: Actively Engaged Users
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_line
    fields: [u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
      u2_users_performance_part5_final_results_vw.time_month]
    filters:
      u2_users_performance_part5_final_results_vw.platform: "-LXP-SCORMService"
    sorts: [u2_users_performance_part5_final_results_vw.time_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
            id: u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
            name: Users}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    font_size: 10px
    label_value_format: ''
    series_types: {}
    series_colors:
      u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids: "#3E6897"
    series_labels:
      u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids: Users
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    defaults_version: 1
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Full Name: u2_users_performance_part5_final_results_vw.user_full_name
      ECL Source Name: u2_users_performance_part5_final_results_vw.ecl_source_name
    row: 30
    col: 0
    width: 12
    height: 8
  filters:
  - name: Time
    title: Time
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: gcp_concord_dawn_qa
    explore: u2_users_skills_learninggoals_vw
    listens_to_filters: []
    field: u2_users_skills_learninggoals_vw.time_date
  - name: User Account Status
    title: User Account Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcp_concord_dawn_qa
    explore: u2_users_skills_learninggoals_vw
    listens_to_filters: []
    field: u2_users_skills_learninggoals_vw.user_account_status
  - name: Excluded From Leaderboard
    title: Excluded From Leaderboard
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcp_concord_dawn_qa
    explore: u2_users_skills_learninggoals_vw
    listens_to_filters: []
    field: u2_users_skills_learninggoals_vw.excluded_from_leaderboard
  - name: User Full Name
    title: User Full Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcp_concord_dawn_qa
    explore: u2_users_skills_learninggoals_vw
    listens_to_filters: []
    field: u2_users_skills_learninggoals_vw.user_full_name
  - name: ECL Source Name
    title: ECL Source Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    listens_to_filters: []
    field: u2_users_performance_part5_final_results_vw.ecl_source_name
  - name: Performance Metric
    title: Performance Metric
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    listens_to_filters: []
    field: u2_users_performance_part5_final_results_vw.performance_metric
  - name: Card Title
    title: Card Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    listens_to_filters: []
    field: u2_users_performance_part5_final_results_vw.card_title
