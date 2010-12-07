<?php
$password = '0123456789';
$salt     = '01234567890123456789012345678901';
$iter     = 2000000;
$x = '';

for ($i = 0; $i < $iter; ++$i) {
//  $x = hash('sha256', $x . $password . $salt);
  $x = md5($x . $password . $salt);
}



