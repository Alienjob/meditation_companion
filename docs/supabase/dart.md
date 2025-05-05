This reference documents every object and method available in Supabase's Flutter library, supabase-flutter. You can use supabase-flutter to interact with your Postgres database, listen to database changes, invoke Deno Edge Functions, build login and user management functionality, and manage large files.

We also provide a supabase package for non-Flutter projects.

Installing
Install from pub.dev#
You can install Supabase package from pub.dev


Flutter

Other Dart Project
flutter pub add supabase_flutter
Initializing
You can initialize Supabase with the static initialize() method of the Supabase class.

The Supabase client is your entrypoint to the rest of the Supabase functionality and is the easiest way to interact with everything we offer within the Supabase ecosystem.

Parameters
url
Required
string
The unique Supabase URL which is supplied when you create a new project in your project dashboard.

anonKey
Required
string
The unique Supabase Key which is supplied when you create a new project in your project dashboard.

headers
Optional
Map<String, String>
Custom header to be passed to the Supabase client.

httpClient
Optional
Client
Custom http client to be used by the Supabase client.

authOptions
Optional
FlutterAuthClientOptions
Options to change the Auth behaviors.

Details
authFlowType
Optional
AuthFlowType
Whether to use the pkce flow or the implicit flow. Defaults to pkce.

localStorage
Optional
LocalStorage
Parameter to override the local storage to store auth tokens.

autoRefreshToken
Optional
bool
Whether to automatically refresh the token when it expires. Defaults to true.

postgrestOptions
Optional
PostgrestClientOptions
Options to change the Postgrest behaviors.

Details
realtimeClientOptions
Optional
RealtimeClientOptions
Options to change the Realtime behaviors.

Details
storageOptions
Optional
StorageClientOptions
Options to change the Storage behaviors.

Details
For Flutter
For other Dart projects
Future<void> main() async {
  await Supabase.initialize(
    url: 'https://xyzcompany.supabase.co',
    anonKey: 'public-anon-key',
  );
  runApp(MyApp());
}
// Get a reference your Supabase client
final supabase = Supabase.instance.client;
Upgrade guide
Although supabase_flutter v2 brings a few breaking changes, for the most part the public API should be the same with a few minor exceptions.
We have brought numerous updates behind the scenes to make the SDK work more intuitively for Flutter and Dart developers.

Upgrade the client library#
Make sure you are using v2 of the client library in your pubspec.yaml file.

supabase_flutter: ^2.0.0
Optionally passing custom configuration to Supabase.initialize() is now organized into separate objects:


Before

After
await Supabase.initialize(
  url: supabaseUrl,
  anonKey: supabaseKey,
  authFlowType: AuthFlowType.pkce,
  storageRetryAttempts: 10,
  realtimeClientOptions: const RealtimeClientOptions(
    logLevel: RealtimeLogLevel.info,
  ),
);
Auth updates#
Renaming Provider to OAuthProvider#
Provider enum is renamed to OAuthProvider.
Previously the Provider symbol often collided with classes in the provider package and developers needed to add import prefixes to avoid collisions.
With the new update, developers can use Supabase and Provider in the same codebase without any import prefixes.


Before

After
await supabase.auth.signInWithOAuth(
  Provider.google,
);
Sign in with Apple method deprecated#
We have removed the sign_in_with_apple dependency in v2.
This is because not every developer needs to sign in with Apple, and we want to reduce the number of dependencies in the library.

With v2, you can import sign_in_with_apple as a separate dependency if you need to sign in with Apple.
We have also added auth.generateRawNonce() method to easily generate a secure nonce.


Before

After
await supabase.auth.signInWithApple();
Initialization does not await for session refresh#
In v1, Supabase.initialize() would await for the session to be refreshed before returning.
This caused delays in the app's launch time, especially when the app is opened in a poor network environment.

In v2, Supabase.initialize() returns immediately after obtaining the session from the local storage, which makes the app launch faster.
Because of this, there is no guarantee that the session is valid when the app starts.

If you need to make sure the session is valid, you can access the isExpired getter to check if the session is valid.
If the session is expired, you can listen to the onAuthStateChange event and wait for a new tokenRefreshed event to be fired.


Before

After
// Session is valid, no check required
final session = supabase.auth.currentSession;
Removing Flutter Webview dependency for OAuth sign in#
In v1, on iOS you could pass a BuildContext to the signInWithOAuth() method to launch the OAuth flow in a Flutter Webview.

In v2, we have dropped the webview_flutter dependency in v2 to allow you to have full control over the UI of the OAuth flow.
We now have native support for Google and Apple sign in, so opening an external browser is no longer needed on iOS.

Because of this update, we no longer need the context parameter, so we have removed the context parameter from the signInWithOAuth() method.


Before

After
// Opens a webview on iOS.
await supabase.auth.signInWithOAuth(
  Provider.github,
  authScreenLaunchMode: LaunchMode.inAppWebView,
  context: context,
);
PKCE is the default auth flow type#
PKCE flow, which is a more secure method for obtaining sessions from deep links, is now the default auth flow for any authentication involving deep links.


Before

After
await Supabase.initialize(
  url: 'SUPABASE_URL',
  anonKey: 'SUPABASE_ANON_KEY',
  authFlowType: AuthFlowType.implicit, // set to implicit by default
);
Auth callback host name parameter removed#
Supabase.initialize() no longer has the authCallbackUrlHostname parameter.
The supabase_flutter SDK will automatically detect auth callback URLs and handle them internally.


Before

After
await Supabase.initialize(
  url: 'SUPABASE_URL',
  anonKey: 'SUPABASE_ANON_KEY',
  authCallbackUrlHostname: 'auth-callback',
);
SupabaseAuth class removed#
The SupabaseAuth had an initialSession member, which was used to obtain the initial session upon app start.
This is now removed, and currentSession should be used to access the session at any time.


Before

After
// Use `initialSession` to obtain the initial session when the app starts.
final initialSession = await SupabaseAuth.initialSession;
Data methods#
Insert and return data#
We made the query builder immutable, which means you can reuse the same query object to chain multiple filters and get the expected outcome.


Before

After
// If you declare a query and chain filters on it
final myQuery = supabase.from('my_table').select();
final foo = await myQuery.eq('some_col', 'foo');
// The `eq` filter above is applied in addition to the following filter
final bar = await myQuery.eq('another_col', 'bar');
Renaming is and in filter#
Because is and in are reserved keywords in Dart, v1 used is_ and in_ as query filter names.
Users found the underscore confusing, so the query filters are now renamed to isFilter and inFilter.


Before

After
final data = await supabase
  .from('users')
  .select()
  .is_('status', null);
final data = await supabase
  .from('users')
  .select()
  .in_('status', ['ONLINE', 'OFFLINE']);
Deprecate FetchOption in favor of count() and head() methods#
FetchOption() on .select() is now deprecated, and new .count() and head() methods are added to the query builder.

count() on .select() performs the select while also getting the count value, and .count() directly on .from() performs a head request resulting in only fetching the count value.


Before

After
// Request with count option
final res = await supabase.from('cities').select(
      'name',
      const FetchOptions(
        count: CountOption.exact,
      ),
    );
final data = res.data;
final count = res.count;
// Request with count and head option
// obtains the count value without fetching the data.
final res = await supabase.from('cities').select(
      'name',
      const FetchOptions(
        count: CountOption.exact,
        head: true,
      ),
    );
final count = res.count;
PostgREST error codes#
The PostgrestException instance thrown by the API methods has a code property. In v1, the code property contained the http status code.

