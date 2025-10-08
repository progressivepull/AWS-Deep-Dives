# Amplify
Full Deployment:
```
[nick@nuc Amplify]$ sh create_and_deploy.sh
>>>>>   Note: use 'amplify delete' from /tmp/amplify to delete all resources created in this demo.

>>>>>   NOTE: It is recommended to create a new IAM user
>>>>>         for every device that installs the Amplify
>>>>>         CLI, rather than attempt to use an existing
>>>>>         IAM user used on another device. Having a
>>>>>         distinct user for each machine provides the
>>>>>         best level of visibility and control without
>>>>>         breaking the deployment of your app, allowing
>>>>>         for the quick deactivation of an individual
>>>>>         machine if needed.

>>>>>   Original working directory:  /home/nick/bb/awsdevassoc/Amplify

>>>>>   Installing AWS Amplify CLI
>>>>>   sudo npm install -g @aws-amplify/cli
[sudo] password for nick:

changed 26 packages, and audited 27 packages in 21s

7 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

>>>>>   amplify configure (skipping), assuming AWS credentials already configured
>>>>>     See: https://docs.amplify.aws/start/getting-started/installation/q/integration/js/

>>>>>   mkdir /tmp/amplify; cd /tmp/amplify; cp some files
'/home/nick/bb/awsdevassoc/Amplify/app_files/package.json' -> './package.json'
'/home/nick/bb/awsdevassoc/Amplify/app_files/webpack.config.js' -> './webpack.config.js'
'/home/nick/bb/awsdevassoc/Amplify/app_files/index.html' -> './index.html'
'/home/nick/bb/awsdevassoc/Amplify/app_files/app.js' -> './src/app.js'

>>>>>   npm install
npm WARN deprecated source-map-url@0.4.1: See https://github.com/lydell/source-map-url#deprecated
npm WARN deprecated urix@0.1.0: Please see https://github.com/lydell/urix#deprecated
npm WARN deprecated resolve-url@0.2.1: https://github.com/lydell/resolve-url#deprecated
npm WARN deprecated source-map-resolve@0.5.3: See https://github.com/lydell/source-map-resolve#deprecated
npm WARN deprecated querystring@0.2.0: The querystring API is considered Legacy. new code should use the URLSearchParams API instead.
npm WARN deprecated uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated uglify-es@3.3.9: support for ECMAScript is superseded by `uglify-js` as of v3.13.0

added 1465 packages, and audited 1466 packages in 16s

75 packages are looking for funding
  run `npm fund` for details

11 high severity vulnerabilities

To address all issues (including breaking changes), run:
  npm audit fix --force

Run `npm audit` for details.

>>>>>   amplify init
>>>>>     This will:
>>>>>     - create amplify directory with backend definitions
>>>>>     - create aws-exports.js in src directory for use in yoru app
>>>>>     - modify .gitignore to ignore generated files
>>>>>     - create amplify project to be see in Amplify web console
Note: It is recommended to run this command from the root of your app directory
? Enter a name for the project amplify
The following configuration will be applied:

Project information
| Name: amplify
| Environment: dev
| Default editor: Visual Studio Code
| App type: javascript
| Javascript framework: none
| Source Directory Path: src
| Distribution Directory Path: dist
| Build Command: npm run-script build
| Start Command: npm run-script start

? Initialize the project with the above configuration? Yes
Using default provider  awscloudformation
? Select the authentication method you want to use: AWS access keys
? accessKeyId:  ********************
? secretAccessKey:  ****************************************
? region:  us-east-2
Adding backend environment dev to AWS Amplify app: d20fks9urlxy7b

Deployment completed.
Deploying root stack amplify [ ====================-------------------- ] 2/4
        amplify-amplify-dev-140903     AWS::CloudFormation::Stack     CREATE_IN_PROGRESS             Wed Jun 07 2023 14:10:28…
        UnauthRole                     AWS::IAM::Role                 CREATE_COMPLETE                Wed Jun 07 2023 14:10:43…
        DeploymentBucket               AWS::S3::Bucket                CREATE_IN_PROGRESS             Wed Jun 07 2023 14:10:31…
        AuthRole                       AWS::IAM::Role                 CREATE_COMPLETE                Wed Jun 07 2023 14:10:43…

✔ Help improve Amplify CLI by sharing non sensitive configurations on failures (y/N) · no
Deployment state saved successfully.
✔ Initialized provider successfully.
✅ Initialized your environment successfully.

Your project has been successfully initialized and connected to the cloud!

Some next steps:
"amplify status" will show you what you've added already and if it's locally configured or deployed
"amplify add <category>" will allow you to add features like user login or a backend API
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify console" to open the Amplify Console and view your project status
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

Pro tip:
Try "amplify add api" to create a backend API and then "amplify push" to deploy everything


>>>>>   amplify add api
? Select from one of the below mentioned services: GraphQL
? Here is the GraphQL API that we will create. Select a setting to edit or continue Continue
? Choose a schema template: Single object with fields (e.g., “Todo” with ID, name, description)

⚠  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

✅ GraphQL schema compiled successfully.

Edit your schema at /tmp/amplify/amplify/backend/api/amplify/schema.graphql or place .graphql files in a directory at /tmp/amplify/amplify/backend/api/amplify/schema
✔ Do you want to edit the schema now? (Y/n) · no
✅ Successfully added resource amplify locally

✅ Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud


>>>>>   amplify push
⠦ Fetching updates to backend environment: dev from the cloud.
⚠  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

⠋ Fetching updates to backend environment: dev from the cloud.✅ GraphQL schema compiled successfully.

Edit your schema at /tmp/amplify/amplify/backend/api/amplify/schema.graphql or place .graphql files in a directory at /tmp/amplify/amplify/backend/api/amplify/schema
✔ Successfully pulled backend environment dev from the cloud.
⠹ Building resource api/amplify
⚠  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

⠧ Building resource api/amplify✅ GraphQL schema compiled successfully.

Edit your schema at /tmp/amplify/amplify/backend/api/amplify/schema.graphql or place .graphql files in a directory at /tmp/amplify/amplify/backend/api/amplify/schema

    Current Environment: dev

┌──────────┬───────────────┬───────────┬───────────────────┐
│ Category │ Resource name │ Operation │ Provider plugin   │
├──────────┼───────────────┼───────────┼───────────────────┤
│ Api      │ amplify       │ Create    │ awscloudformation │
└──────────┴───────────────┴───────────┴───────────────────┘
✔ Are you sure you want to continue? (Y/n) · yes

⚠  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

✅ GraphQL schema compiled successfully.

Edit your schema at /tmp/amplify/amplify/backend/api/amplify/schema.graphql or place .graphql files in a directory at /tmp/amplify/amplify/backend/api/amplify/schema
⠴ Building resource api/amplify
⚠  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

⠏ Building resource api/amplify✅ GraphQL schema compiled successfully.

Edit your schema at /tmp/amplify/amplify/backend/api/amplify/schema.graphql or place .graphql files in a directory at /tmp/amplify/amplify/backend/api/amplify/schema
? Do you want to generate code for your newly created GraphQL API Yes
? Choose the code generation language target javascript
? Enter the file name pattern of graphql queries, mutations and subscriptions src/graphql/**/*.js
? Do you want to generate/update all possible GraphQL operations - queries, mutations and subscriptions Yes
? Enter maximum statement depth [increase from default if your schema is deeply nested] 2

Deployment completed.
Deployed root stack amplify [ ======================================== ] 2/2
        amplify-amplify-dev-140903     AWS::CloudFormation::Stack     UPDATE_COMPLETE                Wed Jun 07 2023 14:13:51…
        apiamplify                     AWS::CloudFormation::Stack     CREATE_COMPLETE                Wed Jun 07 2023 14:13:49…
Deployed api amplify [ ======================================== ] 6/6
        GraphQLAPI                     AWS::AppSync::GraphQLApi       CREATE_COMPLETE                Wed Jun 07 2023 14:12:20…
        GraphQLAPITransformerSchema3C… AWS::AppSync::GraphQLSchema    CREATE_COMPLETE                Wed Jun 07 2023 14:12:33…
        GraphQLAPIDefaultApiKey215A6D… AWS::AppSync::ApiKey           CREATE_COMPLETE                Wed Jun 07 2023 14:12:22…
        GraphQLAPINONEDS95A13CF0       AWS::AppSync::DataSource       CREATE_COMPLETE                Wed Jun 07 2023 14:12:33…
        Todo                           AWS::CloudFormation::Stack     CREATE_COMPLETE                Wed Jun 07 2023 14:13:22…

✔ Generated GraphQL operations successfully and saved at src/graphql
Deployment state saved successfully.

GraphQL endpoint: https://pjjfxe6pfjbvzll2gmcextobgi.appsync-api.us-east-2.amazonaws.com/graphql
GraphQL API KEY: da2-ziqfqxgxavhijczvmxj4zq6xuq

GraphQL transformer version: 2

Browserslist: caniuse-lite is outdated. Please run:
  npx update-browserslist-db@latest
  Why you should do it regularly: https://github.com/browserslist/update-db#readme

>>>>>   amplify status

    Current Environment: dev

┌──────────┬───────────────┬───────────┬───────────────────┐
│ Category │ Resource name │ Operation │ Provider plugin   │
├──────────┼───────────────┼───────────┼───────────────────┤
│ Api      │ amplify       │ No Change │ awscloudformation │
└──────────┴───────────────┴───────────┴───────────────────┘

GraphQL endpoint: https://pjjfxe6pfjbvzll2gmcextobgi.appsync-api.us-east-2.amazonaws.com/graphql
GraphQL API KEY: da2-ziqfqxgxavhijczvmxj4zq6xuq

GraphQL transformer version: 2


>>>>>   Head over to https://us-east-2.console.aws.amazon.com/appsync/home and test Queries to your new API
>>>>>     Press enter to continue...


>>>>>   Running locally with: npm start
>>>>>     Surf to localhost:8080
>>>>>     Ctrl-C to kill and deploy

> amplify@1.0.0 start
> webpack && webpack-dev-server --mode development

asset main.bundle.js 2.55 MiB [emitted] (name: main)
asset index.html 1.67 KiB [emitted] [from: index.html] [copied]
orphan modules 8.23 MiB [orphan] 1574 modules
runtime modules 27.5 KiB 13 modules
cacheable modules 1.98 MiB
  modules by path ./node_modules/ 1.98 MiB 332 modules
  modules by path ./src/ 4.13 KiB
    modules by path ./src/graphql/*.js 2.25 KiB
      ./src/graphql/mutations.js 916 bytes [built] [code generated]
      ./src/graphql/queries.js 596 bytes [built] [code generated]
      ./src/graphql/subscriptions.js 790 bytes [built] [code generated]
    modules by path ./src/*.js 1.88 KiB
      ./src/app.js 1.41 KiB [built] [code generated]
      ./src/aws-exports.js 478 bytes [built] [code generated]
  crypto (ignored) 15 bytes [optional] [built] [code generated]
webpack 5.86.0 compiled successfully in 2035 ms
<w> [webpack-dev-server] "hot: true" automatically applies HMR plugin, you don't have to add it manually to your webpack configuration.
<i> [webpack-dev-server] Project is running at:
<i> [webpack-dev-server] Loopback: http://localhost:8080/
<i> [webpack-dev-server] On Your Network (IPv4): http://192.168.0.73:8080/
<i> [webpack-dev-server] Content not from webpack is served from '/tmp/amplify/public' directory
asset main.bundle.js 2.76 MiB [emitted] (name: main)
asset index.html 1.67 KiB [emitted] [from: index.html] [copied]
orphan modules 8.21 MiB [orphan] 1573 modules
runtime modules 27.5 KiB 13 modules
cacheable modules 2.16 MiB
  modules by path ./node_modules/ 2.15 MiB 358 modules
  modules by path ./src/ 4.13 KiB
    modules by path ./src/graphql/*.js 2.25 KiB
      ./src/graphql/mutations.js 916 bytes [built] [code generated]
      ./src/graphql/queries.js 596 bytes [built] [code generated]
      ./src/graphql/subscriptions.js 790 bytes [built] [code generated]
    modules by path ./src/*.js 1.88 KiB
      ./src/app.js 1.41 KiB [built] [code generated]
      ./src/aws-exports.js 478 bytes [built] [code generated]
  crypto (ignored) 15 bytes [optional] [built] [code generated]
webpack 5.86.0 compiled successfully in 1957 ms
^C<i> [webpack-dev-server] Gracefully shutting down. To force exit, press ^C again. Please wait...

>>>>>   Do you want to add hosting? (Y|n)
create_and_deploy.sh: line 82: [: ==: unary operator expected
>>>>>   amplify add hosting
✔ Select the plugin module to execute · Hosting with Amplify Console (Managed hosting with custom domains, Continuous deployment)
? Choose a type Manual deployment

You can now publish your app using the following command:

Command: amplify publish

>>>>>   amplify publish
⠋ Fetching updates to backend environment: dev from the cloud.
⚠  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

⠏ Fetching updates to backend environment: dev from the cloud.✅ GraphQL schema compiled successfully.

Edit your schema at /tmp/amplify/amplify/backend/api/amplify/schema.graphql or place .graphql files in a directory at /tmp/amplify/amplify/backend/api/amplify/schema
✔ Successfully pulled backend environment dev from the cloud.

    Current Environment: dev

┌──────────┬────────────────┬───────────┬───────────────────┐
│ Category │ Resource name  │ Operation │ Provider plugin   │
├──────────┼────────────────┼───────────┼───────────────────┤
│ Hosting  │ amplifyhosting │ Create    │ awscloudformation │
├──────────┼────────────────┼───────────┼───────────────────┤
│ Api      │ amplify        │ No Change │ awscloudformation │
└──────────┴────────────────┴───────────┴───────────────────┘
✔ Are you sure you want to continue? (Y/n) · yes

Deployment completed.
Deploying root stack amplify [ ===========================------------- ] 2/3
        amplify-amplify-dev-140903     AWS::CloudFormation::Stack     UPDATE_COMPLETE_CLEANUP_IN_PR… Wed Jun 07 2023 14:15:47…
        hostingamplifyhosting          AWS::CloudFormation::Stack     CREATE_COMPLETE                Wed Jun 07 2023 14:15:46…
        apiamplify                     AWS::CloudFormation::Stack     UPDATE_COMPLETE                Wed Jun 07 2023 14:15:46…
Deployed hosting amplifyhosting [ ======================================== ] 1/1
        AmplifyBranch                  AWS::Amplify::Branch           CREATE_COMPLETE                Wed Jun 07 2023 14:15:40…

Deployment state saved successfully.

GraphQL transformer version: 2

Browserslist: caniuse-lite is outdated. Please run:
  npx update-browserslist-db@latest
  Why you should do it regularly: https://github.com/browserslist/update-db#readme
Publish started for amplifyhosting

> amplify@1.0.0 build
> webpack

asset main.bundle.js 2.55 MiB [compared for emit] (name: main)
asset index.html 1.67 KiB [compared for emit] [from: index.html] [copied]
orphan modules 8.23 MiB [orphan] 1574 modules
runtime modules 27.5 KiB 13 modules
cacheable modules 1.98 MiB
  modules by path ./node_modules/ 1.98 MiB 332 modules
  modules by path ./src/ 4.13 KiB
    modules by path ./src/graphql/*.js 2.25 KiB
      ./src/graphql/mutations.js 916 bytes [built] [code generated]
      ./src/graphql/queries.js 596 bytes [built] [code generated]
      ./src/graphql/subscriptions.js 790 bytes [built] [code generated]
    modules by path ./src/*.js 1.88 KiB
      ./src/app.js 1.41 KiB [built] [code generated]
      ./src/aws-exports.js 478 bytes [built] [code generated]
  crypto (ignored) 15 bytes [optional] [built] [code generated]
webpack 5.86.0 compiled successfully in 1997 ms
✔ Zipping artifacts completed.
✔ Deployment complete!
https://dev.d20fks9urlxy7b.amplifyapp.com

[nick@nuc Amplify]$
```
