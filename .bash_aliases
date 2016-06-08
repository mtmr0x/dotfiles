alias be='bundle exec'
alias production_console="heroku run rails console --app worldpackersplatform"
alias staging_console="heroku run rails console --app staging-worldpackersplatform"

alias production_migrate="heroku run rake db:migrate --app worldpackersplatform"
alias staging_migrate="heroku run rake db:migrate --app staging-worldpackersplatform"

alias production_reindex="heroku run rake sunspot:soft_reindex --app worldpackersplatform"
alias staging_reindex="heroku run rake sunspot:soft_reindex --app staging-worldpackersplatform"

alias staging_worker="heroku run:detached rake jobs:work --app staging-worldpackersplatform"

alias staging_log='heroku logs -t --app staging-worldpackersplatform'

eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias fuck)"