In v2, the code property contains the PostgREST error code, which is more useful for debugging.


Before

After
try {
  await supabase.from('countries').select();
} on PostgrestException catch (error) {
  error.code; // Contains http status code
}
Realtime methods#
Realtime methods contains the biggest breaking changes. Most of these changes are to make the interface more type safe.

We have removed the .on() method and replaced it with .onPostgresChanges(), .onBroadcast(), and three different presence methods.

Postgres Changes#
Use the new .onPostgresChanges() method to listen to realtime changes in the database.

In v1, filters were not strongly typed because they took a String type. In v2, filter takes an object. Its properties are strictly typed to catch type errors.

The payload of the callback is now typed as well. In v1, the payload was returned as dynamic. It is now returned as a PostgresChangePayload object. The object contains the oldRecord and newRecord properties for accessing the data before and after the change.


Before

After
supabase.channel('my_channel').on(
  RealtimeListenTypes.postgresChanges,
  ChannelFilter(
    event: '*',
    schema: 'public',
    table: 'messages',
    filter: 'room_id=eq.200',
  ),
  (dynamic payload, [ref]) {
    final Map<String, dynamic> newRecord = payload['new'];
    final Map<String, dynamic> oldRecord = payload['old'];
  },
).subscribe();
Broadcast#
Broadcast now uses the dedicated .onBroadcast() method, rather than the generic .on() method.
Because the method is specific to broadcast, it takes fewer properties.


Before

After
supabase.channel('my_channel').on(
  RealtimeListenTypes.broadcast,
  ChannelFilter(
    event: 'position',
  ),
  (dynamic payload, [ref]) {
    print(payload);
  },
).subscribe();
Presence#
Realtime Presence gets three different methods for listening to three different presence events: sync, join, and leave.
This allows the callback to be strictly typed.


Before

After
final channel = supabase.channel('room1');
channel.on(
  RealtimeListenTypes.presence,
  ChannelFilter(event: 'sync'),
  (payload, [ref]) {
    print('Synced presence state: ${channel.presenceState()}');
  },
).on(
  RealtimeListenTypes.presence,
  ChannelFilter(event: 'join'),
  (payload, [ref]) {
    print('Newly joined presences $payload');
  },
).on(
  RealtimeListenTypes.presence,
  ChannelFilter(event: 'leave'),
  (payload, [ref]) {
    print('Newly left presences: $payload');
  },
).subscribe(
  (status, [error]) async {
    if (status == 'SUBSCRIBED') {
      await channel.track({'online_at': DateTime.now().toIso8601String()});
    }
  },
);
Fetch data
Perform a SELECT query on the table or view.

By default, Supabase projects will return a maximum of 1,000 rows. This setting can be changed in Project API Settings. It's recommended that you keep it low to limit the payload size of accidental or malicious requests. You can use range() queries to paginate through your data.
select() can be combined with Filters
select() can be combined with Modifiers
apikey is a reserved keyword if you're using the Supabase Platform and should be avoided as a column name.
Parameters
columns
Optional
String
The columns to retrieve, separated by commas. Columns can be renamed when returned with customName:columnName

Getting your data
Selecting specific columns
Query referenced tables
Query referenced tables through a join table
Query the same referenced table multiple times
Filtering through referenced tables
Querying with count option
Querying JSON data
Querying referenced table with inner join
Switching schemas per query
final data = await supabase
  .from('instruments')
  .select();
Data source
Response
Insert data
Perform an INSERT into the table or view.

Parameters
values
Required
Map<String, dynamic> or List<Map<String, dynamic>>
The values to insert. Pass an object to insert a single row or an array to insert multiple rows.

Create a record
Fetch inserted record
Bulk create
await supabase
    .from('cities')
    .insert({'name': 'The Shire', 'country_id': 554});
Data source
Update data
Perform an UPDATE on the table or view.

update() should always be combined with Filters to target the item(s) you wish to update.
Parameters
values
Required
Map<String, dynamic>
The values to update with.

Update your data
Update a record and return it
Update JSON data
await supabase
  .from('instruments')
  .update({ 'name': 'piano' })
  .eq('id', 1);
Data source
Upsert data
Perform an UPSERT on the table or view. Depending on the column(s) passed to onConflict, .upsert() allows you to perform the equivalent of .insert() if a row with the corresponding onConflict columns doesn't exist, or if it does exist, perform an alternative action depending on ignoreDuplicates.

Primary keys must be included in values to use upsert.
Parameters
values
Required
Map<String, dynamic> or List<Map<String, dynamic>>
The values to upsert with. Pass a Map to upsert a single row or an List to upsert multiple rows.

onConflict
Optional
String
Comma-separated UNIQUE column(s) to specify how duplicate rows are determined. Two rows are duplicates if all the onConflict columns are equal.

ignoreDuplicates
Optional
bool
If true, duplicate rows are ignored. If false, duplicate rows are merged with existing rows.

defaultToNull
Optional
bool
Make missing fields default to null. Otherwise, use the default value for the column. This only applies when inserting new rows, not when merging with existing rows where ignoreDuplicates is set to false. This also only applies when doing bulk upserts.

Upsert your data
Bulk Upsert your data
Upserting into tables with constraints
final data = await supabase
  .from('instruments')
  .upsert({ 'id': 1, 'name': 'piano' })
  .select();
Data source
Response
Delete data
Perform a DELETE on the table or view.

delete() should always be combined with Filters to target the item(s) you wish to delete.
If you use delete() with filters and you have RLS enabled, only rows visible through SELECT policies are deleted. Note that by default no rows are visible, so you need at least one SELECT/ALL policy that makes the rows visible.
Delete records
Delete multiple records
Fetch deleted records
await supabase
  .from('countries')
  .delete()
  .eq('id', 1);
Data source
Call a Postgres function
Perform a function call.

You can call Postgres functions as Remote Procedure Calls, logic in your database that you can execute from anywhere. Functions are useful when the logic rarely changes—like for password resets and updates.

Parameters
fn
Required
String
The function name to call.

params
Optional
Map<String, dynamic>
The arguments to pass to the function call.

Call a Postgres function without arguments
Call a Postgres function with arguments
Bulk processing
Call a Postgres function with filters
final data = await supabase
  .rpc('hello_world');
Data source
Response
Using filters
Filters allow you to only return rows that match certain conditions.

Filters can be used on select(), update(), upsert(), and delete() queries.

If a Database function returns a table response, you can also apply filters.

Applying Filters
Chaining Filters
Conditional Chaining
Filter by values within a JSON column
Filter Referenced Tables
final data = await supabase
  .from('cities')
  .select('name, country_id')
  .eq('name', 'The Shire');  // Correct
final data = await supabase
  .from('cities')
  .eq('name', 'The Shire')  // Incorrect
  .select('name, country_id');
Notes
Column is equal to a value
Match only rows where column is equal to value.

Parameters
column
Required
String
The column to filter on.

value
Required
Object
The value to filter with.

With `select()`
final data = await supabase
  .from('instruments')
  .select()
  .eq('name', 'viola');
Data source
Response
Column is not equal to a value
Finds all rows whose value on the stated column doesn't match the specified value.

Parameters
column
Required
String
The column to filter on.

value
Required
Object
The value to filter with.

With `select()`
final data = await supabase
  .from('instruments')
  .select('id, name')
  .neq('name', 'viola');
Data source
Response
Column is greater than a value
Finds all rows whose value on the stated column is greater than the specified value.

