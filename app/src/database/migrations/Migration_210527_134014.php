<?php
namespace Zikzay\Database;


class Migration_210527_134014 extends Migration {

    public function up() { 
       
        $this->createTable("location", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("location", "property", "INT UNSIGNED NULL ");
        $this->addColumn("location", "address", "VARCHAR(255) NULL ");
        $this->addColumn("location", "city", "VARCHAR(64) NULL ");
        $this->addColumn("location", "state", "VARCHAR(64) NULL ");
        $this->addColumn("location", "country", "VARCHAR(64) NULL ");
        $this->addColumn("location", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("location", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

       

    }
    
    public function down() { 
        
    }
}