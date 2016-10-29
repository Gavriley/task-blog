# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

count = 1
200.times { count += 1; Post.create(created_at: Time.now + count, title: 'Lorem ipsum dolor sit amet, consectetur adipisicing', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, culpa, tempore quasi non deserunt error, molestias illum ex ipsam repellat id atque delectus! Optio, qui, suscipit? Cupiditate recusandae maxime quas, impedit aperiam natus, saepe ipsam. Eos cum qui libero quo, accusamus assumenda eum soluta totam repudiandae, quas, corrupti odio recusandae explicabo quisquam. Blanditiis omnis distinctio corporis ex illum eaque laudantium vitae, nulla maiores quos, quas odit odio quaerat minima qui, autem cum porro et aut sapiente dignissimos harum. Molestiae, totam similique quibusdam. Repudiandae illo, recusandae quos, fugit amet asperiores voluptas obcaecati et culpa nesciunt eius, itaque non beatae eveniet aut placeat incidunt nemo eligendi aliquid! Tempora minus, nulla aliquid quos quo non in, fuga facilis impedit pariatur neque repudiandae error aliquam eveniet odio, amet maxime a optio quibusdam doloremque est quasi necessitatibus atque. Deserunt facere commodi nostrum labore totam quis ex minus facilis illum. Hic cum, ut esse quos itaque exercitationem suscipit id adipisci atque error est ullam harum iste incidunt repudiandae sunt ea laboriosam. Natus impedit quidem reprehenderit, numquam est praesentium at deleniti. Deleniti, ratione. Cupiditate, quia cum tempora consectetur molestiae atque, maxime reiciendis quis fugit eveniet reprehenderit neque accusamus dolores sapiente inventore blanditiis id harum laborum aspernatur explicabo. Maiores aspernatur eaque natus, odit consectetur rerum mollitia commodi adipisci odio deserunt ex cumque necessitatibus debitis laborum sed, ducimus ut, iusto fugit vitae? Voluptatibus quod, non quibusdam nemo hic quasi dolore aspernatur. Nesciunt asperiores, molestias quibusdam voluptate quaerat voluptas fugiat blanditiis doloribus iste excepturi recusandae corporis odit perferendis impedit consectetur quisquam natus incidunt ipsum repellendus veniam rerum tempora! Doloribus ex tenetur, eum iste. Hic, repellendus! Nihil quis reprehenderit velit. Earum ut ducimus, dolore nihil numquam esse aspernatur qui quia deleniti distinctio temporibus dolorum totam nesciunt quod facere vero, ex! Recusandae pariatur non eveniet expedita harum perferendis quas sed sequi nesciunt.') }

# Category.create([
# 	{name: 'Web-дизайн' },
# 	{name: 'Web-мастеринг' },
# 	{name: 'Сайтостроение' },
# 	{name: 'Компьютеры' },
# 	{name: 'Интернет' },
# 	{name: 'Литература' },
# 	{name: 'Кинематограф' },
# 	{name: 'Музыка' }
# ])

# newuser = User.create(login: 'kasumi', email: 'kasumi@gmail.com', name: 'Петро', password: 'qwerty', admin: true)
# newuser.skip_confirmation!
# newuser.save
# User.delete_all

# count = 58
# 10.times do
# 	newuser = User.new(login: "lorem#{count}", email: "kami#{count}@taskblog.if.ua", name: 'kami', password: 'qwerty')
# 	newuser.skip_confirmation!
# 	newuser.save!
# 	count += 1
# end

# User.all.each { |user| user.skip_confirmation!; user.save! }