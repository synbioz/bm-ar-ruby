require 'yaml'
require 'active_record'

$:.unshift '..'

DB_YML_PATH = 'config/database.yml'

if File.exists?(DB_YML_PATH)
  ActiveRecord::Base.establish_connection(YAML.load(File.open(DB_YML_PATH)))
else
  $stderr.puts 'meh.'
end
