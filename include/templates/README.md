<% if cmd? -%>
# Algolia Search Command Line API Client
<% else -%>
# Algolia Search API Client for <%= !objc? ? (!csharp? ? @name : "C# #") : "iOS and OS X" %>
<% end -%>

<% if swift? -%>
**&lt;Welcome Objective-C developers&gt;**

In July 2015, we release a new version of our Swift client able to work with Swift and Objective-C.

If you were using our Objective-C client, [read the migration guide](https://github.com/algolia/algoliasearch-client-swift/wiki/Migration-guide-from-Objective-C-to-Swift-API-Client).

The Objective-C API Client is still supported and can be found [here](https://github.com/algolia/algoliasearch-client-objc).

**&lt;/Welcome Objective-C developers&gt;**
<% end -%>

<% if objc? -%>
**&lt;Welcome Swift developers&gt;**

In June 2015, we release our [Swift API Client](https://github.com/algolia/algoliasearch-client-swift).

It is able to work with Swift and Objective-C. If you plan to use Swift in your project, please use it since we don't support Swift in our Objective-C API Client.

The Objective-C API Client is still supported and updated.

**&lt;/Welcome Swift developers&gt;**
<% end -%>

<%#    ************************** INTRO ********************************** %>

[Algolia Search](http://www.algolia.com) is a hosted full-text, numerical, and faceted search engine capable of delivering realtime results from the first keystroke.

<% if cmd? -%>
Our command line API client is a small wrapper around CURL to make it easier to use the [Algolia Search REST API](http://www.algolia.com/doc/rest_api).
<% elsif !js? -%>
Our <%= @name %> client lets you easily use the [Algolia Search API](https://www.algolia.com/doc/rest_api) from your <%= puts({'C#' => 'App', 'Java' => "Java Application", "Android" => "Android Application", 'Objective-C' => "iOS & OS X applications"}, "backend") %>. It wraps the [Algolia Search REST API](http://www.algolia.com/doc/rest_api).
<% end -%>

<% if csharp? %>Compatible with .NET 4.0, .NET 4.5, ASP.NET vNext 1.0, Mono 4.5, Windows 8, Windows 8.1, Windows Phone 8.1, Xamarin iOS, and Xamarin Android.<% end %>
<% if android? %>It is based on our [Java API client](https://github.com/algolia/algoliasearch-client-java) and  includes an easy to use asynchronous API to avoid networks calls on UI Thread.<% end %>

<%= import("build_status.info") if !cmd? %>

<% if js? -%>
The JavaScript client lets you use the [Algolia Search API](https://www.algolia.com/doc/rest_api) on the frontend (browsers) or on the backend (Node.js) with the same API.

The backend (Node.js) API can be used to index your data using your Algolia admin API keys.

Our JavaScript library is [UMD](https://github.com/umdjs/umd) compatible, you can
use it with any module loader.

When not using any module loader, it will export an `algoliasearch` method in the `window` object.
<% end -%>

<%#    ************************** TOC ********************************** %>

Table of Contents
=================
**Getting Started**

1. [Setup](#setup)
<% if js? -%>
  - [Frontend](#frontend)
  - [Node.js](#nodejs)
  - [Parse.com](#parsecom-)
<% end -%>
1. [Quick Start](#quick-start)
<% if js? -%>
  - [Frontend](#frontend-1)
    - [Vanilla JavaScript](#vanilla-javascript)
    - [jQuery module](#jquery-module)
    - [AngularJS module](#angularjs-module)
  - [Backend (Node.js)](#backend-nodejs)
1. [Client options](#client-options)
1. [Callback convention](#callback-convention)
1. [Promises](#promises)
1. [Request strategy](#request-strategy)
1. [Cache](#cache)
1. [Proxy support](#proxy-support)
1. [Keep-alive](#keep-alive)
<% end -%>
<% if scala? -%>1. [Philosophy of the scala client](#philosophy)<% end %>
1. [Online documentation](#documentation)
1. [Tutorials](#tutorials)
<% if js? -%>1. [Old JavaScript clients](#old-javascript-clients)<% end -%>


**Commands Reference**

1. [Add a new object](#add-a-new-object-to-the-index)
1. [Update an object](#update-an-existing-object-in-the-index)
1. [Search](#search)
<% if swift? || objc? -%>
1. [Search cache](#search-cache)
<% end -%>
1. [Multiple queries](#multiple-queries)
1. [Get an object](#get-an-object)
1. [Delete an object](#delete-an-object)
1. [Delete by query](#delete-by-query)
1. [Index settings](#index-settings)
1. [List indices](#list-indices)
1. [Delete an index](#delete-an-index)
1. [Clear an index](#clear-an-index)
1. [Wait indexing](#wait-indexing)
1. [Batch writes](#batch-writes)
1. [Security / User API Keys](#security--user-api-keys)
1. [Copy or rename an index](#copy-or-rename-an-index)
<% if !android? -%>
1. [Backup / Retrieve all index content](#backup--retrieve-of-all-index-content)
<% end -%>
1. [Logs](#logs)
<% if ruby? %>1. [Mock](#mock)<% end %>

<%#    ************************** SETUP ********************************** %>

Setup
-------------
<% if cmd? %>To setup the command line client<% else %>To setup your project<% end %>, follow these steps:

<% if java? || scala? %>If you're using Maven, add the following dependency to your `pom.xml` file:
<%= snippet("setup_maven") %>

Initialize the client with your Application ID and API Key. You can find them on [your Algolia account](http://www.algolia.com/users/edit):
<% end %>
<% if scala? %>If you're using SBT, add the following dependency to your `build.sbt` file:
<%= snippet("setup_sbt") %>

Initialize the client with your Application ID and API Key. You can find them on [your Algolia account](http://www.algolia.com/users/edit):
<% end %>

<%= snippet("setup") %>

<% if ruby? -%>
### Ruby on Rails

If you're a Ruby on Rails user; you're probably looking for the [algoliasearch-rails](https://github.com/algolia/algoliasearch-rails) gem.
<% elsif php? -%>
### Framework Integrations

If you're a Symfony or Laravel user; you're probably looking for the following integrations:

 - **Laravel**: [algolia/algoliasearch-laravel](https://github.com/algolia/algoliasearch-laravel)
 - **Symfony**: [algolia/AlgoliaSearchBundle](https://github.com/algolia/AlgoliaSearchBundle)

<% end -%>

<%#    ************************** QUICK START ********************************** %>

Quick Start
-------------

<% if js? -%>
### Frontend

To build your frontend search experience, also check out our [examples](./examples/) and [tutorials](https://www.algolia.com/doc/tutorials).

#### Vanilla JavaScript
<%= snippet("quick_start_vanilla_javasript") %>

#### jQuery module
<%= snippet("quick_start_jquery") %>

#### AngularJS module
<%= snippet("quick_start_angularjs") %>

### Backend (Node.js)
<% end -%>

In 30 seconds, this quick start tutorial will show you how to index and search objects.

<%= snippet("quick_start_new_index") %>

You can now search for contacts using firstname, lastname, company, etc. (even with typos):
<%= snippet("quick_start_search") %>

Settings can be customized to tune the search behavior. For example, you can add a custom sort by number of followers to the already great built-in relevance:
<%= snippet("quick_start_custom_ranking") %>

You can also configure the list of attributes you want to index by order of importance (first = most important):
<%= snippet("quick_start_attributes_order") %>

Since the engine is designed to suggest results as you type, you'll generally search by prefix. In this case the order of attributes is very important to decide which hit is the best:
<%= snippet("quick_start_search_prefix") %>

<% if !cmd? && !android? && !objc? && !swift? && !js? %>
**Notes:** If you are building a web application, you may be more interested in using our [JavaScript client](https://github.com/algolia/algoliasearch-client-js) to perform queries. It brings two benefits:
  * Your users get a better response time by not going through your servers
  * It will offload unnecessary tasks from your servers

```html
<script src="//cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
<script>
var client = algoliasearch('ApplicationID', 'apiKey');
var index = client.initIndex('indexName');

// perform query "jim"
index.search('jim', searchCallback);

// the last optional argument can be used to add search parameters
index.search(
  'jim', {
    hitsPerPage: 5,
    facets: '*',
    maxValuesPerFacet: 10
  },
  searchCallback
);

function searchCallback(err, content) {
  if (err) {
    console.error(err);
    return;
  }

  console.log(content);
}
</script>
```
<% end %>

<% if js? %>
Client options
-------------

In most situations, there is no need to tune the options. We provide this list to be
transparent with our users.

- `timeout` (Number) timeout for requests to our servers, in milliseconds
  + in Node.js this is an inactivity timeout. default to 15s
  + in the browser, this is a global timeout. default to 2s (incremental)
- `protocol` (String) protocol to use when communicating with algolia
  + in the browser, we use the page protocol by default
  + in Node.js it's https by default
  + possible values: 'http:', 'https:'
- `hosts.read` ([String]) array of read hosts to use to call Algolia servers, computed automatically
- `hosts.write` ([String]) array of write hosts to use to call Algolia servers, computed automatically
- `httpAgent` ([HttpAgent](https://nodejs.org/api/http.html#http_class_http_agent)) <sup>node-only</sup> Node.js httpAgent instance to use when communicating with Algolia servers.

To pass an option, use:

```js
var client = algoliasearch(applicationId, apiKey, {
  timeout: 4000
})
```

Callback convention
-------------

Every API call takes a callback as last parameter. This callback will then be called with two arguments:

 1. **error**: null or an [Error](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error) object. More info on the error can be find in `error.message`.
 2. **content**: the object containing the answer from the server, it's a JavaScript object

Promises
-------------

**If you do not provide a callback**, you will get a promise (but never both).

Promises are the [native Promise implementation](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise).

We use [jakearchibald/es6-promise](https://github.com/jakearchibald/es6-promise/) as a polyfill when needed.

Request strategy
-------------

The request strategy used by the JavaScript client includes:

- On the browser:
  + [CORS](http://en.wikipedia.org/wiki/Cross-Origin_Resource_Sharing#Browser_support) for modern browsers
  + [XDomainRequest](https://msdn.microsoft.com/en-us/library/ie/cc288060%28v=vs.85%29.aspx) for IE <= 10
  + [JSONP](http://en.wikipedia.org/wiki/JSONP) in any situation where Ajax requests are unavailabe or blocked.
- Node.js:
  + native [`http` module](https://nodejs.org/api/)

Connections are always `keep-alive`.

Cache
-------------

**Browser only**

To avoid performing the same API calls twice **search** results will be stored in a `cache` that will be tied to your JavaScript `client` and `index` objects.

It's particularly useful when your users are deleting characters or words from the current query but has a chance of ending up with outdated results if the page isn't refreshed for some time.

If at any point you want to clear the cache, just do this:

```js
// clear the queries cache
index.clearCache();

// if you're performing multi-queries using the API client instead of the index
// you'll need to use the following code
client.clearCache();
```

Proxy support
------------

**Node.js only**

If you are behind a proxy, just set `HTTP_PROXY` or `HTTPS_PROXY` environment variables before starting your Node.js program.

```sh
HTTP_PROXY=http://someproxy.com:9320 node main.js
```

Keep-alive
-------------

**Node.js only**

Keep-alive is activated by default.

Because of the nature of keepalive connections, your process will hang even if you do not do any more command using the `client`.

To fix this, we expose a `client.destroy()` method that will terminate all remaining alive connections.

You should call this method when you are finished working with the AlgoliaSearch API. So that your process will exit gently.

**Note: keep-alive is still always activated in browsers, this is a native behavior of browsers.**

<% end %>

<% if scala? -%>
Philosophy
==========

DSL
---

The main goal of this client is to provide a human _accessible_ and _readable_ DSL for using Algolia search.

The entry point of the DSL is the [`algolia.AlgoliaDSL` object](src/main/scala/algolia/AlgoliaDsl).
This DSL is used in the `execute` method of [`algolia.AlgoliaClient`](src/main/scala/algolia/AlgoliaClient).

As we want to provide human readable DSL, there is more than one way to use this DSL. For example, to get an object by its `objectID`:
```scala
client.execute { from index "index" objectId "myId" }

//or

client.execute { get / "index" / "myId" }
```

Future
------

The `execute` method always return a [`scala.concurrent.Future`](http://www.scala-lang.org/api/2.11.7/#scala.concurrent.Future).
Depending of the operation it will be parametrized by a `case class`. For example:
```scala
var future: Future[Search] =
    client.execute {
        search into "index" query "a"
    }
```

JSON as case class
------------------
Putting or getting objects from the API is wrapped into `case class` automatically by [json4s](http://json4s.org).

If you want to get objects just search for it and unwrap the result:
```scala
case class Contact(firstname: String,
                   lastname: String,
                   followers: Int,
                   compagny: String)

var future: Future[Seq[Contact]] =
    client
        .execute {
            search into "index" query "a"
        }
        .map { search =>
            search.as[Contact]
        }
```

If you want to get the full results (with `_highlightResult`, etc.):
```scala
case class EnhanceContact(firstname: String,
                          lastname: String,
                          followers: Int,
                          compagny: String,
                          objectID: String,
                          _highlightResult: Option[Map[String, HighlightResult]
                          _snippetResult: Option[Map[String, SnippetResult]],
                          _rankingInfo: Option[RankingInfo]) extends Hit

var future: Future[Seq[EnhanceContact]] =
    client
        .execute {
            search into "index" query "a"
        }
        .map { search =>
            search.asHit[EnhanceContact]
        }
```

For indexing documents, just pass an instance of your `case class` to the DSL:
```scala
client.execute {
    index into "contacts" `object` Contact("Jimmie", "Barninger", 93, "California Paint")
}
```
<% end %>

Documentation
================
Check our [online documentation](http://www.algolia.com/doc/guides/<%= @slug %>):
 * [Initial Import](http://www.algolia.com/doc/guides/<%= @slug %>#InitialImport)
 * [Ranking &amp; Relevance](http://www.algolia.com/doc/guides/<%= @slug %>#RankingRelevance)
 * [Indexing](http://www.algolia.com/doc/guides/<%= @slug %>#Indexing)
 * [Search](http://www.algolia.com/doc/guides/<%= @slug %>#Search)
 * [Sorting](http://www.algolia.com/doc/guides/<%= @slug %>#Sorting)
 * [Filtering](http://www.algolia.com/doc/guides/<%= @slug %>#Filtering)
 * [Faceting](http://www.algolia.com/doc/guides/<%= @slug %>#Faceting)
 * [Geo-Search](http://www.algolia.com/doc/guides/<%= @slug %>#Geo-Search)
 * [Security](http://www.algolia.com/doc/guides/<%= @slug %>#Security)
 * [REST API](http://www.algolia.com/doc/rest)

Tutorials
================

Check out our [tutorials](http://www.algolia.com/doc/tutorials):
 * [Search bar with autocomplete menu](http://www.algolia.com/doc/tutorials/auto-complete)
 * [Search bar with multi category autocomplete menu](http://www.algolia.com/doc/tutorials/multi-auto-complete)
 * [Instant search result pages](http://www.algolia.com/doc/tutorials/instant-search)

<%#    ************************** API CLIENT REFERENCE JS ********************************** %>

<% if js? -%>
Old JavaScript clients
======================

In April 2015, we released the V3 of our JavaScript client (the one you are looking at) able to work in Node.js and the browser.

If you were using our browser version (V2), [read the migration guide](https://github.com/algolia/algoliasearch-client-js/wiki/Migration-guide-from-2.x.x-to-3.x.x)

If you were using our Node.js version (V1, npm `algolia-search`), [read the migration guide](https://github.com/algolia/algoliasearch-client-js/wiki/Node.js-v1.x.x-migration-guide)
<% end -%>

Commands Reference
==================

<%#    ************************** API CLIENT REFERENCE OTHERS ********************************** %>

Add a new object to the Index
-------------

Each entry in an index has a unique identifier called `objectID`. There are two ways to add en entry to the index:

 1. Using automatic `objectID` assignment. You will be able to access it in the answer.
 2. Supplying your own `objectID`.

You don't need to explicitly create an index, it will be automatically created the first time you add an object.
Objects are schema less so you don't need any configuration to start indexing. If you wish to configure things, the settings section provides details about advanced settings.

Example with automatic `objectID` assignment:

<%= snippet("add_new_object_auto") %>

Example with manual `objectID` assignment:

<%= snippet("add_new_object_manual") %>

Update an existing object in the Index
-------------

You have three options when updating an existing object:

 1. Replace all its attributes.
 2. Replace only some attributes.
 3. Apply an operation to some attributes.

Example on how to replace all attributes of an existing object:

<%= snippet("update_object") %>

You have many ways to update an object's attributes:

 1. Set the attribute value
 2. Add a string or number element to an array
 3. Remove an element from an array
 4. Add a string or number element to an array if it doesn't exist
 5. Increment an attribute
 6. Decrement an attribute

Example to update only the city attribute of an existing object:

<%= snippet("update_object_partial") %>

Example to add a tag:

<%= snippet("update_object_partial_add") %>

Example to remove a tag:

<%= snippet("update_object_partial_remove") %>

Example to add a tag if it doesn't exist:

<%= snippet("update_object_partial_add_unique") %>

Example to increment a numeric value:

<%= snippet("update_object_partial_increment") %>

Note: Here we are incrementing the value by `42`. To increment just by one, put
`value:1`.

Example to decrement a numeric value:

<%= snippet("update_object_partial_decrement") %>

Note: Here we are decrementing the value by `42`. To decrement just by one, put
`value:1`.

Search
-------------
<% if !js? && !cmd? && !android? && !objc? && !swift? %>
**Notes:** If you are building a web application, you may be more interested in using our [JavaScript client](https://github.com/algolia/algoliasearch-client-js) to perform queries. It brings two benefits:
  * Your users get a better response time by not going through your servers
  * It will offload unnecessary tasks from your servers.
<% end %>

<% if cmd? %>To perform a search, you only need to specify the index name and query.<% else %>To perform a search, you only need to initialize the index and perform a call to the search function.<% end %>

The search query allows only to retrieve 1000 hits, if you need to retrieve more than 1000 hits for seo, you can use [Backup / Retrieve all index content](#backup--retrieve-of-all-index-content)

You can use the following optional arguments<%= puts({"C#" => " on Query class", "Objective-C" => " on ASQuery class"}) %>:

### Query Parameters

#### Full Text Search Parameters

 * **<%= puts({'C#' => 'SetQueryString', 'Java' => 'setQueryString', 'Android' => 'setQueryString', 'Objective-C' => 'fullTextQuery'  }, "query") %>**: (string) The instant search query string. All words of the query are interpreted as prefixes (for example "John Mc" will match "John Mccamey" and "Johnathan Mccamey"). If no query parameter is set all objects are retrieved.
 * **<%= puts({'C#' => 'SetQueryType', 'Java' => 'setQueryType', 'Android' => 'setQueryType', 'Objective-C' => 'setQueryType'}, "queryType") %>**: Selects how the query words are interpreted. It can be one of the following values:
  * **<%= puts({'C#' => 'PREFIX_ALL', 'Java' => 'PREFIX_ALL', 'Android' => 'PREFIX_ALL'}, "prefixAll") %>**: All query words are interpreted as prefixes.
  * **<%= puts({'C#' => 'PREFIX_LAST', 'Java' => 'PREFIX_ALL', 'Android' => 'PREFIX_ALL'}, "prefixLast") %>**: Only the last word is interpreted as a prefix (default behavior).
  * **<%= puts({'C#' => 'PREFIX_NONE', 'Java' => 'PREFIX_NONE', 'Android' => 'PREFIX_NONE'}, "prefixNone") %>**: No query word is interpreted as a prefix. This option is not recommended.
 * **<%= puts({'C#' => 'SetRemoveWordsIfNoResults', 'Java' => 'removeWordsIfNoResults', 'Android' => 'removeWordsIfNoResults', 'Objective-C' => 'setRemoveWordsIfNoResults'}, "removeWordsIfNoResults") %>**: This option is used to select a strategy in order to avoid having an empty result page. There are three different options:
  * **<%= puts({'C#' => 'LAST_WORDS', 'Java' => 'REMOVE_LAST_WORDS', 'Android' => 'REMOVE_LAST_WORDS'}, "lastWords") %>**: When a query does not return any results, the last word will be added as optional. The process is repeated with n-1 word, n-2 word, ... until there are results.
  * **<%= puts({'C#' => 'FIRST_WORDS', 'Java' => 'REMOVE_FIRST_WORDS', 'Android' => 'REMOVE_FIRST_WORDS'}, "firstWords") %>**: When a query does not return any results, the first word will be added as optional. The process is repeated with second word, third word, ... until there are results.
  * **<%= puts({'C#' => 'ALL_OPTIONAL', 'Java' => 'REMOVE_ALL_OPTIONAL', 'Android' => 'REMOVE_ALL_OPTIONAL'}, "allOptional") %>**: When a query does not return any results, a second trial will be made with all words as optional. This is equivalent to transforming the AND operand between query terms to an OR operand.
  * **<%= puts({'C#' => 'NONE', 'Java' => 'REMOVE_NONE', 'Android' => 'REMOVE_NONE'}, "none") %>**: No specific processing is done when a query does not return any results (default behavior).
 * **<%= puts({'C#' => 'SetMinWordSizeToAllowOneTypo', 'Java' => 'setMinWordSizeToAllowOneTypo', 'Android' => 'setMinWordSizeToAllowOneTypo', 'Objective-C' => 'minWordSizeForApprox1'}, "minWordSizefor1Typo") %>**: The minimum number of characters in a query word to accept one typo in this word.<br/>Defaults to 4.
 * **<%= puts({'C#' => 'SetMinWordSizeToAllowTwoTypos', 'Java' => 'setMinWordSizeToAllowTwoTypos', 'Android' => 'setMinWordSizeToAllowTwoTypos', 'Objective-C' => 'minWordSizeForApprox2'}, "minWordSizefor2Typos") %>**: The minimum number of characters in a query word to accept two typos in this word.<br/>Defaults to 8.
 * **<%= puts({'C#' => 'EnableTyposOnNumericTokens', 'Java' => 'enableTyposOnNumericTokens', 'Android' => 'enableTyposOnNumericTokens'}, "allowTyposOnNumericTokens") %>**: If set to false, it disables typo tolerance on numeric tokens (numbers). Defaults to false.
 * **<%= puts({'C#' => 'SetTypoTolerance', 'Java' => 'setTypoTolerance', 'Android' => 'setTypoTolerance', 'Objective-C' => 'setTypoTolerance'}, 'typoTolerance') %>**: This option allows you to control the number of typos in the result set:
  * **<%= puts({'C#' => 'TYPO_TRUE', 'Java' => 'TYPO_TRUE', 'Android' => 'TYPO_TRUE'}, "true") %>**: The typo tolerance is enabled and all matching hits are retrieved (default behavior).
  * **<%= puts({'C#' => 'TYPO_FALSE', 'Java' => 'TYPO_FALSE', 'Android' => 'TYPO_FALSE'}, "false") %>**: The typo tolerance is disabled. For example, if one result matches without typos, then all results with typos will be hidden.
  * **<%= puts({'C#' => 'TYPO_MIN', 'Java' => 'TYPO_MIN', 'Android' => 'TYPO_MIN'}, "min") %>**: Only keep results with the minimum number of typos.
  * **<%= puts({'C#' => 'TYPO_STRICT', 'Java' => 'TYPO_STRICT', 'Android' => 'TYPO_STRICT'}, "strict") %>**: Hits matching with 2 typos are not retrieved if there are some matching without typos. This option is useful if you want to avoid false positives as much as possible.
 * **<%= puts({'C#' => 'EnableTyposOnNumericTokens', 'Java' => 'enableTyposOnNumericTokens', 'Android' => 'enableTyposOnNumericTokens'}, "allowTyposOnNumericTokens") %>**: If set to false, disables typo tolerance on numeric tokens (numbers). Defaults to true.
 * **<%= puts({'C#' => 'IgnorePlural', 'Java' => 'ignorePlural', 'Android' => 'ignorePlural'}, "ignorePlural") %>**: If set to true, plural won't be considered as a typo. For example, car and cars will be considered as equals. Defaults to false.
 * **<%= puts({'C#' => 'DisableTypoToleranceOnAttributes', 'Java' => 'disableTypoToleranceOnAttributes', 'Android' => 'disableTypoToleranceOnAttributes'}, "disableTypoToleranceOnAttributes") %>** List of attributes on which you want to disable typo tolerance (must be a subset of the `attributesToIndex` index setting). Attributes are separated with a comma such as `"name,address"`. You can also use JSON string array encoding such as `encodeURIComponent("[\"name\",\"address\"]")`. By default, this list is empty.
 * **<%= puts({'C#' => 'RestrictSearchableAttributes', 'Java' => 'restrictSearchableAttributes', 'Android' => 'restrictSearchableAttributes'}, "restrictSearchableAttributes") %>** List of attributes you want to use for textual search (must be a subset of the `attributesToIndex` index setting). Attributes are separated with a comma such as `"name,address"`. You can also use JSON string array encoding such as `encodeURIComponent("[\"name\",\"address\"]")`. By default, all attributes specified in `attributesToIndex` settings are used to search.
 * **<%= puts({'C#' => 'EnableRemoveStopWords', 'Java' => 'enableRemoveStopWords', 'Android' => 'enableRemoveStopWords'}, 'removeStopWords') %>**: Remove stop words from query before executing it. Defaults to false. Contains stop words for 41 languages (Arabic, Armenian, Basque, Bengali, Brazilian, Bulgarian, Catalan, Chinese, Czech, Danish, Dutch, English, Finnish, French, Galician, German, Greek, Hindi, Hungarian, Indonesian, Irish, Italian, Japanese, Korean, Kurdish, Latvian, Lithuanian, Marathi, Norwegian, Persian, Polish, Portugese, Romanian, Russian, Slovak, Spanish, Swedish, Thai, Turkish, Ukranian, Urdu).
 * **<%= puts({'C#' => 'EnableAdvancedSyntax', 'Java' => 'enableAdvancedSyntax', 'Android' => 'enableAdvancedSyntax'}, 'advancedSyntax') %>**: Enables the advanced query syntax. Defaults to 0 (false).
    * **Phrase query**: A phrase query defines a particular sequence of terms. A phrase query is built by Algolia's query parser for words surrounded by `"`. For example, `"search engine"` will retrieve records having `search` next to `engine` only. Typo tolerance is _disabled_ on phrase queries.
    * **Prohibit operator**: The prohibit operator excludes records that contain the term after the `-` symbol. For example, `search -engine` will retrieve records containing `search` but not `engine`.
 * **<%= puts({'C#' => 'EnableAnalytics', 'Java' => 'enableAnalytics', 'Android' => 'enableAnalytics'}, 'analytics') %>**: If set to false, this query will not be taken into account in the analytics feature. Defaults to true.
 * **<%= puts({'C#' => 'EnableSynonyms', 'Java' => 'enableSynonyms', 'Android' => 'enableSynonyms'}, 'synonyms') %>**: If set to false, this query will not use synonyms defined in the configuration. Defaults to true.
 * **<%= puts({'C#' => 'EnableReplaceSynonymsInHighlight', 'Java' => 'enableReplaceSynonymsInHighlight', 'Android' => 'enableReplaceSynonymsInHighlight'}, 'replaceSynonymsInHighlight') %>**: If set to false, words matched via synonym expansion will not be replaced by the matched synonym in the highlight results. Defaults to true.
<% if objc?  -%>
 * **optionalWords**: An array of strings that contain the list of words that should be considered as optional when found in the query.
<% else -%>
 * **<%= puts({'C#' => 'SetOptionalWords', 'Java' => 'setOptionalWords', 'Android' => 'setOptionalWords'}, "optionalWords") %>**: A string that contains the comma separated list of words that should be considered as optional when found in the query.
<% end -%>

#### Pagination Parameters

 * **<%= puts({'C#' => 'SetPage', 'Java' => 'setPage', 'Android' => 'setPage'}, "page") %>**: (integer) Pagination parameter used to select the page to retrieve.<br/>Page is zero based and defaults to 0. Thus, to retrieve the 10th page you need to set `page=9`.
 * **<%= puts({'C#' => 'SetNbHitsPerPage', 'Java' => 'setHitsPerPage', 'Android' => 'setHitsPerPage'}, "hitsPerPage") %>**: (integer) Pagination parameter used to select the number of hits per page. Defaults to 20.

#### Geo-search Parameters
<% if csharp? || java? || android? || objc? %>
 * **<%= puts ({'C#' => 'AroundLatitudeLongitude(float, float)', 'Java' => 'aroundLatitudeLongitude(float, float)', 'Android' => 'aroundLatitudeLongitude(float, float)', 'Objective-C' => 'searchAroundLatitude:longitude:'}) %>**: Search for entries around a given latitude/longitude.<br/>The maximum distance is automatically guessed depending of the density of the area but you also manually specify the maximum distance in meters with the **<%= puts({'Objective-C' => 'maxDist'}, "radius") %>** parameter.<br/>At indexing, you should specify the geo location of an object with the `_geoloc` attribute in the form ` {"_geoloc":{"lat":48.853409, "lng":2.348800}} `.
 * **<%= puts ({'C#' => 'AroundLatitudeLongitude(float, float, int, int)', 'Java' => 'aroundLatitudeLongitude(float, float, int, int)', 'Android' => 'aroundLatitudeLongitude(float, float, int, int)', 'Objective-C' => 'searchAroundLatitude:longitude:maxDist:precision'}) %>**: Search for entries around a given latitude/longitude with a given precision for ranking. For example, if you set aroundPrecision=100, the distances will be considered by ranges of 100m, for example all distances 0 and 100m will be considered as identical for the "geo" ranking parameter.
<% else %>
 * **aroundLatLng**: Search for entries around a given latitude/longitude (specified as two floats separated by a comma).<br/>For example, `aroundLatLng=47.316669,5.016670`.<br/>By default the maximum distance is automatically guessed based on the density of the area but you can specify it manually in meters with the **aroundRadius** parameter. The precision for ranking can be set with **aroundPrecision** parameter. For example, if you set aroundPrecision=100, the distances will be considered by ranges of 100m, for example all distances 0 and 100m will be considered as identical for the "geo" ranking parameter.<br/>When **aroundRadius** is not set, the radius is computed automatically using the density of the area, you can retrieve the computed radius in the **automaticRadius** attribute of the answer, you can also use the **minimumAroundRadius** query parameter to specify a minimum radius in meters for the automatic computation of **aroundRadius**.<br/>At indexing, you should specify geoloc of an object with the _geoloc attribute (in the form `"_geoloc":{"lat":48.853409, "lng":2.348800}` or `"_geoloc":[{"lat":48.853409, "lng":2.348800},{"lat":48.547456, "lng":2.972075}]` if you have several geo-locations in your record).<% end %>
<% if csharp? || java? || android? || objc? %>
 * **<%= puts ({'C#' => 'AroundLatitudeLongitudeViaIP()', 'Java' => 'aroundLatitudeLongitudeViaIP()', 'Android' => 'aroundLatitudeLongitudeViaIP()', 'Objective-C' => 'searchAroundLatitudeLongitudeViaIP'}) %>**: Search for entries around the latitude/longitude automatically computed from user IP address.<br/>The radius is automatically guessed based on density but you can also specify it manually with the **<%= puts({'Objective-C' => 'maxDist'}, "radius") %>** parameter (optional).<br/>At indexing, you should specify the geo location of an object with the `_geoloc` attribute in the form ` {"_geoloc":{"lat":48.853409, "lng":2.348800}} `.
 * **<%= puts ({'C#' => 'AroundLatitudeLongitudeViaIP(int, int)', 'Java' => 'aroundLatitudeLongitudeViaIP(int, int)', 'Android' => 'aroundLatitudeLongitudeViaIP(int, int)', 'Objective-C' => 'searchAroundLatitudeLlongitude:precision'}) %>**: Search for entries around a latitude/longitude automatically computed from user IP address with a given precision for ranking. For example if you set precision=100, two objects that are a distance of less than 100 meters will be considered as identical for the "geo" ranking parameter.
<% else %>
 * **aroundLatLngViaIP**: Search for entries around a given latitude/longitude automatically computed from user IP address.<br/>For example, `aroundLatLng=47.316669,5.016670`.<br/>You can specify the maximum distance in meters with the **aroundRadius** parameter and the precision for ranking with **aroundPrecision**. For example, if you set aroundPrecision=100, two objects that are in the range 0-99m will be considered as identic in the ranking for the "geo" ranking parameter (same for 100-199, 200-299, ... ranges).<br/>At indexing, you should specify the geo location of an object with the `_geoloc` attribute in the form `{"_geoloc":{"lat":48.853409, "lng":2.348800}}`.<% end %>

 * **<%= puts({'C#' => 'InsideBoundingBox', 'Objective-C' => "searchInsideBoundingBoxWithLatitudeP1:longitudeP1:latitudeP2:longitudeP2"}, "insideBoundingBox") %>**: Search entries inside a given area defined by the two extreme points of a rectangle (defined by 4 floats: p1Lat,p1Lng,p2Lat,p2Lng).<br/>For example, `<%= puts({'C#' => 'InsideBoundingBox(47.3165, 4.9665, 47.3424, 5.0201)', 'Objective-C' => "searchInsideBoundingBoxWithLatitudeP1(47.3165, 4.9665, 47.3424, 5.0201)"}, "insideBoundingBox=47.3165,4.9665,47.3424,5.0201") %>`).<br/>At indexing, you should specify geoloc of an object with the _geoloc attribute (in the form `"_geoloc":{"lat":48.853409, "lng":2.348800}` or `"_geoloc":[{"lat":48.853409, "lng":2.348800},{"lat":48.547456, "lng":2.972075}]` if you have several geo-locations in your record). You can use several bounding boxes (OR) by passing more than 4 values. For example instead of having 4 values you can pass 8 to use or OR between two bounding boxes.
 * **<%= puts({'C#' => 'InsidePolygon', 'Objective-C' => "searchInsidePolygon:"}, "insidePolygon") %>**: Search entries inside a given area defined by a set of points (defined by a minimum of 6 floats: p1Lat,p1Lng,p2Lat,p2Lng,p3Lat,p3Long).<br/>For example, `<%= puts({'C#' => 'InsidePolygon(47.3165, 4.9665, 47.3424, 5.0201, 47.32, 4.98)', 'Objective-C' => "searchInsidePolygon(47.3165, 4.9665, 47.3424, 5.0201)"}, "insideBoundingBox=47.3165,4.9665,47.3424,5.0201") %>`).<br/>At indexing, you should specify geoloc of an object with the _geoloc attribute (in the form `"_geoloc":{"lat":48.853409, "lng":2.348800}` or `"_geoloc":[{"lat":48.853409, "lng":2.348800},{"lat":48.547456, "lng":2.972075}]` if you have several geo-locations in your record).

#### Parameters to Control Results Content
<% if csharp? || java? || android? || objc? %>
 * **<%= puts({'C#' => 'SetAttributesToRetrieve', 'Java' => 'setAttributesToRetrieve', 'Android' => 'setAttributesToRetrieve', 'Objective-C' => 'attributesToRetrieve'}) %>**: The list of object attributes you want to retrieve in order to minimize the answer size. By default, all attributes are retrieved. You can also use `*` to retrieve all values when an **attributesToRetrieve** setting is specified for your index.
 * **<%= puts({'C#' => 'SetAttributesToHighlight', 'Java' => 'setAttributesToHighlight', 'Android' => 'setAttributesToHighlight', 'Objective-C' => 'attributesToHighlight'}) %>**: The list of attributes you want to highlight according to the query. If an attribute has no match for the query, the raw value is returned. By default, all indexed text attributes are highlighted. You can use `*` if you want to highlight all textual attributes. Numerical attributes are not highlighted. A matchLevel is returned for each highlighted attribute and can contain:
  * **full**: If all the query terms were found in the attribute.
  * **partial**: If only some of the query terms were found.
  * **none**: If none of the query terms were found.
 * **<%= puts({'C#' => 'SetAttributesToSnippet', 'Java' => 'setAttributesToSnippet', 'Android' => 'setAttributesToSnippet', 'Objective-C' => 'attributesToSnippet'}) %>**: The list of attributes to snippet alongside the number of words to return (syntax is `attributeName:nbWords`). By default, no snippet is computed.
 * **<%= puts({'C#' => 'GetRankingInfo', 'Java' => 'getRankingInfo', 'Android' => 'getRankingInfo', 'Objective-C' => 'getRankingInfo'}) %>**: If set to <%= puts({'Objective-C' => 'YES'}, "true") %>, the result hits will contain ranking information in the **_rankingInfo** attribute.
 * **<%= puts({'C#' => 'SetHighlightPreTag', 'Java' => 'setHighlightingTags', 'Android' => 'setHighlightingTags', 'Objective-C' => 'setHighlightingTags'}) %>**: (string, string) Specify the string that is inserted before the highlighted parts in the query result (defaults to "&lt;em&gt;") and the string that is inserted after the highlighted parts in the query result (defaults to "&lt;/em&gt;")..
<% else %>
 * **attributesToRetrieve**: A string that contains the list of object attributes you want to retrieve in order to minimize the answer size.<br/> Attributes are separated with a comma (for example `"name,address"`). You can also use a string array encoding (for example `["name","address"]` ). By default, all attributes are retrieved. You can also use `*` to retrieve all values when an **attributesToRetrieve** setting is specified for your index.
 * **attributesToHighlight**: A string that contains the list of attributes you want to highlight according to the query. Attributes are separated by commas. You can also use a string array encoding (for example `["name","address"]`). If an attribute has no match for the query, the raw value is returned. By default all indexed text attributes are highlighted. You can use `*` if you want to highlight all textual attributes. Numerical attributes are not highlighted. A matchLevel is returned for each highlighted attribute and can contain:
  * **full**: If all the query terms were found in the attribute.
  * **partial**: If only some of the query terms were found.
  * **none**: If none of the query terms were found.
 * **attributesToSnippet**: A string that contains the list of attributes to snippet alongside the number of words to return (syntax is `attributeName:nbWords`). Attributes are separated by commas (Example: `attributesToSnippet=name:10,content:10`). <br/>You can also use a string array encoding (Example: `attributesToSnippet: ["name:10","content:10"]`). By default, no snippet is computed.
 * **getRankingInfo**: If set to 1, the result hits will contain ranking information in the **_rankingInfo** attribute.
 * **highlightPreTag**: (string) Specify the string that is inserted before the highlighted parts in the query result (defaults to "&lt;em&gt;").
 * **highlightPostTag**: (string) Specify the string that is inserted after the highlighted parts in the query result (defaults to "&lt;/em&gt;").
 <% end %>

#### Numeric Search Parameters
 * **<%= puts({'C#' => 'SetNumericFilters', 'Java' => 'setNumericFilters', 'Android' => 'setNumericFilters'}, "numericFilters") %>**: A string that contains the comma separated list of numeric filters you want to apply. The filter syntax is `attributeName` followed by `operand` followed by `value`. Supported operands are `<`, `<=`, `=`, `>` and `>=`.

You can easily perform range queries via the `:` operator. This is equivalent to combining a `>=` and `<=` operand. For example, `numericFilters=price:10 to 1000`.

You can also mix OR and AND operators. The OR operator is defined with a parenthesis syntax. For example, `(code=1 AND (price:[0-100] OR price:[1000-2000]))` translates to `encodeURIComponent("code=1,(price:0 to 10,price:1000 to 2000)")`.

You can also use a string array encoding (for example `numericFilters: ["price>100","price<1000"]`).

#### Category Search Parameters
 * **<%= puts({'C#' => 'SetTagFilters', 'Java' => 'setTagFilters', 'Android' => 'setTagFilters'}, "tagFilters") %>**: Filter the query by a set of tags. You can AND tags by separating them with commas. To OR tags, you must add parentheses. For example, `tags=tag1,(tag2,tag3)` means *tag1 AND (tag2 OR tag3)*. You can also use a string array encoding. For example, `tagFilters: ["tag1",["tag2","tag3"]]` means *tag1 AND (tag2 OR tag3)*.<br/>At indexing, tags should be added in the **_tags** attribute of objects. For example `{"_tags":["tag1","tag2"]}`.

#### Faceting Parameters
 * **<%= puts({'C#' => 'SetFaceFilters', 'Java' => 'setFacetFilters', 'Android' => 'setFacetFilters'}, "facetFilters") %>**: Filter the query with a list of facets. Facets are separated by commas and is encoded as `attributeName:value`. To OR facets, you must add parentheses. For example: `facetFilters=(category:Book,category:Movie),author:John%20Doe`. You can also use a string array encoding. For example, `[["category:Book","category:Movie"],"author:John%20Doe"]`.
 * **<%= puts({'C#' => 'SetFacets', 'Java' => 'setFacets', 'Android' => 'setFacets'}, "facets") %>**: List of object attributes that you want to use for faceting. <br/>Attributes are separated with a comma. For example, `"category,author"`. You can also use JSON string array encoding. For example, `["category","author"]`. Only the attributes that have been added in **attributesForFaceting** index setting can be used in this parameter. You can also use `*` to perform faceting on all attributes specified in **attributesForFaceting**. If the number of results is important, the count can be approximate, the attribute `exhaustiveFacetsCount` in the response is true when the count is exact.
 * **<%= puts({'C#' => 'SetMaxValuesPerFacet', 'Java' => 'setMaxValuesPerFacet', 'Android' => 'setMaxValuesPerFacet'}, "maxValuesPerFacet") %>**: Limit the number of facet values returned for each facet. For example, `maxValuesPerFacet=10` will retrieve a maximum of 10 values per facet.

#### UNIFIED FILTER PARAMETER (SQL LIKE)
 * **<%= puts({'C#' => 'SetFilters', 'Java' => 'setFilters', 'Android' => 'setFilters'}, "filters") %>**: Filter the query with numeric, facet or/and tag filters. The syntax is a SQL like syntax, you can use the OR and AND keywords. The syntax for the underlying numeric, facet and tag filters is the same than in the other filters:
  `available=1 AND (category:Book OR NOT category:Ebook) AND public`
  `date: 1441745506 TO 1441755506 AND inStock > 0 AND author:"John Doe"`
The list of keywords is:
 **OR**: create a disjunctive filter between two filters.
 **AND**: create a conjunctive filter between two filters.
 **TO**: used to specify a range for a numeric filter.
 **NOT**: used to negate a filter. The syntax with the ‘-‘ isn’t allowed.

 *Note*: To specify a value with spaces or with a value equal to a keyword, it's possible to add quotes.

 **Warning:**
  * Like for the other filter for performance reason, it's not possible to have FILTER1 OR (FILTER2 AND FILTER3).
  * It's not possible to mix different category of filter inside a OR like num=3 OR tag1 OR facet:value
  * It's not possible to negate an group, it's only possible to negate a filters:  NOT(FILTER1 OR (FILTER2) is not allowed.


#### Distinct Parameter
 * **<%= puts({'C#' => 'EnableDistinct', 'Java' => 'setDistinct', 'Android' => 'setDistinct'}, "distinct") %>**: If set to <%= puts({'C#' => "YES", 'Java' => 'true', 'Android' => 'true', 'Objective-C' => 'YES'}, "1") %>, enables the distinct feature, disabled by default, if the `attributeForDistinct` index setting is set. This feature is similar to the SQL "distinct" keyword. When enabled in a query with the `distinct=1` parameter, all hits containing a duplicate value for the attributeForDistinct attribute are removed from results. For example, if the chosen attribute is `show_name` and several hits have the same value for `show_name`, then only the best one is kept and the others are removed.

<%= snippet("query") %>

The server response will look like:

```json
{
  "hits": [
    {
      "firstname": "Jimmie",
      "lastname": "Barninger",
      "objectID": "433",
      "_highlightResult": {
        "firstname": {
          "value": "<em>Jimmie</em>",
          "matchLevel": "partial"
        },
        "lastname": {
          "value": "Barninger",
          "matchLevel": "none"
        },
        "company": {
          "value": "California <em>Paint</em> & Wlpaper Str",
          "matchLevel": "partial"
        }
      }
    }
  ],
  "page": 0,
  "nbHits": 1,
  "nbPages": 1,
  "hitsPerPage": 20,
  "processingTimeMS": 1,
  "query": "jimmie paint",
  "params": "query=jimmie+paint&attributesToRetrieve=firstname,lastname&hitsPerPage=50"
}
```

<% if swift? || objc? %>

Search cache
------------

You can easily cache the results of the search queries by enabling the search cache.
The results will be cached during a defined amount of time (default: 2 min).
There is no pre-caching mechanism but you can simulated it by making search queries.

By default, the cache is disabled.

<%= snippet("search_cache") %>

<% end %>

<% if !cmd? %>

Multiple queries
--------------

You can send multiple queries with a single API call using a batch of queries:

<%= snippet("multiple_queries") %>

The resulting JSON answer contains a ```results``` array storing the underlying queries answers. The answers order is the same than the requests order.

You can specify a strategy to optimize your multiple queries:
- **none**: Execute the sequence of queries until the end.
- **stopIfEnoughMatches**: Execute the sequence of queries until the number of hits is reached by the sum of hits.

<% end %>

Get an object
-------------

You can easily retrieve an object using its `objectID` and optionally specify a comma separated list of attributes you want:

<%= snippet("get_object") %>

You can also retrieve a set of objects:

<%= snippet("get_objects") %>

Delete an object
-------------

You can delete an object using its `objectID`:

<%= snippet("delete_object") %>

<% if !cmd? %>
Delete by query
-------------

You can delete all objects matching a single query with the following code. Internally, the API client performs the query, deletes all matching hits, and waits until the deletions have been applied.

<%= snippet("delete_by_query") %>
<% end %>

Index Settings
-------------

You can retrieve all settings using the `<%= puts({ "JavaScript" => "getSettings", "PHP" => "getSettings", "Python" => "get_settings", "Ruby" => "get_settings", "Shell" => "settings", 'C#' => "GetSettings", 'Java' => 'getSettings', 'Android' => 'getSettings' , 'Objective-C' => 'getSettings', 'GO' => "GetSettings"}) %>` function. The result will contain the following attributes:


#### Indexing parameters
 * **attributesToIndex**: (array of strings) The list of fields you want to index.<br/>If set to null, all textual and numerical attributes of your objects are indexed. Be sure to update it to get optimal results.<br/>This parameter has two important uses:
  * *Limit the attributes to index*.<br/>For example, if you store a binary image in base64, you want to store it and be able to retrieve it, but you don't want to search in the base64 string.
  * *Control part of the ranking*.<br/>(see the ranking parameter for full explanation) Matches in attributes at the beginning of the list will be considered more important than matches in attributes further down the list. In one attribute, matching text at the beginning of the attribute will be considered more important than text after. You can disable this behavior if you add your attribute inside `unordered(AttributeName)`. For example, `attributesToIndex: ["title", "unordered(text)"]`.
You can decide to have the same priority for two attributes by passing them in the same string using a comma as a separator. For example `title` and `alternative_title` have the same priority in this example, which is different than text priority: `attributesToIndex:["title,alternative_title", "text"]`.
* **numericAttributesToIndex**: (array of strings) All numerical attributes are automatically indexed as numerical filters. If you don't need filtering on some of your numerical attributes, you can specify this list to speed up the indexing.<br/> If you only need to filter on a numeric value with the operator '=', you can speed up the indexing by specifying the attribute with `equalOnly(AttributeName)`. The other operators will be disabled.
 * **attributesForFaceting**: (array of strings) The list of fields you want to use for faceting. All strings in the attribute selected for faceting are extracted and added as a facet. If set to null, no attribute is used for faceting.
 * **attributeForDistinct**: The attribute name used for the `Distinct` feature. This feature is similar to the SQL "distinct" keyword. When enabled in queries with the `distinct=1` parameter, all hits containing a duplicate value for this attribute are removed from results. For example, if the chosen attribute is `show_name` and several hits have the same value for `show_name`, then only the best one is kept and others are removed.
 * **ranking**: (array of strings) Controls the way results are sorted.<br/>We have nine available criteria:
  * **typo**: Sort according to number of typos.
  * **geo**: Sort according to decreasing distance when performing a geo location based search.
  * **words**: Sort according to the number of query words matched by decreasing order. This parameter is useful when you use the `optionalWords` query parameter to have results with the most matched words first.
  * **proximity**: Sort according to the proximity of the query words in hits.
  * **attribute**: Sort according to the order of attributes defined by attributesToIndex.
  * **exact**:
    * If the user query contains one word: sort objects having an attribute that is exactly the query word before others. For example, if you search for the TV show "V", you want to find it with the "V" query and avoid getting all popular TV shows starting by the letter V before it.
    * If the user query contains multiple words: sort according to the number of words that matched exactly (not as a prefix).
  * **custom**: Sort according to a user defined formula set in the **customRanking** attribute.
  * **asc(attributeName)**: Sort according to a numeric attribute using ascending order. **attributeName** can be the name of any numeric attribute in your records (integer, double or boolean).
  * **desc(attributeName)**: Sort according to a numeric attribute using descending order. **attributeName** can be the name of any numeric attribute in your records (integer, double or boolean). <br/>The standard order is ["typo", "geo", "words", "proximity", "attribute", "exact", "custom"].
 * **customRanking**: (array of strings) Lets you specify part of the ranking.<br/>The syntax of this condition is an array of strings containing attributes prefixed by the asc (ascending order) or desc (descending order) operator. For example, `"customRanking" => ["desc(population)", "asc(name)"]`.
 * **queryType**: Select how the query words are interpreted. It can be one of the following values:
  * **prefixAll**: All query words are interpreted as prefixes.
  * **prefixLast**: Only the last word is interpreted as a prefix (default behavior).
  * **prefixNone**: No query word is interpreted as a prefix. This option is not recommended.
 * **separatorsToIndex**: Specify the separators (punctuation characters) to index. By default, separators are not indexed. Use `+#` to be able to search Google+ or C#.
 * **slaves**: The list of indices on which you want to replicate all write operations. In order to get response times in milliseconds, we pre-compute part of the ranking during indexing. If you want to use different ranking configurations depending of the use case, you need to create one index per ranking configuration. This option enables you to perform write operations only on this index and automatically update slave indices with the same operations.
 * **unretrievableAttributes**: The list of attributes that cannot be retrieved at query time. This feature allows you to have attributes that are used for indexing and/or ranking but cannot be retrieved. Defaults to null.
 * **allowCompressionOfIntegerArray**: Allows compression of big integer arrays. We recommended enabling this feature and then storing the list of user IDs or rights as an integer array. When enabled, the integer array is reordered to reach a better compression ratio. Defaults to false.

#### Query expansion
 * **synonyms**: (array of array of string considered as equals). For example, you may want to retrieve the **black ipad** record when your users are searching for **dark ipad**, even if the word **dark** is not part of the record. To do this, you need to configure **black** as a synonym of **dark**. For example, `"synomyms": [ [ "black", "dark" ], [ "small", "little", "mini" ], ... ]`. Synonym feature also supports multi-words expression like `"synonyms": [ ["NY", "New York"] ]`
 * **placeholders**: (hash of array of words). This is an advanced use case to define a token substitutable by a list of words without having the original token searchable. It is defined by a hash associating placeholders to lists of substitutable words. For example, `"placeholders": { "<streetnumber>": ["1", "2", "3", ..., "9999"]}` would allow it to be able to match all street numbers. We use the `< >` tag syntax to define placeholders in an attribute. For example:
  * Push a record with the placeholder: `{ "name" : "Apple Store", "address" : "&lt;streetnumber&gt; Opera street, Paris" }`.
  * Configure the placeholder in your index settings: `"placeholders": { "<streetnumber>" : ["1", "2", "3", "4", "5", ... ], ... }`.
 * **disableTypoToleranceOnWords**: (string array) Specify a list of words on which automatic typo tolerance will be disabled.
 * **disableTypoToleranceOnAttributes**: (string array) List of attributes on which you want to disable typo tolerance (must be a subset of the `attributesToIndex` index setting). By default the list is empty.
 * **altCorrections**: (object array) Specify alternative corrections that you want to consider. Each alternative correction is described by an object containing three attributes:
  * **word**: The word to correct.
  * **correction**: The corrected word.
  * **nbTypos** The number of typos (1 or 2) that will be considered for the ranking algorithm (1 typo is better than 2 typos).

  For example `"altCorrections": [ { "word" : "foot", "correction": "feet", "nbTypos": 1 }, { "word": "feet", "correction": "foot", "nbTypos": 1 } ]`.

#### Default query parameters (can be overwritten by queries)
 * **minWordSizefor1Typo**: (integer) The minimum number of characters needed to accept one typo (default = 4).
 * **minWordSizefor2Typos**: (integer) The minimum number of characters needed to accept two typos (default = 8).
 * **hitsPerPage**: (integer) The number of hits per page (default = 10).
 * **attributesToRetrieve**: (array of strings) Default list of attributes to retrieve in objects. If set to null, all attributes are retrieved.
 * **attributesToHighlight**: (array of strings) Default list of attributes to highlight. If set to null, all indexed attributes are highlighted.
 * **attributesToSnippet**: (array of strings) Default list of attributes to snippet alongside the number of words to return (syntax is 'attributeName:nbWords').<br/>By default, no snippet is computed. If set to null, no snippet is computed.
 * **highlightPreTag**: (string) Specify the string that is inserted before the highlighted parts in the query result (defaults to "&lt;em&gt;").
 * **highlightPostTag**: (string) Specify the string that is inserted after the highlighted parts in the query result (defaults to "&lt;/em&gt;").
 * **optionalWords**: (array of strings) Specify a list of words that should be considered optional when found in the query.
 * **allowTyposOnNumericTokens**: (boolean) If set to false, disable typo-tolerance on numeric tokens (=numbers) in the query word. For example the query `"304"` will match with `"30450"`, but not with `"40450"` that would have been the case with typo-tolerance enabled. Can be very useful on serial numbers and zip codes searches. Default to false.
 * **ignorePlurals**: (boolean) If set to true, simple plural forms won’t be considered as typos (for example car/cars will be considered as equal). Default to false.
 * **advancedSyntax**: Enable the advanced query syntax. Defaults to 0 (false).

  * **Phrase query:** a phrase query defines a particular sequence of terms. A phrase query is build by Algolia's query parser for words surrounded by `"`. For example, `"search engine"` will retrieve records having `search` next to `engine` only. Typo-tolerance is disabled on phrase queries.

  * **Prohibit operator:** The prohibit operator excludes records that contain the term after the `-` symbol. For example `search -engine` will retrieve records containing `search` but not `engine`.
 * **replaceSynonymsInHighlight**: (boolean) If set to false, words matched via synonyms expansion will not be replaced by the matched synonym in the highlighted result. Default to true.
 * **maxValuesPerFacet**: (integer) Limit the number of facet values returned for each facet. For example: `maxValuesPerFacet=10` will retrieve max 10 values per facet.
 * **distinct**: (integer) Enable the distinct feature (disabled by default) if the `attributeForDistinct` index setting is set. This feature is similar to the SQL "distinct" keyword: when enabled in a query with the `distinct=1` parameter, all hits containing a duplicate value for the`attributeForDistinct` attribute are removed from results. For example, if the chosen attribute is `show_name` and several hits have the same value for `show_name`, then only the best one is kept and others are removed.
 * **typoTolerance**: (string) This setting has four different options:

  * **true:** activate the typo-tolerance (default value).

  * **false:** disable the typo-tolerance

  * **min:** keep only results with the lowest number of typo. For example if one result match without typos, then all results with typos will be hidden.

  * **strict:** if there is a match without typo, then all results with 2 typos or more will be removed. This option is useful if you want to avoid as much as possible false positive.
 * **removeStopWords**: (boolean) Remove stop words from query before executing it. Defaults to false. Contains stop words for 41 languages (Arabic, Armenian, Basque, Bengali, Brazilian, Bulgarian, Catalan, Chinese, Czech, Danish, Dutch, English, Finnish, French, Galician, German, Greek, Hindi, Hungarian, Indonesian, Irish, Italian, Japanese, Korean, Kurdish, Latvian, Lithuanian, Marathi, Norwegian, Persian, Polish, Portugese, Romanian, Russian, Slovak, Spanish, Swedish, Thai, Turkish, Ukranian, Urdu)

You can easily retrieve settings or update them:

<%= snippet("index_settings") %>

List indices
-------------
You can list all your indices along with their associated information (number of entries, disk size, etc.) with the `<%= puts({ "JavaScript" => "listIndexes", "PHP" => "listIndexes", "Python" => "list_indexes", "Ruby" => "list_indexes", "Shell" => "indexes", "C#" => "listIndexes", "Java" => "listIndexes", "Android" => "listIndexes", "Objective-C" => "listIndexes", "GO" => "ListIndexes" }) %>` method:

<%= snippet("list_index") %>

Delete an index
-------------
You can delete an index using its name:

<%= snippet("delete_index") %>

Clear an index
-------------
You can delete the index contents without removing settings and index specific API keys by using the clearIndex command:

<%= snippet("clear_index") %>

Wait indexing
-------------

All write operations in Algolia are asynchronous by design.

It means that when you add or update an object to your index, our servers will
reply to your request with a `taskID` as soon as they understood the write
operation.

The actual insert and indexing will be done after replying to your code.

You can wait for a task to complete using <%= import("wait_task.info", ["Ruby"],
"the `waitTask` method on the `taskID` returned by a write operation.") %>

For example, to wait for indexing of a new object:
<%= snippet("wait_indexing") %>

If you want to ensure multiple objects have been indexed, you only need to check
the biggest `taskID`<%= puts({ "Ruby" => " with `wait_task`" }) %>.

Batch writes
-------------

You may want to perform multiple operations with one API call to reduce latency.
We expose four methods to perform batch operations:
 * `<%= puts({ "JavaScript" => "addObjects", "PHP" => "addObjects", "Python" => "add_objects", "Ruby" => "add_objects", "Shell" => "addObject", 'C#' => 'AddObjects', 'Java' => 'addObjects', 'Android' => 'addObjects', 'Objective-C' => 'addObjects', 'GO' => 'AddObjects' }) %>`: Add an array of objects using automatic `objectID` assignment.
 * `<%= puts({ "JavaScript" => "saveObjects", "PHP" => "saveObjects", "Python" => "save_objects", "Ruby" => "save_objects", "Shell" => "saveObject", 'C#' => 'SaveObjects', 'Java' => 'saveObjects', 'Android' => 'saveObjects', 'Objective-C' => 'saveObjects', 'GO' => 'UpdateObjects' }) %>`: Add or update an array of objects that contains an `objectID` attribute.
 * `<%= puts({ "JavaScript" => "deleteObjects", "PHP" => "deleteObjects", "Python" => "delete_objects", "Ruby" => "delete_objects", "Shell" => "deleteObject", 'C#' => 'DeleteObjects', 'Java' => 'deleteObjects', 'Android' => 'deleteObjects', 'Objective-C' => 'deleteObjects', 'GO' => "DeleteObjects" }) %>`: Delete an array of objectIDs.
 * `<%= puts({ "JavaScript" => "partialUpdateObjects", "PHP" => "partialUpdateObjects", "Python" => "partial_update_objects", "Ruby" => "partial_update_objects", "Shell" => "partialUpdate", 'C#' => "PartialUpdateObjects", 'Java' => 'partialUpdateObjects', 'Android' => 'partialUpdateObjects', 'Objective-C' => 'partialUpdateObjects', 'GO' => 'PartialUpdateObjects' }) %>`: Partially update an array of objects that contain an `objectID` attribute (only specified attributes will be updated).

Example using automatic `objectID` assignment:
<%= snippet("batch_new_objects") %>

Example with user defined `objectID` (add or update):
<%= snippet("batch_update") %>

Example that deletes a set of records:
<%= snippet("batch_delete") %>

Example that updates only the `firstname` attribute:
<%= snippet("batch_update_partial") %>

<% if php? %>
Custom batch:
<%= snippet("custom_batch") %>
<% end %>

If you have one index per user, you may want to perform a batch operations across severals indexes.
We expose a method to perform this type of batch:
<%= snippet("batch_multiple_indexes") %>

The attribute **action** can have these values:
- addObject
- updateObject
- partialUpdateObject
- partialUpdateObjectNoCreate
- deleteObject

Security / User API Keys
-------------

The admin API key provides full control of all your indices.
You can also generate user API keys to control security.
These API keys can be restricted to a set of operations or/and restricted to a given index.

<%= snippet("security_list_key") %>

Each key is defined by a set of permissions that specify the authorized actions. The different permissions are:
 * **search**: Allowed to search.
 * **browse**: Allowed to retrieve all index contents via the browse API.
 * **addObject**: Allowed to add/update an object in the index.
 * **deleteObject**: Allowed to delete an existing object.
 * **deleteIndex**: Allowed to delete index content.
 * **settings**: allows to get index settings.
 * **editSettings**: Allowed to change index settings.
 * **analytics**: Allowed to retrieve analytics through the analytics API.
 * **listIndexes**: Allowed to list all accessible indexes.

Example of API Key creation:
<%= snippet("security_add_user_key_simple") %>

You can also create an API Key with advanced settings:

 * **validity**: Add a validity period. The key will be valid for a specific period of time (in seconds).
 * **maxQueriesPerIPPerHour**: Specify the maximum number of API calls allowed from an IP address per hour. Each time an API call is performed with this key, a check is performed. If the IP at the source of the call did more than this number of calls in the last hour, a 403 code is returned. Defaults to 0 (no rate limit). This parameter can be used to protect you from attempts at retrieving your entire index contents by massively querying the index.
<% if !cmd? && !csharp? && !android? && !objc? && !swift? %>
<%= snippet("security_note_forward") %>
<% end %>
 * **maxHitsPerQuery**: Specify the maximum number of hits this API key can retrieve in one call. Defaults to 0 (unlimited). This parameter can be used to protect you from attempts at retrieving your entire index contents by massively querying the index.
 * **indexes**: Specify the list of targeted indices. You can target all indices starting with a prefix or ending with a suffix using the '\*' character. For example, "dev\_\*" matches all indices starting with "dev\_" and "\*\_dev" matches all indices ending with "\_dev". Defaults to all indices if empty or blank.
 * **referers**: Specify the list of referers. You can target all referers starting with a prefix or ending with a suffix using the '\*' character. For example, "algolia.com/\*" matches all referers starting with "algolia.com/" and "\*.algolia.com" matches all referers ending with ".algolia.com". Defaults to all referers if empty or blank.
 * **queryParameters**: Specify the list of query parameters. You can force the query parameters for a query using the url string format (param1=X&param2=Y...).
 * **description**: Specify a description to describe where the key is used.


<%= snippet("security_add_user_key") %>

<% if !cmd? -%>
Update the permissions of an existing key:
<%= snippet("security_update_user_key") %>
<% end -%>
Get the permissions of a given key:
<%= snippet("security_get_user_key") %>

Delete an existing key:
<%= snippet("security_delete_key") %>

<% if !cmd? && !objc? && !swift? && !android? %>

You may have a single index containing per user data. In that case, all records should be tagged with their associated user_id in order to add a `tagFilters=user_42` filter at query time to retrieve only what a user has access to. If you're using the [JavaScript client](http://github.com/algolia/algoliasearch-client-js), it will result in a security breach since the user is able to modify the `tagFilters` you've set by modifying the code from the browser. To keep using the JavaScript client (recommended for optimal latency) and target secured records, you can generate a secured API key from your backend:

<%= snippet("generate_secured_api_key") if !objc? && !swift? && !android? %>

This public API key can then be used in your JavaScript code as follow:

```js
var client = algoliasearch('YourApplicationID', '<%%= public_api_key %>');

var index = client.initIndex('indexName')

index.search('something', function(err, content) {
  if (err) {
    console.error(err);
    return;
  }

  console.log(content);
});
```

You can mix rate limits and secured API keys by setting a `userToken` query parameter at API key generation time. When set, a unique user will be identified by her `IP + user_token` instead of only by her `IP`. This allows you to restrict a single user to performing a maximum of `N` API calls per hour, even if she shares her `IP` with another user.

<%= snippet("generate_secured_api_key_user_token") if !objc? && !swift? && !android? %>

This public API key can then be used in your JavaScript code as follow:

```js
var client = algoliasearch('YourApplicationID', '<%%= public_api_key %>');

var index = client.initIndex('indexName')

index.search('another query', function(err, content) {
  if (err) {
    console.error(err);
    return;
  }

  console.log(content);
});
```
<% end %>

Copy or rename an index
-------------

You can easily copy or rename an existing index using the `copy` and `move` commands.
**Note**: Move and copy commands overwrite the destination index.

<%= snippet("copy_move_index") %>

The move command is particularly useful if you want to update a big index atomically from one version to another. For example, if you recreate your index `MyIndex` each night from a database by batch, you only need to:
 1. Import your database into a new index using [batches](#batch-writes). Let's call this new index `MyNewIndex`.
 1. Rename `MyNewIndex` to `MyIndex` using the move command. This will automatically override the old index and new queries will be served on the new one.

<%= snippet("update_index") %>

<% if !android? %>
Backup / Retrieve of all index content
-------------

The `search` method cannot return more than 1,000 results. If you need to
retrieve all the content of your index (for backup, SEO purposes or for running
a script on it), you should use the `browse` method instead. This method lets
you retrieve objects beyond the 1,000 limit.

This method is optimized for speed. To make it fast, distinct, typo-tolerance,
word proximity, geo distance and number of matched words are disabled. Results
are still returned ranked by attributes and custom ranking.

<% if !ruby? -%>
<%# Ruby has a nice browse method that hides the cursor, so no need to talk about it %>
It will return a `cursor` alongside your data, that you can then use to retrieve
the next chunk of your records.

You can specify custom parameters (like `page` or `hitsPerPage`) on your first
`browse` call, and these parameters will then be included in the `cursor`. Note
that it is not possible to access records beyond the 1,000th on the first call.
<% end -%>

Example:

<%= snippet("backup_index") %>

<% if js? -%>
You can also use the `browseAll` method that will crawl the whole index and emit
events whenever a new chunk of records is fetched.

<%= snippet("backup_index_browse_all") %>

<% end -%>

<% end %>

Logs
-------------

You can retrieve the latest logs via this API. Each log entry contains:
 * Timestamp in ISO-8601 format
 * Client IP
 * Request Headers (API Key is obfuscated)
 * Request URL
 * Request method
 * Request body
 * Answer HTTP code
 * Answer body
 * SHA1 ID of entry

You can retrieve the logs of your last 1,000 API calls and browse them using the offset/length parameters:
 * ***offset***: Specify the first entry to retrieve (0-based, 0 is the most recent log entry). Defaults to 0.
 * ***length***: Specify the maximum number of entries to retrieve starting at the offset. Defaults to 10. Maximum allowed value: 1,000.
 * ***onlyErrors***: Retrieve only logs with an HTTP code different than 200 or 201. (deprecated)
 * ***type***: Specify the type of logs to retrieve:
  * ***query***: Retrieve only the queries.
  * ***build***: Retrieve only the build operations.
  * ***error***: Retrieve only the errors (same as ***onlyErrors*** parameters).

<%= snippet("logs_get") %>

<% if ruby? %>Mock
-------------

For testing purposes, you may want to mock Algolia's API calls. We provide a [WebMock](https://github.com/bblimke/webmock) configuration that you can use including `algolia/webmock`:

<%= snippet("mock") %><% end %>

<% if cmd? %>
MongoDB
-------

You can use the `mongodb/crawler` tool to export a MongoDB collection and add all items to an Algolia index. This script is based on `mongoexport` and `algoliasearch-client-cmd`.

For example, to export the `users` collection of your `myapp` database running on the default port and localhost to a `users` index, use:

```sh
./mongodb/crawler -d myapp -c users --applicationID YourApplicationID --apiKey YourAPIKey --index users
```
<% end %>


<% if python? %>
**Unreachable hosts error?**

If you are seeing an error for `Unreachable hosts` when pushing data to Algolia, this is caused by `PyOpenSSL` and older versions of Python. You can see [more information here](https://github.com/algolia/algoliasearch-client-python/issues/30).

To fix, either upgrade your Python version or [your urllib3](https://github.com/algolia/algoliasearch-client-python/issues/30#issuecomment-151933567).
<% end -%>
