Given 'I am "$name"' do |name|
  Gaskit.repo.config['user.name'] = name
end