Parameters
column
Required
String
The column to filter on.

value
Required
Object
The value to filter with.

With `select()`
final data = await supabase
  .from('countries')
  .select()
  .gt('id', 2);
Data source
Response
Column is greater than or equal to a value
Finds all rows whose value on the stated column is greater than or equal to the specified value.

Parameters
column
Required
String
The column to filter on.

value
Required
Object
The value to filter with.

With `select()`
final data = await supabase
  .from('countries')
  .select()
  .gte('id', 2);
Data source
Response
Column is less than a value
Finds all rows whose value on the stated column is less than the specified value.

Parameters
column
Required
String
The column to filter on.

value
Required
Object
The value to filter with.

With `select()`
final data = await supabase
  .from('countries')
  .select()
  .lt('id', 2);
Data source
Response
Column is less than or equal to a value
Finds all rows whose value on the stated column is less than or equal to the specified value.

Parameters
column
Required
String
The column to filter on.

value
Required
Object
The value to filter with.

With `select()`
final data = await supabase
  .from('countries')
  .select()
  .lte('id', 2);
Data source
Response
Column matches a pattern
Finds all rows whose value in the stated column matches the supplied pattern (case sensitive).

Parameters
column
Required
String
The column to filter on.

pattern
Required
String
The pattern to match with.

With `select()`
final data = await supabase
  .from('planets')
  .select()
  .like('name', '%Ea%');
Data source
Response
Column matches a case-insensitive pattern
Finds all rows whose value in the stated column matches the supplied pattern (case insensitive).

Parameters
column
Required
String
The column to filter on.

pattern
Required
String
The pattern to match with.

With `select()`
final data = await supabase
  .from('planets')
  .select()
  .ilike('name', '%ea%');
Data source
Response
Column is a value
A check for exact equality (null, true, false), finds all rows whose value on the stated column exactly match the specified value.

Parameters
column
Required
String
The column to filter on.

value
Required
Object?
The value to filter with.

Checking for nullness, true or false
final data = await supabase
  .from('countries')
  .select()
  .isFilter('name', null);
Data source
Response
Notes
Column is in an array
Finds all rows whose value on the stated column is found on the specified values.

Parameters
column
Required
String
The column to filter on.

values
Required
List
The List to filter with.

With `select()`
final data = await supabase
  .from('characters')
  .select()
  .inFilter('name', ['Luke', 'Leia']);
Data source
Response
Notes
Column contains every element in a value
Only relevant for jsonb, array, and range columns. Match only rows where column contains every element appearing in value.

Parameters
column
Required
String
The jsonb, array, or range column to filter on.

value
Required
Object
The jsonb, array, or range value to filter with.

On array columns
On range columns
On `jsonb` columns
final data = await supabase
  .from('issues')
  .select()
  .contains('tags', ['is:open', 'priority:low']);
Data source
Response
Notes
Contained by value
Only relevant for jsonb, array, and range columns. Match only rows where every element appearing in column is contained by value.

Parameters
column
Required
String
The jsonb, array, or range column to filter on.

value
Required
Object
The jsonb, array, or range value to filter with.

On array columns
On range columns
On `jsonb` columns
final data = await supabase
  .from('classes')
  .select('name')
  .containedBy('days', ['monday', 'tuesday', 'wednesday', 'friday']);
Data source
Response
Greater than a range
Only relevant for range columns. Match only rows where every element in column is greater than any element in range.

Parameters
column
Required
String
The range column to filter on.

range
Required
String
The range to filter with.

With `select()`
final data = await supabase
  .from('reservations')
  .select()
  .rangeGt('during', '[2000-01-02 08:00, 2000-01-02 09:00)');
Data source
Response
Notes
Greater than or equal to a range
Only relevant for range columns. Match only rows where every element in column is either contained in range or greater than any element in range.

Parameters
column
Required
String
The range column to filter on.

range
Required
String
The range to filter with.

With `select()`
final data = await supabase
  .from('reservations')
  .select()
  .rangeGte('during', '[2000-01-02 08:30, 2000-01-02 09:30)');
Data source
Response
Notes
Less than a range
Only relevant for range columns. Match only rows where every element in column is less than any element in range.

Parameters
column
Required
String
The range column to filter on.

range
Required
String
The range to filter with.

With `select()`
final data = await supabase
  .from('reservations')
  .select()
  .rangeLt('during', '[2000-01-01 15:00, 2000-01-01 16:00)');
Data source
Response
Notes
Less than or equal to a range
Only relevant for range columns. Match only rows where every element in column is either contained in range or less than any element in range.

Parameters
column
Required
String
The range column to filter on.

range
Required
String
The range to filter with.

With `select()`
final data = await supabase
  .from('reservations')
  .select()
  .rangeLte('during', '[2000-01-01 15:00, 2000-01-01 16:00)');
Data source
Response
Notes
Mutually exclusive to a range
Only relevant for range columns. Match only rows where column is mutually exclusive to range and there can be no element between the two ranges.

Parameters
column
Required
String
The range column to filter on.

range
Required
String
The range to filter with.

With `select()`
final data = await supabase
  .from('reservations')
  .select()
  .rangeAdjacent('during', '[2000-01-01 12:00, 2000-01-01 13:00)');
Data source
Response
Notes
With a common element
Only relevant for array and range columns. Match only rows where column and value have an element in common.

Parameters
column
Required
String
The array or range column to filter on.

value
Required
Object
The array or range value to filter with.

On array columns
On range columns
final data = await supabase
  .from('issues')
  .select('title')
  .overlaps('tags', ['is:closed', 'severity:high']);
Data source
Response
Match a string
Finds all rows whose tsvector value on the stated column matches to_tsquery(query).

Parameters
column
Required
String
The text or tsvector column to filter on.

query
Required
String
The query text to match with.

config
Optional
String
The text search configuration to use.

type
Optional
TextSearchType
Change how the query text is interpreted.

Text search
Basic normalization
Full normalization
Websearch
final data = await supabase
  .from('quotes')
  .select('catchphrase')
  .textSearch('content', "'eggs' & 'ham'",
    config: 'english'
  );
Data source
Response
Match an associated value
Finds all rows whose columns match the specified query object.

Parameters
query
Required
Map<String, dynamic>
The object to filter with, with column names as keys mapped to their filter values

With `select()`
final data = await supabase
  .from('instruments')
  .select()
  .match({ 'id': 2, 'name': 'viola' });
Data source
Response
Don't match the filter
Finds all rows which doesn't satisfy the filter.

.not() expects you to use the raw PostgREST syntax for the filter names and values.

.not('name','eq','violin')
.not('arraycol','cs','{"a","b"}') // Use Postgres array {} for array column and 'cs' for contains.
.not('rangecol','cs','(1,2]') // Use Postgres range syntax for range column.
.not('id','in','(6,7)')  // Use Postgres list () and 'in' instead of `inFilter`.
.not('id','in','(${mylist.join(',')})')  // You can insert a Dart list array.
Parameters
column
Required
String
The column to filter on.

operator
Required
String
The operator to be negated to filter with, following PostgREST syntax.

value
Optional
Object
The value to filter with, following PostgREST syntax.

With `select()`
With `update()`
With `delete()`
With `rpc()`
final data = await supabase
  .from('countries')
  .select()
  .not('name', 'is', null)
Data source
Response
Match at least one filter
Finds all rows satisfying at least one of the filters.

.or() expects you to use the raw PostgREST syntax for the filter names and values.

