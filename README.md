Algolia Search API Client README generator
==================

> *Opening notes:* This is an INTERNAL tool used to generate the README.md files of the following projects:

 * [algoliasearch-client-ruby](https://github.com/algolia/algoliasearch-client-ruby)
 * [algoliasearch-client-python](https://github.com/algolia/algoliasearch-client-python)
 * [algoliasearch-client-php](https://github.com/algolia/algoliasearch-client-php)
 * [algoliasearch-client-js](https://github.com/algolia/algoliasearch-client-js)
 * [algoliasearch-client-cmd](https://github.com/algolia/algoliasearch-client-cmd)
 * [algoliasearch-client-java](https://github.com/algolia/algoliasearch-client-java)
 * [algoliasearch-client-android](https://github.com/algolia/algoliasearch-client-android)
 * [algoliasearch-client-csharp](https://github.com/algolia/algoliasearch-client-csharp)
 * [algoliasearch-client-objc](https://github.com/algolia/algoliasearch-client-objc)
 * [algoliasearch-client-swift](https://github.com/algolia/algoliasearch-client-swift)
 * [algoliasearch-client-scala](https://github.com/algolia/algoliasearch-client-scala)

That's probably not the repository you were looking for. For Algolia's REST API documentation, go to [algolia.com/doc/rest](http://algolia.com/doc/rest).

Usage
------

After a change is merged, a travis job will run and automatically:
- clone each repository
- generate and update each READMEs
- push and create a pull request on each repositories
