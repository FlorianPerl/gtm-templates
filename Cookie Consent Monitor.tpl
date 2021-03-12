___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Cookie Consent Monitor",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Tag template for monitoring user interactions with Cookie Information and Cookiebot widgets.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "endPoint",
    "displayName": "GET request endpoint",
    "simpleValueType": true,
    "valueHint": "e.g. https://track.com/collect",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^https://.+"
        ]
      }
    ],
    "alwaysInSummary": true,
    "help": "Provide the URL to which the GET request with tag data is sent"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require the necessary APIs
const readFromDataLayer = require('copyFromDataLayer');
const sendPixel = require('sendPixel');
const getTimestamp = require('getTimestamp');
const getUrl = require('getUrl');
const encode = require('encodeUriComponent');
const random = require('generateRandom');

// Get the values referring to interaction with the cookie consent widget
const timestamp = getTimestamp();
const platform = readFromDataLayer('platform');
const statistic = readFromDataLayer('cookie_cat_statistic');
const marketing = readFromDataLayer('cookie_cat_marketing');
const functional = readFromDataLayer('cookie_cat_functional');
const hostname = encode(getUrl('host'));
const pathname = encode(getUrl('path'));
const id = timestamp.toString() + "-" + random(0, 9).toString() + random(0, 9).toString() + random(0, 9).toString();

const eventTimestamp = getTimestamp();

const endPoint = data.endPoint;

// Build payload
const payload = '?timestamp=' + timestamp + '&interactionId=' + id + '&host=' + hostname + '&path=' + pathname + '&platform=' + platform + '&statistic=' + statistic + '&marketing=' + marketing + '&functional=' + functional;

// Send pixel
sendPixel(endPoint + payload, null, null);

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "platform"
              },
              {
                "type": 1,
                "string": "cookie_cat_statistic"
              },
              {
                "type": 1,
                "string": "cookie_cat_marketing"
              },
              {
                "type": 1,
                "string": "cookie_cat_functional"
              },
              {
                "type": 1,
                "string": "interaction_id"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 10/5/2020, 4:37:05 PM


