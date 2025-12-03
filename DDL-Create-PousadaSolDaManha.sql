-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PousadaSoldaManha
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PousadaSoldaManha
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PousadaSoldaManha` DEFAULT CHARACTER SET utf8 ;
USE `PousadaSoldaManha` ;

-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Funcionario` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nomeSocial` VARCHAR(45) NULL,
  `dataNasc` DATE NOT NULL,
  `estadoCivil` VARCHAR(15) NOT NULL,
  `carteiraTrab` VARCHAR(25) NOT NULL,
  `genero` VARCHAR(15) NOT NULL,
  `salario` DECIMAL(7,2) ZEROFILL UNSIGNED NOT NULL,
  `ch` INT NOT NULL,
  `pix` VARCHAR(60) NOT NULL,
  `situacao` VARCHAR(15) NOT NULL,
  `funcGratificada` DECIMAL(6,2) UNSIGNED ZEROFILL NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `carteiraTrab_UNIQUE` (`carteiraTrab` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Endereco` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  INDEX `fk_Endereco_Funcionario_idx` (`Funcionario_cpf` ASC) VISIBLE,
  PRIMARY KEY (`Funcionario_cpf`),
  CONSTRAINT `fk_Endereco_Funcionario`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  INDEX `fk_Telefone_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  PRIMARY KEY (`idTelefone`),
  CONSTRAINT `fk_Telefone_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Dependente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nomeSocial` VARCHAR(45) NULL,
  `dataNasc` DATE NOT NULL,
  `parentesco` VARCHAR(15) NOT NULL,
  `Responsavel_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Dependente_Funcionario1_idx` (`Responsavel_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Funcionario1`
    FOREIGN KEY (`Responsavel_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`OcorrenciaInterna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`OcorrenciaInterna` (
  `idOcorrenciaInterna` INT NOT NULL AUTO_INCREMENT,
  `dataHora` DATETIME NOT NULL,
  `gravidade` VARCHAR(25) NOT NULL,
  `descricao` VARCHAR(155) NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idOcorrenciaInterna`),
  INDEX `fk_OcorrenciaInterna_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_OcorrenciaInterna_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Ferias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Ferias` (
  `idFerias` INT NOT NULL AUTO_INCREMENT,
  `dataInicio` DATE NOT NULL,
  `qtdDias` INT NOT NULL,
  `anoRef` INT NOT NULL,
  `valor` DECIMAL(6,2) UNSIGNED ZEROFILL NOT NULL,
  `adiantamento13` TINYINT NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idFerias`),
  INDEX `fk_Ferias_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Ferias_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`RegPonto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`RegPonto` (
  `idRegPonto` INT NOT NULL AUTO_INCREMENT,
  `dataHora` DATETIME NOT NULL,
  `tipoEntradaSaida` VARCHAR(15) NOT NULL,
  `justificativa` VARCHAR(250) NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idRegPonto`),
  INDEX `fk_RegPonto_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_RegPonto_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(45) NULL,
  `Gerente_cpf` VARCHAR(14) NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Funcionario1_idx` (`Gerente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Funcionario1`
    FOREIGN KEY (`Gerente_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Cargo` (
  `CBO` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CBO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Trabalhar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Trabalhar` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Cargo_CBO` VARCHAR(10) NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NULL,
  INDEX `fk_Funcionario_has_Cargo_Cargo1_idx` (`Cargo_CBO` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Cargo_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Cargo_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  PRIMARY KEY (`Funcionario_cpf`, `Cargo_CBO`, `Departamento_idDepartamento`),
  CONSTRAINT `fk_Funcionario_has_Cargo_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Funcionario_has_Cargo_Cargo1`
    FOREIGN KEY (`Cargo_CBO`)
    REFERENCES `PousadaSoldaManha`.`Cargo` (`CBO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Funcionario_has_Cargo_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `PousadaSoldaManha`.`Departamento` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Hospede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Hospede` (
  `docIdentificacao` VARCHAR(25) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `genero` VARCHAR(15) NOT NULL,
  `telefone` VARCHAR(25) NULL,
  `email` VARCHAR(45) NULL,
  `PCD` VARCHAR(45) NULL,
  `Responsavel_docIdentificacao` VARCHAR(25) NULL,
  PRIMARY KEY (`docIdentificacao`),
  INDEX `fk_Hospede_Hospede1_idx` (`Responsavel_docIdentificacao` ASC) VISIBLE,
  CONSTRAINT `fk_Hospede_Hospede1`
    FOREIGN KEY (`Responsavel_docIdentificacao`)
    REFERENCES `PousadaSoldaManha`.`Hospede` (`docIdentificacao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Reserva` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `dataEntrada` DATETIME NOT NULL,
  `dataSaida` DATETIME NOT NULL,
  `qtdHospedes` INT NOT NULL,
  `valorAdiantado` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  `sistuacao` VARCHAR(25) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Responsavel_docIdentificacao` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Reserva_Hospede1_idx` (`Responsavel_docIdentificacao` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `PousadaSoldaManha`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reserva_Hospede1`
    FOREIGN KEY (`Responsavel_docIdentificacao`)
    REFERENCES `PousadaSoldaManha`.`Hospede` (`docIdentificacao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`UnidadeHoteleira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`UnidadeHoteleira` (
  `idUnidadeHoteleira` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valorDiaria` DECIMAL(6,2) NOT NULL,
  `tipo` VARCHAR(25) NOT NULL,
  `qtdMaxHospedes` INT NOT NULL,
  PRIMARY KEY (`idUnidadeHoteleira`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Ocupacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Ocupacao` (
  `Reserva_idReserva` INT NOT NULL,
  `UnidadeHoteleira_idUnidadeHoteleira` INT NOT NULL,
  `valorDiaria` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`Reserva_idReserva`, `UnidadeHoteleira_idUnidadeHoteleira`),
  INDEX `fk_Reserva_has_UnidadeHoteleira_UnidadeHoteleira1_idx` (`UnidadeHoteleira_idUnidadeHoteleira` ASC) VISIBLE,
  INDEX `fk_Reserva_has_UnidadeHoteleira_Reserva1_idx` (`Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_has_UnidadeHoteleira_Reserva1`
    FOREIGN KEY (`Reserva_idReserva`)
    REFERENCES `PousadaSoldaManha`.`Reserva` (`idReserva`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_has_UnidadeHoteleira_UnidadeHoteleira1`
    FOREIGN KEY (`UnidadeHoteleira_idUnidadeHoteleira`)
    REFERENCES `PousadaSoldaManha`.`UnidadeHoteleira` (`idUnidadeHoteleira`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Hospedagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Hospedagem` (
  `Reserva_idReserva` INT NOT NULL,
  `checkIn` DATETIME NOT NULL,
  `checkOut` DATETIME NULL,
  `valorTotal` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  `desconto` DECIMAL(7,2) UNSIGNED ZEROFILL NULL,
  INDEX `fk_Hospedagem_Reserva1_idx` (`Reserva_idReserva` ASC) VISIBLE,
  PRIMARY KEY (`Reserva_idReserva`),
  CONSTRAINT `fk_Hospedagem_Reserva1`
    FOREIGN KEY (`Reserva_idReserva`)
    REFERENCES `PousadaSoldaManha`.`Reserva` (`idReserva`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Acomodar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Acomodar` (
  `Hospedagem_Reserva_idReserva` INT NOT NULL,
  `Hospede_docIdentificacao` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Hospedagem_Reserva_idReserva`, `Hospede_docIdentificacao`),
  INDEX `fk_Hospedagem_has_Hospede_Hospede1_idx` (`Hospede_docIdentificacao` ASC) VISIBLE,
  INDEX `fk_Hospedagem_has_Hospede_Hospedagem1_idx` (`Hospedagem_Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Hospedagem_has_Hospede_Hospedagem1`
    FOREIGN KEY (`Hospedagem_Reserva_idReserva`)
    REFERENCES `PousadaSoldaManha`.`Hospedagem` (`Reserva_idReserva`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospedagem_has_Hospede_Hospede1`
    FOREIGN KEY (`Hospede_docIdentificacao`)
    REFERENCES `PousadaSoldaManha`.`Hospede` (`docIdentificacao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(6,2) UNSIGNED ZEROFILL NOT NULL,
  `quantidade` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PousadaSoldaManha`.`ItensHospedagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PousadaSoldaManha`.`ItensHospedagem` (
  `Produto_idProduto` INT NOT NULL,
  `Hospedagem_Reserva_idReserva` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `valor` DECIMAL(6,2) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Hospedagem_Reserva_idReserva`),
  INDEX `fk_Produto_has_Hospedagem_Hospedagem1_idx` (`Hospedagem_Reserva_idReserva` ASC) VISIBLE,
  INDEX `fk_Produto_has_Hospedagem_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Hospedagem_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `PousadaSoldaManha`.`Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Hospedagem_Hospedagem1`
    FOREIGN KEY (`Hospedagem_Reserva_idReserva`)
    REFERENCES `PousadaSoldaManha`.`Hospedagem` (`Reserva_idReserva`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