.or('id.in.(6,7),arraycol.cs.{"a","b"}')  // Use Postgres list () and 'in' instead of `inFilter`. Array {} and 'cs' for contains.
.or('id.in.(${mylist.join(',')}),arraycol.cs.{${mylistArray.join(',')}}')	// You can insert a Dart list for list or array column.
.or('id.in.(${mylist.join(',')}),rangecol.cs.(${mylistRange.join(',')}]')	// You can insert a Dart list for list or range column.
Parameters
filters
Required
String
The filters to use, following PostgREST syntax

referencedTable
Optional
String
Set this to filter on referenced tables instead of the parent table

With `select()`
Use `or` with `and`
Use `or` on referenced tables
final data = await supabase
  .from('instruments')
  .select('name')
  .or('id.eq.2,name.eq.cello');
Data source
Response
Match the filter
Match only rows which satisfy the filter. This is an escape hatch - you should use the specific filter methods wherever possible.

.filter() expects you to use the raw PostgREST syntax for the filter names and values, so it should only be used as an escape hatch in case other filters don't work.

.filter('arraycol','cs','{"a","b"}') // Use Postgres array {} and 'cs' for contains.
.filter('rangecol','cs','(1,2]') // Use Postgres range syntax for range column.
.filter('id','in','(6,7)')  // Use Postgres list () and 'in' for in_ filter.
.filter('id','cs','{${mylist.join(',')}}')  // You can insert a Dart array list.
Parameters
column
Required
String
The column to filter on.

operator
Required
String
The operator to filter with, following PostgREST syntax.

value
Required
Object
The value to filter with, following PostgREST syntax.

With `select()`
With `update()`
With `delete()`
With `rpc()`
On a referenced table
final data = await supabase
  .from('characters')
  .select()
  .filter('name', 'in', '("Ron","Dumbledore")')
Data source
Response
Using modifiers
Filters work on the row level. That is, they allow you to return rows that only match certain conditions without changing the shape of the rows. Modifiers are everything that don't fit that definition—allowing you to change the format of the response (e.g., returning a CSV string).

Modifiers must be specified after filters. Some modifiers only apply for queries that return rows (e.g., select() or rpc() on a function that returns a table response).

Return data after inserting
With `upsert()`
final data = await supabase
  .from('instruments')
  .upsert({ 'id': 1, 'name': 'piano' })
  .select();
Data source
Response
Order the results
Orders the result with the specified column.

Parameters
column
Required
String
The column to order by.

ascending
Optional
bool
Whether to order in ascending order. Default is false.

nullsFirst
Optional
bool
Whether to order nulls first. Default is false.

referencedTable
Optional
String
Specify the referenced table when ordering by a column in an embedded resource.

With `select()`
On a referenced table
Order parent table by a referenced table
final data = await supabase
  .from('instruments')
  .select('id, name')
  .order('id', ascending: false);
Data source
Response
Limit the number of rows returned
Limits the result with the specified count.

Parameters
count
Required
int
The maximum number of rows to return.

referencedTable
Optional
int
Set this to limit rows of referenced tables instead of the parent table.

With `select()`
On a referenced table
final data = await supabase
  .from('instruments')
  .select('name')
  .limit(1);
Data source
Response
Limit the query to a range
Limits the result to rows within the specified range, inclusive.

Parameters
from
Required
int
The starting index from which to limit the result.

to
Required
int
The last index to which to limit the result.

referencedTable
Optional
String
Set this to limit rows of referenced tables instead of the parent table.

With `select()`
final data = await supabase
  .from('instruments')
  .select('name')
  .range(0, 1);
Data source
Response
Retrieve one row of data
Retrieves only one row from the result. Result must be one row (e.g. using limit), otherwise this will result in an error.

With `select()`
final data = await supabase
  .from('instruments')
  .select('name')
  .limit(1)
  .single();
Data source
Response
Retrieve zero or one row of data
With `select()`
final data = await supabase
  .from('instruments')
  .select()
  .eq('name', 'guzheng')
  .maybeSingle();
Data source
Response
Retrieve as a CSV
Return data as CSV
final data = await supabase
  .from('instruments')
  .select()
  .csv();
Data source
Response
Notes
Using explain
For debugging slow queries, you can get the Postgres EXPLAIN execution plan of a query using the explain() method. This works on any query, even for rpc() or writes.

Explain is not enabled by default as it can reveal sensitive information about your database. It's best to only enable this for testing environments but if you wish to enable it for production you can provide additional protection by using a pre-request function.

Follow the Performance Debugging Guide to enable the functionality on your project.

Parameters
analyze
Optional
bool
If true, the query will be executed and the actual run time will be returned.

verbose
Optional
bool
If true, the query identifier will be returned and data will include the output columns of the query.

settings
Optional
bool
If true, include information on configuration parameters that affect query planning.

buffers
Optional
bool
If true, include information on buffer usage.

wal
Optional
bool
If true, include information on WAL record generation.

Get the execution plan
Get the execution plan with analyze and verbose
final data = await supabase
  .from('instruments')
  .select()
  .explain();
Data source
Response
Notes
Create a new user
Creates a new user.

By default, the user needs to verify their email address before logging in. To turn this off, disable Confirm email in your project.
Confirm email determines if users need to confirm their email address after signing up.
If Confirm email is enabled, a user is returned but session is null.
If Confirm email is disabled, both a user and a session are returned.
When the user confirms their email address, they are redirected to the SITE_URL by default. You can modify your SITE_URL or add additional redirect URLs in your project.
If signUp() is called for an existing confirmed user:
When both Confirm email and Confirm phone (even when phone provider is disabled) are enabled in your project, an obfuscated/fake user object is returned.
When either Confirm email or Confirm phone (even when phone provider is disabled) is disabled, the error message, User already registered is returned.
Parameters
email
Optional
String
User's email address to be used for email authentication.

phone
Optional
String
User's phone number to be used for phone authentication.

password
Required
String
Password to be used for authentication.

emailRedirectTo
Optional
String
The URL to redirect the user to after they confirm their email address.

data
Optional
Map<String, dynamic>
The user's metadata to be stored in the user's object.

captchaToken
Optional
String
The captcha token to be used for captcha verification.

channel
Optional
OtpChannel
Messaging channel to use (e.g. whatsapp or sms). Defaults to OtpChannel.sms.

Sign up with an email and password
Sign up with a phone number and password (SMS)
Sign up with additional metadata
Sign up with redirect URL
final AuthResponse res = await supabase.auth.signUp(
  email: 'example@email.com',
  password: 'example-password',
);
final Session? session = res.session;
final User? user = res.user;
Response
Listen to auth events
Receive a notification every time an auth event happens.

Types of auth events: AuthChangeEvent.passwordRecovery, AuthChangeEvent.signedIn, AuthChangeEvent.signedOut, AuthChangeEvent.tokenRefreshed, AuthChangeEvent.userUpdatedand AuthChangeEvent.userDeleted
Listen to auth changes
Listen to a specific event
Unsubscribe from auth subscription
final authSubscription = supabase.auth.onAuthStateChange.listen((data) {
  final AuthChangeEvent event = data.event;
  final Session? session = data.session;
  print('event: $event, session: $session');
  switch (event) {
    case AuthChangeEvent.initialSession:
    // handle initial session
    case AuthChangeEvent.signedIn:
    // handle signed in
    case AuthChangeEvent.signedOut:
    // handle signed out
    case AuthChangeEvent.passwordRecovery:
    // handle password recovery
    case AuthChangeEvent.tokenRefreshed:
    // handle token refreshed
    case AuthChangeEvent.userUpdated:
    // handle user updated
    case AuthChangeEvent.userDeleted:
    // handle user deleted
    case AuthChangeEvent.mfaChallengeVerified:
    // handle mfa challenge verified
  }
});
Create an anonymous user
Creates an anonymous user.

