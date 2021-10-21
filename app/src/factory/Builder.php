<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/3/2020
 *Time: 8:41 AM
 */

namespace Zikzay\factory;


use Zikzay\Lib\Util;

class Builder
{
    protected $command;
    protected $options;
    protected $args;

    public static function make(array $args)
    {        
        (new self())->analiseCommand($args);

    }

    private function analiseCommand(array $args)
    {
        if(count($args) == 1) {
            $this->terminalDoc();
        } else {
            $command = strtolower($args[1]);
            if(in_array($command, $this->commandArray())){
                $this->command = $command;

                array_shift($args);
                array_shift($args);

                $this->processCommand($command, $args);

            } else {
                echo EL;
                Util::cmdPrint('You entered an invalid command', -1);
            }
        }
    }

    private function terminalDoc()
    {
        $stop =  "\e[0m";
        $color = "\e[37;1m";
        $greenB = "\e[32;1m";
        $yellow = "\e[33m";
        $yellowU = "\e[33;4m";
        $green = "\e[32m";
        $skyL = "\e[36m";
        $blueL = "\e[94m";

        echo "
 ________    ___   ___     ___ _________          ____    ___     ___
|_____   |  |   | |   |  /   /|_____    |        /    \   \   \  /   /
    /   /   |   | |   |/   /       /   /        /      \\   \\   \/   /
   /   /    |   | |       /       /   /        /   /\   \   \     /
  /   /     |   | |      \\       /   /        /   /__\   \   |   |
 /   /_____ |   | |   |\   \    /   /_____   /   /____    \  |   |
|__________||___| |___|  \___\ |___________|/___/      \___\ |___|

";

        echo "{$greenB} Zikzay PHP{$stop} Framework $green V 1.0.0 $stop 01-08-2020 10:28:07 ".EL.EL.EL;

        echo "{$yellowU}Usage:{$stop}" . EL;
        echo "   {$green}command{$stop} [{$skyL}options{$stop}] [arguments]". EL. EL;

        echo "{$yellowU}Commands:{$stop}" . EL;

        echo "  {$green}Migration {$stop}";
        echo "\t\tMake a database migration". EL;

        echo "  {$green}Model {$stop}";
        echo "\t\tA class that represent a table in the database" . EL;

        echo "  {$green}Controller {$stop}";
        echo "\t\tA class that all the functions of a request are stored" . EL;

        echo EL;

        echo "{$yellowU}Options:{$stop}" . EL;

        echo "  {$skyL}-c --create {$stop}";
        echo "\t\tCreate the what is specify in the command". EL;

        echo "  {$skyL}-d --delete {$stop}";
        echo "\t\tDelete what is specity in the command" . EL;

        echo "  {$skyL}-p --push {$stop}";
        echo "\t\tApply all the generated migration to the database" . EL;





        echo EL;
    }

    protected function commandArray() {
        return ['migration', 'model', 'controller'

        ];
    }

    private function processCommand(string $command, $args)
    {
        $class = 'Zikzay\factory\\'.ucwords($command);
        if(class_exists($class)) {
            new $class($args);
        }
    }
}