<?php

class PriceNetworkAPIWrapper
{
    private $apiBaseURL = 'https://api2.campusbooks.com/13/rest/books';

    private $validOptions = [
        'key' => '',
        'format' => 'json',
        'isbn' => '',
        'f' => 'search',
        'keywords' => '',
        'page' => 1,
        'binding' => '',
        'conditions' => '0,1,2,4,5,6,7,8,9',
        'type' => '',
        'coupons' => 1,
        'image_width' => 120,
    ];

    function PriceNetworkAPIWrapper($key)
    {
        $this->validOptions['key'] = $key;
    }

    public function searchKeywords($keywords)
    {
        $options = ['keywords' => $keywords];

        return $this->getResponse($this->buildQueryString($options));
    }
    
    public function getBuyPrices($isbn)
    {
        $options = [
            'isbn' => $isbn,
            'f' => 'search,prices'
        ];
        
        return $this->getResponse($this->buildQueryString($options));
    }
    
    public function getSellPrices($isbn)
    {
        $options = [
            'isbn' => $isbn,
            'f' => 'search,prices',
            'type' => 'buyback',
            'conditions' => '0,1',
        ];
        
        return $this->getResponse($this->buildQueryString($options));
    }

    private function buildQueryString($params = [])
    {
        $qs = '';

        foreach($params as $k=>$p)
        {
            if ( array_key_exists($k, $this->validOptions) )
            {
                $this->validOptions[$k] = urlencode($p);
            }
        }

        foreach($this->validOptions as $k=>$v)
        {
            $qs .= $k . '=' . $v . '&';
        }

        return $qs;
    }

    private function getResponse($qs)
    {
        if ( function_exists('curl_init') )
        {
            // Get cURL resource
            $curl = curl_init();

            //var_dump($this->apiBaseURL . '?' . $qs);
        
            // Set some options - we are passing in a useragent too here
            curl_setopt_array($curl, array(
                CURLOPT_RETURNTRANSFER => 1,
                CURLOPT_URL => $this->apiBaseURL . '?' . $qs,
                CURLOPT_USERAGENT => 'PriceNetwork API Wordpress Plugin'
            ));
            
            // Send the request & save response to $resp
            $resp = curl_exec($curl);
            
            // Close request to clear up some resources
            curl_close($curl);

            return $resp;
        }

        return null; // no cURL available
    }

}
