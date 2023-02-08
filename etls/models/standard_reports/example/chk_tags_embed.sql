-- generate tags embed script
 -- {{get_tags_embed_query('')}}
{{get_tags_embed_query( get_db_source('cards_dim_m') , 'id' )}}
