<?php

namespace Meristation\API;

use Unirest;

require_once 'libs/Unirest.php';

require_once 'libs/simple_html_dom.php';

class MeristationAPI
{
    private $response_body = "";
    private $baseUrl = "http://as.com/meristation/juegos/";
    private $arrSystems = array();

    public function __construct($system = "pc")
    {
        $this->arrSystems[] = $system;
    }

    public function getMeristationPage($game_name)
    {
        $returnValue = "";
        # Remove spaces
        $game_name = trim($game_name);
        # convert spaces to -
        $game_name = str_replace(' ', '-', $game_name);
        # Remove &<space>
        $game_name = str_replace('& ', '', $game_name);
        # lowercase
        $game_name = strtolower($game_name);
        # Remove all special chars execept a-z, digits, --sign, ?-sign, !-sign
        $game_name = preg_replace('/[^a-z\d\?!\-]/', '', $game_name);

        # Get the webpage
        $i = 0;
        do {
            $system = $this->arrSystems[$i++];
            $url = $this->baseUrl . "/" . $game_name;
            $response = Unirest\Request::get($url, $headers = array(), $parameters = null);
        } while ($response->code <> 200 and $i < count($this->arrSystems));

        if ($response->code == 200) {
            $returnValue = $response->raw_body;
        }
        $this->response_body = $returnValue;
    }

    public function getMeristationInfo()
    {
        # Get DOM by string content
        $html = str_get_html($this->response_body);
        # Define json output array
        $json_output = array();
        $error = false;
        # init all vars
        $name = "";
        $metascritic_score = 0;
        $user_score = 0.0;
        $descripcion ="";
        $rating = "";
        $developer = "";
        $publisher = "";
        $genres = "";
        $release_date = "";
        $image_url = "";
        $cheat_url = "";

        if (!$html) {
            $json_output['error'] = "Page could not be loaded!";
            $error = true;
        }

        if (!$error) {
            foreach ($html->find('p.ga-hdr__tl') as $element) {
                $name = trim($element->plaintext);
            }

            foreach ($html->find('div.metascore_w.game span') as $element) {
                $metascritic_score = intval($element->plaintext);
            }

            foreach ($html->find("div.metascore_w.user.large.game") as $element) {
                $user_score = floatval($element->plaintext);
            }

            foreach ($html->find('li.summary_detail.product_rating span.data') as $element) {
                $rating = trim($element->plaintext);
            }

            $all = array();
            foreach ($html->find('li span.info__val') as $element) {
                array_push($all, trim($element->plaintext));
            }
            $genres=$all[1];
            $genres = explode(', ',$genres);

            $developers=$all[2];
            $developers = explode(", ", $developers);
            
            $release_date=$all[3];
            $release_date = substr($release_date,0,10);
            $release_date = explode('/',$release_date);
            $release_date = $release_date[2].'-'.$release_date[1].'-'.$release_date[0];

            foreach ($html->find('li.summary_detail.publisher span.data a') as $element) {
                $publisher = trim($element->plaintext);
            }

            foreach ($html->find('li.summary_detail.release_data span.data') as $element) {
                $release_date = trim($element->plaintext);
            }

            $platforms = array();
            $platform_url = array();
            foreach ($html->find('span.info__val span') as $element) {
                if(preg_match('/^\w{3}/',$element->plaintext)==1){              //Evita que coga valores que no sean codigos de plataformas
                    $platform = substr(trim($element->plaintext),0,3);          // Recoge solo los 3 primeros caracteres (el cuarto suele ser un numero que no nos interesa)
                    array_push($platforms, $platform);
                    array_push($platform_url, $element->href);
                }

            }

            foreach ($html->find('img.product_image.large_image') as $element) {
                $image_url = $element->src;
            }

            foreach ($html->find('li.summary_detail.product_cheats span.data a') as $element) {
                $cheat_url = $element->href;
            }
            foreach ($html->find('div.game-sum p') as $element) {
                $descripcion = trim($element->plaintext);
            }
            
            # Prevent memory leak
            $html->clear();
            unset($html);

            # Fill-in the array
            $json_output['name'] = $name;
            $json_output['metascritic_score'] = $metascritic_score;
            $json_output['users_score'] = $user_score;
            $json_output['rating'] = $rating;
            $json_output['genres'] = $genres;
            $json_output['developers'] = $developers;
            $json_output['publishers'] = $publisher;
            $json_output['release_date'] = $release_date;
            $json_output['platform'] = $platforms;
            $json_output['descripcion'] = $descripcion;
            $json_output['platform_url'] = $platform_url;
            $json_output['thumbnail_url'] = $image_url;
            $json_output['cheat_url'] = $cheat_url;
        }

        # Return JSON format
        return $json_output;
    }
}

if ($_SERVER['SCRIPT_FILENAME'] == __FILE__) {
    if (isset($_GET['game_title'])) {
        $pushsquare_api = new MetacriticAPI();
        $pushsquare_api->getMetacriticPage($_GET['game_title']);
        echo $pushsquare_api->getMeristationInfo();
    } else {
        echo array("error" => "Game title is empty");
    }
}
