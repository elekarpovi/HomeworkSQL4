USE lesson4;

/*Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.*/
SELECT  count(*) AS likes
FROM likes
JOIN media ON likes.media_id = media.id
WHERE media.user_id in 
(SELECT user_id FROM profiles WHERE DATE(birthday) > "2011-08-22");

/*Определить кто больше поставил лайков (всего): мужчины или женщины.*/
SELECT gender, count(*) as likes 
FROM ( SELECT user_id, (SELECT gender FROM profiles WHERE profiles.user_id = likes.user_id) as gender 
FROM likes) as likes
GROUP BY gender;

/*Вывести всех пользователей, которые не отправляли сообщения*/
SELECT firstname, lastname FROM users
WHERE id NOT IN (SELECT distinct from_user_id  FROM messages);