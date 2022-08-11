CREATE DATABASE `clouddriver` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE `front50` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE `orca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE `fiat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'clouddriver_service'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON clouddriver.* To 'clouddriver_service'@'127.0.0.1';

CREATE USER 'clouddriver_migrate'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON clouddriver.* To 'clouddriver_migrate'@'127.0.0.1';


CREATE USER 'front50_service'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON front50.* To 'front50_service'@'127.0.0.1';

CREATE USER 'front50_migrate'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON front50.* To 'front50_migrate'@'127.0.0.1';


CREATE USER 'orca_service'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON orca.* To 'orca_service'@'127.0.0.1';

CREATE USER 'orca_migrate'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON orca.* To 'orca_migrate'@'127.0.0.1';


CREATE USER 'fiat_service'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON fiat.* To 'fiat_service'@'127.0.0.1';

CREATE USER 'fiat_migrate'@'127.0.0.1' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON fiat.* To 'fiat_migrate'@'127.0.0.1';

FLUSH PRIVILEGES;
