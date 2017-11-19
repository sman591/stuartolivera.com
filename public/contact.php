<?php

if ($_POST['username']) // most bots will fill this (hidden by CSS) field
  exit;

$name    = $_POST['name'];
$email   = $_POST['email'];
$subject = $_POST['subject'];
$message = $_POST['comments'];

if (trim($name) == '' || trim($email) == '' || trim($message) == '')
  exit;

$content =  "From:  " . $name . "\r\n";
$content .= "Email:  " . $email . "\r\n";
if (trim($subject) != '')
  $content .= "Subject:  " . $subject . "\r\n";
$content .=  "Message:  \r\n" . $message . "\r\n----";

require '../vendor/autoload.php';
use SparkPost\SparkPost;
use GuzzleHttp\Client;
use Http\Adapter\Guzzle6\Client as GuzzleAdapter;

$httpClient = new GuzzleAdapter(new Client());
$sparky = new SparkPost($httpClient, ['key'=>getenv('SPARKPOST_API_KEY')]);

$promise = $sparky->transmissions->post([
    'content' => [
        'from' => [
            'name' => 'stuartolivera.com',
            'email' => 'stuart@oliveraweb.com',
        ],
        'subject' => 'Contact From stuartolivera.com',
        'text' => $content
    ],
    'recipients' => [
        [
            'address' => [
                'name' => 'Stuart Olivera',
                'email' => 'stuart@stuartolivera.com',
            ],
        ],
    ],
]);

try {
    $response = $promise->wait();
    echo $response->getStatusCode()."\n";
} catch (\Exception $e) {
    http_response_code(500);
    echo $e->getCode()."\n";
    echo $e->getMessage()."\n";
}

?>
