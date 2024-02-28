use `warehouse`;

START TRANSACTION;

INSERT INTO `departments` (`name`) VALUES 
('Marketing'),
('Sales'),
('Engineering'),
('Customer Service'),
('Accounting');

INSERT INTO `permissions` (`name`) VALUES 
('read'),
('write'),
('delete'),
('execute'),
('admin');

INSERT INTO `requests_status` (`name`) VALUES 
('Pending'),
('Approved'),
('Rejected'),
('Cancelled');

INSERT INTO `roles` (`name`) VALUES 
('Admin'),
('Manager'),
('Employee'),
('Intern');

INSERT INTO `suppliers` (`name`, `phone`, `address`, `cnpj`) VALUES 
('Supplier A', '(11) 1234-5678', 'Rua A, 123', '12345678901234'),
('Supplier B', '(11) 9876-5432', 'Rua B, 456', '09876543210987'),
('Supplier C', '(11) 5555-5555', 'Rua C, 789', '11111111111111'),
('Supplier D', '(11) 9999-9999', 'Rua D, 1010', '22222222222222');

INSERT INTO `users` (`username`, `password`) VALUES
('joao.silva', 'qwerty123'),
('maria.souza', '123456abc'),
('pedro.rocha', 'senha123');

INSERT INTO `contact` (`user_id`, `message`, `created_at`, `updated_at`,`status`) VALUES
(1, 'Olá, gostaria de saber mais sobre o produto X', now(), now(),'unseen'),
(2, 'Preciso de ajuda para acessar minha conta', now(), now(),'seen'),
(3, 'Tenho uma sugestão para melhorar o site', now(), now(),'unseen');

INSERT INTO `employees` (`name`, `email`, `cpf`, `department_id`, `hire_date`) VALUES
('Fernando Santos', 'fernando.santos@gmail.com', '123.456.789-00', 1, '2020-01-01'),
('Ana Maria', 'ana.maria@hotmail.com', '987.654.321-00', 2, '2018-05-10'),
('Bruno Alves', 'bruno.alves@yahoo.com', '111.222.333-44', 1, '2021-03-15'),
('Caio Castro', 'caio.castro@yahoo.com', '111.222.333-44', 1, '2021-03-15');

INSERT INTO `equipment` (`patrimony_number`, `name`, `allocated_to`, `allocated_by`, `allocated_at`, `status`) VALUES
('EQUIP001', 'Laptop', 'John Doe', 1, '2021-01-01 08:00:00', 'allocated'),
('EQUIP002', 'Printer', 'Jane Doe', 2, '2021-05-05 10:30:00', 'allocated'),
('EQUIP003', 'Tablet', 'Bob Smith', 3, '2021-02-15 12:45:00', 'allocated'),
('EQUIP004', 'Projector', 'Alice Brown', 4, '2021-10-10 14:00:00', 'allocated');

INSERT INTO `equipment_allocation` (`equipment_id`, `allocated_to`, `allocated_by`, `allocation_date`, `return_date`) VALUES
(1, 'John Doe', 1, '2021-01-01', '2021-01-31'),
(2, 'Jane Doe', 2, '2021-05-05', '2021-06-30'),
(3, 'Bob Smith', 3, '2021-02-15', '2021-03-31'),
(4, 'Alice Brown', 4, '2021-10-10', '2021-10-31');

INSERT INTO `maintenance` (`equipment_id`, `date`, `description`) VALUES
(1, '2022-01-01', 'Troca de óleo'),
(2, '2022-01-02', 'Substituição de peça'),
(3, '2022-01-03', 'Limpeza geral');

INSERT INTO problem_report (`employee_id`, `report_date`, `problem_description`) VALUES
(1, '2022-01-01', 'Equipamento com mau funcionamento'),
(2, '2022-01-02', 'Equipamento apresentando ruídos'),
(3, '2022-01-03', 'Equipamento com vazamento de óleo');

INSERT INTO `products` (`name`, `price`, `supplier_id`) VALUES 
('Product 1', 10.50, 1),
('Product 2', 15.25, 2),
('Product 3', 20.00, 3),
('Product 4', 7.99, 1),
('Product 5', 12.00, 3);

INSERT INTO `purchases` (`product_id`, `supplier_id`, `employee_id`, `value`, `date`) VALUES 
(1, 1, 1, 100.00, '2022-04-01'),
(2, 2, 2, 200.00, '2022-04-02'),
(3, 3, 3, 150.00, '2022-04-03'),
(4, 1, 4, 80.00, '2022-04-04'),
(5, 3, 2, 240.00, '2022-04-05');

INSERT INTO `requests` (`employee_id`, `request_date`, `material`, `quantity`, `reason`, `status_id`) VALUES 
(1, '2022-04-01', 'Material 1', 100, 'Reason 1', 1),
(2, '2022-04-02', 'Material 2', 200, 'Reason 2', 2),
(3, '2022-04-03', 'Material 3', 150, 'Reason 3', 3),
(4, '2022-04-04', 'Material 4', 80, 'Reason 4', 1);

INSERT INTO `stock` (`product_id`, `quantity`, `min_quantity`, `max_quantity`)VALUES 
(1, 100, 10, 200),
(2, 50, 5, 100),
(3, 200, 20, 400),
(4, 150, 15, 300),
(5, 75, 7, 150);

INSERT INTO `user_permissions` (`user_id`, `permission_id`) VALUES 
(1, 1),
(1, 2),
(2, 2),
(3, 3);

INSERT INTO `employee_roles` (`employee_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2);

INSERT INTO `orders` (`purchase_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 5, 10.50),
(1, 2, 10, 20.00),
(2, 3, 8, 15.75),
(3, 4, 3, 35.25),
(4, 5, 6, 8.99);

COMMIT;