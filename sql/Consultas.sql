-- 1. vehiculos disponibles 
SELECT * FROM vehiculo 
WHERE id_vehiculo NOT IN (SELECT id_vehiculo FROM Venta);

-- 2. Ventas con datos de cliente y coche
SELECT v.id_venta, v.fecha, v.total, 
       c.nombre AS cliente, veh.marca, veh.modelo
FROM Venta v
JOIN Cliente c ON v.id_cliente = c.id_cliente
JOIN vehiculo veh ON veh.id_vehiculo = veh.id_vehiculo;

-- 3. Citas pendientes con mecánico y coche
SELECT ct.fecha, ct.hora, ct.descripcion, m.nombre AS mecanico, veh.matricula
FROM CitaTaller ct
JOIN Mecanico m ON ct.id_mecanico = m.id_mecanico
JOIN vehiculo veh ON ct.id_vehiculo = veh.id_vehiculo 
ORDER BY ct.fecha;

-- 4. Coches o motos disponibles
SELECT COUNT(*) AS total_coches FROM vehiculo WHERE tipo='coche';
SELECT COUNT(*) AS total_motos FROM vehiculo WHERE tipo='moto';

