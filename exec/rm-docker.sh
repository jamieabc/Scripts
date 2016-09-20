#!/usr/bin/env node
require ('shelljs/global');
var request = require('request');

// setup all repositories
var repositories = ['dsp-core-dev-v1.1.0'];
var registry = 'http://192.168.101.29:5000/v1/repositories/vpon/';

// get all images from repository
repositories.forEach((element, idx, array) => {
  var url = registry + element + '/tags';
  request
    .get(url)
    .on('response', (res) => {
      res.setEncoding('utf8');
    })
    .on('data', (data) => {
      var json = JSON.parse(data);
      Object.keys(json).forEach((elm, idx, array) => {
        var deleteUrl = registry + element + '/tags/' + elm;
        request
          .del(deleteUrl)
          .on('response', (res) => {
            res.setEncoding('utf8');
            console.log('deleting ' + element + ', id: ' + elm);
          })
          .on('data', (data) => {
            if (data == 'false') {
              console.log('fail');
            }
          });
      })
      var delUrl = registry + element;
      request
        .del(delUrl)
        .on('response', (res) => {
          res.setEncoding('utf8');
          console.log('remove ' + element + ' repository');
        });
    })
});
