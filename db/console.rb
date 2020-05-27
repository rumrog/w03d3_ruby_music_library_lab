require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('sql_runner')


SqlRunner.run "SELECT * FROM album"
