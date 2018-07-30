# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ジャンル
Category.create(name: 'Rock')
Category.create(name: 'Jpop')
Category.create(name: 'Hardrock/Metal')
Category.create(name: 'Pops')
Category.create(name: 'HipHop/R&B')
Category.create(name: 'Dance/Electronic')
Category.create(name: 'Jazz')
Category.create(name: 'World')
Category.create(name: 'Classical')
Category.create(name: 'Anime/Game/Soundtrack')
Category.create(name: 'Idol')

# 商品
# 下記、記述うまく画像データアップロードできず
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id: open("#{Rails.root}/images/meteora.jpg"), price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')
# Product.create(album_title: 'Meteora', artist: 'Linkin Park', label: 'ワーナー・ブラザーズ・レコード', category_id: '1', favorite_count: '0', image_id:'meteora.jpg', price: '1700', stock: '50', release_year:'2003')


# ディスク
#Disc.create(product_id: '1', disc_number: '1')
# シングル／アルバム内の曲
# Music.create(disc_id: '1', track_number:'1', name: 'Forward', bpm: '90', duration: '0:13')
# Music.create(disc_id: '1', track_number:'2', name: 'Faint', bpm: '120', duration: '2:42')
# Music.create(disc_id: '1', track_number:'3', name: 'Breaking the habbit', bpm: '160', duration: '2:42')

# ユーザー
# User.create(email:'takizawa.webcamp@gmail.com', encrypted_password: '000000', reset_password_token:'', reset_password_sent_at: '', remember_created_at: '', sign_in_count:'0', current_sign_in_at:'', last_sign_in_at:'', current_sign_in_ip:'', last_sign_in_ip:'', first_name:'滝澤', last_name:'惇', kana_first:'タキザワ',kana_last:'ジュン', postal_code:'123-4567', prefecture:'1', city:'東京都府中市', address1:'3-16-5', address2:'アパート府中', phone_number:'080-0000-0000')
# User.create(email:'takizawa2.webcamp@gmail.com', encrypted_password: '000000', reset_password_token:'', reset_password_sent_at: '', remember_created_at: '', sign_in_count:'0', current_sign_in_at:'', last_sign_in_at:'', current_sign_in_ip:'', last_sign_in_ip:'', first_name:'滝澤2', last_name:'惇', kana_first:'タキザワ',kana_last:'ジュン', postal_code:'123-4567', prefecture:'2', city:'2東京都府中市', address1:'23-16-5', address2:'アパート府中2', phone_number:'280-0000-0000')
# User.create(email:'takizawa3.webcamp@gmail.com', encrypted_password: '000000', reset_password_token:'', reset_password_sent_at: '', remember_created_at: '', sign_in_count:'0', current_sign_in_at:'', last_sign_in_at:'', current_sign_in_ip:'', last_sign_in_ip:'', first_name:'滝澤3', last_name:'惇', kana_first:'タキザワ',kana_last:'ジュン', postal_code:'123-4567', prefecture:'3', city:'3東京都府中市', address1:'33-16-5', address2:'アパート府中3', phone_number:'380-0000-0000')
# User.create(email:'takizawa4.webcamp@gmail.com', encrypted_password: '000000', reset_password_token:'', reset_password_sent_at: '', remember_created_at: '', sign_in_count:'0', current_sign_in_at:'', last_sign_in_at:'', current_sign_in_ip:'', last_sign_in_ip:'', first_name:'滝澤4', last_name:'惇', kana_first:'タキザワ',kana_last:'ジュン', postal_code:'123-4567', prefecture:'4', city:'4東京都府中市', address1:'43-16-5', address2:'アパート府中4', phone_number:'480-0000-0000')
# User.create(email:'takizawa5.webcamp@gmail.com', encrypted_password: '000000', reset_password_token:'', reset_password_sent_at: '', remember_created_at: '', sign_in_count:'0', current_sign_in_at:'', last_sign_in_at:'', current_sign_in_ip:'', last_sign_in_ip:'', first_name:'滝澤5', last_name:'惇', kana_first:'タキザワ',kana_last:'ジュン', postal_code:'123-4567', prefecture:'5', city:'5東京都府中市', address1:'53-16-5', address2:'アパート府中5', phone_number:'580-0000-0000')

#オーダー
# Order.create(id: 1, user_id: 1, address_id: 1, total: 3980, payment: 3, status: 1, created_at: "2018-07-14 12:22:22", updated_at: "2018-07-14 13:22:22")
# Order.create(id: 2, user_id: 1, address_id: 1, total: 3980, payment: 3, status: 1, created_at: "2018-07-15 12:22:22", updated_at: "2018-07-15 13:22:22")
# Order.create(id: 3, user_id: 1, address_id: 1, total: 3980, payment: 3, status: 1, created_at: "2018-07-16 12:22:22", updated_at: "2018-07-16 13:22:22")

#オーダーアイテム
# OrderItem.create!(order_id: 1, product_id: 3, price: 3980, quantity: 1, created_at: "2018-07-14 12:22:22", updated_at: "2018-07-14 13:22:22")
# OrderItem.create(order_id: 2, product_id: 3, price: 3980, quantity: 1, created_at: "2018-07-15 12:22:22", updated_at: "2018-07-15 13:22:22")
# OrderItem.create(order_id: 3, product_id: 3, price: 3980, quantity: 1, created_at: "2018-07-16 12:22:22", updated_at: "2018-07-16 13:22:22")