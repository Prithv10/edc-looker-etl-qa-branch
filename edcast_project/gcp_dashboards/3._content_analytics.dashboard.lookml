- dashboard: 3___content_analytics
  title: 3. Content Analytics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: whS8zQACMHRMERKqQyltMG
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Content Attributes**"
    row: 29
    col: 11
    width: 8
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Content Performance**"
    row: 0
    col: 10
    width: 10
    height: 2
  - name: Content Performance [Overview]
    title: Content Performance [Overview]
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_grid
    fields: [u2_users_performance_part5_final_results_vw.performance_metric, u2_users_performance_part5_final_results_vw.card_title,
      u2_users_performance_part5_final_results_vw.standard_card_type, u2_users_performance_part5_final_results_vw.is_public,
      u2_users_performance_part5_final_results_vw.card_state, u2_users_performance_part5_final_results_vw.card_author_full_name,
      u2_users_performance_part5_final_results_vw.card_resource_url, u2_users_performance_part5_final_results_vw.content_structure,
      u2_users_performance_part5_final_results_vw.count]
    filters:
      u2_users_performance_part5_final_results_vw.card_id: NOT NULL
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
      u2_users_performance_part5_final_results_vw.performance_metric, u2_users_performance_part5_final_results_vw.card_title]
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
    hidden_fields:
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Content Structure: u2_users_performance_part5_final_results_vw.content_structure
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      Assigned Content: u2_users_performance_part5_final_results_vw.assigned_content
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
    row: 12
    col: 0
    width: 24
    height: 9
  - name: Content Performance [Data Explorer]
    title: Content Performance [Data Explorer]
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_grid
    fields: [u2_users_performance_part5_final_results_vw.time_time, u2_users_performance_part5_final_results_vw.performance_metric,
      u2_users_performance_part5_final_results_vw.content_structure, u2_users_performance_part5_final_results_vw.card_title,
      u2_users_performance_part5_final_results_vw.standard_card_type, u2_users_performance_part5_final_results_vw.card_state,
      u2_users_performance_part5_final_results_vw.user_full_name, u2_users_performance_part5_final_results_vw.shared_to_user_full_name,
      u2_users_performance_part5_final_results_vw.shared_to_group_name, u2_users_performance_part5_final_results_vw.card_author_full_name,
      u2_users_performance_part5_final_results_vw.card_resource_url, u2_users_performance_part5_final_results_vw.comment_message,
      u2_users_performance_part5_final_results_vw.card_rating, u2_users_performance_part5_final_results_vw.primary_key]
    filters:
      u2_users_performance_part5_final_results_vw.card_state: "-EMPTY"
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    hidden_fields: [u2_users_performance_part5_final_results_vw.primary_key]
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Content Structure: u2_users_performance_part5_final_results_vw.content_structure
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      Assigned Content: u2_users_performance_part5_final_results_vw.assigned_content
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
    row: 21
    col: 0
    width: 24
    height: 8
  - name: Content Activity By Platform
    title: Content Activity By Platform
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_grid
    fields: [u2_users_performance_part5_final_results_vw.platform, u2_users_performance_part5_final_results_vw.count]
    filters:
      u2_users_performance_part5_final_results_vw.platform: web,ios,android,-NULL
    sorts: [u2_users_performance_part5_final_results_vw.platform]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labVal
    series_colors:
      android: "#ACD47D"
      ios: "#9AC3E1"
      web: "#8970BB"
    series_labels:
      ios: ios
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
    hidden_fields: []
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Content Structure: u2_users_performance_part5_final_results_vw.content_structure
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Time: u2_users_performance_part5_final_results_vw.time_date
      Assigned Content: u2_users_performance_part5_final_results_vw.assigned_content
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
    row: 31
    col: 0
    width: 13
    height: 10
  - name: Total Content by Standard Card Type
    title: Total Content by Standard Card Type
    model: gcp_concord_dawn_qa
    explore: c1_content_latest_metadata_vw
    type: looker_grid
    fields: [c1_content_latest_metadata_vw.count, derived_table_standard_card_type.top_13_standard_card_type_names,
      derived_table_standard_card_type.rank]
    filters:
      c1_content_latest_metadata_vw.is_public: ''
      c1_content_latest_metadata_vw.standard_card_type: "-EMPTY"
    sorts: [derived_table_standard_card_type.rank]
    limit: 14
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
      c1_content_latest_metadata_vw.count:
        is_active: true
    value_labels: labels
    label_type: labVal
    series_colors:
      Video: "#5EA7CF"
      Course: "#A9D5F2"
      Interactive: "#3A81AF"
      Text: "#D6F2B5"
      Miscellaneous: "#6DBA59"
      Pathway: "#AFE08B"
      E Book: "#429338"
      Quiz: "#FFE9A8"
      Image: "#FF823A"
      Video Stream: "#FFC87F"
      News: "#EA4C29"
      Other: "#FFA355"
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
    hidden_fields: [derived_table_standard_card_type.rank]
    series_types: {}
    listen:
      Content Structure: c1_content_latest_metadata_vw.content_structure
      Card Title: c1_content_latest_metadata_vw.card_title
    row: 31
    col: 13
    width: 11
    height: 10
  - name: "# Content Published MoM"
    title: "# Content Published MoM"
    model: gcp_concord_dawn_qa
    explore: c1_content_latest_metadata_vw
    type: looker_line
    fields: [c1_content_latest_metadata_vw.published_month, c1_content_latest_metadata_vw.count]
    fill_fields: [c1_content_latest_metadata_vw.published_month]
    filters:
      c1_content_latest_metadata_vw.is_public: ''
      c1_content_latest_metadata_vw.published_month: 12 months
    sorts: [c1_content_latest_metadata_vw.published_month desc]
    limit: 500
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: c1_content_latest_metadata_vw.count,
            id: c1_content_latest_metadata_vw.count, name: Content Data}], showLabels: false,
        showValues: true, maxValue: !!null '', minValue: 0, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_types:
      c1_content_latest_metadata_vw.count: area
    series_colors:
      c1_content_latest_metadata_vw.count: "#5D8AB6"
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    x_axis_label_rotation: -60
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Content Structure: c1_content_latest_metadata_vw.content_structure
      Card Title: c1_content_latest_metadata_vw.card_title
    row: 41
    col: 13
    width: 11
    height: 10
  - name: "# Content by Level"
    title: "# Content by Level"
    model: gcp_concord_dawn_qa
    explore: c1_content_latest_metadata_vw
    type: looker_pie
    fields: [c1_content_latest_metadata_vw.card_level, c1_content_latest_metadata_vw.count]
    filters: {}
    sorts: [c1_content_latest_metadata_vw.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: lab
    inner_radius: 50
    series_colors:
      No Level: "#D46156"
      Beginner: "#4E7599"
      Intermediate: "#D8B87D"
      Advanced: "#679B47"
      advanced: "#679B47"
      intermediate: "#FAECB4"
      beginner: "#396d96"
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
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
    hidden_fields: []
    y_axes: []
    listen:
      Content Structure: c1_content_latest_metadata_vw.content_structure
      Card Title: c1_content_latest_metadata_vw.card_title
    row: 51
    col: 13
    width: 11
    height: 11
  - name: Overall Assignment Progression
    title: Overall Assignment Progression
    model: gcp_concord_dawn_qa
    explore: u2_users_assignment_status_vw
    type: looker_column
    fields: [u2_users_assignment_status_vw.assignment_progression, u2_users_assignment_status_vw.count]
    pivots: [u2_users_assignment_status_vw.assignment_progression]
    filters:
      u2_users_assignment_status_vw.user_full_name: "-EMPTY"
      u2_users_assignment_status_vw.assignment_state: ''
      u2_users_assignment_status_vw.assignor_full_name: ''
    sorts: [u2_users_assignment_status_vw.assignment_progression, u2_users_assignment_status_vw.count
        3]
    limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: u2_users_assignment_status_vw.count,
            id: 1. Not Started - u2_users_assignment_status_vw.count, name: 1. Not
              Started}, {axisId: u2_users_assignment_status_vw.count, id: 2. Started
              - u2_users_assignment_status_vw.count, name: 2. Started}, {axisId: u2_users_assignment_status_vw.count,
            id: 3. Completed - u2_users_assignment_status_vw.count, name: 3. Completed}],
        showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 10px
    series_types: {}
    series_colors:
      1. Not Started - u2_users_assignment_status_vw.count: "#D1D1D1"
      2. Started - u2_users_assignment_status_vw.count: "#7DAACF"
      3. Completed - u2_users_assignment_status_vw.count: "#4C7234"
      4. Dismissed - u2_users_assignment_status_vw.count: "#EC9249"
    label_color: [grey]
    column_spacing_ratio: 0.4
    column_group_spacing_ratio: 0
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Content Structure: u2_users_assignment_status_vw.content_structure
      Card Title: u2_users_assignment_status_vw.card_title
      Excluded From Leaderboard: u2_users_assignment_status_vw.excluded_from_leaderboard
      User Account Status: u2_users_assignment_status_vw.user_account_status
    row: 51
    col: 0
    width: 13
    height: 11
  - name: Assignment Status [Data Explorer ] - Content
    title: Assignment Status [Data Explorer ] - Content
    model: gcp_concord_dawn_qa
    explore: u2_users_assignment_status_vw
    type: looker_grid
    fields: [u2_users_assignment_status_vw.user_full_name, u2_users_assignment_status_vw.assignor_full_name,
      u2_users_assignment_status_vw.assignment_state, u2_users_assignment_status_vw.time_assignment_started_time,
      u2_users_assignment_status_vw.time_completed_time, u2_users_assignment_status_vw.assignment_due_time,
      u2_users_assignment_status_vw.card_title, u2_users_assignment_status_vw.assignment_type,
      u2_users_assignment_status_vw.assignment_progression, u2_users_assignment_status_vw.email,
      u2_users_assignment_status_vw.primary_key]
    filters:
      u2_users_assignment_status_vw.assignment_state: ''
      u2_users_assignment_status_vw.assignor_full_name: ''
      u2_users_assignment_status_vw.time_completed_date: 2022/01/01 to 2022/04/01
      u2_users_assignment_status_vw.user_full_name: ''
    sorts: [u2_users_assignment_status_vw.card_title, u2_users_assignment_status_vw.time_completed_time
        desc, u2_users_assignment_status_vw.time_assignment_started_time desc, u2_users_assignment_status_vw.assignment_state
        desc]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
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
    series_column_widths:
      u2_users_assignment_status_vw.assignor_full_name: 187
      u2_users_assignment_status_vw.assignment_state: 131
      u2_users_assignment_status_vw.user_full_name: 109
      u2_users_assignment_status_vw.card_title: 375
      u2_users_assignment_status_vw.email: 140
      u2_users_assignment_status_vw.assignment_progression: 99
      u2_users_assignment_status_vw.assignment_type: 138
      u2_users_assignment_status_vw.assignment_due_time: 140
      u2_users_assignment_status_vw.time_completed_time: 148
      u2_users_assignment_status_vw.time_assignment_started_time: 179
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    series_types: {}
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
    hidden_fields: [u2_users_assignment_status_vw.primary_key]
    listen:
      Content Structure: u2_users_assignment_status_vw.content_structure
      Card Title: u2_users_assignment_status_vw.card_title
      Excluded From Leaderboard: u2_users_assignment_status_vw.excluded_from_leaderboard
      User Account Status: u2_users_assignment_status_vw.user_account_status
    row: 41
    col: 0
    width: 13
    height: 10
  - name: Top 10 Content
    title: Top 10 Content
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_bar
    fields: [u2_users_performance_part5_final_results_vw.card_title, u2_users_performance_part5_final_results_vw.current_bookmarks,
      u2_users_performance_part5_final_results_vw.current_likes, u2_users_performance_part5_final_results_vw.total_bookmarks,
      u2_users_performance_part5_final_results_vw.total_comments, u2_users_performance_part5_final_results_vw.total_completions,
      u2_users_performance_part5_final_results_vw.total_content_source_visits, u2_users_performance_part5_final_results_vw.total_published_journeys,
      u2_users_performance_part5_final_results_vw.total_published_pathways, u2_users_performance_part5_final_results_vw.total_published_smartcards,
      u2_users_performance_part5_final_results_vw.total_ratings, u2_users_performance_part5_final_results_vw.total_shares_to_direct_users,
      u2_users_performance_part5_final_results_vw.total_shares_to_groups, u2_users_performance_part5_final_results_vw.total_unique_card_views,
      u2_users_performance_part5_final_results_vw.total_views, u2_users_performance_part5_final_results_vw.clc_badges_completed,
      u2_users_performance_part5_final_results_vw.followers_users, u2_users_performance_part5_final_results_vw.following_users,
      u2_users_performance_part5_final_results_vw.total_badges_earned, u2_users_performance_part5_final_results_vw.total_badges_shared,
      u2_users_performance_part5_final_results_vw.total_events]
    filters: {}
    sorts: [u2_users_performance_part5_final_results_vw.total_events desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${u2_users_performance_part5_final_results_vw.count}))',
        label: Total, value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number, id: n9M0W8CVUt}]
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
      palette_id: edcast-s-faves-sequential-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: u2_users_performance_part5_final_results_vw.current_bookmarks,
            id: u2_users_performance_part5_final_results_vw.current_bookmarks, name: Current
              Bookmarks}, {axisId: u2_users_performance_part5_final_results_vw.current_likes,
            id: u2_users_performance_part5_final_results_vw.current_likes, name: Current
              Likes}, {axisId: u2_users_performance_part5_final_results_vw.total_bookmarks,
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
              Views}, {axisId: u2_users_performance_part5_final_results_vw.clc_badges_completed,
            id: u2_users_performance_part5_final_results_vw.clc_badges_completed,
            name: Clc Badges Completed}, {axisId: u2_users_performance_part5_final_results_vw.followers_users,
            id: u2_users_performance_part5_final_results_vw.followers_users, name: Followers
              Users}, {axisId: u2_users_performance_part5_final_results_vw.following_users,
            id: u2_users_performance_part5_final_results_vw.following_users, name: Following
              Users}, {axisId: u2_users_performance_part5_final_results_vw.total_badges_earned,
            id: u2_users_performance_part5_final_results_vw.total_badges_earned, name: Total
              Badges Earned}, {axisId: u2_users_performance_part5_final_results_vw.total_badges_shared,
            id: u2_users_performance_part5_final_results_vw.total_badges_shared, name: Total
              Badges Shared}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    font_size: 10px
    series_types: {}
    series_colors:
      u2_users_performance_part5_final_results_vw.current_bookmarks: "#E9E9E9"
    label_color: [grey]
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
    hidden_fields: [total, u2_users_performance_part5_final_results_vw.total_events]
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Assigned Content: u2_users_performance_part5_final_results_vw.assigned_content
      Time: u2_users_performance_part5_final_results_vw.time_date
      Content Structure: u2_users_performance_part5_final_results_vw.content_structure
      Card Title: u2_users_performance_part5_final_results_vw.card_title
      Excluded From Leaderboard: u2_users_performance_part5_final_results_vw.excluded_from_leaderboard
      User Account Status: u2_users_performance_part5_final_results_vw.user_account_status
    row: 2
    col: 0
    width: 12
    height: 10
  - title: Top 20 - Content Sources
    name: Top 20 - Content Sources
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_column
    fields: [u2_users_performance_part5_final_results_vw.ecl_source_name, u2_users_performance_part5_final_results_vw.clc_badges_completed,
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
    filters:
      u2_users_performance_part5_final_results_vw.ecl_source_name: "-EMPTY"
      u2_users_performance_part5_final_results_vw.user_account_status: ''
      u2_users_performance_part5_final_results_vw.excluded_from_leaderboard: ''
    sorts: [u2_users_performance_part5_final_results_vw.total_events desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${u2_users_performance_part5_final_results_vw.count}))',
        label: Total, value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number, id: vMCbZ5RFHb, is_disabled: true}]
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
      palette_id: edcast-s-faves-sequential-0
      options:
        steps: 5
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
    series_types: {}
    series_colors:
      u2_users_performance_part5_final_results_vw.clc_badges_completed: "#E9E9E9"
    label_color: [grey]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [u2_users_performance_part5_final_results_vw.total_events]
    listen:
      Performance Metric: u2_users_performance_part5_final_results_vw.performance_metric
      Assigned Content: u2_users_performance_part5_final_results_vw.assigned_content
      Time: u2_users_performance_part5_final_results_vw.time_date
      Content Structure: u2_users_performance_part5_final_results_vw.content_structure
      Card Title: u2_users_performance_part5_final_results_vw.card_title
    row: 2
    col: 12
    width: 12
    height: 10
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
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    listens_to_filters: []
    field: u2_users_performance_part5_final_results_vw.time_date
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
  - name: User Account Status
    title: User Account Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcp_concord_dawn_qa
    explore: u2_users_assignment_status_vw
    listens_to_filters: []
    field: u2_users_assignment_status_vw.user_account_status
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
    explore: u2_users_assignment_status_vw
    listens_to_filters: []
    field: u2_users_assignment_status_vw.excluded_from_leaderboard
  - name: Content Structure
    title: Content Structure
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    listens_to_filters: []
    field: u2_users_performance_part5_final_results_vw.content_structure
  - name: Assigned Content
    title: Assigned Content
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    listens_to_filters: []
    field: u2_users_performance_part5_final_results_vw.assigned_content
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
