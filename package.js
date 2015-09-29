Package.describe({
  name: 'liberation:google-url-shortener',
  version: '1.0.0',
  summary: 'Google URL Shortener API allows you to shorten URLs just as you would on goo.gl. Based on asveloper:shortner package.',
  git: 'dolgarev/meteor-google-url-shortener'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1');

  api.use(['http', 'coffeescript'], 'server');

  api.addFiles('server/service.coffee');
});
