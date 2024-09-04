CREATE FUNCTION haversine_distance(lat1 DOUBLE, lon1 DOUBLE, lat2 DOUBLE, lon2 DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE r DOUBLE DEFAULT 6371;
    DECLARE dlat DOUBLE;
    DECLARE dlon DOUBLE;
    DECLARE a DOUBLE;
    DECLARE c DOUBLE;
    DECLARE d DOUBLE;

    SET dlat = RADIANS(lat2 - lat1);
    SET dlon = RADIANS(lon2 - lon1);
    SET a = SIN(dlat / 2) * SIN(dlat / 2) + COS(RADIANS(lat1)) * COS(RADIANS(lat2)) * SIN(dlon / 2) * SIN(dlon / 2);
    SET c = 2 * ATAN2(SQRT(a), SQRT(1 - a));
    SET d = r * c;

    RETURN d;
END
