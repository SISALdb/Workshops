library(neotoma2)

speleothems <- function(samples){
  # Get all speleothem samples
  entities <- get_table('speleothems', limit = 5000)
  en_join <- get_table('speleothemcollectionunit', limit = 5000)
  
  allSamp <- samples %>% mutate(collunitid = as.integer(collunitid))
  
  samp_w_entity <- allSamp %>%
    left_join(en_join, by = join_by(collunitid == collectionunitid)) %>%
    left_join(entities, by = join_by(entityid == entityid))
  
  return(samp_w_entity)
}
