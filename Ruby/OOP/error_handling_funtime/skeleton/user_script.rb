require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"
puts "'five' == #{convert_to_int('05')}"

feed_me_a_fruit

sam = BestFriend.new('Satu', 5, 'chemistry')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
