::db
mysql -uroot -pA1234567a < create_db.sql
::delete all_file.sql
del /F /Q all_files.sql
::user_info
type user_info.sql >> all_files.sql
::????SQL
type user_friend.sql >> all_files.sql
::user_group
type user_group.sql >> all_files.sql
::sys_dict
type sys_dict.sql >> all_files.sql
::???SQL
type user_photo_group.sql >> all_files.sql
::user_photo
type user_photo.sql >> all_files.sql
::user_email
type user_email.sql >> all_files.sql
::user_blog
type user_blog.sql >> all_files.sql
::blog_comment
type blog_comment.sql>> all_files.sql
::user_message
type user_message.sql >> all_files.sql
:: update2016-08-07
type update2016-08-07.sql >> all_files.sql
::execute
mysql -uroot -pA1234567a social_work < all_files.sql
