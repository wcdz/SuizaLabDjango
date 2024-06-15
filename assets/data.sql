-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 04:01 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suizalab`
--

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tipos documentos', 7, 'add_tiposdocumentos'),
(26, 'Can change tipos documentos', 7, 'change_tiposdocumentos'),
(27, 'Can delete tipos documentos', 7, 'delete_tiposdocumentos'),
(28, 'Can view tipos documentos', 7, 'view_tiposdocumentos'),
(29, 'Can add numeros documentos', 8, 'add_numerosdocumentos'),
(30, 'Can change numeros documentos', 8, 'change_numerosdocumentos'),
(31, 'Can delete numeros documentos', 8, 'delete_numerosdocumentos'),
(32, 'Can view numeros documentos', 8, 'view_numerosdocumentos'),
(33, 'Can add citas', 9, 'add_citas'),
(34, 'Can change citas', 9, 'change_citas'),
(35, 'Can delete citas', 9, 'delete_citas'),
(36, 'Can view citas', 9, 'view_citas'),
(37, 'Can add tipos especialidades', 10, 'add_tiposespecialidades'),
(38, 'Can change tipos especialidades', 10, 'change_tiposespecialidades'),
(39, 'Can delete tipos especialidades', 10, 'delete_tiposespecialidades'),
(40, 'Can view tipos especialidades', 10, 'view_tiposespecialidades');

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$G4VSfXJxcUedGwQ2SMT99Z$V1Ol652yOQATt7YD/5Ax5rXpUbGgrhQqjrJCN1Vb1wI=', NULL, 1, 'wcdz', '', '', 'wcdz.dev@gmail.com', 1, 1, '2024-06-14 22:30:33.607399');

--
-- Dumping data for table `citas_citas`
--

INSERT INTO `citas_citas` (`id_cita`, `nombre_completo`, `fecha_registro`, `fecha_actualizacion`, `estado`, `id_numero_documento`, `id_tipo_especialidad`) VALUES
(2, 'Patito Feli332432z', '2024-06-15 00:46:44.440405', '2024-06-15 01:44:47.365302', 0, 11, 1),
(3, 'Patito Feliz', '2024-06-15 00:47:06.188114', '2024-06-15 00:47:06.188114', 1, 10, 1);

--
-- Dumping data for table `citas_numerosdocumentos`
--

INSERT INTO `citas_numerosdocumentos` (`id_numero_documento`, `numero_documento`, `id_tipo_documento`) VALUES
(1, '78767832', 1),
(2, '90876753', 1),
(10, '71520250', 1),
(11, '71520250', 2);

--
-- Dumping data for table `citas_tiposdocumentos`
--

INSERT INTO `citas_tiposdocumentos` (`id_tipo_documento`, `nombre_documento`, `num_digitos`) VALUES
(1, 'DNI', '8'),
(2, 'CARNET EXTRANJERIA', '12');

--
-- Dumping data for table `citas_tiposespecialidades`
--

INSERT INTO `citas_tiposespecialidades` (`id_tipo_especialidad`, `nombre_especialidad`) VALUES
(1, 'Cardiologia'),
(2, 'Ginecologia'),
(3, 'Gastroenterologia'),
(4, 'Neurologia'),
(5, 'Medicina General');

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'citas', 'citas'),
(8, 'citas', 'numerosdocumentos'),
(7, 'citas', 'tiposdocumentos'),
(10, 'citas', 'tiposespecialidades'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-14 22:28:16.952527'),
(2, 'auth', '0001_initial', '2024-06-14 22:28:17.716455'),
(3, 'admin', '0001_initial', '2024-06-14 22:28:17.944563'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-14 22:28:17.954613'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-14 22:28:17.970520'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-14 22:28:18.059782'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-14 22:28:18.124668'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-14 22:28:18.218665'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-14 22:28:18.234722'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-14 22:28:18.326819'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-14 22:28:18.330864'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-14 22:28:18.347056'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-14 22:28:18.372258'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-14 22:28:18.400450'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-14 22:28:18.485461'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-14 22:28:18.502630'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-14 22:28:18.530803'),
(18, 'sessions', '0001_initial', '2024-06-14 22:28:18.682235'),
(19, 'citas', '0001_initial', '2024-06-14 22:29:21.941098'),
(20, 'citas', '0002_tiposdocumentos_num_digitos', '2024-06-15 00:18:18.900547');

-- --------------------------------------------------------

--
-- Structure for view `vista_citas`
--
DROP TABLE IF EXISTS `vista_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas`  AS SELECT `c`.`id_cita` AS `id_cita`, `c`.`nombre_completo` AS `nombre_completo`, `td`.`nombre_documento` AS `tipo_documento`, `nd`.`numero_documento` AS `numero_documento`, `te`.`nombre_especialidad` AS `nombre_especialidad`, `c`.`fecha_registro` AS `fecha_registro`, `c`.`fecha_actualizacion` AS `fecha_actualizacion`, `c`.`estado` AS `estado` FROM (((`citas_citas` `c` join `citas_numerosdocumentos` `nd` on(`c`.`id_numero_documento` = `nd`.`id_numero_documento`)) join `citas_tiposdocumentos` `td` on(`nd`.`id_tipo_documento` = `td`.`id_tipo_documento`)) join `citas_tiposespecialidades` `te` on(`c`.`id_tipo_especialidad` = `te`.`id_tipo_especialidad`))  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