Returns an anonymous user
It is recommended to set up captcha for anonymous sign-ins to prevent abuse. You can pass in the captcha token in the options param.
Parameters
data
Optional
Map<String, dynamic>
The user's metadata to be stored in the user's object.

captchaToken
Optional
String
The captcha token to be used for captcha verification.

Create an anonymous user
Create an anonymous user with custom user metadata
await supabase.auth.signInAnonymously();
Response
Sign in a user
Log in an existing user using email or phone number with password.

Requires either an email and password or a phone number and password.
Parameters
email
Optional
String
User's email address to be used for email authentication.

phone
Optional
String
User's phone number to be used for phone authentication.

password
Required
String
Password to be used for authentication.

captchaToken
Optional
String
The captcha token to be used for captcha verification.

Sign in with email and password
Sign in with phone and password
final AuthResponse res = await supabase.auth.signInWithPassword(
  email: 'example@email.com',
  password: 'example-password',
);
final Session? session = res.session;
final User? user = res.user;
Response
Sign in with ID Token
Allows you to perform native Google and Apple sign in by combining it with google_sign_in or sign_in_with_apple packages.

Parameters
provider
Required
OAuthProvider
The provider to perform the sign in with. Currently, OAuthProvider.google and OAuthProvider.apple are supported.

idToken
Required
String
The identity token obtained from the third-party provider.

accessToken
Optional
String
Access token obtained from the third-party provider. Required for Google sign in.

nonce
Optional
String
Raw nonce value used to perform the third-party sign in. Required for Apple sign-in.

captchaToken
Optional
String
The captcha token to be used for captcha verification.

Native Google sign in
Native Apple Sign in
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
const webClientId = '<web client ID that you registered on Google Cloud, for example my-web.apps.googleusercontent.com>';
const iosClientId = '<iOS client ID that you registered on Google Cloud, for example my-ios.apps.googleusercontent.com';
final GoogleSignIn googleSignIn = GoogleSignIn(
  clientId: iosClientId,
  serverClientId: webClientId,
);
final googleUser = await googleSignIn.signIn();
final googleAuth = await googleUser!.authentication;
final accessToken = googleAuth.accessToken;
final idToken = googleAuth.idToken;
if (accessToken == null) {
  throw 'No Access Token found.';
}
if (idToken == null) {
  throw 'No ID Token found.';
}
final response = await supabase.auth.signInWithIdToken(
  provider: OAuthProvider.google,
  idToken: idToken,
  accessToken: accessToken,
);
Response
Notes
Sign in a user through OTP
Requires either an email or phone number.
This method is used for passwordless sign-ins where an OTP is sent to the user's email or phone number.
If you're using an email, you can configure whether you want the user to receive a magiclink or an OTP.
If you're using phone, you can configure whether you want the user to receive an OTP.
The magic link's destination URL is determined by the SITE_URL. You can modify the SITE_URL or add additional redirect urls in your project.
Parameters
email
Optional
String
Email address to send the magic link or OTP to.

phone
Optional
String
Phone number to send the OTP to.

emailRedirectTo
Optional
String
The URL to redirect the user to after they click on the magic link.

shouldCreateUser
Optional
bool
If set to false, this method will not create a new user. Defaults to true.

data
Optional
Map<String, dynamic>
The user's metadata to be stored in the user's object.

captchaToken
Optional
String
The captcha token to be used for captcha verification.

channel
Optional
OtpChannel
Messaging channel to use (e.g. whatsapp or sms). Defaults to OtpChannel.sms.

Sign in with email.
Sign in with SMS OTP.
Sign in with WhatsApp OTP
await supabase.auth.signInWithOtp(
  email: 'example@email.com',
  emailRedirectTo: kIsWeb ? null : 'io.supabase.flutter://signin-callback/',
);
Response
Notes
Sign in a user through OAuth
Signs the user in using third-party OAuth providers.

This method is used for signing in using a third-party provider.
Supabase supports many different third-party providers.
Parameters
provider
Required
OAuthProvider
The OAuth provider to use for signing in.

redirectTo
Optional
String
The URL to redirect the user to after they sign in with the third-party provider.

scopes
Optional
String
A list of scopes to request from the third-party provider.

authScreenLaunchMode
Optional
LaunchMode
The launch mode for the auth screen. Defaults to LaunchMode.platformDefault.

queryParams
Optional
Map<String, String>
Additional query parameters to be passed to the OAuth flow.

Sign in using a third-party provider
With `redirectTo`
With scopes
await supabase.auth.signInWithOAuth(
  OAuthProvider.github,
  redirectTo: kIsWeb ? null : 'my.scheme://my-host', // Optionally set the redirect link to bring back the user via deeplink.
  authScreenLaunchMode:
      kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication, // Launch the auth screen in a new webview on mobile.
);
Sign in a user through SSO
Before you can call this method you need to establish a connection to an identity provider. Use the CLI commands to do this.
If you've associated an email domain to the identity provider, you can use the domain property to start a sign-in flow.
In case you need to use a different way to start the authentication flow with an identity provider, you can use the providerId property. For example:
Mapping specific user email addresses with an identity provider.
Using different hints to identify the correct identity provider, like a company-specific page, IP address or other tracking information.
Parameters
providerId
Optional
String
The ID of the SSO provider to use for signing in.

domain
Optional
String
The email domain to use for signing in.

redirectTo
Optional
String
The URL to redirect the user to after they sign in with the third-party provider.

captchaToken
Optional
String
The captcha token to be used for captcha verification.

launchMode
Optional
LaunchMode
The launch mode for the auth screen. Defaults to LaunchMode.platformDefault.

Sign in with email domain
Sign in with provider UUID
await supabase.auth.signInWithSSO(
  domain: 'company.com',
);
Sign out a user
Signs out the current user, if there is a logged in user.

In order to use the signOut() method, the user needs to be signed in first.
Parameters
scope
Optional
SignOutScope
Whether to sign out from all devices or just the current device. Defaults to SignOutScope.local.

Sign out
await supabase.auth.signOut();
Verify and log in through OTP
The verifyOtp method takes in different verification types. If a phone number is used, the type can either be sms or phone_change. If an email address is used, the type can be one of the following: signup, magiclink, recovery, invite or email_change.
The verification type used should be determined based on the corresponding auth method called before verifyOtp to sign up or sign in a user.
Parameters
token
Required
String
The token that user was sent to their email or mobile phone

type
Required
OtpType
Type of the OTP to verify

email
Optional
String
Email address that the OTP was sent to

phone
Optional
String
Phone number that the OTP was sent to

redirectTo
Optional
String
URI to redirect the user to after the OTP is verified

captchaToken
Optional
String
The captcha token to be used for captcha verification

tokenHash
Optional
String
Token used in an email link

Verify Signup One-Time Password (OTP)
Verify SMS One-Time Password (OTP)
final AuthResponse res = await supabase.auth.verifyOTP(
  type: OtpType.signup,
  token: token,
  phone: '+13334445555',
);
final Session? session = res.session;
final User? user = res.user;
Response
Retrieve a session
Returns the session data, if there is an active session.

