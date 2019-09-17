### Apis and Microservices Projects - Timestamp Microservice:

- [freecodecamp](https://learn.freecodecamp.org/apis-and-microservices/apis-and-microservices-projects/timestamp-microservice)

## How to use it:
- clone the repo:
```
git clone https://github.com/chavo1/training-nodejs.git
cd training-nodejs/apis-microservices
vagrant up
```
- access the app on http://192.168.56.56:3000
- type POST URL button
```
- you will be redirected to http://192.168.56.56:3000/api/shorturl/new
- the content of the page should be simmilar to this one:
```
{"original_url":"https://www.github.com/chavo1","short_url":"351"}
```
- change the URL in your browser:
```
http://192.168.56.56:3000/api/shorturl/351
```
- this will redirect you to:
```
https://www.github.com/chavo1
