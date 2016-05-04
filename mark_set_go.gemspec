Gem::Specification.new do |s|
  s.name        = 'mark_set_go'
  s.version     = '0.0.1'
  s.date        = '2016-05-04'
  s.summary     = 'Mark, Set, Go!'
  s.description = 'Literate programming in Golang'
  s.authors     = ['Alice Pote']
  s.email       = 'alice.writes.wrongs@gmail.com'
  s.files       = [
    'lib/mark_set_go.rb',
    'lib/mark_set_go/comment.rb',
    'lib/mark_set_go/code.rb',
    'lib/mark_set_go/document.rb'
  ]
  s.executables << 'mark_set_go'
  s.license     = 'GPLv3'
end
