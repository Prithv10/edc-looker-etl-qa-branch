- dashboard: welcome__to_analytics_homepage
  title: Welcome to Analytics Homepage
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Uk570jSgvtqu6skE9EcVi1
  elements:
  - name: Cards Viewed Last 30 Days (copy)
    title: Cards Viewed Last 30 Days (copy)
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: single_value
    fields: [u2_users_performance_part5_final_results_vw.count_user_card_id, u2_users_performance_part5_final_results_vw.time_month]
    fill_fields: [u2_users_performance_part5_final_results_vw.time_month]
    filters:
      u2_users_performance_part5_final_results_vw.event: '"card_viewed"'
      u2_users_performance_part5_final_results_vw.performance_metric: Total Unique
        Card Views
    sorts: [u2_users_performance_part5_final_results_vw.time_month desc]
    limit: 500
    dynamic_fields: [{args: [u2_users_performance_part5_final_results_vw.count_user_card_id],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: u2_users_performance_part5_final_results_vw.count_user_card_id,
        label: Percent change from previous - User Performance Count User Card ID,
        source_field: u2_users_performance_part5_final_results_vw.count_user_card_id,
        table_calculation: percent_change_from_previous_user_performance_count_user_card_id,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 0EDgiZAcpw}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Cards Viewed
    comparison_label: ''
    defaults_version: 1
    listen: {}
    row: 1
    col: 0
    width: 6
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Welcome to EdGraph"}],"id":1663830781849},{"type":"p","children":[{"text":""}],"id":1663940354902},{"type":"p","children":[{"text":"This
      page serves as an executive summary to quickly monitor key vitals on the platform.
      These are further outlined in the "},{"type":"a","url":"https://docs.edcast.com/docs/get-started-with-edgraph-most-common-use-cases","children":[{"text":"Top
      Use Cases for EdGraph","color":"rgb(0, 0, 233)","underline":true}],"id":1664476995588},{"color":"rgb(0,
      0, 233)","underline":true,"text":" "},{"text":"post. Note that the data in this
      dashboard only reflects LXP data. This dashboard does not include any data from
      your LMS instance if applicable. This is to isolate the effects of the LXP to
      get clear, actionable insights. "}],"id":1663830781849},{"type":"p","id":1663940314972,"children":[{"text":""}]},{"type":"h1","align":"center","children":[{"text":"Landing
      Page Definitions"}],"id":1663940315674},{"type":"p","children":[{"text":""}],"id":1663940385150},{"type":"h3","align":"center","children":[{"text":"Top
      Cards"}],"id":1663940315674},{"type":"p","children":[{"text":""}],"id":1663940386487},{"type":"p","align":"left","children":[{"text":"These
      contain metrics for the trailing 30 days. These include cards viewed in the
      last 30 days, completions in the last 30 days, and UGC content created in the
      last 30 days."}],"id":1663940315675},{"type":"p","align":"left","id":1663940442003,"children":[{"text":""}]},{"type":"p","children":[{"text":"\n"}],"id":1663830781850}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 19
    width: 5
    height: 9
  - name: Completions Last 30 Days
    title: Completions Last 30 Days
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: single_value
    fields: [u2_users_performance_part5_final_results_vw.count_user_card_id, u2_users_performance_part5_final_results_vw.time_month]
    fill_fields: [u2_users_performance_part5_final_results_vw.time_month]
    filters:
      u2_users_performance_part5_final_results_vw.event: '"card_marked_as_complete"'
      u2_users_performance_part5_final_results_vw.performance_metric: Total Completions
      u2_users_performance_part5_final_results_vw.platform_external: "-External"
    sorts: [u2_users_performance_part5_final_results_vw.time_month desc]
    limit: 500
    dynamic_fields: [{args: [u2_users_performance_part5_final_results_vw.count_user_card_id],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: u2_users_performance_part5_final_results_vw.count_user_card_id,
        label: Percent change from previous - User Performance Count User Card ID,
        source_field: u2_users_performance_part5_final_results_vw.count_user_card_id,
        table_calculation: percent_change_from_previous_user_performance_count_user_card_id,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 0EDgiZAcpw}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Completions
    comparison_label: ''
    defaults_version: 1
    listen: {}
    row: 1
    col: 6
    width: 7
    height: 4
  - type: button
    name: button_793
    rich_content_json: '{"text":"Highlights","description":"","newTab":false,"alignment":"center","size":"large","style":"FILLED","color":"#80868B"}'
    row: 0
    col: 0
    width: 19
    height: 1
  - name: User Generated Content Last 30 Days (copy)
    title: User Generated Content Last 30 Days (copy)
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: single_value
    fields: [u2_users_performance_part5_final_results_vw.count, u2_users_performance_part5_final_results_vw.time_month]
    fill_fields: [u2_users_performance_part5_final_results_vw.time_month]
    filters:
      u2_users_performance_part5_final_results_vw.ecl_source_name: User Generated
        Content
      u2_users_performance_part5_final_results_vw.event: '"card_created","card_published"'
    sorts: [u2_users_performance_part5_final_results_vw.time_month desc]
    limit: 500
    dynamic_fields: [{args: [u2_users_performance_part5_final_results_vw.count], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: u2_users_performance_part5_final_results_vw.count,
        label: Percent change from previous - User Performance Count, source_field: u2_users_performance_part5_final_results_vw.count,
        table_calculation: percent_change_from_previous_user_performance_count, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, id: 7aSHCF7FZQ}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: UGC Content Created
    comparison_label: ''
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 1
    col: 13
    width: 6
    height: 4
  - title: Actively Engaged Users [Last 6 Months]
    name: Actively Engaged Users [Last 6 Months]
    model: gcp_concord_dawn_qa
    explore: u2_users_performance_part5_final_results_vw
    type: looker_line
    fields: [u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids,
      u2_users_performance_part5_final_results_vw.time_month]
    filters:
      u2_users_performance_part5_final_results_vw.performance_metric: Followers (Users)
      u2_users_performance_part5_final_results_vw.platform_external: "-External"
      u2_users_performance_part5_final_results_vw.time_date: 6 months
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
            name: ":"}], showLabels: false, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    hide_legend: false
    label_value_format: ''
    series_types: {}
    series_colors:
      u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids: "#3E6897"
    series_labels:
      u2_users_performance_part5_final_results_vw.count_of_distinct_user_ids: Users
    x_axis_datetime_label: "%Y-%b"
    defaults_version: 1
    listen: {}
    row: 9
    col: 15
    width: 9
    height: 10
  - title: User Funnel
    name: User Funnel
    model: gcp_concord_dawn_qa
    explore: u3_users_user_funnel_data_explorer_vw
    type: looker_funnel
    fields: [u3_users_user_funnel_data_explorer_vw.metrics, u3_users_user_funnel_data_explorer_vw.count]
    filters:
      u3_users_user_funnel_data_explorer_vw.metrics: "-EMPTY"
    sorts: [u3_users_user_funnel_data_explorer_vw.count desc]
    limit: 500
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: hidden
    valuePosition: inline
    labelColorEnabled: true
    labelColor: "#FFF"
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      custom:
        id: 0b0865a4-34c1-b5ca-fd71-925df2603b47
        label: Custom
        type: discrete
        colors:
        - "#8A6EBB"
        - "#AE92C6"
        - "#5D8AB6"
        - "#9BC2E1"
        - "#A2A2A2"
        - "#5A5A5A"
        - "#26D2DC"
        - "#126E82"
        - "#9FFA82"
        - "#AA0A3C"
        - "#F0F031"
        - "#FA78F9"
      options:
        steps: 5
    isStepped: true
    labelScale: ".25"
    labelOverlap: false
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
    up_color: false
    down_color: false
    total_color: false
    listen: {}
    row: 5
    col: 5
    width: 10
    height: 10
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      ##User Funnel##


      **Users Invited:**Total users loaded onto the LXP instance (typically an email list)

      **Users Onboarded:** Total users with at least one sign-on to the platform

      **Active Users:** Total users who've logged in and completed at least one of our content-related performance metrics and/or following another user

      **Users with Completions:** Users who've completed pathways,  journeys, cards, or all three

      **Badge/Certificate Earners:** Users who've earned a badge

      **Employer Advocacy:** Users who've shared badges or certificates on social media.
    row: 5
    col: 0
    width: 5
    height: 11
