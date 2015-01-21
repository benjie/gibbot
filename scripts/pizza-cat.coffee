# Description:
#   Pizza Cat!
#
# Commands:
#   hubot pizza cat me - Get a random Pizza Cat image
#   hubot pizza cat bomb N - Get N Pizza Cats

module.exports = (robot) ->
  require('./helpers/me-static')(robot, 'pizza cat', [
    'http://24.media.tumblr.com/34534d89e130c539dfc143ca87e0fa1b/tumblr_muo4fciS9z1sqr3ymo1_500.gif'
    'http://collegecandy.files.wordpress.com/2013/09/pizza-cat.gif'
    'http://31.media.tumblr.com/tumblr_lz0omuWhkz1rno5r3o1_500.gif'
    'http://1.bp.blogspot.com/-FZZKBHSF2mQ/UnHuErtd_LI/AAAAAAAAUHc/mg6s1p9PYjo/s1600/ee1baad10e318153996b6948d6bda00a.gif'
    'http://31.media.tumblr.com/6b9e41d937044b881d77475ee69f9899/tumblr_n1o5r8dcnc1tn74x3o1_1280.gif'
    'http://cdn4.thatsnerdalicious.com/wp-content/uploads/2013/08/taco-pizza-cat.gif'
    'http://24.media.tumblr.com/07a25b1a9b417d31ba2bb1543319c25a/tumblr_mmsvmrsMLL1r4xjo2o1_500.gif'
    'http://24.media.tumblr.com/2c07c6dd0db42f989bf47b741cb4516f/tumblr_msxw68bnA21r4xjo2o1_250.gif'
    'http://2.bp.blogspot.com/-WYlfno03t3o/UnHt60Z8Q9I/AAAAAAAAUHU/P4SdzV4_rWQ/s1600/pizzadjcat.gif'
    'http://www.pugmob.com/kpug/wp-content/uploads/2013/10/pizzacat.gif'
    'http://media2.giphy.com/media/bWrQToQINH3UI/giphy.gif'
    'http://cdn.gifbay.com/2012/12/cat_check_pizza_check_laser_eyes_check-19171.gif'
  ])
