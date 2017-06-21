alias be='bundle exec'

eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias fuck)"

alias vi="vim"

alias staging1='ssh -i ~/.ssh/infra-staging.pem ec2-user@54.164.88.147'
alias staging2='ssh -i ~/.ssh/infra-staging.pem ec2-user@54.88.231.182'
alias devmachine='ssh -i ~/.ssh/infra-staging.pem ec2-user@34.201.219.199'
alias weather='curl -s http://wttr.in/$(curl -s http://ipinfo.io/city)\?1m |head -17'

