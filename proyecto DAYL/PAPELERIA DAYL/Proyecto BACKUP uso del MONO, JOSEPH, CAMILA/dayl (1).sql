-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-09-2023 a las 20:44:05
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dayl`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(25, 'Can add proveedor', 7, 'add_proveedor'),
(26, 'Can change proveedor', 7, 'change_proveedor'),
(27, 'Can delete proveedor', 7, 'delete_proveedor'),
(28, 'Can view proveedor', 7, 'view_proveedor'),
(29, 'Can add categoria', 8, 'add_categoria'),
(30, 'Can change categoria', 8, 'change_categoria'),
(31, 'Can delete categoria', 8, 'delete_categoria'),
(32, 'Can view categoria', 8, 'view_categoria'),
(33, 'Can add subcategoria', 9, 'add_subcategoria'),
(34, 'Can change subcategoria', 9, 'change_subcategoria'),
(35, 'Can delete subcategoria', 9, 'delete_subcategoria'),
(36, 'Can view subcategoria', 9, 'view_subcategoria'),
(37, 'Can add producto', 10, 'add_producto'),
(38, 'Can change producto', 10, 'change_producto'),
(39, 'Can delete producto', 10, 'delete_producto'),
(40, 'Can view producto', 10, 'view_producto'),
(41, 'Can add color', 11, 'add_color'),
(42, 'Can change color', 11, 'change_color'),
(43, 'Can delete color', 11, 'delete_color'),
(44, 'Can view color', 11, 'view_color'),
(45, 'Can add cliente', 12, 'add_cliente'),
(46, 'Can change cliente', 12, 'change_cliente'),
(47, 'Can delete cliente', 12, 'delete_cliente'),
(48, 'Can view cliente', 12, 'view_cliente'),
(49, 'Can add clientes', 12, 'add_clientes'),
(50, 'Can change clientes', 12, 'change_clientes'),
(51, 'Can delete clientes', 12, 'delete_clientes'),
(52, 'Can view clientes', 12, 'view_clientes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$mBkiGRRYEUeDxTFKFZIWzE$npJH2oMN1AJYVyYE/d8Sz6630Ly1MsiKcdW+s0/UyKc=', '2023-09-15 19:56:35.327090', 0, 'alejo-largo@hotmail.com', 'Jorge Alejandro', '', 'alejo-largo@hotmail.com', 0, 1, '2023-09-15 18:20:53.136012'),
(2, 'pbkdf2_sha256$600000$6PVUt0Dd7b1rvCgA4ZFmVS$qk1ROPlAR+Q5djsdWzHBy6IBER/LIZomDKhdeXi5kV0=', '2023-09-15 20:21:14.678020', 1, 'alejo', '', '', '', 1, 1, '2023-09-15 20:20:50.112051');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `imagen`) VALUES
(1, 'Belleza', 'imagen/productos/2606d46d31874c07bc8ad546615f5b41.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `casa_apto` varchar(10) DEFAULT NULL,
  `ciudad` varchar(30) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `departamento` varchar(50) NOT NULL,
  `descripcion` longtext,
  `nit` varchar(15) DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `tipo_persona` varchar(50) NOT NULL,
  `tipo_via` varchar(3) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_hola_id_60e221f6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `casa_apto`, `ciudad`, `complemento`, `departamento`, `descripcion`, `nit`, `nombre`, `numero`, `telefono`, `tipo_persona`, `tipo_via`, `user_id`) VALUES
(1, '0', 'Medellin', '88B-29', 'AMZ', 'Pedregal Medellin', NULL, 'Jorge Alejandro', '78c', '3148847522', 'Natural', 'TV', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) DEFAULT NULL,
  `color` varchar(26) NOT NULL,
  `stock` int DEFAULT NULL,
  `producto_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `color_producto_id_id_c70417ee` (`producto_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `imagen`, `color`, `stock`, `producto_id_id`) VALUES
(1, 'imagen/productos/0706081aa8d4444388f48e4acdb9112b.jpg', 'Rojo', 20, 1),
(2, 'imagen/productos/bfa35e12b3074504bd691103a391297b.jpg', 'Azul', 16, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-09-15 20:24:26.186160', '1', 'Belleza', 1, '[{\"added\": {}}]', 8, 2),
(2, '2023-09-15 20:25:01.857722', '1', 'Maquillaje Belleza', 1, '[{\"added\": {}}]', 9, 2),
(3, '2023-09-15 20:25:18.597653', '1', 'Plasticos J&T 1028034536-5', 1, '[{\"added\": {}}]', 7, 2),
(4, '2023-09-15 20:25:43.665712', '1', 'Jorge Alejandro \"0\" \"Maquillaje\"', 1, '[{\"added\": {}}]', 10, 2),
(5, '2023-09-15 20:26:08.401884', '1', 'Jorge Alejandro - Rojo 1', 1, '[{\"added\": {}}]', 11, 2),
(6, '2023-09-15 20:26:25.570415', '2', 'Jorge Alejandro - Azul 2', 1, '[{\"added\": {}}]', 11, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'producto', 'proveedor'),
(8, 'producto', 'categoria'),
(9, 'producto', 'subcategoria'),
(10, 'producto', 'producto'),
(11, 'producto', 'color'),
(12, 'cliente', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-09-15 16:19:40.171388'),
(2, 'auth', '0001_initial', '2023-09-15 16:19:40.751214'),
(3, 'admin', '0001_initial', '2023-09-15 16:19:41.029329'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-09-15 16:19:41.037848'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-15 16:19:41.045378'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-09-15 16:19:41.123741'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-09-15 16:19:41.165361'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-09-15 16:19:41.207013'),
(9, 'auth', '0004_alter_user_username_opts', '2023-09-15 16:19:41.215616'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-09-15 16:19:41.258671'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-09-15 16:19:41.260667'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-09-15 16:19:41.267684'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-09-15 16:19:41.309874'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-09-15 16:19:41.348065'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-09-15 16:19:41.388842'),
(16, 'auth', '0011_update_proxy_permissions', '2023-09-15 16:19:41.400067'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-09-15 16:19:41.443375'),
(30, 'cliente', '0001_initial', '2023-09-15 18:16:02.076929'),
(19, 'sessions', '0001_initial', '2023-09-15 16:28:18.477542'),
(20, 'producto', '0001_initial', '2023-09-15 16:35:52.519530'),
(21, 'producto', '0002_producto_color', '2023-09-15 16:37:51.928164'),
(22, 'cliente', '0002_rename_cliente_clientes', '2023-09-15 16:43:28.118784'),
(31, 'cliente', '0002_clientes_casa_apto_clientes_ciudad_and_more', '2023-09-15 18:16:02.783642'),
(32, 'cliente', '0003_rename_clientes_cliente_alter_cliente_table', '2023-09-15 18:16:02.815601'),
(33, 'cliente', '0004_alter_cliente_table', '2023-09-15 18:16:02.829929'),
(34, 'cliente', '0005_remove_cliente_contraseña_and_more', '2023-09-15 18:16:02.916416'),
(35, 'cliente', '0006_alter_cliente_nombre', '2023-09-15 18:16:02.955896'),
(36, 'cliente', '0007_cliente_hola', '2023-09-15 18:16:03.023782'),
(37, 'cliente', '0008_remove_cliente_hola', '2023-09-15 18:16:03.068219'),
(38, 'cliente', '0009_cliente_hola', '2023-09-15 18:18:32.966595'),
(39, 'cliente', '0010_alter_cliente_hola', '2023-09-15 18:19:31.220181'),
(40, 'cliente', '0011_rename_hola_cliente_user', '2023-09-15 18:19:47.288434');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('f19z6j18xagqx8olgl98cf6xgi02d33y', '.eJxVjk2OgzAMha8y8hpBfpmE3cxypDkDcpyU0kJSBZhNxd0nqO2i3th6fv787kCY87gm6O7Ae360W05-ozX1o4eOVxDT7HKADn5SHsLH1xQuGH1OUJXjuI4ei09V8IdTytBpzRmrAGmbtwl9IQvB1CFRKoYXdZxxCLFQm8fUvN4uDftkLTMc0XhVShpzUiYoJO8s58LVl9sA-15Bj9t67rclPKgg4E1zSNcQj4UviYdUU4prHl19WOrndql_kw_T99P7Bjjjci7X6JQmSYx7DJ7opERJJqTVgjOvNGMkpVbBtCWjaDVZtMgsotRWSjIE-z-EkXKz:1qhFeS:q8S9dzmva0w6uj0RGFAO2jZ45Rx4TNZZB3vEHvpvv2c', '2023-09-29 20:42:56.986799');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `porcentaje_iva` decimal(3,1) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `oferta` decimal(4,2) DEFAULT NULL,
  `proveedor_id_id` bigint DEFAULT NULL,
  `subcategoria_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_proveedor_id_id_90b63e1d` (`proveedor_id_id`),
  KEY `producto_subcategoria_id_555d6ddb` (`subcategoria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `porcentaje_iva`, `precio`, `stock`, `oferta`, `proveedor_id_id`, `subcategoria_id`) VALUES
(1, 'Jorge Alejandro', '16.0', '50000.00', 36, '5.00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(30) NOT NULL,
  `nombre_completo` varchar(60) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `correo_electronico` varchar(200) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `ciudad`, `nombre_completo`, `nit`, `correo_electronico`, `telefono`, `direccion`) VALUES
(1, 'Medellin', 'Plasticos J&T', '1028034536-5', 'alejo-largo@hotmail.com', '3148847522', 'Pedregal Medellin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
CREATE TABLE IF NOT EXISTS `subcategoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `categoria_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategoria_categoria_id_e594c1f4` (`categoria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id`, `nombre`, `categoria_id`) VALUES
(1, 'Maquillaje', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
