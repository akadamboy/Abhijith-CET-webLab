CREATE DEFINER=`root`@`localhost` TRIGGER `shop`.`update_available_quantity` AFTER INSERT ON `sale_item` FOR EACH ROW
BEGIN

update product set product.quantity_in_stock = product.quantity_in_stock - new.quantity
where product.product_id = new.product_id;

END