['michael jackson', 'albert einstein', 'shakespeare', 'abraham lincoln']
  .each do |w|
  Word.find_or_create_by label: w
end
