<?php

class PriceNetworkISBNHelper
{
    private $isbn13 = '';
    private $isbn10 = '';

    function __construct($isbn)
    {
        $isbn = self::cleanIsbn($isbn);
        if ($this->validateIsbn($isbn)) {
            $this->isbn10 = $this->ten($isbn);
            $this->isbn13 = $this->thirteen($isbn);
        }
    }

    /**
     * @TODO clean the isbn value
     * @return integer|mixed
     */
    public static function cleanIsbn($isbn)
    {
        $digits = preg_replace('/[^0-9x]/i', '', $isbn);

        // If the resulting number is between 6 and 9 digits, try
        // left padding and see if we get a valid ISBN
        // This is written specifically for when Excel eliminates the leftmost zeros
        if ( (strlen($digits) <= 9) && (strlen($digits) >= 6)) {
            $digits = str_pad($digits, 10, 0, STR_PAD_LEFT);

            if (!self::validateIsbn($digits))  {
                return '';
            }

        }
        return $digits;
    }

    /**
     * @TODO validate the isbn value
     * @return boolean
     */
    public static function validateIsbn($isbn, $clean = false)
    {
        $isbn = ($clean) ? self::cleanIsbn($isbn) : $isbn;

        $isbn = preg_replace('# \-#', '', $isbn);

        if (!self::validateIsbnStructure($isbn)) {
            return false;
        }

        $isbnVerified = self::getIsbnChecksum($isbn);

        return $isbnVerified;
    }

    /**
     * @TODO get isbn checksum
     * @return mixed
     */
    private static function getIsbnChecksum($isbn)
    {
        $isbnVerified = 0;
        $isbnLen = strlen($isbn);
        $isbn = strtoupper($isbn);

        if ($isbnLen == 10) {
            $sum = 0;

            for ($i = 0; $i < $isbnLen - 1; $i++) {
                $sum += ((int)$isbn{$i}) * ($i+1);
            }

            $checksum = $sum % 11;

            $isbnVerified = ($checksum == 10 && $isbn{strlen($isbn) - 1} == 'X') ||
                ($checksum == $isbn{strlen($isbn) - 1});
        } else if ($isbnLen == 13 && preg_match('/^97[89]/', $isbn)) {
            //http://www.bisg.org/pi/appendix_1.html#Algorithm%20for%20Checking%20the%20Bookland%20EAN
            $sum = 0;

            for ($i = 0; $i < $isbnLen; $i++) {
                $sum += ((int)$isbn{$i}) * (1 + (($i % 2) * 2)); // one or three, even/odd
            }

            $isbnVerified = ($sum % 10) == 0;
        }

        return $isbnVerified;
    }

    /**
     * @TODO validate isbn structure
     * @return boolean
     */
    private static function validateIsbnStructure($isbn)
    {
        if (!preg_match('#^[0-9xX]{10,13}#', $isbn) || (!$isbn)) {
            return false;
        }
        return true;
    }

    /**
     * @TODO used to generate valid test ISBN data
     * @return integer
     */
    static function generateISBN($num)
    {
        $newNumberString = '1' . str_pad($num, 8, '0', STR_PAD_LEFT);

        $sum = 0;
        for ($i = 0; $i < strlen($newNumberString); $i++) {
            $sum += (int)$newNumberString{$i} * ($i+1);
        }

        // add checksum
        $checksum = $sum % 11;

        if ($checksum == 10) {
            $checksum = 'X';
        }

        $newNumberString .= $checksum;

        return $newNumberString;
    }

    /**
     * @TODO cerate a isbn of 10 digits
     * @return integer
     */
    function ten($isbn = '')
    {
        $isbn = $isbn ? self::clean($isbn) : (isset($this) ? $this->isbn10 : '');
        if (! ($isbn)) {
            return 0;
        } elseif(self::validateIsbn($isbn)) {
            // Already 10 digits
            if (strlen($isbn) == 10) {
                return $isbn;
            } else {
                // If ISBN starts with 978, drop 978 + check digit, recalculate check digit
                // http://www.bisg.org/pi/appendix_1.html#Retrieving%20the%2010-digit%20ISBN%20from%20the%20Bookland%20EAN
                $retval = substr($isbn, 3, 9);
                $sum = 0;
                for ($i = 0; $i < 9; $i++) {
                    $sum += ((int)$retval{$i}) * ($i + 1);
                }
                $checksum = $sum % 11;
                if ($checksum == 10) {
                    $retval .= 'X';
                } else {
                    $retval .= $checksum;
                }
                return $retval;
            }
        } else {
            return 0;
        }
    }

    /**
     * @TODO add zero pad to number
     * @return number zero format
     */
    function zeroPad10($isbn) {
        $length=strlen($isbn);
        if ($length==8 || $length==9) {
            return str_pad($isbn, 10, 0, STR_PAD_LEFT);
        }
        return $isbn;
    }

    /**
     * @TODO cerate a number of 13 digits
     * @return integer
     */
    static function thirteen($isbn = '')
    {
        if ($isbn) {
            $isbn = self::cleanIsbn($isbn);
        } elseif (isset($this) && !empty($this->isbn13)) {
            return $this->isbn13;
        } else {
            return '';
        }
        if(! $isbn) {
            return false;
        } elseif(self::validateIsbn($isbn)) {
            // Already 13 digits
            if (strlen($isbn) == 13) {
                return $isbn;
            } else {
                $retval = "978".substr($isbn,0,9);
                $sum = 0;
                for ($i = 0; $i < 12; $i++) {
                    $sum += ((int)$retval{$i}) * (1 + (($i % 2) * 2)); // one or three, even/odd
                }
                $retval .= (10 - ($sum % 10)) % 10;
                return $retval;
            }
        } else {
            return false;
        }
    }

    /**
     * @TODO
     */
    function stripHyphens($isbn='') {
        if (!$isbn) return false;
        return str_replace("-", "", $isbn);
    }
}
