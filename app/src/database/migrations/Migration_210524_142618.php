<?php
namespace Zikzay\Database;


class Migration_210524_142618 extends Migration {

    public function up() { 
        $this->createTable("admin", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("admin", "token", "VARCHAR(32) NULL ");
        $this->addColumn("admin", "name", "VARCHAR(64) NULL  ");
        $this->addColumn("admin", "email", "VARCHAR(64) NULL  ");
        $this->addColumn("admin", "phone", "VARCHAR(14) NULL  ");
        $this->addColumn("admin", "password", "VARCHAR(255) NULL ");
        $this->addColumn("admin", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("admin", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

        $this->createTable("token", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("token", "token", "VARCHAR(32) NULL ");
        $this->addColumn("token", "admin", "VARCHAR(64) NULL  ");
        $this->addColumn("token", "phone", "VARCHAR(14) NULL  ");
        $this->addColumn("token", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("token", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");



    }
    
    public function down() { 
        
    }
}