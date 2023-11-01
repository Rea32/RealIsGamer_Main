<?php

namespace Pushsquare\API;

use Unirest;

require_once 'libs/Unirest.php';

require_once 'libs/simple_html_dom.php';

class PushsquareAPI
{
    private $response_body = "";
    private $baseUrl = "https://www.3djuegos.com/juegos/";
    private $arrSystems = array();

    public function __construct($system = "pc")
    {
        $this->arrSystems[] = strtolower($system);
    }

    public function getPushsquarePage($game_name)
    {
        $returnValue = "";
        # Remove spaces
        $game_name = trim($game_name);
        # convert spaces to -
        $game_name = str_replace(' ','-', $game_name);
        # Remove &<space>
        $game_name = str_replace('& ', '', $game_name);
        # lowercase
        $game_name = strtolower($game_name);
        # Remove all special chars execept a-z, digits, --sign, ?-sign, !-sign
        //$game_name = preg_replace('/[^a-z\d\?!\-]/', '', $game_name);
      

        # Get the webpage
        $i = 0;
        do {
            $system = $this->arrSystems[$i++];
            $url = $this->baseUrl . $game_name.'/imagenes/';
            $response = Unirest\Request::get($url, $headers = array(), $parameters = null);
        } while ($response->code <> 200 and $i < count($this->arrSystems));

        if ($response->code == 200) {
            $returnValue = $response->raw_body;
        }
        $this->response_body = $returnValue;
    }

    public function getPushsquareScreenshots()
    {
        # Get DOM by string content
        $html = str_get_html($this->response_body);
        # Define json output array
        $json_output = array();
        $error = false;
        # init all vars
        $image = "";
    

        if (!$html) {
            $json_output['error'] = "Page could not be loaded!";
            $error = true;
        }

        if (!$error) {
            foreach ($html->find('#galeria p img') as $element) {
                $image = $element-> getAttribute('data-big');

            }
            # Prevent memory leak
            $html->clear();
            unset($html);

            # Fill-in the array
            $json_output = $image;

        }

        # Return JSON format
        return $json_output;
    }
}

if ($_SERVER['SCRIPT_FILENAME'] == __FILE__) {
    if (isset($_GET['game_title'])) {
        $pushsquare_api = new MetacriticAPI();
        $pushsquare_api->getMetacriticPage($_GET['game_title']);
        echo $pushsquare_api->getMetacriticScores();
    } else {
        echo json_encode(array("error" => "Game title is empty"));
    }
}
