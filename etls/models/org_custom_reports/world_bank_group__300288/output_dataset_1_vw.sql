-- output_dataset_1
-- output_dataset_1_vw

select DISTINCT card_title, card_resource_url, card_type, card_subtype, card_author_full_name, card_id, card_state, 
from {{ref('c1_content_latest_metadata_vw')}}