- dashboard: 7_4__feature_reports
  title: 7.4 Feature Reports
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: zQ2de8VPxtGMFJi8Zv28Vp
  elements:
  - name: SCORM - Report
    title: SCORM - Report
    model: gcp_concord_dawn_qa
    explore: u2_users_scorm_data_explorer_vw
    type: table
    fields: [u2_users_scorm_data_explorer_vw.card_title, u2_users_scorm_data_explorer_vw.card_author_full_name,
      u2_users_scorm_data_explorer_vw.user_full_name, u2_users_scorm_data_explorer_vw.scorm_registration_status,
      u2_users_scorm_data_explorer_vw.scorm_registration_success, u2_users_scorm_data_explorer_vw.scorm_score,
      u2_users_scorm_data_explorer_vw.scorm_total_seconds_tracked, u2_users_scorm_data_explorer_vw.scorm_attempts,
      u2_users_scorm_data_explorer_vw.time_time]
    filters:
      u2_users_scorm_data_explorer_vw.event: '"card_scorm_completed","card_scorm_started"'
      u2_users_scorm_data_explorer_vw.card_title: ''
      u2_users_scorm_data_explorer_vw.card_author_full_name: ''
      u2_users_scorm_data_explorer_vw.user_full_name: ''
      u2_users_scorm_data_explorer_vw.scorm_registration_status: ''
    sorts: [u2_users_scorm_data_explorer_vw.card_title]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      u2_users_scorm_data_explorer_vw.card_title: Card Title (Scorm)
      u2_users_scorm_data_explorer_vw.card_author_full_name: Author Name
      u2_users_scorm_data_explorer_vw.user_full_name: User Name
      u2_users_scorm_data_explorer_vw.time_time: Time
    defaults_version: 1
    listen: {}
    row: 53
    col: 0
    width: 24
    height: 11
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## **Poll**"
    row: 64
    col: 11
    width: 8
    height: 2
  - name: Live Events - Overview
    title: Live Events - Overview
    model: gcp_concord_dawn_qa
    explore: u1_users_live_event_cards_vw
    type: looker_grid
    fields: [u1_users_live_event_cards_vw.card_title, u1_users_live_event_cards_vw.card_author_full_name,
      u1_users_live_event_cards_vw.training_start_time, u1_users_live_event_cards_vw.training_end_time,
      u1_users_live_event_cards_vw.time_zone, u1_users_live_event_cards_vw.registration_type,
      u1_users_live_event_cards_vw.registration_limit, u1_users_live_event_cards_vw.last_registration_date,
      u1_users_live_event_cards_vw.card_id, u1_users_live_event_cards_vw.registration_approved,
      u1_users_live_event_cards_vw.registration_rejected, u1_users_live_event_cards_vw.unregistered]
    filters:
      u1_users_live_event_cards_vw.training_registration_state: "-EMPTY"
      u1_users_live_event_cards_vw.card_title: ''
      u1_users_live_event_cards_vw.user_full_name: ''
    sorts: [u1_users_live_event_cards_vw.card_title]
    limit: 500
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
    column_order: ["$$$_row_numbers_$$$", u1_users_live_event_cards_vw.card_title,
      u1_users_live_event_cards_vw.card_author_full_name, u1_users_live_event_cards_vw.training_start_time,
      u1_users_live_event_cards_vw.training_end_time, u1_users_live_event_cards_vw.time_zone,
      u1_users_live_event_cards_vw.registration_type, u1_users_live_event_cards_vw.registration_limit,
      u1_users_live_event_cards_vw.last_registration_date, u1_users_live_event_cards_vw.registration_approved,
      u1_users_live_event_cards_vw.registration_rejected, u1_users_live_event_cards_vw.unregistered,
      u1_users_live_event_cards_vw.card_id]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      u1_users_live_event_cards_vw.training_start_time: Start Date
      u1_users_live_event_cards_vw.training_end_time: End Date
      u1_users_live_event_cards_vw.card_author_full_name: Author Name
    series_cell_visualizations:
      u1_users_live_event_cards_vw.registration_approved:
        is_active: false
      u1_users_live_event_cards_vw.card_id:
        is_active: false
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
    listen: {}
    row: 41
    col: 0
    width: 12
    height: 10
  - name: Project Card - Report
    title: Project Card - Report
    model: gcp_concord_dawn_qa
    explore: u1_users_project_cards_vw
    type: looker_grid
    fields: [u1_users_project_cards_vw.card_title, u1_users_project_cards_vw.card_author_full_name,
      u1_users_project_cards_vw.submission_status, u1_users_project_cards_vw.grade,
      u1_users_project_cards_vw.submitter_full_name, u1_users_project_cards_vw.project_card_submission_url,
      u1_users_project_cards_vw.time_time, u1_users_project_cards_vw.grade_range,
      u1_users_project_cards_vw.submitter_type, u1_users_project_cards_vw.grader_type,
      u1_users_project_cards_vw.grader_full_name, u1_users_project_cards_vw.email]
    filters:
      u1_users_project_cards_vw.card_title: ''
      u1_users_project_cards_vw.submission_status: ''
      u1_users_project_cards_vw.grader_full_name: ''
      u1_users_project_cards_vw.submitter_full_name: ''
    sorts: [u1_users_project_cards_vw.card_title]
    limit: 500
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
    column_order: ["$$$_row_numbers_$$$", u1_users_project_cards_vw.card_title, u1_users_project_cards_vw.card_author_full_name,
      u1_users_project_cards_vw.grade_range, u1_users_project_cards_vw.submitter_type,
      u1_users_project_cards_vw.grader_type, u1_users_project_cards_vw.grader_full_name,
      u1_users_project_cards_vw.submitter_full_name, u1_users_project_cards_vw.email,
      u1_users_project_cards_vw.project_card_submission_url, u1_users_project_cards_vw.submission_status,
      u1_users_project_cards_vw.grade, u1_users_project_cards_vw.time_time]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      u1_users_project_cards_vw.card_title: Card Title (Project)
      u1_users_project_cards_vw.card_author_full_name: Author Name
      u1_users_project_cards_vw.grade_range: Grading Scale
      u1_users_project_cards_vw.submitter_type: Submissions By
      u1_users_project_cards_vw.grader_type: Graded By
      u1_users_project_cards_vw.grader_full_name: Grader Name
      u1_users_project_cards_vw.submitter_full_name: Submitted By (Name)
      u1_users_project_cards_vw.email: Submitted By (Email)
      u1_users_project_cards_vw.time_time: Time (UTC)
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 27
    col: 12
    width: 12
    height: 12
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h2","align":"center","children":[{"text":"MultiQuiz Report","bold":true}],"id":1663750543892}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h2","children":[{"text":"Project Cards","bold":true}],"id":1663750627433,"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 25
    col: 0
    width: 24
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h2","children":[{"text":"SCORM","bold":true}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 51
    col: 0
    width: 24
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h2","children":[{"text":"Live Events","bold":true}],"id":1663750729163,"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 39
    col: 0
    width: 24
    height: 2
  - title: MultiQuiz Card - GradeBook
    name: MultiQuiz Card - GradeBook
    model: gcp_concord_dawn_qa
    explore: u2_quiz_data_explorer_part3_final_vw
    type: looker_grid
    fields: [u2_quiz_data_explorer_part3_final_vw.card_title, u2_quiz_data_explorer_part3_final_vw.card_author_full_name,
      u2_quiz_data_explorer_part3_final_vw.quiz_passing_criteria, u2_quiz_data_explorer_part3_final_vw.total_quiz_attempts,
      u2_quiz_data_explorer_part3_final_vw.card_id, u2_quiz_data_explorer_part3_final_vw.user_full_name,
      u2_quiz_data_explorer_part3_final_vw.total_correct, u2_quiz_data_explorer_part3_final_vw.total_questions,
      u2_quiz_data_explorer_part3_final_vw.quiz_option_is_correct, u2_quiz_data_explorer_part3_final_vw.result]
    filters:
      u2_quiz_data_explorer_part3_final_vw.card_title: ''
      u2_quiz_data_explorer_part3_final_vw.user_full_name: ''
    sorts: [u2_quiz_data_explorer_part3_final_vw.card_title]
    limit: 500
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
    column_order: ["$$$_row_numbers_$$$", u2_quiz_data_explorer_part3_final_vw.card_title,
      u2_quiz_data_explorer_part3_final_vw.card_author_full_name, u2_quiz_data_explorer_part3_final_vw.total_questions,
      u2_quiz_data_explorer_part3_final_vw.quiz_passing_criteria, u2_quiz_data_explorer_part3_final_vw.user_full_name,
      u2_quiz_data_explorer_part3_final_vw.total_quiz_attempts, u2_quiz_data_explorer_part3_final_vw.total_correct,
      u2_quiz_data_explorer_part3_final_vw.result, u2_quiz_data_explorer_part3_final_vw.quiz_option_is_correct,
      u2_quiz_data_explorer_part3_final_vw.card_id]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      u2_quiz_data_explorer_part3_final_vw.card_author_full_name: Author Name
      u2_quiz_data_explorer_part3_final_vw.quiz_option_is_correct: Result (Passed/
        Failed)
      u2_quiz_data_explorer_part3_final_vw.total_quiz_attempts: No. of Attempts
      u2_quiz_data_explorer_part3_final_vw.quiz_questions_passed: Correct Answers
      u2_quiz_data_explorer_part3_final_vw.card_title: Card Title (Quiz)
      u2_quiz_data_explorer_part3_final_vw.user_full_name: Attempted By
      u2_quiz_data_explorer_part3_final_vw.total_correct: Correct Answers
      u2_quiz_data_explorer_part3_final_vw.result: Result (Passed/Failed)
    series_cell_visualizations:
      u2_quiz_data_explorer_part3_final_vw.total_questions:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    defaults_version: 1
    series_types: {}
    series_column_widths:
      u2_quiz_data_explorer_part3_final_vw.total_questions: 116
      u2_quiz_data_explorer_part3_final_vw.quiz_passing_criteria: 143
      u2_quiz_data_explorer_part3_final_vw.total_quiz_attempts: 112
      u2_quiz_data_explorer_part3_final_vw.total_correct: 120
    hidden_fields: [u2_quiz_data_explorer_part3_final_vw.quiz_option_is_correct]
    listen: {}
    row: 2
    col: 12
    width: 12
    height: 11
  - name: MultiQuiz Card - Overview
    title: MultiQuiz Card - Overview
    model: gcp_concord_dawn_qa
    explore: u2_quiz_data_explorer_part3_final_vw
    type: looker_grid
    fields: [u2_quiz_data_explorer_part3_final_vw.card_title, u2_quiz_data_explorer_part3_final_vw.total_questions,
      u2_quiz_data_explorer_part3_final_vw.quiz_reanswerable, u2_quiz_data_explorer_part3_final_vw.Total_attempts,
      u2_quiz_data_explorer_part3_final_vw.card_id, u2_quiz_data_explorer_part3_final_vw.Total_unique_attempts,
      u2_quiz_data_explorer_part3_final_vw.quiz_passing_criteria, u2_quiz_data_explorer_part3_final_vw.users_passed,
      u2_quiz_data_explorer_part3_final_vw.users_failed]
    filters:
      u2_quiz_data_explorer_part3_final_vw.card_title: ''
    sorts: [u2_quiz_data_explorer_part3_final_vw.card_title]
    limit: 500
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
    column_order: ["$$$_row_numbers_$$$", u2_quiz_data_explorer_part3_final_vw.card_title,
      u2_quiz_data_explorer_part3_final_vw.total_questions, u2_quiz_data_explorer_part3_final_vw.quiz_reanswerable,
      u2_quiz_data_explorer_part3_final_vw.quiz_passing_criteria, u2_quiz_data_explorer_part3_final_vw.Total_attempts,
      u2_quiz_data_explorer_part3_final_vw.Total_unique_attempts, u2_quiz_data_explorer_part3_final_vw.users_passed,
      u2_quiz_data_explorer_part3_final_vw.users_failed, u2_quiz_data_explorer_part3_final_vw.card_id]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      u2_quiz_data_explorer_part3_final_vw.card_title: Card Title (Quiz)
      u2_quiz_data_explorer_part3_final_vw.quiz_reanswerable: Resubmission Allowed
        (Y/N)
      u2_quiz_data_explorer_part3_final_vw.quiz_passing_criteria: Passing Criteria
    series_column_widths:
      u2_quiz_data_explorer_part3_final_vw.quiz_reanswerable: 205
      u2_quiz_data_explorer_part3_final_vw.quiz_passing_criteria: 145
      u2_quiz_data_explorer_part3_final_vw.card_title: 194
    series_cell_visualizations:
      u2_quiz_data_explorer_part3_final_vw.total_questions:
        is_active: false
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
    listen: {}
    row: 2
    col: 0
    width: 12
    height: 11
  - title: MultiQuiz Card - Report
    name: MultiQuiz Card - Report
    model: gcp_concord_dawn_qa
    explore: u2_quiz_data_explorer_part3_final_vw
    type: looker_grid
    fields: [u2_quiz_data_explorer_part3_final_vw.card_title, u2_quiz_data_explorer_part3_final_vw.quiz_question_label,
      u2_quiz_data_explorer_part3_final_vw.card_id, u2_quiz_data_explorer_part3_final_vw.Total_unique_attempts,
      u2_quiz_data_explorer_part3_final_vw.total_correct, u2_quiz_data_explorer_part3_final_vw.total_incorrect]
    sorts: [u2_quiz_data_explorer_part3_final_vw.card_title]
    limit: 500
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
    series_labels:
      u2_quiz_data_explorer_part3_final_vw.quiz_question_label: Quiz Question
      u2_quiz_data_explorer_part3_final_vw.Total_unique_attempts: Total Quiz Question
        Attempts
      u2_quiz_data_explorer_part3_final_vw.card_title: Card Title (Quiz)
    series_cell_visualizations:
      u2_quiz_data_explorer_part3_final_vw.Total_attempts:
        is_active: false
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", u2_quiz_data_explorer_part3_final_vw.card_title,
      u2_quiz_data_explorer_part3_final_vw.quiz_question_label, u2_quiz_data_explorer_part3_final_vw.Total_unique_attempts,
      u2_quiz_data_explorer_part3_final_vw.total_correct, u2_quiz_data_explorer_part3_final_vw.total_incorrect,
      u2_quiz_data_explorer_part3_final_vw.card_id]
    series_column_widths:
      u2_quiz_data_explorer_part3_final_vw.Total_unique_attempts: 112
      u2_quiz_data_explorer_part3_final_vw.total_correct: 109
      u2_quiz_data_explorer_part3_final_vw.total_incorrect: 137
      u2_quiz_data_explorer_part3_final_vw.quiz_question_label: 504
      u2_quiz_data_explorer_part3_final_vw.card_title: 536
    listen: {}
    row: 13
    col: 0
    width: 12
    height: 12
  - title: Live Events - Report
    name: Live Events - Report
    model: gcp_concord_dawn_qa
    explore: u1_users_live_event_cards_vw
    type: looker_grid
    fields: [u1_users_live_event_cards_vw.card_title, u1_users_live_event_cards_vw.card_author_full_name,
      u1_users_live_event_cards_vw.training_start_date, u1_users_live_event_cards_vw.training_end_date,
      u1_users_live_event_cards_vw.time_zone, u1_users_live_event_cards_vw.user_full_name,
      u1_users_live_event_cards_vw.email, u1_users_live_event_cards_vw.training_registration_state,
      u1_users_live_event_cards_vw.registration_type, u1_users_live_event_cards_vw.registration_limit,
      u1_users_live_event_cards_vw.last_registration_date]
    filters:
      u1_users_live_event_cards_vw.training_registration_state: "-NULL"
      u1_users_live_event_cards_vw.card_title: ''
      u1_users_live_event_cards_vw.user_full_name: ''
    sorts: [u1_users_live_event_cards_vw.last_registration_date desc]
    limit: 500
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
      u1_users_live_event_cards_vw.card_title: Card Title (Live Events)
      u1_users_live_event_cards_vw.card_author_full_name: Author Name
      u1_users_live_event_cards_vw.training_start_date: Start Date
      u1_users_live_event_cards_vw.training_end_date: End Date
      u1_users_live_event_cards_vw.user_full_name: User Name
      u1_users_live_event_cards_vw.training_registration_state: Registration State
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 41
    col: 12
    width: 12
    height: 10
  - title: Poll Responses[OverView]
    name: Poll Responses[OverView]
    model: gcp_concord_dawn_qa
    explore: u2_users_quiz_and_poll_responses_vw
    type: looker_grid
    fields: [u2_users_quiz_and_poll_responses_vw.card_id, u2_users_quiz_and_poll_responses_vw.card_title,
      u2_users_quiz_and_poll_responses_vw.count]
    filters:
      u2_users_quiz_and_poll_responses_vw.card_id: ''
      u2_users_quiz_and_poll_responses_vw.card_title: "-NULL"
      u2_users_quiz_and_poll_responses_vw.card_type: Poll
    sorts: [u2_users_quiz_and_poll_responses_vw.count desc 0]
    limit: 500
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
    series_labels:
      u2_users_quiz_and_poll_responses_vw.count: Total Responses
    series_column_widths:
      u2_users_quiz_and_poll_responses_vw.card_id: 89
      u2_users_quiz_and_poll_responses_vw.card_title: 617
    series_cell_visualizations:
      u2_users_quiz_and_poll_responses_vw.count:
        is_active: false
    defaults_version: 1
    listen: {}
    row: 66
    col: 0
    width: 24
    height: 11
  - title: Project Cards (Overview)
    name: Project Cards (Overview)
    model: gcp_concord_dawn_qa
    explore: u1_users_project_cards_vw
    type: looker_grid
    fields: [u1_users_project_cards_vw.card_title, u1_users_project_cards_vw.card_author_full_name,
      u1_users_project_cards_vw.grade_range, u1_users_project_cards_vw.grader_type,
      u1_users_project_cards_vw.submitter_type, u1_users_project_cards_vw.card_id,
      u1_users_project_cards_vw.total_graded, u1_users_project_cards_vw.total_submitted]
    sorts: [u1_users_project_cards_vw.card_title]
    limit: 500
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
    column_order: ["$$$_row_numbers_$$$", u1_users_project_cards_vw.card_title, u1_users_project_cards_vw.card_author_full_name,
      u1_users_project_cards_vw.grade_range, u1_users_project_cards_vw.grader_type,
      u1_users_project_cards_vw.submitter_type, u1_users_project_cards_vw.total_graded,
      u1_users_project_cards_vw.total_submitted, u1_users_project_cards_vw.card_id]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      u1_users_project_cards_vw.card_author_full_name: Author Name
      u1_users_project_cards_vw.card_title: Card Title (Project)
      u1_users_project_cards_vw.card_id: Project ID
      u1_users_project_cards_vw.grade_range: Grading Scale
      u1_users_project_cards_vw.grader_type: Graded By
    series_column_widths:
      u1_users_project_cards_vw.total_graded: 129
      u1_users_project_cards_vw.total_submitted: 128
      u1_users_project_cards_vw.submitter_type: 128
      u1_users_project_cards_vw.grader_type: 107
      u1_users_project_cards_vw.grade_range: 106
      u1_users_project_cards_vw.card_title: 543
    series_cell_visualizations:
      u1_users_project_cards_vw.total_graded:
        is_active: false
    defaults_version: 1
    listen: {}
    row: 27
    col: 0
    width: 12
    height: 12