Get the session data
final Session? session = supabase.auth.currentSession;
Response
Retrieve a new session
This method will refresh and return a new session whether the current one is expired or not.
Refresh session using the current session
final AuthResponse res = await supabase.auth.refreshSession();
final session = res.session;
Response
Retrieve a user
Returns the user data, if there is a logged in user.

Get the logged in user
final User? user = supabase.auth.currentUser;
Response
Update a user
Updates user data for a logged in user.

In order to use the updateUser() method, the user needs to be signed in first.
By default, email updates sends a confirmation link to both the user's current and new email. To only send a confirmation link to the user's new email, disable Secure email change in your project's email auth provider settings.
Parameters
attributes
Required
UserAttributes
Attributes to update for the user.

Details
emailRedirectTo
Optional
String
The URI to redirect the user to after the email is updated.

Update the email for an authenticated user
Update the password for an authenticated user
Update the user's metadata
Update the user's password with a nonce
final UserResponse res = await supabase.auth.updateUser(
  UserAttributes(
    email: 'example@email.com',
  ),
);
final User? updatedUser = res.user;
Response
Notes
Retrieve identities linked to a user
Gets all the identities linked to a user.

The user needs to be signed in to call getUserIdentities().
Returns a list of identities linked to the user
final identities = await supabase.auth.getUserIdentities();
Response
Link an identity to a user
Links an oauth identity to an existing user. This method supports the PKCE flow.

The Enable Manual Linking option must be enabled from your project's authentication settings.
The user needs to be signed in to call linkIdentity().
If the candidate identity is already linked to the existing user or another user, linkIdentity() will fail.
Parameters
provider
Required
OAuthProvider
The provider to link the identity to.

redirectTo
Optional
String
The URL to redirect the user to after they sign in with the third-party provider.

scopes
Optional
String
A list of scopes to request from the third-party provider.

authScreenLaunchMode
Optional
LaunchMode
The launch mode for the auth screen. Defaults to LaunchMode.platformDefault.

queryParams
Optional
Map<String, String>
Additional query parameters to be passed to the OAuth flow.

Link an identity to a user
await supabase.auth.linkIdentity(OAuthProvider.google);
Unlink an identity from a user
Unlinks an identity from a user by deleting it. The user will no longer be able to sign in with that identity once it's unlinked.

The Enable Manual Linking option must be enabled from your project's authentication settings.
The user needs to be signed in to call unlinkIdentity().
The user must have at least 2 identities in order to unlink an identity.
The identity to be unlinked must belong to the user.
Parameters
identity
Required
UserIdentity
The user identity to unlink.

Unlink an identity
// retrieve all identites linked to a user
final identities = await supabase.auth.getUserIdentities();
// find the google identity
final googleIdentity = identities.firstWhere(
  (element) => element.provider == 'google',
);
// unlink the google identity
await supabase.auth.unlinkIdentity(googleIdentity);
Send a password reauthentication nonce
This method is used together with updateUser() when a user's password needs to be updated.
This method sends a nonce to the user's email. If the user doesn't have a confirmed email address, the method sends the nonce to the user's confirmed phone number instead.
Send reauthentication nonce
await supabase.auth.reauthenticate();
Notes
Resend an OTP
Resends a signup confirmation, email change, or phone change email to the user.
Passwordless sign-ins can be resent by calling the signInWithOtp() method again.
Password recovery emails can be resent by calling the resetPasswordForEmail() method again.
This method only resend an email or phone OTP to the user if an initial signup, email change, or phone change request was made.
Resend an email signup confirmation
final ResendResponse res = await supabase.auth.resend(
  type: OtpType.signup,
  email: 'email@example.com',
);
Notes
Set the session data
setSession() takes in a refresh token and uses it to get a new session.
The refresh token can only be used once to obtain a new session.
Refresh token rotation is enabled by default on all projects to guard against replay attacks.
You can configure the REFRESH_TOKEN_REUSE_INTERVAL which provides a short window in which the same refresh token can be used multiple times in the event of concurrency or offline issues.
Parameters
refreshToken
Required
String
Refresh token to use to get a new session.

Refresh the session
final refreshToken = supabase.currentSession?.refreshToken ?? '';
final AuthResponse response = await supabase.auth.setSession(refreshToken);
final session = res.session;
Response
Notes
Auth MFA
This section contains methods commonly used for Multi-Factor Authentication (MFA) and are invoked behind the supabase.auth.mfa namespace.

Currently, we only support time-based one-time password (TOTP) as the 2nd factor. We don't support recovery codes but we allow users to enroll more than 1 TOTP factor, with an upper limit of 10.

Having a 2nd TOTP factor for recovery means the user doesn't have to store their recovery codes. It also reduces the attack surface since the recovery factor is usually time-limited and not a single static code.

Learn more about implementing MFA on your application on our guide here.

Enroll a factor
Starts the enrollment process for a new Multi-Factor Authentication (MFA) factor. This method creates a new unverified factor. To verify a factor, present the QR code or secret to the user and ask them to add it to their authenticator app. The user has to enter the code from their authenticator app to verify it.

Currently, totp is the only supported factorType. The returned id should be used to create a challenge.
To create a challenge, see mfa.challenge().
To verify a challenge, see mfa.verify().
To create and verify a challenge in a single step, see mfa.challengeAndVerify().
Parameters
factorType
Optional
String
Type of factor being enrolled.

issuer
Optional
String
Domain which the user is enrolled with.

friendlyName
Optional
String
Human readable name assigned to the factor.

Enroll a time-based, one-time password (TOTP) factor
final res = await supabase.auth.mfa.enroll(factorType: FactorType.totp);
final qrCodeUrl = res.totp.qrCode;
Response
Create a challenge
Prepares a challenge used to verify that a user has access to a MFA factor.

An enrolled factor is required before creating a challenge.
To verify a challenge, see mfa.verify().
Parameters
factorId
Required
String
System assigned identifier for authenticator device as returned by enroll

Create a challenge for a factor
final res = await supabase.auth.mfa.challenge(
  factorId: '34e770dd-9ff9-416c-87fa-43b31d7ef225',
);
Response
Verify a challenge
Verifies a code against a challenge. The verification code is provided by the user by entering a code seen in their authenticator app.

To verify a challenge, please create a challenge first.
Parameters
factorId
Required
String
System assigned identifier for authenticator device as returned by enroll

challengeId
Required
String
The ID of the challenge to verify

code
Required
String
The verification code on the user's authenticator app

Verify a challenge for a factor
final res = await supabase.auth.mfa.verify(
  factorId: '34e770dd-9ff9-416c-87fa-43b31d7ef225',
  challengeId: '4034ae6f-a8ce-4fb5-8ee5-69a5863a7c15',
  code: '123456',
);
Response
Create and verify a challenge
Helper method which creates a challenge and immediately uses the given code to verify against it thereafter. The verification code is provided by the user by entering a code seen in their authenticator app.

An enrolled factor is required before invoking challengeAndVerify().
Executes mfa.challenge() and mfa.verify() in a single step.
Parameters
factorId
Required
String
System assigned identifier for authenticator device as returned by enroll

code
Required
String
The verification code on the user's authenticator app

Create and verify a challenge for a factor
final res = await supabase.auth.mfa.challengeAndVerify(
  factorId: '34e770dd-9ff9-416c-87fa-43b31d7ef225',
  code: '123456',
);
Response
Unenroll a factor
Unenroll removes a MFA factor. A user has to have an aal2 authenticator level in order to unenroll a verified factor.

