<?php
namespace Zikzay\Database;


class Migration_210507_140603 extends Migration {

    public function up() { 
        $this->createTable("admin", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("admin", "admin", "VARCHAR(32) NULL  ");
        $this->addColumn("admin", "email", "VARCHAR(64) NULL  ");
        $this->addColumn("admin", "username", "VARCHAR(16) NULL  ");
        $this->addColumn("admin", "password", "VARCHAR(255) NULL ");
        $this->addColumn("admin", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("admin", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

        $this->createTable("contact", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("contact", "name", "VARCHAR(32) NULL ");
        $this->addColumn("contact", "message", "TEXT NULL ");
        $this->addColumn("contact", "email", "VARCHAR(64) NULL  ");
        $this->addColumn("contact", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("contact", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

        $this->createTable("post", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("post", "admin", "VARCHAR(64) NULL  ");
        $this->addColumn("post", "image", "VARCHAR(32) NULL ");
        $this->addColumn("post", "title", "TEXT NULL ");
        $this->addColumn("post", "details", "TEXT NULL ");
        $this->addColumn("post", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("post", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");



    }
    
    public function down() { 
        
    }
}