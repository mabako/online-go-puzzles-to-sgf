require_relative 'puzzle'

raise ArgumentError, 'Missing ID of the puzzle to check' if ARGV.length == 0
collection_id = ARGV[0].to_i
raise ArgumentError, 'not a numeric puzzle id' if collection_id.nil?

Dir.mkdir(collection_id.to_s) unless Dir.exist?(collection_id.to_s)
Dir.chdir(collection_id.to_s)

puzzles = Puzzle.collection_summary(collection_id)
puzzles.each_with_index { |puzzle, index|
  Puzzle.from_url(puzzle['id']).save("#{index+1}.sgf")
  print '.'
}