Parameters
factorId
Required
String
System assigned identifier for authenticator device as returned by enroll

Unenroll a factor
final res = await supabase.auth.mfa.unenroll(
  '34e770dd-9ff9-416c-87fa-43b31d7ef225',
);
Response
Get Authenticator Assurance Level
Returns the Authenticator Assurance Level (AAL) for the active session.

Authenticator Assurance Level (AAL) is the measure of the strength of an authentication mechanism.
In Supabase, having an AAL of aal1 means the user has signed in with their first factor, such as email, password, or OAuth sign-in. An AAL of aal2 means the user has also signed in with their second factor, such as a time-based, one-time-password (TOTP).
If the user has a verified factor, the nextLevel field returns aal2. Otherwise, it returns aal1.
Get the AAL details of a session
final res = supabase.auth.mfa.getAuthenticatorAssuranceLevel();
final currentLevel = res.currentLevel;
final nextLevel = res.nextLevel;
final currentAuthenticationMethods = res.currentAuthenticationMethods;
Response
Auth Admin
Any method under the supabase.auth.admin namespace requires a service_role key.
These methods are considered admin methods and should be called on a trusted server. Never expose your service_role key in the Flutter app.
Create server-side auth client
final supabase = SupabaseClient(supabaseUrl, serviceRoleKey);
Retrieve a user
Get user by id.

Fetches the user object from the database based on the user's id.
The getUserById() method requires the user's id which maps to the auth.users.id column.
Parameters
uid
Required
String
User ID of the user to fetch.

Fetch the user object using the access_token jwt
final res = await supabase.auth.admin.getUserById(userId);
final user = res.user;
Response
List all users
Get a list of users.

Defaults to return 50 users per page.
Parameters
page
Optional
int
What page of users to return.

page
Optional
int
How many users to be returned per page. Defaults to 50.

Get a page of users
Paginated list of users
// Returns the first 50 users.
final List<User> users = await supabase.auth.admin.listUsers();
Response
Create a user
Creates a new user.

To confirm the user's email address or phone number, set email_confirm or phone_confirm to true. Both arguments default to false.
createUser() will not send a confirmation email to the user. You can use inviteUserByEmail() if you want to send them an email invite instead.
If you are sure that the created user's email or phone number is legitimate and verified, you can set the email_confirm or phone_confirm param to true.
Parameters
attributes
Required
AdminUserAttributes
Attributes to create the user with.

Details
With custom user metadata
Auto-confirm the user's email
Auto-confirm the user's phone number
final res = await supabase.auth.admin.createUser(AdminUserAttributes(
  email: 'user@email.com',
  password: 'password',
  userMetadata: {'name': 'Yoda'},
));
Response
Delete a user
Delete a user.

The deleteUser() method requires the user's ID, which maps to the auth.users.id column.
Parameters
id
Required
String
ID of the user to be deleted.

Removes a user
await supabase.auth.admin
    .deleteUser('715ed5db-f090-4b8c-a067-640ecee36aa0');
Send an email invite link
Sends an invite link to the user's email address.

Parameters
email
Required
String
Email address of the user to invite.

redirectTo
Optional
String
URI to redirect the user to after they open the invite link.

data
Optional
Map<String, dynamic>
A custom data object to store the user's metadata. This maps to the auth.users.user_metadata column.

Invite a user
final UserResponse res = await supabase.auth.admin
    .inviteUserByEmail('email@example.com');
final User? user = res.user;
Response
Generate an email link
Generates email links and OTPs to be sent via a custom email provider.

The following types can be passed into generateLink(): signup, magiclink, invite, recovery, emailChangeCurrent, emailChangeNew, phoneChange.
generateLink() only generates the email link for email_change_email if the "Secure email change" setting is enabled under the "Email" provider in your Supabase project.
generateLink() handles the creation of the user for signup, invite and magiclink.
Parameters
type
Required
GenerateLinkType
The type of invite link to generate.

email
Required
String
Email address of the user to invite.

password
Optional
String
Password for the user. Required for signup type.

redirectTo
Optional
String
URI to redirect the user to after they open the invite link.

data
Optional
Map<String, dynamic>
A custom data object to store the user's metadata. This maps to the auth.users.user_metadata column.

Generate a signup link
final res = await supabase.auth.admin.generateLink(
  type: GenerateLinkType.signup,
  email: 'email@example.com',
  password: 'secret',
);
final actionLink = res.properties.actionLink;
Response
Update a user
Parameters
uid
Required
GenerateLinkType
User ID of the user to update.

attributes
Required
AdminUserAttributes
Attributes to update for the user.

Details
Updates a user's email
await supabase.auth.admin.updateUserById(
  '6aa5d0d4-2a9f-4483-b6c8-0cf4c6c98ac4',
  attributes: AdminUserAttributes(
    email: 'new@email.com',
  ),
);
Invokes a Supabase Edge Function.
Invokes a Supabase Function. See the guide for details on writing Functions.

Requires an Authorization header.
Invoke params generally match the Fetch API spec.
Parameters
functionName
Required
String
The name of the function to invoke.

headers
Optional
Map<String, String>
Custom headers to send with the request.

body
Optional
Map<String, String>
The body of the request.

method
Optional
HttpMethod
HTTP method of the request. Defaults to POST.

Basic invocation.
Specifying response type.
Parsing custom headers.
final res = await supabase.functions.invoke('hello', body: {'foo': 'baa'});
final data = res.data;
Listen to database changes
Returns real-time data from your table as a Stream.

Realtime is disabled by default for new tables. You can turn it on by managing replication.
stream() will emit the initial data as well as any further change on the database as Stream<List<Map<String, dynamic>>> by combining Postgrest and Realtime.
Takes a list of primary key column names that will be used to update and delete the proper records within the SDK.
The following filters are available
.eq('column', value) listens to rows where the column equals the value
.neq('column', value) listens to rows where the column does not equal the value
.gt('column', value) listens to rows where the column is greater than the value
.gte('column', value) listens to rows where the column is greater than or equal to the value
.lt('column', value) listens to rows where the column is less than the value
.lte('column', value) listens to rows where the column is less than or equal to the value
.inFilter('column', [val1, val2, val3]) listens to rows where the column is one of the values
Listen to a table
With filter, order and limit
With an IN filter
Using `stream()` with `StreamBuilder`
supabase.from('countries')
  .stream(primaryKey: ['id'])
  .listen((List<Map<String, dynamic>> data) {
  // Do something awesome with the data
});
Subscribe to channel
Subscribe to realtime changes in your database.

Realtime is disabled by default for new tables. You can turn it on by managing replication.
If you want to receive the "previous" data for updates and deletes, you will need to set REPLICA IDENTITY to FULL, like this: ALTER TABLE your_table REPLICA IDENTITY FULL;
Listen to database changes
Listen to inserts
Listen to updates
Listen to deletes
Listen to multiple events
Listen to row level changes
Listen to broadcast messages
Listen to presence events
supabase
    .channel('public:countries')
    .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'countries',
        callback: (payload) {
          print('Change received: ${payload.toString()}');
        })
    .subscribe();
Unsubscribe from a channel
Unsubscribes and removes Realtime channel from Realtime client.

Removing a channel is a great way to maintain the performance of your project's Realtime service as well as your database if you're listening to Postgres changes. Supabase will automatically handle cleanup 30 seconds after a client is disconnected, but unused channels may cause degradation as more clients are simultaneously subscribed.
Remove a channel
final status = await supabase.removeChannel(channel);
Unsubscribe from all channels
Unsubscribes and removes all Realtime channels from Realtime client.

