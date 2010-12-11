set +xe
echo ". ~/.rvm/scripts/rvm"
set -x

rvm use `rake -sf $PWD/ci/init.rakefile get_rvm_version`
rvm_gemset_create_on_use_flag=1 && rvm gemset use sunspot-sequel

set -e
