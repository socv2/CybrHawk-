# Search Queries

#### Search Language Queries

CybrHawk uses Lucene query syntax for querying alert data. Lucene provides software developers with an easy-to-use toolkit for implementing full-text search capabilities within target systems, or for building a complete full-text search engine.

#### Key Matching

You can specify fields to search in the query syntax:

*   where the `status` field contains `active`

    ```
    status:active
    ```
*   where the `title` field contains `quick` or `brown`

    ```
    title:(quick OR brown)
    ```
*   where the `author` field contains the exact phrase `John Smith`

    ```
    author:"John Smith"
    ```
*   where the `first name` field contains `Alice` (note how we need to escape the space with a backslash)

    ```
    first\ name:Alice
    ```
*   where any of the fields `book.title`, `book.content`, or `book.date` contains `quick` or `brown` (note how we need to escape the `*` with a backslash):

    ```
    book.\*:(quick OR brown)
    ```
*   Search for "foo bar" in the title field and "quick fox" in the body field.

    ```
    title:"foo bar" AND body:"quick fox"
    ```
*   Search for either the phrase "foo bar" in the title field AND the phrase "quick fox" in the body field or the word "fox" in the title field.

    ```
    (title:"foo bar" AND body:"quick fox") OR title:fox
    ```
*   Search for the word "foo" and not "bar" in the title field

    ```
    title:foo -title:bar
    ```
*   where the field `title` has any non-null value:

    ```
    _exists_:title
    ```

#### Wildcard Matching

*   Search for any word that starts with "foo" in the title field.

    ```
    title:foo*
    ```
*   Search for any word that starts with "foo" and ends with "bar" in the title field.

    ```
    title:foo*bar
    ```
* Note that Lucene doesn't support using a `*` symbol as the first character of a search.

#### Recommend Reading

* [Elastic Query DSL Query String Syntax](https://www.elastic.co/guide/en/elasticsearch/reference/8.11/query-dsl-query-string-query.html#query-string-syntax)
* [Apache Lucene Query Parser Syntax](https://lucene.apache.org/core/2_9_4/queryparsersyntax.html)
