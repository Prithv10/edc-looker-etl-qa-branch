- dashboard: 6__channel_analytics
  title: 6. Channel Analytics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: b09tJrgMoZc0fhP5ikA9k3
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: "## **Channel Performance**"
    row: 0
    col: 9
    width: 9
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "## **Channel Trends**"
    row: 22
    col: 11
    width: 11
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "## **Channel Attributes**"
    row: 32
    col: 10
    width: 12
    height: 2
  - name: Channel Performance  [Overview]
    title: Channel Performance  [Overview]
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    type: looker_grid
    fields: [ch2_channel_performance_part2_final_results_vw.channel_name, ch2_channel_performance_part2_final_results_vw.performance_metric,
      ch2_channel_performance_part2_final_results_vw.is_channel_private, ch2_channel_performance_part2_final_results_vw.is_channel_curated,
      ch2_channel_performance_part2_final_results_vw.channel_status, ch2_channel_performance_part2_final_results_vw.count]
    filters: {}
    sorts: [ch2_channel_performance_part2_final_results_vw.count desc]
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
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_sql_query_menu_options: false
    column_order: [ch2_channel_performance_part2_final_results_vw.count, ch2_channel_performance_part2_final_results_vw.performance_metric,
      ch2_channel_performance_part2_final_results_vw.channel_name, ch2_channel_performance_part2_final_results_vw.is_channel_private,
      ch2_channel_performance_part2_final_results_vw.is_channel_curated, ch2_channel_performance_part2_final_results_vw.channel_status]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      ch2_channel_performance_part2_final_results_vw.channel_name: Channel Name
      ch2_channel_performance_part2_final_results_vw.performance_metric: Performance
        Metric
      ch2_channel_performance_part2_final_results_vw.is_channel_private: Is Channel
        Private
      ch2_channel_performance_part2_final_results_vw.count: Total
    series_cell_visualizations:
      ch2_channel_performance_part2_final_results_vw.count:
        is_active: false
        value_display: true
    series_text_format:
      ch2_channel_performance_part2_final_results_vw.channel_name:
        align: left
      ch2_channel_performance_part2_final_results_vw.count: {}
      ch2_channel_performance_part2_final_results_vw.performance_metric: {}
      ch2_channel_performance_part2_final_results_vw.is_channel_private: {}
      ch2_channel_performance_part2_final_results_vw.is_channel_curated: {}
      ch2_channel_performance_part2_final_results_vw.channel_status: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    header_font_color: ''
    header_background_color: ''
    conditional_formatting: []
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
    y_axes: []
    listen:
      Channel Name: ch2_channel_performance_part2_final_results_vw.channel_name
      User Account Status: ch2_channel_performance_part2_final_results_vw.user_account_status
      User Full Name: ch2_channel_performance_part2_final_results_vw.user_full_name
      Performance Metric: ch2_channel_performance_part2_final_results_vw.performance_metric
      Channel Status: ch2_channel_performance_part2_final_results_vw.channel_status
      Time: ch2_channel_performance_part2_final_results_vw.time_date
      Excluded From Leaderboard: ch2_channel_performance_part2_final_results_vw.excluded_from_leaderboard
    row: 2
    col: 12
    width: 12
    height: 10
  - name: Channel Performance [Data Explorer]
    title: Channel Performance [Data Explorer]
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    type: looker_grid
    fields: [ch2_channel_performance_part2_final_results_vw.time_time, ch2_channel_performance_part2_final_results_vw.performance_metric,
      ch2_channel_performance_part2_final_results_vw.user_full_name, ch2_channel_performance_part2_final_results_vw.email,
      ch2_channel_performance_part2_final_results_vw.event, ch2_channel_performance_part2_final_results_vw.channel_name,
      ch2_channel_performance_part2_final_results_vw.channel_status, ch2_channel_performance_part2_final_results_vw.is_channel_curated,
      ch2_channel_performance_part2_final_results_vw.primary_key]
    filters: {}
    sorts: [ch2_channel_performance_part2_final_results_vw.time_time desc]
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
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      ch2_channel_performance_part2_final_results_vw.is_channel_curated: Is Channel
        Curated
      ch2_channel_performance_part2_final_results_vw.time_time: Time
    series_column_widths:
      ch2_channel_performance_part2_final_results_vw.event: 120
      ch2_channel_performance_part2_final_results_vw.channel_status: 92
      ch2_channel_performance_part2_final_results_vw.is_channel_curated: 221
    series_cell_visualizations:
      ch2_channel_performance_part2_final_results_vw.is_channel_curated:
        is_active: false
    series_text_format:
      ch2_channel_performance_part2_final_results_vw.time_time:
        align: center
      ch2_channel_performance_part2_final_results_vw.performance_metric: {}
      ch2_channel_performance_part2_final_results_vw.user_full_name: {}
      ch2_channel_performance_part2_final_results_vw.channel_name:
        align: left
      ch2_channel_performance_part2_final_results_vw.email: {}
      ch2_channel_performance_part2_final_results_vw.event: {}
      ch2_channel_performance_part2_final_results_vw.channel_status: {}
      ch2_channel_performance_part2_final_results_vw.is_channel_curated: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    header_font_color: ''
    header_background_color: ''
    conditional_formatting: []
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: [ch2_channel_performance_part2_final_results_vw.primary_key]
    y_axes: []
    listen:
      Channel Name: ch2_channel_performance_part2_final_results_vw.channel_name
      User Account Status: ch2_channel_performance_part2_final_results_vw.user_account_status
      User Full Name: ch2_channel_performance_part2_final_results_vw.user_full_name
      Performance Metric: ch2_channel_performance_part2_final_results_vw.performance_metric
      Channel Status: ch2_channel_performance_part2_final_results_vw.channel_status
      Time: ch2_channel_performance_part2_final_results_vw.time_date
      Excluded From Leaderboard: ch2_channel_performance_part2_final_results_vw.excluded_from_leaderboard
    row: 12
    col: 0
    width: 24
    height: 10
  - name: Channel Activity [Filter Performance Metric]
    title: Channel Activity [Filter Performance Metric]
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    type: looker_line
    fields: [ch2_channel_performance_part2_final_results_vw.time_month, ch2_channel_performance_part2_final_results_vw.performance_metric,
      ch2_channel_performance_part2_final_results_vw.count]
    pivots: [ch2_channel_performance_part2_final_results_vw.performance_metric]
    fill_fields: [ch2_channel_performance_part2_final_results_vw.time_month]
    filters: {}
    sorts: [ch2_channel_performance_part2_final_results_vw.time_month, ch2_channel_performance_part2_final_results_vw.performance_metric]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_performance_metric, based_on: ch2_channel_performance_part2_final_results_vw.performance_metric,
        expression: '', label: Count of Performance Metric, type: count_distinct,
        _kind_hint: measure, _type_hint: number, id: BoSxTFV7dU}, {measure: list_of_performance_metric,
        based_on: ch2_channel_performance_part2_final_results_vw.performance_metric,
        expression: '', label: List of Performance Metric, type: list, _kind_hint: measure,
        _type_hint: list, id: 3gijz6XLeX}]
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: ch2_channel_performance_part2_final_results_vw.count,
            id: Current Collaborators - ch2_channel_performance_part2_final_results_vw.count,
            name: Current Collaborators}, {axisId: ch2_channel_performance_part2_final_results_vw.count,
            id: Current Curators - ch2_channel_performance_part2_final_results_vw.count,
            name: Current Curators}, {axisId: ch2_channel_performance_part2_final_results_vw.count,
            id: Current Followers - ch2_channel_performance_part2_final_results_vw.count,
            name: Current Followers}, {axisId: ch2_channel_performance_part2_final_results_vw.count,
            id: Total Distinct User Visits - ch2_channel_performance_part2_final_results_vw.count,
            name: Total Distinct User Visits}, {axisId: ch2_channel_performance_part2_final_results_vw.count,
            id: Total Visits - ch2_channel_performance_part2_final_results_vw.count,
            name: Total Visits}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    font_size: 10px
    series_types: {}
    series_colors:
      Current Collaborators - ch2_channel_performance_part2_final_results_vw.count: "#FAECB4"
      Current Curators - ch2_channel_performance_part2_final_results_vw.count: "#F0AF65"
      Current Followers - ch2_channel_performance_part2_final_results_vw.count: "#679B47"
      Total Distinct User Visits - ch2_channel_performance_part2_final_results_vw.count: "#3E6897"
      Total Visits - ch2_channel_performance_part2_final_results_vw.count: "#9AC3E1"
    series_labels:
      ch2_channel_performance_part2_final_results_vw.time_month: Year-Month
      ch2_channel_performance_part2_final_results_vw.performance_metric: Performance
        Metric
      ch2_channel_performance_part2_final_results_vw.count: Count
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
      ch2_channel_performance_part2_final_results_vw.count:
        is_active: false
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Channel Name: ch2_channel_performance_part2_final_results_vw.channel_name
      User Account Status: ch2_channel_performance_part2_final_results_vw.user_account_status
      User Full Name: ch2_channel_performance_part2_final_results_vw.user_full_name
      Performance Metric: ch2_channel_performance_part2_final_results_vw.performance_metric
      Channel Status: ch2_channel_performance_part2_final_results_vw.channel_status
      Time: ch2_channel_performance_part2_final_results_vw.time_date
      Excluded From Leaderboard: ch2_channel_performance_part2_final_results_vw.excluded_from_leaderboard
    row: 24
    col: 0
    width: 12
    height: 8
  - name: Channel Activity By Platform
    title: Channel Activity By Platform
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    type: looker_grid
    fields: [ch2_channel_performance_part2_final_results_vw.platform, ch2_channel_performance_part2_final_results_vw.count]
    filters:
      ch2_channel_performance_part2_final_results_vw.platform: android,web,ios
    sorts: [ch2_channel_performance_part2_final_results_vw.count desc]
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
    color_application:
      collection_id: edcast-s-faves
      palette_id: edcast-s-faves-categorical-0
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels: {}
    series_cell_visualizations:
      ch2_channel_performance_part2_final_results_vw.count:
        is_active: true
    value_labels: labels
    label_type: labVal
    hidden_fields: []
    hidden_points_if_no: []
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    font_size: 12
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Channel Name: ch2_channel_performance_part2_final_results_vw.channel_name
      User Account Status: ch2_channel_performance_part2_final_results_vw.user_account_status
      User Full Name: ch2_channel_performance_part2_final_results_vw.user_full_name
      Performance Metric: ch2_channel_performance_part2_final_results_vw.performance_metric
      Channel Status: ch2_channel_performance_part2_final_results_vw.channel_status
      Time: ch2_channel_performance_part2_final_results_vw.time_date
      Excluded From Leaderboard: ch2_channel_performance_part2_final_results_vw.excluded_from_leaderboard
    row: 34
    col: 0
    width: 12
    height: 9
  - title: Total Channels with Activity
    name: Total Channels with Activity
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    type: looker_line
    fields: [ch2_channel_performance_part2_final_results_vw.time_month, ch2_channel_performance_part2_final_results_vw.count_of_channel_ids]
    fill_fields: [ch2_channel_performance_part2_final_results_vw.time_month]
    filters: {}
    sorts: [ch2_channel_performance_part2_final_results_vw.time_month]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_channel_name, based_on: ch2_channel_performance_part2_final_results_vw.channel_name,
        expression: '', label: Count of Channel Name, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: WiO1gulhO9}, {measure: sum_of_channel_id, based_on: ch2_channel_performance_part2_final_results_vw.channel_id,
        expression: '', label: Sum of Channel ID, type: sum, _kind_hint: measure,
        _type_hint: number, id: YEnfe6b1kT}, {measure: count_of_channel_id, based_on: ch2_channel_performance_part2_final_results_vw.channel_id,
        expression: '', label: Count of Channel ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: kk1uittLzj}]
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: ch2_channel_performance_part2_final_results_vw.count_of_channel_ids,
            id: ch2_channel_performance_part2_final_results_vw.count_of_channel_ids,
            name: Count of Channel Ids}], showLabels: false, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
          0.0,"K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '50'
    hide_legend: false
    font_size: 10px
    label_value_format: ''
    series_types:
      count_of_ch2_channel_performance_part2_final_results_vw.channel_id: area
    series_colors:
      count_of_ch2_channel_performance_part2_final_results_vw.channel_id: "#5C8BB6"
      count_of_channel_id: "#3E6897"
      ch2_channel_performance_part2_final_results_vw.count_of_channel_ids: "#3A81AF"
    series_labels: {}
    label_color: [grey]
    x_axis_datetime_label: "%Y-%b"
    swap_axes: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Channel Name: ch2_channel_performance_part2_final_results_vw.channel_name
      User Account Status: ch2_channel_performance_part2_final_results_vw.user_account_status
      User Full Name: ch2_channel_performance_part2_final_results_vw.user_full_name
      Performance Metric: ch2_channel_performance_part2_final_results_vw.performance_metric
      Channel Status: ch2_channel_performance_part2_final_results_vw.channel_status
      Time: ch2_channel_performance_part2_final_results_vw.time_date
      Excluded From Leaderboard: ch2_channel_performance_part2_final_results_vw.excluded_from_leaderboard
    row: 24
    col: 12
    width: 12
    height: 8
  - name: Top 20 Channels
    title: Top 20 Channels
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    type: looker_column
    fields: [ch2_channel_performance_part2_final_results_vw.channel_name, ch2_channel_performance_part2_final_results_vw.Current_Collaborators,
      ch2_channel_performance_part2_final_results_vw.Current_Curators, ch2_channel_performance_part2_final_results_vw.Current_Followers,
      ch2_channel_performance_part2_final_results_vw.Total_Distinct_User_Visits, ch2_channel_performance_part2_final_results_vw.total_events,
      ch2_channel_performance_part2_final_results_vw.Total_Visits]
    filters: {}
    sorts: [ch2_channel_performance_part2_final_results_vw.total_events desc]
    limit: 20
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: ch2_channel_performance_part2_final_results_vw.Current_Collaborators,
            id: ch2_channel_performance_part2_final_results_vw.Current_Collaborators,
            name: Current Collaborators}, {axisId: ch2_channel_performance_part2_final_results_vw.Current_Curators,
            id: ch2_channel_performance_part2_final_results_vw.Current_Curators, name: Current
              Curators}, {axisId: ch2_channel_performance_part2_final_results_vw.Current_Followers,
            id: ch2_channel_performance_part2_final_results_vw.Current_Followers,
            name: Current Followers}, {axisId: ch2_channel_performance_part2_final_results_vw.Total_Distinct_User_Visits,
            id: ch2_channel_performance_part2_final_results_vw.Total_Distinct_User_Visits,
            name: Total Distinct User Visits}, {axisId: ch2_channel_performance_part2_final_results_vw.Total_Visits,
            id: ch2_channel_performance_part2_final_results_vw.Total_Visits, name: Total
              Visits}], showLabels: true, showValues: true, valueFormat: '[>999999]#.0,,\M;[>999]
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
      ch2_channel_performance_part2_final_results_vw.Current_Collaborators: "#DCEBFB"
    label_color: [grey]
    hidden_fields: [ch2_channel_performance_part2_final_results_vw.total_events]
    defaults_version: 1
    listen:
      Channel Name: ch2_channel_performance_part2_final_results_vw.channel_name
      Time: ch2_channel_performance_part2_final_results_vw.time_date
      User Account Status: ch2_channel_performance_part2_final_results_vw.user_account_status
      Excluded From Leaderboard: ch2_channel_performance_part2_final_results_vw.excluded_from_leaderboard
      User Full Name: ch2_channel_performance_part2_final_results_vw.user_full_name
      Performance Metric: ch2_channel_performance_part2_final_results_vw.performance_metric
      Channel Status: ch2_channel_performance_part2_final_results_vw.channel_status
    row: 2
    col: 0
    width: 12
    height: 10
  filters:
  - name: Channel Name
    title: Channel Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    listens_to_filters: []
    field: ch2_channel_performance_part2_final_results_vw.channel_name
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
    explore: ch2_channel_performance_part2_final_results_vw
    listens_to_filters: []
    field: ch2_channel_performance_part2_final_results_vw.time_date
  - name: User Account Status
    title: User Account Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    listens_to_filters: []
    field: ch2_channel_performance_part2_final_results_vw.user_account_status
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
    explore: ch2_channel_performance_part2_final_results_vw
    listens_to_filters: []
    field: ch2_channel_performance_part2_final_results_vw.excluded_from_leaderboard
  - name: User Full Name
    title: User Full Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    listens_to_filters: []
    field: ch2_channel_performance_part2_final_results_vw.user_full_name
  - name: Performance Metric
    title: Performance Metric
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    listens_to_filters: []
    field: ch2_channel_performance_part2_final_results_vw.performance_metric
  - name: Channel Status
    title: Channel Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: concord
    explore: ch2_channel_performance_part2_final_results_vw
    listens_to_filters: []
    field: ch2_channel_performance_part2_final_results_vw.channel_status
