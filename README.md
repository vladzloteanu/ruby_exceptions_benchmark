## Ruby exceptions benchmark

Quick'n'dirty benchmark of ruby's exceptions mechanisms

1. Syntetic case (`if` vs 'raise'/'rescue' vs 'throw/catch')

2. Real-world case ('model.save' vs 'model.save!')


### Run benchmark

    bundle install
    rake db:create && rake db:migrate
    bundle exec ./script/benchmark_ruby_exceptions.rb

### Results

    Rehearsal -----------------------------------------------
    if            0.000000   0.000000   0.000000 (  0.000170)
    exception     0.010000   0.000000   0.010000 (  0.043268)
    catch/twrow   0.000000   0.000000   0.000000 (  0.001549)
    -------------------------------------- total: 0.010000sec

                      user     system      total        real
    if            0.000000   0.000000   0.000000 (  0.000192)
    exception     0.010000   0.000000   0.010000 (  0.009678)
    catch/twrow   0.000000   0.000000   0.000000 (  0.001449)


    Rehearsal ------------------------------------------------------
    ActiveRecord#save    1.030000   0.090000   1.120000 (  1.193164)
    ActiveRecord#save!   1.450000   0.100000   1.550000 (  1.636631)
    --------------------------------------------- total: 2.670000sec

                             user     system      total        real
    ActiveRecord#save    0.990000   0.080000   1.070000 (  1.139592)
    ActiveRecord#save!   1.450000   0.100000   1.550000 (  1.643734)
