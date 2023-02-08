- dashboard: 4__structured_content_analytics
  title: 4. Structured Content Analytics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JwS1KISAsU34loaQhfOiuQ
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Structured Content Explorer**"
    row: 45
    col: 9
    width: 13
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Channel Performance**"
    row: 0
    col: 10
    width: 10
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Pathway Performance**"
    row: 26
    col: 10
    width: 13
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Journey Performance**"
    row: 10
    col: 10
    width: 14
    height: 2
  - name: Performance Drill-Down By Carousel [Filter Group]
    title: Performance Drill-Down By Carousel [Filter Group]
    model: concord
    explore: g3_groups_structured_content_performance_data_explorer_vw
    type: looker_bar
    fields: [g3_groups_structured_content_performance_data_explorer_vw.carousel_name,
      g3_groups_structured_content_performance_data_explorer_vw.total_views, g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
      g3_groups_structured_content_performance_data_explorer_vw.current_likes, g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
      g3_groups_structured_content_performance_data_explorer_vw.total_comments, g3_groups_structured_content_performance_data_explorer_vw.total_completions,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings, g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
      g3_groups_structured_content_performance_data_explorer_vw.total_events]
    filters:
      g3_groups_structured_content_performance_data_explorer_vw.carousel_name: "-EMPTY"
      g3_groups_structured_content_performance_data_explorer_vw.is_carousel_enabled: ''
      g3_groups_structured_content_performance_data_explorer_vw.badge_content: ''
    sorts: [g3_groups_structured_content_performance_data_explorer_vw.total_events
        desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{measure: count_of_performance_metric, based_on: g3_groups_structured_content_performance_data_explorer_vw.performance_metric,
        expression: '', label: Count of Performance Metric, type: count_distinct,
        _kind_hint: measure, _type_hint: number, id: 4Lz5XX4yE7}]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            name: Total Views}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            name: Current Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            name: Current Likes}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            name: Total Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            name: Total Published Journeys}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            name: Total Comments}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            name: Total Completions}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            name: Total Published Pathways}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            name: Total Ratings}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            name: Total Shares to Groups}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            name: Total Unique Card Views}], showLabels: false, showValues: true,
        valueFormat: '[>999999]#.0,,\M;[>999] 0.0,"K";0', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    hidden_series: [Total Shares to Direct Users - g3_groups_structured_content_performance_data_explorer_vw.count]
    font_size: 10px
    series_types: {}
    series_colors:
      g3_groups_structured_content_performance_data_explorer_vw.total_views: "#D1E8FB"
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways: "#AFF48B"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_structured_content_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views: "#7DBCDE"
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks: "#FFA355"
    label_color: [grey]
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [g3_groups_structured_content_performance_data_explorer_vw.total_events]
    listen:
      Performance Metric: g3_groups_structured_content_performance_data_explorer_vw.performance_metric
      Assigned Content: g3_groups_structured_content_performance_data_explorer_vw.assigned_content
      Group Name: g3_groups_structured_content_performance_data_explorer_vw.group_name
      User Account Status: g3_groups_structured_content_performance_data_explorer_vw.user_account_status
      Channel Name: g3_groups_structured_content_performance_data_explorer_vw.channel_name
      Card Title: g3_groups_structured_content_performance_data_explorer_vw.card_title
      Journey Title: g3_groups_structured_content_performance_data_explorer_vw.journey_title
      Pathway Title: g3_groups_structured_content_performance_data_explorer_vw.pathway_title
      User Full Name: g3_groups_structured_content_performance_data_explorer_vw.user_full_name
      Channel Content Exclusivity: g3_groups_structured_content_performance_data_explorer_vw.channel_content_exclusivity
      Overall Content Structure: g3_groups_structured_content_performance_data_explorer_vw.overall_content_structure
      Time: g3_groups_structured_content_performance_data_explorer_vw.time_date
      Excluded From Leaderboard: g3_groups_structured_content_performance_data_explorer_vw.excluded_from_leaderboard
    row: 2
    col: 0
    width: 12
    height: 8
  - name: Top 20 Channels by Total User Performance [Filter Group]
    title: Top 20 Channels by Total User Performance [Filter Group]
    model: concord
    explore: g3_groups_structured_content_performance_data_explorer_vw
    type: looker_column
    fields: [g3_groups_structured_content_performance_data_explorer_vw.channel_name,
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.current_likes, g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.total_comments, g3_groups_structured_content_performance_data_explorer_vw.total_completions,
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_structured_content_performance_data_explorer_vw.total_events, g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings, g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
      g3_groups_structured_content_performance_data_explorer_vw.total_views]
    filters:
      g3_groups_structured_content_performance_data_explorer_vw.is_carousel_enabled: 'Yes'
      g3_groups_structured_content_performance_data_explorer_vw.carousel_name: ''
      g3_groups_structured_content_performance_data_explorer_vw.badge_content: ''
    sorts: [g3_groups_structured_content_performance_data_explorer_vw.total_events
        desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${g3_groups_structured_content_performance_data_explorer_vw.count}))',
        label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: new_calculation, _type_hint: number,
        id: UjpkKrlCPp, is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            name: Current Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            name: Current Likes}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            name: Total Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            name: Total Comments}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            name: Total Completions}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            name: Total Published Journeys}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            name: Total Published Pathways}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            name: Total Ratings}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            name: Total Shares to Groups}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            name: Total Unique Card Views}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            name: Total Views}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
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
      Current Likes - g3_groups_structured_content_performance_data_explorer_vw.count: "#AFF48B"
      Total Comments - g3_groups_structured_content_performance_data_explorer_vw.count: "#EA4C29"
      Total Shares to Direct Groups - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFB4B0"
      Total Shares to Direct Users - g3_groups_structured_content_performance_data_explorer_vw.count: "#FF746E"
      Current Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFA355"
      Total Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFE9A8"
      Total Completions - g3_groups_structured_content_performance_data_explorer_vw.count: "#429338"
      Total Published Journeys - g3_groups_structured_content_performance_data_explorer_vw.count: "#429338"
      Total Published SmartCards - g3_groups_structured_content_performance_data_explorer_vw.count: "#9AE0C4"
      Total Ratings - g3_groups_structured_content_performance_data_explorer_vw.count: "#FF823A"
      Total Shares to Groups - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFB4B0"
      Total Unique Card Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#7DBCDE"
      Total Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#D1E8FB"
      Total Content Source Visits - g3_groups_structured_content_performance_data_explorer_vw.count: "#205D8E"
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks: "#FFA355"
      g3_groups_structured_content_performance_data_explorer_vw.current_likes: "#AFF48B"
      g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_structured_content_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_structured_content_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways: "#AFF48B"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views: "#7DBCDE"
      g3_groups_structured_content_performance_data_explorer_vw.total_views: "#D1E8FB"
    series_labels:
      Current Likes - g3_groups_structured_content_performance_data_explorer_vw.count: Current
        Likes
      Total Comments - g3_groups_structured_content_performance_data_explorer_vw.count: Total
        Comments
      Total Shares to Direct Groups - g3_groups_structured_content_performance_data_explorer_vw.count: Total
        Shares to Direct Groups
      Total Shares to Direct Users - g3_groups_structured_content_performance_data_explorer_vw.count: Total
        Shares to Direct Users
      new_calculation: Total
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
    hidden_fields: [g3_groups_structured_content_performance_data_explorer_vw.total_events]
    listen:
      Performance Metric: g3_groups_structured_content_performance_data_explorer_vw.performance_metric
      Assigned Content: g3_groups_structured_content_performance_data_explorer_vw.assigned_content
      Group Name: g3_groups_structured_content_performance_data_explorer_vw.group_name
      User Account Status: g3_groups_structured_content_performance_data_explorer_vw.user_account_status
      Channel Name: g3_groups_structured_content_performance_data_explorer_vw.channel_name
      Card Title: g3_groups_structured_content_performance_data_explorer_vw.card_title
      Journey Title: g3_groups_structured_content_performance_data_explorer_vw.journey_title
      Pathway Title: g3_groups_structured_content_performance_data_explorer_vw.pathway_title
      User Full Name: g3_groups_structured_content_performance_data_explorer_vw.user_full_name
      Channel Content Exclusivity: g3_groups_structured_content_performance_data_explorer_vw.channel_content_exclusivity
      Overall Content Structure: g3_groups_structured_content_performance_data_explorer_vw.overall_content_structure
      Time: g3_groups_structured_content_performance_data_explorer_vw.time_date
      Excluded From Leaderboard: g3_groups_structured_content_performance_data_explorer_vw.excluded_from_leaderboard
    row: 2
    col: 12
    width: 12
    height: 8
  - name: Journey Progression [Overview] [Filter Group]
    title: Journey Progression [Overview] [Filter Group]
    model: concord
    explore: g4_groups_structured_journey_progression_overview_vw
    type: looker_grid
    fields: [g4_groups_structured_journey_progression_overview_vw.group_name, g4_groups_structured_journey_progression_overview_vw.user_full_name,
      g4_groups_structured_journey_progression_overview_vw.carousel_name, g4_groups_structured_journey_progression_overview_vw.channel_name,
      g4_groups_structured_journey_progression_overview_vw.overall_completion_status,
      g4_groups_structured_journey_progression_overview_vw.time_completed_date, g4_groups_structured_journey_progression_overview_vw.journey_completion_progress,
      g4_groups_structured_journey_progression_overview_vw.journey_progress, g4_groups_structured_journey_progression_overview_vw.journey_title,
      g4_groups_structured_journey_progression_overview_vw.journey_pathway_completion_status,
      g4_groups_structured_journey_progression_overview_vw.journey_pathway_completion_progress,
      g4_groups_structured_journey_progression_overview_vw.journey_pathway_progress,
      g4_groups_structured_journey_progression_overview_vw.journey_pathway_title,
      g4_groups_structured_journey_progression_overview_vw.email, g4_groups_structured_journey_progression_overview_vw.journey_id,
      g4_groups_structured_journey_progression_overview_vw.journey_pathway_id]
    filters:
      g4_groups_structured_journey_progression_overview_vw.overall_completion_status: ''
      g4_groups_structured_journey_progression_overview_vw.carousel_name: ''
      g4_groups_structured_journey_progression_overview_vw.journey_pathway_title: ''
      g4_groups_structured_journey_progression_overview_vw.badge_content: ''
    sorts: [g4_groups_structured_journey_progression_overview_vw.journey_title, g4_groups_structured_journey_progression_overview_vw.journey_completion_progress
        desc, g4_groups_structured_journey_progression_overview_vw.journey_pathway_title,
      g4_groups_structured_journey_progression_overview_vw.time_completed_date desc,
      g4_groups_structured_journey_progression_overview_vw.user_full_name]
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
    listen:
      Group Name: g4_groups_structured_journey_progression_overview_vw.group_name
      User Account Status: g4_groups_structured_journey_progression_overview_vw.user_account_status
      Channel Name: g4_groups_structured_journey_progression_overview_vw.channel_name
      Journey Title: g4_groups_structured_journey_progression_overview_vw.journey_title
      User Full Name: g4_groups_structured_journey_progression_overview_vw.user_full_name
      Channel Content Exclusivity: g4_groups_structured_journey_progression_overview_vw.channel_content_exclusivity
      Excluded From Leaderboard: g4_groups_structured_journey_progression_overview_vw.excluded_from_leaderboard
    row: 19
    col: 0
    width: 12
    height: 7
  - name: Journey Progression [Data Explorer] [Filter Group]
    title: Journey Progression [Data Explorer] [Filter Group]
    model: concord
    explore: g3_groups_structured_journey_progression_data_explorer_vw
    type: looker_grid
    fields: [g3_groups_structured_journey_progression_data_explorer_vw.group_name,
      g3_groups_structured_journey_progression_data_explorer_vw.user_full_name, g3_groups_structured_journey_progression_data_explorer_vw.carousel_name,
      g3_groups_structured_journey_progression_data_explorer_vw.channel_name, g3_groups_structured_journey_progression_data_explorer_vw.time_completed_date,
      g3_groups_structured_journey_progression_data_explorer_vw.journey_title, g3_groups_structured_journey_progression_data_explorer_vw.journey_pathway_title,
      g3_groups_structured_journey_progression_data_explorer_vw.card_title, g3_groups_structured_journey_progression_data_explorer_vw.duration_hhmm,
      g3_groups_structured_journey_progression_data_explorer_vw.duration_seconds,
      g3_groups_structured_journey_progression_data_explorer_vw.email, g3_groups_structured_journey_progression_data_explorer_vw.journey_id,
      g3_groups_structured_journey_progression_data_explorer_vw.journey_pathway_id,
      g3_groups_structured_journey_progression_data_explorer_vw.card_id]
    filters:
      g3_groups_structured_journey_progression_data_explorer_vw.user_id_1: ">=0"
      g3_groups_structured_journey_progression_data_explorer_vw.carousel_name: ''
      g3_groups_structured_journey_progression_data_explorer_vw.journey_pathway_title: ''
      g3_groups_structured_journey_progression_data_explorer_vw.badge_content: ''
    sorts: [g3_groups_structured_journey_progression_data_explorer_vw.journey_title,
      g3_groups_structured_journey_progression_data_explorer_vw.user_full_name]
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
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Group Name: g3_groups_structured_journey_progression_data_explorer_vw.group_name
      User Account Status: g3_groups_structured_journey_progression_data_explorer_vw.user_account_status
      Channel Name: g3_groups_structured_journey_progression_data_explorer_vw.channel_name
      Card Title: g3_groups_structured_journey_progression_data_explorer_vw.card_title
      Journey Title: g3_groups_structured_journey_progression_data_explorer_vw.journey_title
      User Full Name: g3_groups_structured_journey_progression_data_explorer_vw.user_full_name
      Channel Content Exclusivity: g3_groups_structured_journey_progression_data_explorer_vw.channel_content_exclusivity
      Overall Content Structure: g3_groups_structured_journey_progression_data_explorer_vw.overall_content_structure
      Excluded From Leaderboard: g3_groups_structured_journey_progression_data_explorer_vw.excluded_from_leaderboard
    row: 19
    col: 12
    width: 12
    height: 7
  - name: Top 20 Journey Pathways by Total User Performance [Filter Group]
    title: Top 20 Journey Pathways by Total User Performance [Filter Group]
    model: concord
    explore: g3_groups_structured_content_performance_data_explorer_vw
    type: looker_column
    fields: [g3_groups_structured_content_performance_data_explorer_vw.journey_pathway_title,
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.current_likes, g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.total_comments, g3_groups_structured_content_performance_data_explorer_vw.total_completions,
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings, g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
      g3_groups_structured_content_performance_data_explorer_vw.total_views, g3_groups_structured_content_performance_data_explorer_vw.total_events]
    filters:
      g3_groups_structured_content_performance_data_explorer_vw.journey_pathway_title: "-EMPTY"
      g3_groups_structured_content_performance_data_explorer_vw.carousel_name: ''
      g3_groups_structured_content_performance_data_explorer_vw.is_carousel_enabled: ''
      g3_groups_structured_content_performance_data_explorer_vw.badge_content: ''
    sorts: [g3_groups_structured_content_performance_data_explorer_vw.total_events
        desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${g3_groups_structured_content_performance_data_explorer_vw.count}))',
        label: Total, value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number, id: 5BeD0BmcZr, is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            name: Current Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            name: Current Likes}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            name: Total Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            name: Total Comments}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            name: Total Completions}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            name: Total Published Journeys}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            name: Total Published Pathways}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            name: Total Ratings}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            name: Total Shares to Groups}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            name: Total Unique Card Views}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            name: Total Views}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
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
      Current Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFA355"
      Current Likes - g3_groups_structured_content_performance_data_explorer_vw.count: "#AFF48B"
      Total Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFE9A8"
      Total Comments - g3_groups_structured_content_performance_data_explorer_vw.count: "#EA4C29"
      Total Completions - g3_groups_structured_content_performance_data_explorer_vw.count: "#429338"
      Total Published Journeys - g3_groups_structured_content_performance_data_explorer_vw.count: "#429338"
      Total Published SmartCards - g3_groups_structured_content_performance_data_explorer_vw.count: "#9AE0C4"
      Total Ratings - g3_groups_structured_content_performance_data_explorer_vw.count: "#FF823A"
      Total Shares to Direct Users - g3_groups_structured_content_performance_data_explorer_vw.count: "#FF746E"
      Total Shares to Groups - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFB4B0"
      Total Unique Card Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#7DBCDE"
      Total Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#D1E8FB"
      g3_groups_structured_content_performance_data_explorer_vw.total_views: "#D1E8FB"
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways: "#AFF48B"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_structured_content_performance_data_explorer_vw.current_likes: "#AFF48B"
      g3_groups_structured_content_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views: "#7DBCDE"
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks: "#FFA355"
    label_color: [grey]
    hidden_fields: [new_calculation, g3_groups_structured_content_performance_data_explorer_vw.total_events]
    defaults_version: 1
    listen:
      Performance Metric: g3_groups_structured_content_performance_data_explorer_vw.performance_metric
      Assigned Content: g3_groups_structured_content_performance_data_explorer_vw.assigned_content
      Group Name: g3_groups_structured_content_performance_data_explorer_vw.group_name
      User Account Status: g3_groups_structured_content_performance_data_explorer_vw.user_account_status
      Channel Name: g3_groups_structured_content_performance_data_explorer_vw.channel_name
      Card Title: g3_groups_structured_content_performance_data_explorer_vw.card_title
      Journey Title: g3_groups_structured_content_performance_data_explorer_vw.journey_title
      Pathway Title: g3_groups_structured_content_performance_data_explorer_vw.pathway_title
      User Full Name: g3_groups_structured_content_performance_data_explorer_vw.user_full_name
      Channel Content Exclusivity: g3_groups_structured_content_performance_data_explorer_vw.channel_content_exclusivity
      Overall Content Structure: g3_groups_structured_content_performance_data_explorer_vw.overall_content_structure
      Time: g3_groups_structured_content_performance_data_explorer_vw.time_date
      Excluded From Leaderboard: g3_groups_structured_content_performance_data_explorer_vw.excluded_from_leaderboard
    row: 12
    col: 12
    width: 12
    height: 7
  - name: Pathway Progression [Overview] [Filter Group]
    title: Pathway Progression [Overview] [Filter Group]
    model: concord
    explore: g4_groups_structured_pathway_progression_overview_vw
    type: looker_grid
    fields: [g4_groups_structured_pathway_progression_overview_vw.group_name, g4_groups_structured_pathway_progression_overview_vw.user_full_name,
      g4_groups_structured_pathway_progression_overview_vw.carousel_name, g4_groups_structured_pathway_progression_overview_vw.channel_name,
      g4_groups_structured_pathway_progression_overview_vw.overall_completion_status,
      g4_groups_structured_pathway_progression_overview_vw.time_completed_date, g4_groups_structured_pathway_progression_overview_vw.completion_progress,
      g4_groups_structured_pathway_progression_overview_vw.pathway_progress, g4_groups_structured_pathway_progression_overview_vw.pathway_id,
      g4_groups_structured_pathway_progression_overview_vw.pathway_title]
    filters:
      g4_groups_structured_pathway_progression_overview_vw.badge_content: ''
      g4_groups_structured_pathway_progression_overview_vw.carousel_name: ''
      g4_groups_structured_pathway_progression_overview_vw.overall_completion_status: ''
      g4_groups_structured_pathway_progression_overview_vw.time_completed_date: 2022/01/01
        to 2022/04/01
      g4_groups_structured_pathway_progression_overview_vw.user_id: ">=0"
    sorts: [g4_groups_structured_pathway_progression_overview_vw.pathway_title, g4_groups_structured_pathway_progression_overview_vw.completion_progress
        desc, g4_groups_structured_pathway_progression_overview_vw.time_completed_date
        desc, g4_groups_structured_pathway_progression_overview_vw.user_full_name]
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
    listen:
      Group Name: g4_groups_structured_pathway_progression_overview_vw.group_name
      User Account Status: g4_groups_structured_pathway_progression_overview_vw.user_account_status
      Channel Name: g4_groups_structured_pathway_progression_overview_vw.channel_name
      Pathway Title: g4_groups_structured_pathway_progression_overview_vw.pathway_title
      User Full Name: g4_groups_structured_pathway_progression_overview_vw.user_full_name
      Channel Content Exclusivity: g4_groups_structured_pathway_progression_overview_vw.channel_content_exclusivity
      Excluded From Leaderboard: g4_groups_structured_pathway_progression_overview_vw.excluded_from_leaderboard
    row: 28
    col: 12
    width: 12
    height: 9
  - name: Pathway Progression [Data Explorer] [Filter Group]
    title: Pathway Progression [Data Explorer] [Filter Group]
    model: concord
    explore: g3_groups_structured_pathway_progression_data_explorer_vw
    type: looker_grid
    fields: [g3_groups_structured_pathway_progression_data_explorer_vw.group_name,
      g3_groups_structured_pathway_progression_data_explorer_vw.user_full_name, g3_groups_structured_pathway_progression_data_explorer_vw.carousel_name,
      g3_groups_structured_pathway_progression_data_explorer_vw.channel_name, g3_groups_structured_pathway_progression_data_explorer_vw.time_completed_date,
      g3_groups_structured_pathway_progression_data_explorer_vw.pathway_title, g3_groups_structured_pathway_progression_data_explorer_vw.card_title,
      g3_groups_structured_pathway_progression_data_explorer_vw.duration_hhmm, g3_groups_structured_pathway_progression_data_explorer_vw.duration_seconds,
      g3_groups_structured_pathway_progression_data_explorer_vw.email, g3_groups_structured_pathway_progression_data_explorer_vw.pathway_id,
      g3_groups_structured_pathway_progression_data_explorer_vw.card_id]
    filters:
      g3_groups_structured_pathway_progression_data_explorer_vw.user_id_1: ">=0"
      g3_groups_structured_pathway_progression_data_explorer_vw.carousel_name: ''
      g3_groups_structured_pathway_progression_data_explorer_vw.badge_content: ''
    sorts: [g3_groups_structured_pathway_progression_data_explorer_vw.pathway_title,
      g3_groups_structured_pathway_progression_data_explorer_vw.user_full_name]
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
    listen:
      Group Name: g3_groups_structured_pathway_progression_data_explorer_vw.group_name
      User Account Status: g3_groups_structured_pathway_progression_data_explorer_vw.user_account_status
      Channel Name: g3_groups_structured_pathway_progression_data_explorer_vw.channel_name
      Card Title: g3_groups_structured_pathway_progression_data_explorer_vw.card_title
      Pathway Title: g3_groups_structured_pathway_progression_data_explorer_vw.pathway_title
      User Full Name: g3_groups_structured_pathway_progression_data_explorer_vw.user_full_name
      Channel Content Exclusivity: g3_groups_structured_pathway_progression_data_explorer_vw.channel_content_exclusivity
      Overall Content Structure: g3_groups_structured_pathway_progression_data_explorer_vw.overall_content_structure
      Excluded From Leaderboard: g3_groups_structured_pathway_progression_data_explorer_vw.excluded_from_leaderboard
    row: 37
    col: 0
    width: 12
    height: 8
  - name: Structured Content Totals by Carousel
    title: Structured Content Totals by Carousel
    model: concord
    explore: c2_content_structure_metadata_vw
    type: looker_grid
    fields: [c2_content_structure_metadata_vw.count, derived_table_top_13_carousels.rank,
      derived_table_top_13_carousels.top_13_carousel_names]
    filters:
      derived_table_top_13_carousels.top_13_carousel_names: "-NULL"
    sorts: [derived_table_top_13_carousels.rank]
    limit: 14
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
      c2_content_structure_metadata_vw.count:
        is_active: true
    value_labels: labels
    label_type: labVal
    start_angle: -255
    series_colors:
      Premium Content (included in Subscription): "#D1E8FB"
      Other: "#FFA355"
      Channels: "#7DBCDE"
      Hot Topics: "#A9D5F2"
      EdCast Sales Academy: "#3A81AF"
      EdCast Originals: "#C3E29A"
      Cityscape Real Estate II: "#6DBA59"
      "⚡EdCast Human Resources": "#AFE08B"
      "⚡EdCast Upskilling": "#429338"
      Interesting Channels: "#FAECB4"
      All Channels: "#FF823A"
      "⚡Internal EdCast Channels (Archive)": "#FFC87F"
      Focus Areas for CIPD: "#EA4C29"
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
    hidden_fields: [derived_table_top_13_carousels.rank]
    listen:
      Channel Name: derived_table_top_25_channels.channel_name
      Card Title: c2_content_structure_metadata_vw.card_title
      Journey Title: c2_content_structure_metadata_vw.journey_title
      Pathway Title: c2_content_structure_metadata_vw.pathway_title
      Channel Content Exclusivity: c2_content_structure_metadata_vw.channel_content_exclusivity
      Overall Content Structure: c2_content_structure_metadata_vw.overall_content_structure
    row: 47
    col: 0
    width: 12
    height: 9
  - name: Structured Content Totals By Channel
    title: Structured Content Totals By Channel
    model: concord
    explore: c2_content_structure_metadata_vw
    type: looker_grid
    fields: [c2_content_structure_metadata_vw.count, derived_table_top_25_channels.top_25_channel_names]
    filters:
      c2_content_structure_metadata_vw.channel_name: "-EMPTY"
    sorts: [c2_content_structure_metadata_vw.count desc 0]
    limit: 26
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
      c2_content_structure_metadata_vw.count:
        is_active: true
    value_labels: labels
    label_type: labVal
    series_colors:
      Other: "#50B69E"
      Leadership: "#D1E8FB"
      It Skills: "#5EA7CF"
      Communications: "#A9D5F2"
      Human Resources: "#3A81AF"
      Tech Insights: "#7DBCDE"
      Project Management: "#205D8E"
      Management: "#D6F2B5"
      Marketing And Advertising: "#6DBA59"
      Sales: "#AFE08B"
      "⚡engineering &amp; Technology": "#429338"
      Next Gen Tech: "#90D16C"
      Edcast Business Impact Programs: "#287028"
      Finance: "#FFE9A8"
      "⚡leadership And Management": "#FF823A"
      Go1 - Biz Library Test: "#FFC87F"
      "⚡product Training": "#EA4C29"
      "⚡data Analytics": "#FFA355"
      Realtor Tips: "#A13025"
      "⚡#oneedcast": "#F2E0FD"
      "⚡sales Training": "#AC86C1"
      Entrepreneurship: "#DAC1EB"
      "⚡marketing (archived)": "#8562B5"
      Metamindfulness Multiversity (m3): "#BFA2D7"
      Cybersecurity: "#703994"
      "⚡sales Collateral": "#CFF2DA"
      'Finance ': "#DCEBFB"
      "⚡data Analytics ": "#ED9149"
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
    hidden_fields: [sql_runner_query.rank]
    listen:
      Channel Name: derived_table_top_25_channels.channel_name
      Card Title: c2_content_structure_metadata_vw.card_title
      Journey Title: c2_content_structure_metadata_vw.journey_title
      Pathway Title: c2_content_structure_metadata_vw.pathway_title
      Channel Content Exclusivity: c2_content_structure_metadata_vw.channel_content_exclusivity
      Overall Content Structure: c2_content_structure_metadata_vw.overall_content_structure
    row: 47
    col: 12
    width: 11
    height: 9
  - name: Structured Content [Data Explorer]
    title: Structured Content [Data Explorer]
    model: concord
    explore: c2_content_structure_metadata_vw
    type: table
    fields: [c2_content_structure_metadata_vw.carousel_name, c2_content_structure_metadata_vw.channel_name,
      c2_content_structure_metadata_vw.overall_content_structure, c2_content_structure_metadata_vw.journey_title,
      c2_content_structure_metadata_vw.journey_pathway_title, c2_content_structure_metadata_vw.pathway_title,
      c2_content_structure_metadata_vw.card_type, c2_content_structure_metadata_vw.card_title,
      c2_content_structure_metadata_vw.primary_key]
    filters:
      c2_content_structure_metadata_vw.carousel_name: ''
      c2_content_structure_metadata_vw.channel_name: ''
      c2_content_structure_metadata_vw.journey_pathway_title: ''
      c2_content_structure_metadata_vw.card_type: ''
      c2_content_structure_metadata_vw.badge_content: ''
      c2_content_structure_metadata_vw.is_carousel_enabled: ''
    sorts: [c2_content_structure_metadata_vw.carousel_name, c2_content_structure_metadata_vw.channel_name,
      c2_content_structure_metadata_vw.journey_title, c2_content_structure_metadata_vw.pathway_title,
      c2_content_structure_metadata_vw.card_title]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    hidden_fields: [c2_content_structure_metadata_vw.primary_key]
    listen:
      Channel Name: derived_table_top_25_channels.channel_name
      Card Title: c2_content_structure_metadata_vw.card_title
      Journey Title: c2_content_structure_metadata_vw.journey_title
      Pathway Title: c2_content_structure_metadata_vw.pathway_title
      Channel Content Exclusivity: c2_content_structure_metadata_vw.channel_content_exclusivity
      Overall Content Structure: c2_content_structure_metadata_vw.overall_content_structure
    row: 56
    col: 0
    width: 12
    height: 8
  - title: Top 20 Journeys By Total User Performance
    name: Top 20 Journeys By Total User Performance
    model: concord
    explore: g3_groups_structured_content_performance_data_explorer_vw
    type: looker_column
    fields: [g3_groups_structured_content_performance_data_explorer_vw.journey_title,
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.current_likes, g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.total_comments, g3_groups_structured_content_performance_data_explorer_vw.total_completions,
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings, g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
      g3_groups_structured_content_performance_data_explorer_vw.total_views, g3_groups_structured_content_performance_data_explorer_vw.total_events]
    filters:
      g3_groups_structured_content_performance_data_explorer_vw.journey_title: "-NULL"
      g3_groups_structured_content_performance_data_explorer_vw.carousel_name: ''
      g3_groups_structured_content_performance_data_explorer_vw.channel_name: ''
      g3_groups_structured_content_performance_data_explorer_vw.is_carousel_enabled: ''
      g3_groups_structured_content_performance_data_explorer_vw.badge_content: ''
      g3_groups_structured_content_performance_data_explorer_vw.content_structure: ''
      g3_groups_structured_content_performance_data_explorer_vw.group_name: ''
      g3_groups_structured_content_performance_data_explorer_vw.card_title: ''
      g3_groups_structured_content_performance_data_explorer_vw.pathway_title: ''
      g3_groups_structured_content_performance_data_explorer_vw.channel_content_exclusivity: ''
      g3_groups_structured_content_performance_data_explorer_vw.overall_content_structure: ''
      g3_groups_structured_content_performance_data_explorer_vw.user_full_name: ''
    sorts: [g3_groups_structured_content_performance_data_explorer_vw.total_events
        desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row( ${g3_groups_structured_content_performance_data_explorer_vw.count}))',
        label: Total, value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number, id: rzCVwcxOkx, is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            name: Current Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            name: Current Likes}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            name: Total Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            name: Total Comments}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            name: Total Completions}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            name: Total Published Journeys}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            name: Total Published Pathways}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            name: Total Ratings}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            name: Total Shares to Groups}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            name: Total Unique Card Views}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            name: Total Views}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
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
      Total Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#DCEBFB"
      Total Shares to Direct Users - g3_groups_structured_content_performance_data_explorer_vw.count: "#F3BEB9"
      Total Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#FAECB4"
      Total Published SmartCards - g3_groups_structured_content_performance_data_explorer_vw.count: "#B7E2CB"
      Total Shares to Groups - g3_groups_structured_content_performance_data_explorer_vw.count: "#B7E2CB"
      Current Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#F0AF65"
      Current Likes - g3_groups_structured_content_performance_data_explorer_vw.count: "#C2E199"
      Total Comments - g3_groups_structured_content_performance_data_explorer_vw.count: "#D56339"
      Total Completions - g3_groups_structured_content_performance_data_explorer_vw.count: "#679B47"
      Total Published Journeys - g3_groups_structured_content_performance_data_explorer_vw.count: "#3C7672"
      Total Ratings - g3_groups_structured_content_performance_data_explorer_vw.count: "#D46156"
      Total Unique Card Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#93BAD7"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views: "#5EA7CF"
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks: "#FFA355"
      g3_groups_structured_content_performance_data_explorer_vw.current_likes: "#AFF48B"
      g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_structured_content_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_structured_content_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys: "#006D66"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways: "#50B69E"
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_structured_content_performance_data_explorer_vw.total_views: "#D1E8FB"
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
    hidden_fields: [g3_groups_structured_content_performance_data_explorer_vw.total_events]
    listen:
      Time: g3_groups_structured_content_performance_data_explorer_vw.time_date
      User Account Status: g3_groups_structured_content_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_structured_content_performance_data_explorer_vw.excluded_from_leaderboard
      Performance Metric: g3_groups_structured_content_performance_data_explorer_vw.performance_metric
      Assigned Content: g3_groups_structured_content_performance_data_explorer_vw.assigned_content
    row: 12
    col: 0
    width: 12
    height: 7
  - title: Top 20 Pathways by Total User Performance [Filter Group]
    name: Top 20 Pathways by Total User Performance [Filter Group]
    model: concord
    explore: g3_groups_structured_content_performance_data_explorer_vw
    type: looker_column
    fields: [g3_groups_structured_content_performance_data_explorer_vw.pathway_title,
      g3_groups_structured_content_performance_data_explorer_vw.clc_badges_completed,
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
      g3_groups_structured_content_performance_data_explorer_vw.current_likes, g3_groups_structured_content_performance_data_explorer_vw.followers_users,
      g3_groups_structured_content_performance_data_explorer_vw.following_users, g3_groups_structured_content_performance_data_explorer_vw.total_badges_earned,
      g3_groups_structured_content_performance_data_explorer_vw.total_badges_shared,
      g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks, g3_groups_structured_content_performance_data_explorer_vw.total_comments,
      g3_groups_structured_content_performance_data_explorer_vw.total_completions,
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings, g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
      g3_groups_structured_content_performance_data_explorer_vw.total_views, g3_groups_structured_content_performance_data_explorer_vw.total_events]
    filters:
      g3_groups_structured_content_performance_data_explorer_vw.journey_title: ''
      g3_groups_structured_content_performance_data_explorer_vw.channel_name: ''
      g3_groups_structured_content_performance_data_explorer_vw.time_time: ''
      g3_groups_structured_content_performance_data_explorer_vw.pathway_title: "-NULL"
      g3_groups_structured_content_performance_data_explorer_vw.overall_content_structure: ''
      g3_groups_structured_content_performance_data_explorer_vw.card_title: ''
      g3_groups_structured_content_performance_data_explorer_vw.channel_content_exclusivity: ''
      g3_groups_structured_content_performance_data_explorer_vw.group_name: ''
      g3_groups_structured_content_performance_data_explorer_vw.user_full_name: ''
    sorts: [g3_groups_structured_content_performance_data_explorer_vw.total_events
        desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: g3_groups_structured_content_performance_data_explorer_vw.clc_badges_completed,
            id: g3_groups_structured_content_performance_data_explorer_vw.clc_badges_completed,
            name: Clc Badges Completed}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks,
            name: Current Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            id: g3_groups_structured_content_performance_data_explorer_vw.current_likes,
            name: Current Likes}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.followers_users,
            id: g3_groups_structured_content_performance_data_explorer_vw.followers_users,
            name: Followers Users}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.following_users,
            id: g3_groups_structured_content_performance_data_explorer_vw.following_users,
            name: Following Users}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_badges_earned,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_badges_earned,
            name: Total Badges Earned}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_badges_shared,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_badges_shared,
            name: Total Badges Shared}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks,
            name: Total Bookmarks}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_comments,
            name: Total Comments}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_completions,
            name: Total Completions}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits,
            name: Total Content Source Visits}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys,
            name: Total Published Journeys}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways,
            name: Total Published Pathways}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards,
            name: Total Published Smartcards}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_ratings,
            name: Total Ratings}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users,
            name: Total Shares to Direct Users}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups,
            name: Total Shares to Groups}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views,
            name: Total Unique Card Views}, {axisId: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            id: g3_groups_structured_content_performance_data_explorer_vw.total_views,
            name: Total Views}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
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
      Current Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFA355"
      Current Likes - g3_groups_structured_content_performance_data_explorer_vw.count: "#AFF48B"
      Total Bookmarks - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFE9A8"
      Total Comments - g3_groups_structured_content_performance_data_explorer_vw.count: "#EA4C29"
      Total Completions - g3_groups_structured_content_performance_data_explorer_vw.count: "#429338"
      Total Content Source Visits - g3_groups_structured_content_performance_data_explorer_vw.count: "#205D8E"
      Total Published SmartCards - g3_groups_structured_content_performance_data_explorer_vw.count: "#9AE0C4"
      Total Ratings - g3_groups_structured_content_performance_data_explorer_vw.count: "#FF823A"
      Total Shares to Direct Users - g3_groups_structured_content_performance_data_explorer_vw.count: "#FF746E"
      Total Shares to Groups - g3_groups_structured_content_performance_data_explorer_vw.count: "#FFB4B0"
      Total Unique Card Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#7DBCDE"
      Total Views - g3_groups_structured_content_performance_data_explorer_vw.count: "#D1E8FB"
      g3_groups_structured_content_performance_data_explorer_vw.clc_badges_completed: "#D6F2B5"
      g3_groups_structured_content_performance_data_explorer_vw.current_bookmarks: "#FFA355"
      g3_groups_structured_content_performance_data_explorer_vw.current_likes: "#AFF48B"
      g3_groups_structured_content_performance_data_explorer_vw.followers_users: "#8562B5"
      g3_groups_structured_content_performance_data_explorer_vw.following_users: "#BFA2D7"
      g3_groups_structured_content_performance_data_explorer_vw.total_badges_earned: "#CBCBCB"
      g3_groups_structured_content_performance_data_explorer_vw.total_badges_shared: "#E4E5E5"
      g3_groups_structured_content_performance_data_explorer_vw.total_bookmarks: "#FFE9A8"
      g3_groups_structured_content_performance_data_explorer_vw.total_comments: "#EA4C29"
      g3_groups_structured_content_performance_data_explorer_vw.total_completions: "#429338"
      g3_groups_structured_content_performance_data_explorer_vw.total_content_source_visits: "#205D8E"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_journeys: "#006D66"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_pathways: "#50B69E"
      g3_groups_structured_content_performance_data_explorer_vw.total_published_smartcards: "#9AE0C4"
      g3_groups_structured_content_performance_data_explorer_vw.total_ratings: "#FF823A"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_direct_users: "#FF746E"
      g3_groups_structured_content_performance_data_explorer_vw.total_shares_to_groups: "#FFB4B0"
      g3_groups_structured_content_performance_data_explorer_vw.total_unique_card_views: "#5EA7CF"
      g3_groups_structured_content_performance_data_explorer_vw.total_views: "#D1E8FB"
    label_color: [grey]
    defaults_version: 1
    hidden_fields: [g3_groups_structured_content_performance_data_explorer_vw.total_events]
    listen:
      Time: g3_groups_structured_content_performance_data_explorer_vw.time_date
      User Account Status: g3_groups_structured_content_performance_data_explorer_vw.user_account_status
      Excluded From Leaderboard: g3_groups_structured_content_performance_data_explorer_vw.excluded_from_leaderboard
      Performance Metric: g3_groups_structured_content_performance_data_explorer_vw.performance_metric
      Assigned Content: g3_groups_structured_content_performance_data_explorer_vw.assigned_content
    row: 28
    col: 0
    width: 12
    height: 9
  filters:
  - name: Group Name
    title: Group Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: g3_groups_structured_pathway_progression_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_structured_pathway_progression_data_explorer_vw.group_name
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
    explore: g3_groups_structured_content_performance_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_structured_content_performance_data_explorer_vw.time_date
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
    explore: g3_groups_structured_content_performance_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_structured_content_performance_data_explorer_vw.user_account_status
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
    explore: g3_groups_structured_content_performance_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_structured_content_performance_data_explorer_vw.excluded_from_leaderboard
  - name: Channel Name
    title: Channel Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: c2_content_structure_metadata_vw
    listens_to_filters: []
    field: derived_table_top_25_channels.channel_name
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
    explore: c2_content_structure_metadata_vw
    listens_to_filters: []
    field: c2_content_structure_metadata_vw.card_title
  - name: Journey Title
    title: Journey Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: c2_content_structure_metadata_vw
    listens_to_filters: []
    field: c2_content_structure_metadata_vw.journey_title
  - name: Pathway Title
    title: Pathway Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: c2_content_structure_metadata_vw
    listens_to_filters: []
    field: c2_content_structure_metadata_vw.pathway_title
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
    explore: g3_groups_structured_pathway_progression_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_structured_pathway_progression_data_explorer_vw.user_full_name
  - name: Performance Metric
    title: Performance Metric
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: g3_groups_structured_content_performance_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_structured_content_performance_data_explorer_vw.performance_metric
  - name: Channel Content Exclusivity
    title: Channel Content Exclusivity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: c2_content_structure_metadata_vw
    listens_to_filters: []
    field: c2_content_structure_metadata_vw.channel_content_exclusivity
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
    explore: g3_groups_structured_content_performance_data_explorer_vw
    listens_to_filters: []
    field: g3_groups_structured_content_performance_data_explorer_vw.assigned_content
  - name: Overall Content Structure
    title: Overall Content Structure
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: concord
    explore: c2_content_structure_metadata_vw
    listens_to_filters: []
    field: c2_content_structure_metadata_vw.overall_content_structure
