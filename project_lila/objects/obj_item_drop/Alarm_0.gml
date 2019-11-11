itemsprite = sprite_duplicate(asset_get_index(ds_map_find_value(global.itemData[| itemid],"sprite")));
sprite_set_offset(itemsprite,32,32);
sprite_index = itemsprite;
mask_index = spr_empty;
image_xscale = 0.5;
image_yscale = 0.5;