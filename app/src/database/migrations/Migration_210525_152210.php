<?php
namespace Zikzay\Database;


class Migration_210525_152210 extends Migration {

    public function up() { 
        
        $this->createTable("amenities", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("amenities", "property", "INT UNSIGNED NULL ");
        $this->addColumn("amenities", "amenity", "VARCHAR(255) NULL ");
        $this->addColumn("amenities", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("amenities", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

        $this->createTable("property", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("property", "propertyid", "VARCHAR(16) NULL ");
        $this->addColumn("property", "name", "VARCHAR(256) NULL ");
        $this->addColumn("property", "location", "TEXT NULL ");
        $this->addColumn("property", "price", "INT UNSIGNED NULL ");
        $this->addColumn("property", "type", "VARCHAR(256) NULL ");
        $this->addColumn("property", "state", "VARCHAR(256) NULL ");
        $this->addColumn("property", "area", "VARCHAR(256) NULL ");
        $this->addColumn("property", "description", "TEXT NULL ");
        $this->addColumn("property", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("property", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

        $this->createTable("property_details", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("property_details", "label", "VARCHAR(255) NULL ");
        $this->addColumn("property_details", "detail", "VARCHAR(255) NULL ");
        $this->addColumn("property_details", "property", "INT UNSIGNED NULL ");
        $this->addColumn("property_details", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("property_details", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

        $this->createTable("property_media", "id", "INT NOT NULL ", " AUTO_INCREMENT");
        $this->addColumn("property_media", "property", "INT UNSIGNED NULL ");
        $this->addColumn("property_media", "media", "VARCHAR(64) NULL ");
        $this->addColumn("property_media", "type", "VARCHAR(16) NULL ");
        $this->addColumn("property_media", "created_at", "TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP");
        $this->addColumn("property_media", "updated_at", "TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP");

        

    }
    
    public function down() { 
        
    }
}