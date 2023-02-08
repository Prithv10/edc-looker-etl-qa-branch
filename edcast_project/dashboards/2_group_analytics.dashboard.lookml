- dashboard: 2__group_analytics
  title: 2. Group Analytics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1mykA19jZInXuU1dDKSWqw
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Group Trends**##"
    row: 41
    col: 9
    width: 8
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "##  **Group Performance**##"
    row: 0
    col: 9
    width: 6
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Group Attributes**##"
    row: 60
    col: 10
    width: 6
    height: 2
  - name: Top 20 Channels [Filter Group]
    title: Top 20 Channels [Filter Group]
    model: concord
    explore: g3_groups_channel_performance_vw
    type: looker_column
    fields: [g3_groups_channel_performance_vw.channel_name, g3_groups_channel_performance_vw.current_collaborators,
      g3_groups_channel_performance_vw.current_curators, g3_groups_channel_performance_vw.current_followers,
      g3_groups_channel_performance_vw.total_distinct_user_visits, g3_groups_channel_performance_vw.total_visits,
      g3_groups_channel_performance_vw.total_events]
    filters:
      g3_groups_channel_performance_vw.channel_status: "-EMPTY"
      g3_groups_channel_performance_vw.performance_metric: ''
    sorts: [g3_groups_channel_performance_vw.total_events desc]
    limit: 20
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_channel_performance_vw.current_collaborators,
            id: g3_groups_channel_performance_vw.current_collaborators, name: Current
              Collaborators}, {axisId: g3_groups_channel_performance_vw.current_curators,
            id: g3_groups_channel_performance_vw.current_curators, name: Current Curators},
          {axisId: g3_groups_channel_performance_vw.current_followers, id: g3_groups_channel_performance_vw.current_followers,
            name: Current Followers}, {axisId: g3_groups_channel_performance_vw.total_distinct_user_visits,
            id: g3_groups_channel_performance_vw.total_distinct_user_visits, name: Total
              Distinct User Visits}, {axisId: g3_groups_channel_performance_vw.total_visits,
            id: g3_groups_channel_performance_vw.total_visits, name: Total Visits}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
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
      Current Collaborators - g3_groups_channel_performance_vw.count: "#FAECB4"
      Current Curators - g3_groups_channel_performance_vw.count: "#F0AF65"
      Current Followers - g3_groups_channel_performance_vw.count: "#679B47"
      Total Distinct User Visits - g3_groups_channel_performance_vw.count: "#9AC3E1"
      Total Visits - g3_groups_channel_performance_vw.count: "#DCEBFB"
      g3_groups_channel_performance_vw.current_collaborators: "#FAECB4"
      g3_groups_channel_performance_vw.current_curators: "#F0AF65"
      g3_groups_channel_performance_vw.current_followers: "#679B47"
      g3_groups_channel_performance_vw.total_distinct_user_visits: "#80AFD3"
      g3_groups_channel_performance_vw.total_visits: "#9AC3E1"
    label_color: [grey]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [g3_groups_channel_performance_vw.total_events]
    listen:
      Time: g3_groups_channel_performance_vw.time_date
      Group Name: g3_groups_channel_performance_vw.group_name
      User Full Name: g3_groups_channel_performance_vw.user_full_name
      User Account Status: g3_groups_channel_performance_vw.user_account_status
      Excluded From Leaderboard: g3_groups_channel_performance_vw.excluded_from_leaderboard
    row: 22
    col: 0
    width: 12
    height: 9
  - name: Group User Performance [Data Explorer]
    title: Group User Performance [Data Explorer]
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_grid
    fields: [g3_groups_performance_data_explorer_vw.time_time, g3_groups_performance_data_explorer_vw.performance_metric,
      g3_groups_performance_data_explorer_vw.group_name, g3_groups_performance_data_explorer_vw.user_full_name,
      g3_groups_performance_data_explorer_vw.email, g3_groups_performance_data_explorer_vw.event,
      g3_groups_performance_data_explorer_vw.content_structure, g3_groups_performance_data_explorer_vw.card_title,
      g3_groups_performance_data_explorer_vw.followed_user_id, g3_groups_performance_data_explorer_vw.following_user_full_name,
      g3_groups_performance_data_explorer_vw.follower_id, g3_groups_performance_data_explorer_vw.follower_user_full_name,
      g3_groups_performance_data_explorer_vw.shared_to_user_full_name, g3_groups_performance_data_explorer_vw.shared_to_group_name,
      g3_groups_performance_data_explorer_vw.card_author_full_name, g3_groups_performance_data_explorer_vw.card_resource_url,
      g3_groups_performance_data_explorer_vw.comment_message, g3_groups_performance_data_explorer_vw.primary_key]
    filters:
      g3_groups_performance_data_explorer_vw.performance_metric: "-EMPTY"
    sorts: [g3_groups_performance_data_explorer_vw.time_time desc]
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
      g3_groups_performance_data_explorer_vw.time_time: Time
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    series_types: {}
    defaults_version: 1
    hidden_fields: [g3_groups_performance_data_explorer_vw.primary_key]
    listen:
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Time: g3_groups_performance_data_explorer_vw.time_date
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 2
    col: 12
    width: 12
    height: 11
  - name: Top 20 Searches [Last 30 Days] [Filter Group]
    title: Top 20 Searches [Last 30 Days] [Filter Group]
    model: concord
    explore: g3_groups_search_user_details_vw
    type: looker_bar
    fields: [g3_groups_search_user_details_vw.search_query, g3_groups_search_user_details_vw.web,
      g3_groups_search_user_details_vw.android, g3_groups_search_user_details_vw.ios,
      g3_groups_search_user_details_vw.total_platforms]
    filters:
      g3_groups_search_user_details_vw.search_query: "-NULL,-*"
      g3_groups_search_user_details_vw.platform: android,ios,web
    sorts: [g3_groups_search_user_details_vw.total_platforms desc]
    limit: 20
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
    color_application:
      collection_id: edcast-s-faves
      palette_id: edcast-s-faves-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: g3_groups_search_user_details_vw.web,
            id: g3_groups_search_user_details_vw.web, name: Web}, {axisId: g3_groups_search_user_details_vw.android,
            id: g3_groups_search_user_details_vw.android, name: Android}, {axisId: g3_groups_search_user_details_vw.ios,
            id: g3_groups_search_user_details_vw.ios, name: Ios}], showLabels: false,
        showValues: true, valueFormat: '[>999999]#.0,,\M;[>999] 0.0,"K";0', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    font_size: 10px
    series_types: {}
    series_colors:
      android - g3_groups_search_user_details_vw.count: "#ACD47D"
      ios - g3_groups_search_user_details_vw.count: "#9AC3E1"
      web - g3_groups_search_user_details_vw.count: "#8970BB"
      g3_groups_search_user_details_vw.android: "#ACD47D"
      g3_groups_search_user_details_vw.web: "#8970BB"
      g3_groups_search_user_details_vw.ios: "#9AC3E1"
    label_color: [grey]
    defaults_version: 1
    hidden_fields: [g3_groups_search_user_details_vw.total_platforms]
    listen:
      Time: g3_groups_search_user_details_vw.time_date
      Group Name: g3_groups_search_user_details_vw.group_name
      User Full Name: g3_groups_search_user_details_vw.user_full_name
      User Account Status: g3_groups_search_user_details_vw.user_account_status
      Excluded From Leaderboard: g3_groups_search_user_details_vw.excluded_from_leaderboard
    row: 31
    col: 0
    width: 12
    height: 10
  - name: Top 20 Users [Filter Group]
    title: Top 20 Users [Filter Group]
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_column
    fields: [g3_groups_performance_data_explorer_vw.user_full_name, g3_groups_performance_data_explorer_vw.clc_badges_completed,
      g3_groups_performance_data_explorer_vw.current_bookmarks, g3_groups_performance_data_explorer_vw.current_likes,
      g3_groups_performance_data_explorer_vw.followers_users, g3_groups_performance_data_explorer_vw.following_users,
      g3_groups_performance_data_explorer_vw.total_badges_earned, g3_groups_performance_data_explorer_vw.total_badges_shared,
      g3_groups_performance_data_explorer_vw.total_bookmarks, g3_groups_performance_data_explorer_vw.total_comments,
      g3_groups_performance_data_explorer_vw.total_completions, g3_groups_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_performance_data_explorer_vw.total_published_journeys, g3_groups_performance_data_explorer_vw.total_published_pathways,
      g3_groups_performance_data_explorer_vw.total_published_smartcards, g3_groups_performance_data_explorer_vw.total_ratings,
      g3_groups_performance_data_explorer_vw.total_shares_to_direct_users, g3_groups_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_performance_data_explorer_vw.total_unique_card_views, g3_groups_performance_data_explorer_vw.total_views,
      g3_groups_performance_data_explorer_vw.total_events]
    filters:
      g3_groups_performance_data_explorer_vw.performance_metric: "-EMPTY"
    sorts: [g3_groups_performance_data_explorer_vw.total_events desc]
    limit: 20
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_performance_data_explorer_vw.clc_badges_completed,
            id: g3_groups_performance_data_explorer_vw.clc_badges_completed, name: Clc
              Badges Completed}, {axisId: g3_groups_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_performance_data_explorer_vw.current_bookmarks, name: Current
              Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.current_likes,
            id: g3_groups_performance_data_explorer_vw.current_likes, name: Current
              Likes}, {axisId: g3_groups_performance_data_explorer_vw.followers_users,
            id: g3_groups_performance_data_explorer_vw.followers_users, name: Followers
              Users}, {axisId: g3_groups_performance_data_explorer_vw.following_users,
            id: g3_groups_performance_data_explorer_vw.following_users, name: Following
              Users}, {axisId: g3_groups_performance_data_explorer_vw.total_badges_earned,
            id: g3_groups_performance_data_explorer_vw.total_badges_earned, name: Total
              Badges Earned}, {axisId: g3_groups_performance_data_explorer_vw.total_badges_shared,
            id: g3_groups_performance_data_explorer_vw.total_badges_shared, name: Total
              Badges Shared}, {axisId: g3_groups_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_performance_data_explorer_vw.total_bookmarks, name: Total
              Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.total_comments,
            id: g3_groups_performance_data_explorer_vw.total_comments, name: Total
              Comments}, {axisId: g3_groups_performance_data_explorer_vw.total_completions,
            id: g3_groups_performance_data_explorer_vw.total_completions, name: Total
              Completions}, {axisId: g3_groups_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_performance_data_explorer_vw.total_published_journeys, name: Total
              Published Journeys}, {axisId: g3_groups_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_performance_data_explorer_vw.total_published_pathways, name: Total
              Published Pathways}, {axisId: g3_groups_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_performance_data_explorer_vw.total_ratings,
            id: g3_groups_performance_data_explorer_vw.total_ratings, name: Total
              Ratings}, {axisId: g3_groups_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_performance_data_explorer_vw.total_shares_to_groups, name: Total
              Shares to Groups}, {axisId: g3_groups_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_performance_data_explorer_vw.total_unique_card_views, name: Total
              Unique Card Views}, {axisId: g3_groups_performance_data_explorer_vw.total_views,
            id: g3_groups_performance_data_explorer_vw.total_views, name: Total Views}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
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
      Total Views - g3_groups_performance_data_explorer_vw.count: "#9AC3E1"
      Total Content Source Visits - g3_groups_performance_data_explorer_vw.count: "#205D8E"
      Total Shares to Direct Users - g3_groups_performance_data_explorer_vw.count: "#FF746E"
      Total Bookmarks - g3_groups_performance_data_explorer_vw.count: "#FFE9A8"
      Total Badges Shared - g3_groups_performance_data_explorer_vw.count: "#E4E5E5"
      Total Completions - g3_groups_performance_data_explorer_vw.count: "#429338"
      CLC Badges Completed - g3_groups_performance_data_explorer_vw.count: "#D6F2B5"
      Current Bookmarks - g3_groups_performance_data_explorer_vw.count: "#FFA335"
      Current Likes - g3_groups_performance_data_explorer_vw.count: "#AFF48B"
      Followers (Users) - g3_groups_performance_data_explorer_vw.count: "#8562B5"
      Following (Users) - g3_groups_performance_data_explorer_vw.count: "#BFA2D7"
      Total Badges Earned - g3_groups_performance_data_explorer_vw.count: "#CBCBCB"
      Total Comments - g3_groups_performance_data_explorer_vw.count: "#EA4C29"
      Total Published Journeys - g3_groups_performance_data_explorer_vw.count: "#006D66"
      Total Published Pathways - g3_groups_performance_data_explorer_vw.count: "#50B69E"
      Total Published SmartCards - g3_groups_performance_data_explorer_vw.count: "#9AE0C4"
      Total Shares to Groups - g3_groups_performance_data_explorer_vw.count: "#FFB4B0"
      g3_groups_performance_data_explorer_vw.total_views: "#D1E8FB"
      g3_groups_performance_data_explorer_vw.total_unique_card_views: "#5EA7CF"
      g3_groups_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_performance_data_explorer_vw.total_published_pathways: "#50B69E"
      g3_groups_performance_data_explorer_vw.total_published_journeys: "#006D66"
      g3_groups_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_performance_data_explorer_vw.total_badges_shared: "#E4E5E5"
      g3_groups_performance_data_explorer_vw.total_badges_earned: "#CBCBCB"
      g3_groups_performance_data_explorer_vw.following_users: "#BFA2D7"
      g3_groups_performance_data_explorer_vw.followers_users: "#8562B5"
      g3_groups_performance_data_explorer_vw.current_likes: "#AFF48B"
      g3_groups_performance_data_explorer_vw.current_bookmarks: "#FFA355"
      g3_groups_performance_data_explorer_vw.clc_badges_completed: "#D6F2B5"
    label_color: [grey]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [g3_groups_performance_data_explorer_vw.total_events]
    listen:
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Time: g3_groups_performance_data_explorer_vw.time_date
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 13
    col: 12
    width: 12
    height: 9
  - name: Group Performance [Overview]
    title: Group Performance [Overview]
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_grid
    fields: [g3_groups_performance_data_explorer_vw.performance_metric, g3_groups_performance_data_explorer_vw.count,
      g3_groups_performance_data_explorer_vw.group_name]
    filters:
      g3_groups_performance_data_explorer_vw.performance_metric: "-EMPTY"
    sorts: [g3_groups_performance_data_explorer_vw.count desc 0]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [g3_groups_performance_data_explorer_vw.count, g3_groups_performance_data_explorer_vw.performance_metric,
      g3_groups_performance_data_explorer_vw.group_name]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      g3_groups_performance_data_explorer_vw.count: Total
    series_cell_visualizations:
      g3_groups_performance_data_explorer_vw.count:
        is_active: false
    series_text_format:
      g3_groups_performance_data_explorer_vw.count:
        align: left
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
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Time: g3_groups_performance_data_explorer_vw.time_date
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 22
    col: 12
    width: 12
    height: 9
  - name: Assignment Status [Data Explorer] [Filter Group]
    title: Assignment Status [Data Explorer] [Filter Group]
    model: concord
    explore: g3_groups_assignment_status_vw
    type: looker_grid
    fields: [g3_groups_assignment_status_vw.group_name, g3_groups_assignment_status_vw.user_full_name,
      g3_groups_assignment_status_vw.assignor_full_name, g3_groups_assignment_status_vw.assignment_state,
      g3_groups_assignment_status_vw.time_assignment_started_date, g3_groups_assignment_status_vw.time_completed_date,
      g3_groups_assignment_status_vw.assignment_due_date, g3_groups_assignment_status_vw.card_title,
      g3_groups_assignment_status_vw.assignment_type, g3_groups_assignment_status_vw.email,
      g3_groups_assignment_status_vw.count_of_group_assignment_association]
    filters:
      g3_groups_assignment_status_vw.assignment_state: ''
      g3_groups_assignment_status_vw.group_assignment_association: ''
      g3_groups_assignment_status_vw.assignor_full_name: ''
    sorts: [g3_groups_assignment_status_vw.card_title, g3_groups_assignment_status_vw.time_completed_date
        desc, g3_groups_assignment_status_vw.time_assignment_started_date desc, g3_groups_assignment_status_vw.assignment_state
        desc]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", g3_groups_assignment_status_vw.group_name,
      g3_groups_assignment_status_vw.user_full_name, g3_groups_assignment_status_vw.assignor_full_name,
      g3_groups_assignment_status_vw.assignment_state, g3_groups_assignment_status_vw.time_assignment_started_date,
      g3_groups_assignment_status_vw.time_completed_date, g3_groups_assignment_status_vw.assignment_due_date,
      g3_groups_assignment_status_vw.card_title, g3_groups_assignment_status_vw.assignment_type,
      g3_groups_assignment_status_vw.count_of_group_assignment_association, g3_groups_assignment_status_vw.email]
    show_totals: true
    show_row_totals: true
    truncate_header: false
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
      Group Name: g3_groups_assignment_status_vw.group_name
      User Full Name: g3_groups_assignment_status_vw.user_full_name
      User Account Status: g3_groups_assignment_status_vw.user_account_status
      Excluded From Leaderboard: g3_groups_assignment_status_vw.excluded_from_leaderboard
      Card Title: g3_groups_assignment_status_vw.card_title
      ECL Source Name: g3_groups_assignment_status_vw.ecl_source_name
    row: 70
    col: 0
    width: 24
    height: 10
  - name: Actively Engaged Users [Filter Group]
    title: Actively Engaged Users [Filter Group]
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_line
    fields: [g3_groups_performance_data_explorer_vw.group_name, g3_groups_performance_data_explorer_vw.distinct_active_users,
      g3_groups_performance_data_explorer_vw.time_date]
    pivots: [g3_groups_performance_data_explorer_vw.group_name]
    fill_fields: [g3_groups_performance_data_explorer_vw.time_date]
    filters:
      g3_groups_performance_data_explorer_vw.performance_metric: "-Followers (Users)"
    sorts: [g3_groups_performance_data_explorer_vw.group_name, g3_groups_performance_data_explorer_vw.time_date
        desc]
    limit: 50
    column_limit: 20
    dynamic_fields: [{category: measure, expression: '', label: Distinct Active Users,
        based_on: g3_groups_performance_data_explorer_vw.user_id, _kind_hint: measure,
        measure: distinct_active_users, type: count_distinct, _type_hint: number,
        id: MNIwBaoeGZ}]
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
    legend_position: right
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: "??? (japan Financials)\
              \ - g3_groups_performance_data_explorer_vw.distinct_active_users", id: "???\
              \ (japan Financials) - g3_groups_performance_data_explorer_vw.distinct_active_users",
            name: "??? (japan Financials)"}, {axisId: 17june2022 - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: 17june2022 - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: 17june2022}, {axisId: 2019 Intake - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: 2019 Intake - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: 2019 Intake}, {axisId: '2019 Intake: Transport & Automotive Design  -
              g3_groups_performance_data_explorer_vw.distinct_active_users', id: '2019
              Intake: Transport & Automotive Design  - g3_groups_performance_data_explorer_vw.distinct_active_users',
            name: '2019 Intake: Transport & Automotive Design '}, {axisId: 2019 New
              Employees Cohort - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: 2019 New Employees Cohort - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: 2019 New Employees Cohort}, {axisId: '2019: Alumni - g3_groups_performance_data_explorer_vw.distinct_active_users',
            id: '2019: Alumni - g3_groups_performance_data_explorer_vw.distinct_active_users',
            name: '2019: Alumni'}, {axisId: Abc - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Abc - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Abc}, {axisId: Abhishek - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Abhishek - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Abhishek}, {axisId: Academy Test Group (development Only) - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Academy Test Group (development Only) - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Academy Test Group (development Only)}, {axisId: Accurics - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Accurics - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Accurics}, {axisId: Accurics Customer Success - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Accurics Customer Success - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Accurics Customer Success}, {axisId: Adecco  - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Adecco  - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: 'Adecco '}, {axisId: Adp - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Adp - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Adp}, {axisId: Agile Guild - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Agile Guild - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Agile Guild}, {axisId: Agile Physical Therapy - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Agile Physical Therapy - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Agile Physical Therapy}, {axisId: Agp Glass - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Agp Glass - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Agp Glass}, {axisId: Ai-centric Learning Automation - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Ai-centric Learning Automation - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Ai-centric Learning Automation}, {axisId: Aia Sales - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Aia Sales - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Aia Sales}, {axisId: Aip Test - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Aip Test - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Aip Test}, {axisId: Algonquin - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Algonquin - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Algonquin}, {axisId: Allworx - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Allworx - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Allworx}, {axisId: Alternatives To Reduce Plastic - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Alternatives To Reduce Plastic - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Alternatives To Reduce Plastic}, {axisId: Amea - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Amea - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Amea}, {axisId: Amea Sales - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Amea Sales - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Amea Sales}, {axisId: Americas West Sales Team - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Americas West Sales Team - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Americas West Sales Team}, {axisId: Anitab.org Premium Members -
              Upskilling Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Anitab.org Premium Members - Upskilling Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Anitab.org Premium Members - Upskilling Group}, {axisId: Apple123
              Test Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Apple123 Test Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Apple123 Test Group}, {axisId: Apprendio - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Apprendio - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Apprendio}, {axisId: Arun Singh - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Arun Singh - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Arun Singh}, {axisId: Asda - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Asda - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Asda}, {axisId: Atd Golden Gate - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Atd Golden Gate - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Atd Golden Gate}, {axisId: Au And Nz Region - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Au And Nz Region - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Au And Nz Region}, {axisId: Autocad - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Autocad - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Autocad}, {axisId: Avathon Capital  - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Avathon Capital  - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: 'Avathon Capital '}, {axisId: Axel Springer - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Axel Springer - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Axel Springer}, {axisId: Ayan Holding - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Ayan Holding - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Ayan Holding}, {axisId: Bain & Company - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bain & Company - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bain & Company}, {axisId: Bangalore Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bangalore Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bangalore Group}, {axisId: Bank Of Canada - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bank Of Canada - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bank Of Canada}, {axisId: Barghausen Consulting - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Barghausen Consulting - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Barghausen Consulting}, {axisId: Bas' Private Auditorium For Awesome
              Pitch Practice - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bas' Private Auditorium For Awesome Pitch Practice - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bas' Private Auditorium For Awesome Pitch Practice}, {axisId: Bdm
              Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bdm Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bdm Group}, {axisId: Bdm Mumbai - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bdm Mumbai - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bdm Mumbai}, {axisId: Belgium Pension Plus - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Belgium Pension Plus - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Belgium Pension Plus}, {axisId: Bic - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bic - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bic}, {axisId: Blockchain Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Blockchain Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Blockchain Group}, {axisId: Boardwalktech - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Boardwalktech - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Boardwalktech}, {axisId: Brian Hewitt's Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Brian Hewitt's Group - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Brian Hewitt's Group}, {axisId: Bright Stars - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: Bright Stars - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: Bright Stars}, {axisId: C - g3_groups_performance_data_explorer_vw.distinct_active_users,
            id: C - g3_groups_performance_data_explorer_vw.distinct_active_users,
            name: C}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    hide_legend: false
    label_value_format: ''
    series_types: {}
    series_labels: {}
    x_axis_datetime_label: "%Y%b"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Time: g3_groups_performance_data_explorer_vw.time_date
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 43
    col: 0
    width: 12
    height: 8
  - name: User Activity [Filter Group]
    title: User Activity [Filter Group]
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_line
    fields: [g3_groups_performance_data_explorer_vw.performance_metric, g3_groups_performance_data_explorer_vw.count,
      g3_groups_performance_data_explorer_vw.time_month]
    pivots: [g3_groups_performance_data_explorer_vw.performance_metric]
    fill_fields: [g3_groups_performance_data_explorer_vw.time_month]
    filters:
      g3_groups_performance_data_explorer_vw.performance_metric: "-EMPTY"
    sorts: [g3_groups_performance_data_explorer_vw.performance_metric, g3_groups_performance_data_explorer_vw.time_month
        desc]
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_performance_data_explorer_vw.count,
            id: Current Bookmarks - g3_groups_performance_data_explorer_vw.count,
            name: Current Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Current Likes - g3_groups_performance_data_explorer_vw.count, name: Current
              Likes}, {axisId: g3_groups_performance_data_explorer_vw.count, id: Total
              Bookmarks - g3_groups_performance_data_explorer_vw.count, name: Total
              Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.count, id: Total
              Comments - g3_groups_performance_data_explorer_vw.count, name: Total
              Comments}, {axisId: g3_groups_performance_data_explorer_vw.count, id: Total
              Completions - g3_groups_performance_data_explorer_vw.count, name: Total
              Completions}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Content Source Visits - g3_groups_performance_data_explorer_vw.count,
            name: Total Content Source Visits}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Published Journeys - g3_groups_performance_data_explorer_vw.count,
            name: Total Published Journeys}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Published Pathways - g3_groups_performance_data_explorer_vw.count,
            name: Total Published Pathways}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Published SmartCards - g3_groups_performance_data_explorer_vw.count,
            name: Total Published SmartCards}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Shares to Direct Users - g3_groups_performance_data_explorer_vw.count,
            name: Total Shares to Direct Users}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Shares to Groups - g3_groups_performance_data_explorer_vw.count,
            name: Total Shares to Groups}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Unique Card Views - g3_groups_performance_data_explorer_vw.count,
            name: Total Unique Card Views}, {axisId: g3_groups_performance_data_explorer_vw.count,
            id: Total Views - g3_groups_performance_data_explorer_vw.count, name: Total
              Views}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_types: {}
    series_colors:
      Total Shares to Direct Users - g3_groups_performance_data_explorer_vw.count: "#D45F34"
      Current Likes - g3_groups_performance_data_explorer_vw.count: "#ACD47D"
      Total Unique Card Views - g3_groups_performance_data_explorer_vw.count: "#3E6897"
      Total Completions - g3_groups_performance_data_explorer_vw.count: "#679B47"
      Total Content Source Visits - g3_groups_performance_data_explorer_vw.count: "#3E6897"
      Total Published SmartCards - g3_groups_performance_data_explorer_vw.count: "#5acfd4"
      Total Bookmarks - g3_groups_performance_data_explorer_vw.count: "#FAECB4"
      Total Shares to Groups - g3_groups_performance_data_explorer_vw.count: "#bc8db4"
      Total Published Journeys - g3_groups_performance_data_explorer_vw.count: "#3C7672"
    series_point_styles:
      Total Views - g3_groups_performance_data_explorer_vw.count: diamond
      Total Shares to Direct Users - g3_groups_performance_data_explorer_vw.count: triangle
      Current Likes - g3_groups_performance_data_explorer_vw.count: square
      Total Unique Card Views - g3_groups_performance_data_explorer_vw.count: triangle
      Total Published SmartCards - g3_groups_performance_data_explorer_vw.count: diamond
      Total Bookmarks - g3_groups_performance_data_explorer_vw.count: square
    label_color: [grey]
    defaults_version: 1
    listen:
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Time: g3_groups_performance_data_explorer_vw.time_date
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 43
    col: 12
    width: 12
    height: 8
  - name: Channel Activity [Filter Group]
    title: Channel Activity [Filter Group]
    model: concord
    explore: g3_groups_channel_performance_vw
    type: looker_line
    fields: [g3_groups_channel_performance_vw.count, g3_groups_channel_performance_vw.performance_metric,
      g3_groups_channel_performance_vw.time_month]
    pivots: [g3_groups_channel_performance_vw.performance_metric]
    fill_fields: [g3_groups_channel_performance_vw.time_month]
    filters:
      g3_groups_channel_performance_vw.channel_status: "-EMPTY"
      g3_groups_channel_performance_vw.performance_metric: ''
      g3_groups_channel_performance_vw.channel_name: ''
    sorts: [g3_groups_channel_performance_vw.performance_metric desc, g3_groups_channel_performance_vw.time_month
        desc]
    limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_channel_performance_vw.count,
            id: Total Visits - g3_groups_channel_performance_vw.count, name: Total
              Visits}, {axisId: g3_groups_channel_performance_vw.count, id: Total
              Distinct User Visits - g3_groups_channel_performance_vw.count, name: Total
              Distinct User Visits}, {axisId: g3_groups_channel_performance_vw.count,
            id: Current Followers - g3_groups_channel_performance_vw.count, name: Current
              Followers}, {axisId: g3_groups_channel_performance_vw.count, id: Current
              Curators - g3_groups_channel_performance_vw.count, name: Current Curators},
          {axisId: g3_groups_channel_performance_vw.count, id: Current Collaborators
              - g3_groups_channel_performance_vw.count, name: Current Collaborators}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: custom, tickDensityCustom: 7,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_colors:
      Total Visits - g3_groups_channel_performance_vw.count: "#9AC3E1"
      Current Curators - g3_groups_channel_performance_vw.count: "#ED9149"
      Current Collaborators - g3_groups_channel_performance_vw.count: "#FAECB4"
      Total Distinct User Visits - g3_groups_channel_performance_vw.count: "#3E6897"
      Current Followers - g3_groups_channel_performance_vw.count: "#679B47"
    series_point_styles:
      Current Collaborators - g3_groups_channel_performance_vw.count: square
      Current Curators - g3_groups_channel_performance_vw.count: triangle
      Total Distinct User Visits - g3_groups_channel_performance_vw.count: diamond
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    x_axis_label_rotation: -45
    defaults_version: 1
    listen:
      Time: g3_groups_channel_performance_vw.time_date
      Group Name: g3_groups_channel_performance_vw.group_name
      User Full Name: g3_groups_channel_performance_vw.user_full_name
      User Account Status: g3_groups_channel_performance_vw.user_account_status
      Excluded From Leaderboard: g3_groups_channel_performance_vw.excluded_from_leaderboard
    row: 51
    col: 0
    width: 12
    height: 9
  - name: Active Group Users By Platform
    title: Active Group Users By Platform
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_bar
    fields: [g3_groups_performance_data_explorer_vw.group_name, g3_groups_performance_data_explorer_vw.android,
      g3_groups_performance_data_explorer_vw.ios, g3_groups_performance_data_explorer_vw.web,
      g3_groups_performance_data_explorer_vw.total_platforms]
    filters:
      g3_groups_performance_data_explorer_vw.performance_metric: "-Followers (Users)"
      g3_groups_performance_data_explorer_vw.platform: android,ios,web
      g3_groups_performance_data_explorer_vw.referer: ''
      g3_groups_performance_data_explorer_vw.card_author_full_name: ''
    sorts: [g3_groups_performance_data_explorer_vw.total_platforms desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Distinct Active Users,
        based_on: g3_groups_performance_data_explorer_vw.user_id, _kind_hint: measure,
        measure: distinct_active_users, type: count_distinct, _type_hint: number,
        id: TxDdC3owwL}, {category: table_calculation, expression: 'sum(pivot_row(
          ${g3_groups_performance_data_explorer_vw.distinct_active_users}))', label: Total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number, id: mB1EE1vzdT, is_disabled: true}]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: g3_groups_performance_data_explorer_vw.android,
            id: g3_groups_performance_data_explorer_vw.android, name: Android}, {
            axisId: g3_groups_performance_data_explorer_vw.ios, id: g3_groups_performance_data_explorer_vw.ios,
            name: Ios}, {axisId: g3_groups_performance_data_explorer_vw.web, id: g3_groups_performance_data_explorer_vw.web,
            name: Web}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    series_types: {}
    series_colors:
      web - distinct_active_users: "#8970BB"
      ios - distinct_active_users: "#9AC3E1"
      android - distinct_active_users: "#8FBF69"
      android - g3_groups_performance_data_explorer_vw.distinct_active_users: "#8FBF69"
      web - g3_groups_performance_data_explorer_vw.distinct_active_users: "#8970BB"
      ios - g3_groups_performance_data_explorer_vw.distinct_active_users: "#9AC3E1"
      g3_groups_performance_data_explorer_vw.web: "#8970BB"
      g3_groups_performance_data_explorer_vw.ios: "#9AC3E1"
      g3_groups_performance_data_explorer_vw.android: "#ACD47D"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [g3_groups_performance_data_explorer_vw.total_platforms]
    listen:
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Time: g3_groups_performance_data_explorer_vw.time_date
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 80
    col: 0
    width: 12
    height: 8
  - name: Top 20 Content [Filter Group]
    title: Top 20 Content [Filter Group]
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_bar
    fields: [g3_groups_performance_data_explorer_vw.card_title, g3_groups_performance_data_explorer_vw.clc_badges_completed,
      g3_groups_performance_data_explorer_vw.current_bookmarks, g3_groups_performance_data_explorer_vw.current_likes,
      g3_groups_performance_data_explorer_vw.followers_users, g3_groups_performance_data_explorer_vw.following_users,
      g3_groups_performance_data_explorer_vw.total_badges_earned, g3_groups_performance_data_explorer_vw.total_badges_shared,
      g3_groups_performance_data_explorer_vw.total_bookmarks, g3_groups_performance_data_explorer_vw.total_comments,
      g3_groups_performance_data_explorer_vw.total_completions, g3_groups_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_performance_data_explorer_vw.total_published_journeys, g3_groups_performance_data_explorer_vw.total_published_pathways,
      g3_groups_performance_data_explorer_vw.total_published_smartcards, g3_groups_performance_data_explorer_vw.total_ratings,
      g3_groups_performance_data_explorer_vw.total_shares_to_direct_users, g3_groups_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_performance_data_explorer_vw.total_unique_card_views, g3_groups_performance_data_explorer_vw.total_views,
      g3_groups_performance_data_explorer_vw.total_events]
    filters:
      g3_groups_performance_data_explorer_vw.content_structure: ''
      g3_groups_performance_data_explorer_vw.performance_metric: ''
    sorts: [g3_groups_performance_data_explorer_vw.total_events desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${g3_groups_performance_data_explorer_vw.count}))',
        label: Total, value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number, id: iMVDD067xL, is_disabled: true}]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: g3_groups_performance_data_explorer_vw.clc_badges_completed,
            id: g3_groups_performance_data_explorer_vw.clc_badges_completed, name: Clc
              Badges Completed}, {axisId: g3_groups_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_performance_data_explorer_vw.current_bookmarks, name: Current
              Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.current_likes,
            id: g3_groups_performance_data_explorer_vw.current_likes, name: Current
              Likes}, {axisId: g3_groups_performance_data_explorer_vw.followers_users,
            id: g3_groups_performance_data_explorer_vw.followers_users, name: Followers
              Users}, {axisId: g3_groups_performance_data_explorer_vw.following_users,
            id: g3_groups_performance_data_explorer_vw.following_users, name: Following
              Users}, {axisId: g3_groups_performance_data_explorer_vw.total_badges_earned,
            id: g3_groups_performance_data_explorer_vw.total_badges_earned, name: Total
              Badges Earned}, {axisId: g3_groups_performance_data_explorer_vw.total_badges_shared,
            id: g3_groups_performance_data_explorer_vw.total_badges_shared, name: Total
              Badges Shared}, {axisId: g3_groups_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_performance_data_explorer_vw.total_bookmarks, name: Total
              Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.total_comments,
            id: g3_groups_performance_data_explorer_vw.total_comments, name: Total
              Comments}, {axisId: g3_groups_performance_data_explorer_vw.total_completions,
            id: g3_groups_performance_data_explorer_vw.total_completions, name: Total
              Completions}, {axisId: g3_groups_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_performance_data_explorer_vw.total_published_journeys, name: Total
              Published Journeys}, {axisId: g3_groups_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_performance_data_explorer_vw.total_published_pathways, name: Total
              Published Pathways}, {axisId: g3_groups_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_performance_data_explorer_vw.total_ratings,
            id: g3_groups_performance_data_explorer_vw.total_ratings, name: Total
              Ratings}, {axisId: g3_groups_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_performance_data_explorer_vw.total_shares_to_groups, name: Total
              Shares to Groups}, {axisId: g3_groups_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_performance_data_explorer_vw.total_unique_card_views, name: Total
              Unique Card Views}, {axisId: g3_groups_performance_data_explorer_vw.total_views,
            id: g3_groups_performance_data_explorer_vw.total_views, name: Total Views}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
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
      Current Likes - g3_groups_performance_data_explorer_vw.count: "#AFF48B"
      Total Comments - g3_groups_performance_data_explorer_vw.count: "#EA4C29"
      Total Published Pathways - g3_groups_performance_data_explorer_vw.count: "#50B69E"
      Total Shares to Direct Groups - g3_groups_performance_data_explorer_vw.count: "#FFB4B0"
      Total Shares to Direct Users - g3_groups_performance_data_explorer_vw.count: "#FF746E"
      Total Views - g3_groups_performance_data_explorer_vw.count: "#D1E8FB"
      Total Content Source Visits - g3_groups_performance_data_explorer_vw.count: "#205D8E"
      Total Unique Card Views - g3_groups_performance_data_explorer_vw.count: "#5EA7CF"
      Total Shares to Groups - g3_groups_performance_data_explorer_vw.count: "#FFB4B0"
      Total Ratings - g3_groups_performance_data_explorer_vw.count: "#FF823A"
      Total Published SmartCards - g3_groups_performance_data_explorer_vw.count: "#9AE0C4"
      Total Published Journeys - g3_groups_performance_data_explorer_vw.count: "#006D66"
      Total Completions - g3_groups_performance_data_explorer_vw.count: "#429338"
      Total Bookmarks - g3_groups_performance_data_explorer_vw.count: "#FFE9A8"
      Current Bookmarks - g3_groups_performance_data_explorer_vw.count: "#FFA355"
      g3_groups_performance_data_explorer_vw.current_bookmarks: "#FFA355"
      g3_groups_performance_data_explorer_vw.current_likes: "#AFF48B"
      g3_groups_performance_data_explorer_vw.followers_users: "#8562B5"
      g3_groups_performance_data_explorer_vw.following_users: "#BFA2D7"
      g3_groups_performance_data_explorer_vw.total_badges_earned: "#CBCBCB"
      g3_groups_performance_data_explorer_vw.total_badges_shared: "#E4E5E5"
      g3_groups_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_performance_data_explorer_vw.total_published_journeys: "#006D66"
      g3_groups_performance_data_explorer_vw.total_published_pathways: "#50B69E"
      g3_groups_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_performance_data_explorer_vw.total_unique_card_views: "#5EA7CF"
      g3_groups_performance_data_explorer_vw.total_views: "#D1E8FB"
    label_color: [grey]
    hidden_fields: [new_calculation, g3_groups_performance_data_explorer_vw.total_events]
    defaults_version: 1
    listen:
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Time: g3_groups_performance_data_explorer_vw.time_date
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 13
    col: 0
    width: 12
    height: 9
  - name: Overall Assignment Progression - Filter Group
    title: Overall Assignment Progression - Filter Group
    model: concord
    explore: g3_groups_assignment_status_vw
    type: looker_column
    fields: [g3_groups_assignment_status_vw.assignment_progression, g3_groups_assignment_status_vw.count]
    pivots: [g3_groups_assignment_status_vw.assignment_progression]
    filters:
      g3_groups_assignment_status_vw.assignment_state: ''
      g3_groups_assignment_status_vw.group_assignment_association: ''
      g3_groups_assignment_status_vw.assignor_full_name: ''
    sorts: [g3_groups_assignment_status_vw.assignment_progression, g3_groups_assignment_status_vw.count
        3]
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
      collection_id: edcast-s-faves
      palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_assignment_status_vw.count,
            id: g3_groups_assignment_status_vw.count, name: 'Assignment Status [Data
              Explorer]'}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    font_size: 10px
    series_types: {}
    series_colors:
      1. Not Started - g3_groups_assignment_status_vw.count: "#D1D1D1"
      2. Started - g3_groups_assignment_status_vw.count: "#9AC3E1"
      3. Completed - g3_groups_assignment_status_vw.count: "#679B47"
      4. Dismissed - g3_groups_assignment_status_vw.count: "#D45F34"
    label_color: [grey]
    column_spacing_ratio: 0.4
    show_dropoff: false
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
    listen:
      Group Name: g3_groups_assignment_status_vw.group_name
      User Full Name: g3_groups_assignment_status_vw.user_full_name
      User Account Status: g3_groups_assignment_status_vw.user_account_status
      Excluded From Leaderboard: g3_groups_assignment_status_vw.excluded_from_leaderboard
      Card Title: g3_groups_assignment_status_vw.card_title
      ECL Source Name: g3_groups_assignment_status_vw.ecl_source_name
    row: 62
    col: 0
    width: 12
    height: 8
  - name: Overall Onboarding Status [Filter Group]
    title: Overall Onboarding Status [Filter Group]
    model: concord
    explore: g3_groups_overall_onboarding_status_vw
    type: looker_column
    fields: [g3_groups_overall_onboarding_status_vw.overall_onboarding_status, g3_groups_overall_onboarding_status_vw.count]
    pivots: [g3_groups_overall_onboarding_status_vw.overall_onboarding_status]
    filters:
      g3_groups_overall_onboarding_status_vw.overall_onboarding_status: ''
    sorts: [g3_groups_overall_onboarding_status_vw.overall_onboarding_status]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_overall_onboarding_status_vw.count,
            id: '1: Never Signed-In, No Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count',
            name: '1: Never Signed-In, No Days of Active Engagement'}, {axisId: g3_groups_overall_onboarding_status_vw.count,
            id: '2: Signed-In, No Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count',
            name: '2: Signed-In, No Days of Active Engagement'}, {axisId: g3_groups_overall_onboarding_status_vw.count,
            id: '3: Signed-In, 1 Day of Active Engagement - g3_groups_overall_onboarding_status_vw.count',
            name: '3: Signed-In, 1 Day of Active Engagement'}, {axisId: g3_groups_overall_onboarding_status_vw.count,
            id: '4: Signed-In, Multiple Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count',
            name: '4: Signed-In, Multiple Days of Active Engagement'}], showLabels: false,
        showValues: true, valueFormat: '[>999999]#.0,,\M;[>999] 0,"K";0', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_colors:
      '1: Never Signed-In : No Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#CBCBCB"
      '2: Signed-In : No Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#A9D5F2"
      '3: Signed-In : 1 Day of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#5EA7CF"
      '4: Signed-In : Multiple Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#429338"
      '1: Never Signed-In, No Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#D1D1D1"
      '2: Signed-In, No Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#BED9F2"
      '3: Signed-In, 1 Day of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#80AED3"
      '4: Signed-In, Multiple Days of Active Engagement - g3_groups_overall_onboarding_status_vw.count': "#679C47"
    label_color: [grey]
    column_spacing_ratio: 0.4
    defaults_version: 1
    listen:
      Group Name: g3_groups_overall_onboarding_status_vw.group_name
      User Full Name: g3_groups_overall_onboarding_status_vw.user_full_name
      User Account Status: g3_groups_overall_onboarding_status_vw.user_account_status
      Excluded From Leaderboard: g3_groups_overall_onboarding_status_vw.excluded_from_leaderboard
    row: 80
    col: 12
    width: 12
    height: 8
  - title: Top 20 Skills & Learning Goals [Filter Group]
    name: Top 20 Skills & Learning Goals [Filter Group]
    model: concord
    explore: g3_groups_skills_learninggoals_vw
    type: looker_bar
    fields: [g3_groups_skills_learninggoals_vw.topic_label, g3_groups_skills_learninggoals_vw.skills,
      g3_groups_skills_learninggoals_vw.learning_goals, g3_groups_skills_learninggoals_vw.total_types]
    filters:
      g3_groups_skills_learninggoals_vw.topic_label: ''
      g3_groups_skills_learninggoals_vw.topic_type: "-EMPTY"
    sorts: [g3_groups_skills_learninggoals_vw.learning_goals desc]
    limit: 20
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: g3_groups_skills_learninggoals_vw.skills,
            id: g3_groups_skills_learninggoals_vw.skills, name: Skills}, {axisId: g3_groups_skills_learninggoals_vw.learning_goals,
            id: g3_groups_skills_learninggoals_vw.learning_goals, name: Learning Goals}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    hide_legend: false
    font_size: 10px
    series_types: {}
    series_colors:
      Learning Goals - g3_groups_skills_learninggoals_vw.distinct_group_users: "#9AC3E1"
      Skills - g3_groups_skills_learninggoals_vw.distinct_group_users: "#ACD47D"
      g3_groups_skills_learninggoals_vw.learning_goals: "#80AED3"
      g3_groups_skills_learninggoals_vw.skills: "#C3E39A"
    series_labels:
      Learning Goals - g3_groups_skills_learninggoals_vw.skills: Skills
      Learning Goals - g3_groups_skills_learninggoals_vw.learning_goals: Learning
        Goals
    label_color: [grey]
    defaults_version: 1
    hidden_fields: [g3_groups_skills_learninggoals_vw.total_types]
    listen:
      Time: g3_groups_skills_learninggoals_vw.time_date
      Group Name: g3_groups_skills_learninggoals_vw.group_name
      User Full Name: g3_groups_skills_learninggoals_vw.user_full_name
      User Account Status: g3_groups_skills_learninggoals_vw.user_account_status
      Excluded From Leaderboard: g3_groups_skills_learninggoals_vw.excluded_from_leaderboard
    row: 62
    col: 12
    width: 12
    height: 8
  - title: Top 20 Groups
    name: Top 20 Groups
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    type: looker_column
    fields: [g3_groups_performance_data_explorer_vw.group_name, g3_groups_performance_data_explorer_vw.total_views,
      g3_groups_performance_data_explorer_vw.total_unique_card_views, g3_groups_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_performance_data_explorer_vw.total_shares_to_direct_users, g3_groups_performance_data_explorer_vw.total_ratings,
      g3_groups_performance_data_explorer_vw.total_published_smartcards, g3_groups_performance_data_explorer_vw.total_published_pathways,
      g3_groups_performance_data_explorer_vw.total_published_journeys, g3_groups_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_performance_data_explorer_vw.total_completions, g3_groups_performance_data_explorer_vw.total_comments,
      g3_groups_performance_data_explorer_vw.total_bookmarks, g3_groups_performance_data_explorer_vw.total_badges_shared,
      g3_groups_performance_data_explorer_vw.total_badges_earned, g3_groups_performance_data_explorer_vw.following_users,
      g3_groups_performance_data_explorer_vw.followers_users, g3_groups_performance_data_explorer_vw.current_likes,
      g3_groups_performance_data_explorer_vw.current_bookmarks, g3_groups_performance_data_explorer_vw.clc_badges_completed,
      g3_groups_performance_data_explorer_vw.total_events]
    filters:
      g3_groups_performance_data_explorer_vw.performance_metric: "-EMPTY"
    sorts: [g3_groups_performance_data_explorer_vw.total_events desc]
    limit: 20
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_performance_data_explorer_vw.total_views,
            id: g3_groups_performance_data_explorer_vw.total_views, name: Total Views},
          {axisId: g3_groups_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_performance_data_explorer_vw.total_unique_card_views, name: Total
              Unique Card Views}, {axisId: g3_groups_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_performance_data_explorer_vw.total_shares_to_groups, name: Total
              Shares to Groups}, {axisId: g3_groups_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_performance_data_explorer_vw.total_ratings,
            id: g3_groups_performance_data_explorer_vw.total_ratings, name: Total
              Ratings}, {axisId: g3_groups_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_performance_data_explorer_vw.total_published_pathways, name: Total
              Published Pathways}, {axisId: g3_groups_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_performance_data_explorer_vw.total_published_journeys, name: Total
              Published Journeys}, {axisId: g3_groups_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_performance_data_explorer_vw.total_completions,
            id: g3_groups_performance_data_explorer_vw.total_completions, name: Total
              Completions}, {axisId: g3_groups_performance_data_explorer_vw.total_comments,
            id: g3_groups_performance_data_explorer_vw.total_comments, name: Total
              Comments}, {axisId: g3_groups_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_performance_data_explorer_vw.total_bookmarks, name: Total
              Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.total_badges_shared,
            id: g3_groups_performance_data_explorer_vw.total_badges_shared, name: Total
              Badges Shared}, {axisId: g3_groups_performance_data_explorer_vw.total_badges_earned,
            id: g3_groups_performance_data_explorer_vw.total_badges_earned, name: Total
              Badges Earned}, {axisId: g3_groups_performance_data_explorer_vw.following_users,
            id: g3_groups_performance_data_explorer_vw.following_users, name: Following
              Users}, {axisId: g3_groups_performance_data_explorer_vw.followers_users,
            id: g3_groups_performance_data_explorer_vw.followers_users, name: Followers
              Users}, {axisId: g3_groups_performance_data_explorer_vw.current_likes,
            id: g3_groups_performance_data_explorer_vw.current_likes, name: Current
              Likes}, {axisId: g3_groups_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_performance_data_explorer_vw.current_bookmarks, name: Current
              Bookmarks}, {axisId: g3_groups_performance_data_explorer_vw.clc_badges_completed,
            id: g3_groups_performance_data_explorer_vw.clc_badges_completed, name: Clc
              Badges Completed}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    font_size: 10px
    series_colors:
      g3_groups_performance_data_explorer_vw.total_views: "#D1E8FB"
      g3_groups_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_performance_data_explorer_vw.total_badges_earned: "#CBCBCB"
      g3_groups_performance_data_explorer_vw.total_unique_card_views: "#5EA7CF"
      g3_groups_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_performance_data_explorer_vw.total_published_pathways: "#50B69E"
      g3_groups_performance_data_explorer_vw.total_published_journeys: "#006D66"
      g3_groups_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_performance_data_explorer_vw.total_badges_shared: "#E4E5E5"
      g3_groups_performance_data_explorer_vw.following_users: "#BFA2D7"
      g3_groups_performance_data_explorer_vw.followers_users: "#8562B5"
      g3_groups_performance_data_explorer_vw.current_likes: "#AFF48B"
      g3_groups_performance_data_explorer_vw.current_bookmarks: "#FFA355"
      g3_groups_performance_data_explorer_vw.clc_badges_completed: "#D6F2B5"
    label_color: [grey]
    defaults_version: 1
    hidden_fields: [g3_groups_performance_data_explorer_vw.total_events]
    listen:
      Time: g3_groups_performance_data_explorer_vw.time_date
      Assigned Content: g3_groups_performance_data_explorer_vw.assigned_content
      Group Name: g3_groups_performance_data_explorer_vw.group_name
      User Full Name: g3_groups_performance_data_explorer_vw.user_full_name
      User Account Status: g3_groups_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_performance_data_explorer_vw.excluded_from_leaderboard
      Card Title: g3_groups_performance_data_explorer_vw.card_title
      ECL Source Name: g3_groups_performance_data_explorer_vw.ecl_source_name
    row: 2
    col: 0
    width: 12
    height: 11
  filters:
  - name: Time
    title: Time
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_performance_data_explorer_vw.time_date
  - name: Group Name
    title: Group Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: concord
    explore: g3_groups_search_user_details_vw
    listens_to_filters: []
    field: g3_groups_search_user_details_vw.group_name
  - name: User Full Name
    title: User Full Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: g3_groups_channel_performance_vw
    listens_to_filters: []
    field: g3_groups_channel_performance_vw.user_full_name
  - name: User Account Status
    title: User Account Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: g3_groups_assignment_status_vw
    listens_to_filters: []
    field: g3_groups_assignment_status_vw.user_account_status
  - name: Excluded From Leaderboard
    title: Excluded From Leaderboard
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: g3_groups_search_user_details_vw
    listens_to_filters: []
    field: g3_groups_search_user_details_vw.excluded_from_leaderboard
  - name: Card Title
    title: Card Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: g3_groups_assignment_status_vw
    listens_to_filters: []
    field: g3_groups_assignment_status_vw.card_title
  - name: Assigned Content
    title: Assigned Content
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: g3_groups_performance_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_performance_data_explorer_vw.assigned_content
  - name: ECL Source Name
    title: ECL Source Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: concord
    explore: g3_groups_assignment_status_vw
    listens_to_filters: []
    field: g3_groups_assignment_status_vw.ecl_source_name
