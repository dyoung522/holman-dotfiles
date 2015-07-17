# Rails shortcuts
alias sc='bin/rails console'
alias sg='bin/rails generate'
alias sd='bin/rails destroy'
alias be='bundle exec'
alias br='bundle exec rake'
alias migrate='rake db:migrate db:test:clone'
alias railsnew="rails new . -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb -T"
alias bforeman="bundle exec foreman start -f Procfile.local"
alias tforeman="\$(rbenv which foreman) start -f Procfile.local"