Removing channels is a great way to maintain the performance of your project's Realtime service as well as your database if you're listening to Postgres changes. Supabase will automatically handle cleanup 30 seconds after a client is disconnected, but unused channels may cause degradation as more clients are simultaneously subscribed.
Remove all channels
final statuses = await supabase.removeAllChannels();
Retrieve all channels
Returns all Realtime channels.

Get all channels
final channels = supabase.getChannels();
Create a bucket
Creates a new Storage bucket

Policy permissions required:
buckets permissions: insert
objects permissions: none
Refer to the Storage guide on how access control works
Parameters
id
Required
String
A unique identifier for the bucket you are creating.

bucketOptions
Optional
BucketOptions
A parameter to optionally make the bucket public.

Details
Create bucket
final String bucketId = await supabase
  .storage
  .createBucket('avatars');
Response
Retrieve a bucket
Retrieves the details of an existing Storage bucket.

Policy permissions required:
buckets permissions: select
objects permissions: none
Refer to the Storage guide on how access control works
Parameters
id
Required
String
The unique identifier of the bucket you would like to retrieve.

Get bucket
final Bucket bucket = await supabase
  .storage
  .getBucket('avatars');
Response
List all buckets
Retrieves the details of all Storage buckets within an existing product.

Policy permissions required:
buckets permissions: select
objects permissions: none
Refer to the Storage guide on how access control works
List buckets
final List<Bucket> buckets = await supabase
  .storage
  .listBuckets();
Response
Update a bucket
Updates a new Storage bucket

Policy permissions required:
buckets permissions: update
objects permissions: none
Refer to the Storage guide on how access control works
Parameters
id
Required
String
A unique identifier for the bucket you are updating.

bucketOptions
Required
BucketOptions
A parameter to optionally make the bucket public.

Details
Update bucket
final String res = await supabase
  .storage
  .updateBucket('avatars', const BucketOptions(public: false));
Response
Delete a bucket
Deletes an existing bucket. A bucket can't be deleted with existing objects inside it. You must first empty() the bucket.

Policy permissions required:
buckets permissions: select and delete
objects permissions: none
Refer to the Storage guide on how access control works
Parameters
id
Required
String
A unique identifier for the bucket you are deleting.

Delete bucket
final String res = await supabase
  .storage
  .deleteBucket('avatars');
Response
Empty a bucket
Removes all objects inside a single bucket.

Policy permissions required:
buckets permissions: select
objects permissions: select and delete
Refer to the Storage guide on how access control works
Parameters
id
Required
String
A unique identifier for the bucket you are emptying.

Empty bucket
final String res = await supabase
  .storage
  .emptyBucket('avatars');
Response
Upload a file
Uploads a file to an existing bucket.

Policy permissions required:
buckets permissions: none
objects permissions: insert
Refer to the Storage guide on how access control works
Parameters
path
Required
String
The relative file path. Should be of the format folder/subfolder/filename.png. The bucket must already exist before attempting to update.

file
Required
File or Uint8List
File object to be stored in the bucket.

fileOptions
Optional
FileOptions
Details
retryAttempts
Optional
int
Sets the retryAttempts parameter set across the storage client. Defaults to 10.

retryController
Optional
StorageRetryController
Pass a RetryController instance and call cancel() to cancel the retry attempts.

Upload file
Upload file on web
final avatarFile = File('path/to/file');
final String fullPath = await supabase.storage.from('avatars').upload(
      'public/avatar1.png',
      avatarFile,
      fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
    );
Response
Download a file
Downloads a file.

Policy permissions required:
buckets permissions: none
objects permissions: select
Refer to the Storage guide on how access control works
Parameters
path
Required
String
The full path and file name of the file to be downloaded. For example folder/image.png.

transform
Optional
TransformOptions
Transform the asset before serving it to the client.

Details
Download file
With transform
final Uint8List file = await supabase
  .storage
  .from('avatars')
  .download('avatar1.png');
Response
List all files in a bucket
Lists all the files within a bucket.

Policy permissions required:
buckets permissions: none
objects permissions: select
Refer to the Storage guide on how access control works
Parameters
path
Required
String
The folder path.

searchOptions
Optional
SearchOptions
Options for the search operations such as limit and offset.

Details
List files in a bucket
final List<FileObject> objects = await supabase
  .storage
  .from('avatars')
  .list();
Response
Replace an existing file
Replaces an existing file at the specified path with a new one.

Policy permissions required:
buckets permissions: none
objects permissions: update and select
Refer to the Storage guide on how access control works
Parameters
path
Required
String
The relative file path. Should be of the format folder/subfolder/filename.png. The bucket must already exist before attempting to update.

file
Required
File or Uint8List
File object to be stored in the bucket.

fileOptions
Optional
FileOptions
Details
retryAttempts
Optional
int
Sets the retryAttempts parameter set across the storage client. Defaults to 10.

retryController
Optional
StorageRetryController
Pass a RetryController instance and call cancel() to cancel the retry attempts.

Update file
Update file on web
final avatarFile = File('path/to/local/file');
final String path = await supabase.storage.from('avatars').update(
      'public/avatar1.png',
      avatarFile,
      fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
    );
Response
Move an existing file
Moves an existing file, optionally renaming it at the same time.

Policy permissions required:
buckets permissions: none
objects permissions: update and select
Refer to the Storage guide on how access control works
Parameters
fromPath
Required
String
The original file path, including the current file name. For example folder/image.png.

toPath
Required
String
The new file path, including the new file name. For example folder/image-new.png.

Move file
final String result = await supabase
  .storage
  .from('avatars')
  .move('public/avatar1.png', 'private/avatar2.png');
Response
Delete files in a bucket
Deletes files within the same bucket

Policy permissions required:
buckets permissions: none
objects permissions: delete and select
Refer to the Storage guide on how access control works
Parameters
paths
Required
List<String>
A list of files to delete, including the path and file name. For example ['folder/image.png'].

Delete file
final List<FileObject> objects = await supabase
  .storage
  .from('avatars')
  .remove(['avatar1.png']);
Response
Create a signed URL
Create signed url to download file without requiring permissions. This URL can be valid for a set number of seconds.

Policy permissions required:
buckets permissions: none
objects permissions: select
Refer to the Storage guide on how access control works
Parameters
path
Required
String
The file path, including the file name. For example folder/image.png.

expiresIn
Required
int
The number of seconds until the signed URL expires. For example, 60 for a URL which is valid for one minute.

transform
Optional
TransformOptions
Transform the asset before serving it to the client.

Details
Create Signed URL
With transform
final String signedUrl = await supabase
  .storage
  .from('avatars')
  .createSignedUrl('avatar1.png', 60);
Retrieve public URL
Retrieve URLs for assets in public buckets

The bucket needs to be set to public, either via updateBucket() or by going to Storage on supabase.com/dashboard, clicking the overflow menu on a bucket and choosing "Make public"
Policy permissions required:
buckets permissions: none
objects permissions: none
Refer to the Storage guide on how access control works
Parameters
path
Required
String
The path and name of the file to generate the public URL for. For example folder/image.png.

transform
Optional
TransformOptions
Transform the asset before serving it to the client.

Details
Returns the URL for an asset in a public bucket
With transform
final String publicUrl = supabase
  .storage
  .from('public-bucket')
  .getPublicUrl('avatar1.png');
Response