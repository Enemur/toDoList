require 'yaml'
config = YAML::load_file('db/seeds/seeds.yml')

config['projects'].each do |project|
  pr = Project.create(title: project['title'])

  project['todos'].each do |item|
    pr.to_dos.create(text: item['text'], isCompleted: item['isCompleted'])
    end
end