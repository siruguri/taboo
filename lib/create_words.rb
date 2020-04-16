['michael jackson', 'albert einstein', 'shakespeare', 'Johnny Depp', 'Abraham Lincoln', 'Stephen Hawkins', 'Harriet Tubman', 'Madonna', 'Patrick Stewart', 'Marie Curie', 'Jennifer Aniston', 'Pablo Picasso', 'Johnny Depp', 'beyonce', 'cheech and chong', 'bart simpson', 'james bond'] .each do |w|
  Word.find_or_create_by label: w
end
