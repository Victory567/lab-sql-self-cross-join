select f.film_id, fa1.actor_id, fa2.actor_id, concat(a1.first_name," ", a1.last_name), concat(a2.first_name," ", a2.last_name)
from film f
    inner join film_actor fa1
    on f.film_id=fa1.film_id
    
    inner join actor a1
    on fa1.actor_id=a1.actor_id
    
    inner join film_actor fa2
    on f.film_id=fa2.film_id
    
    inner join actor a2
    on fa2.actor_id=a2.actor_id   
where f.film_id = 82;


SELECT o1.customer_id AS CustomerID1,
       o2.customer_id AS CustomerID2,
       COUNT(*) NoOfOverlappingMovies
FROM( (SELECT c.customer_id, f.film_id
        FROM customer AS c
        JOIN rental AS r ON r.customer_id = c.customer_id
        JOIN inventory AS i ON i.inventory_id = r.inventory_id
        JOIN film AS f ON i.film_id = f.film_id
        ) AS o1
        JOIN (SELECT c.customer_id, f.film_id
                FROM customer AS c
                JOIN rental AS r ON r.customer_id = c.customer_id
                JOIN inventory AS i ON i.inventory_id = r.inventory_id
                JOIN film AS f ON i.film_id = f.film_id
    ) AS o2 ON o2.film_id = o1.film_id AND o2.customer_id < o1.customer_id )
GROUP BY o1.customer_id, o2.customer_id
ORDER BY COUNT(*) DESC;

