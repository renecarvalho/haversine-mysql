SELECT nome_loja, 
       latitude, 
       longitude, 
       haversine_distance(-21.223, -47.820, latitude, longitude) AS distancia_km
FROM lojas
HAVING distancia_km <= 5
ORDER BY distancia_km ASC;

/* voce tambem pode usar com WHERE no lugar do HAVING e também usar sem clausula de filtro e trabalhar com LIMIT  */
