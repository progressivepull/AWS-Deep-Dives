# CodeBuild Unit Testing
BodeBuild can pass/fail a build in an automated fashion by inspecting the return value of a test command in the pre_build phase of buildspec.yaml.  

Here's an example of that outside of CodeBuild:   
```
$ npm test

> codebuild_testing@1.0.0 test
> mocha --recursive tests --exit

restify listening at http://[::]:8080


  Tests root
    ✔ verifies get /

  Array
    #indexOf()
      ✔ should return -1 when the value is not present


  2 passing (31ms)

$ echo $?
0

$ vi tests/get_root.js
## Modify the test so it fails

$ npm test

> codebuild_testing@1.0.0 test
> mocha --recursive tests --exit

restify listening at http://[::]:8080


  Tests root
    1) verifies get /

  Array
    #indexOf()
      ✔ should return -1 when the value is not present


  1 passing (24ms)
  1 failing

  1) Tests root
       verifies get /:

      Uncaught AssertionError: "\"root\"" must include "droot"
      + expected - actual

      -"root"
      +droot

      at StringAsserter.contains (node_modules/unit.js/src/assertions.js:913:22)
      at Test.<anonymous> (tests/get_root.js:12:32)
      at Test.assert (node_modules/supertest/lib/test.js:172:8)
      at localAssert (node_modules/supertest/lib/test.js:120:14)
      at /Users/nick/bb/CodeBuild_Testing/node_modules/supertest/lib/test.js:125:7
      at Request.callback (node_modules/superagent/lib/node/index.js:857:12)
      at /Users/nick/bb/CodeBuild_Testing/node_modules/superagent/lib/node/index.js:1070:18
      at IncomingMessage.<anonymous> (node_modules/superagent/lib/node/parsers/json.js:21:7)
      at IncomingMessage.emit (node:events:525:35)
      at endReadableNT (node:internal/streams/readable:1359:12)
      at process.processTicksAndRejections (node:internal/process/task_queues:82:21)



$ echo $?
1

```



Here's an example from inside CodeBuild:
```
[Container] 2023/06/14 20:12:46 Waiting for agent ping
[Container] 2023/06/14 20:12:47 Waiting for DOWNLOAD_SOURCE
[Container] 2023/06/14 20:12:54 Phase is DOWNLOAD_SOURCE
[Container] 2023/06/14 20:12:54 CODEBUILD_SRC_DIR=/codebuild/output/src326885626/src/git-codecommit.us-east-2.amazonaws.com/v1/repos/CodeBuild_Testing
[Container] 2023/06/14 20:12:54 YAML location is /codebuild/output/src326885626/src/git-codecommit.us-east-2.amazonaws.com/v1/repos/CodeBuild_Testing/buildspec.yaml
[Container] 2023/06/14 20:12:54 Not setting HTTP client timeout for source type codecommit
[Container] 2023/06/14 20:12:54 Processing environment variables
[Container] 2023/06/14 20:12:54 Selecting 'nodejs' runtime version '18' based on manual selections...
[Container] 2023/06/14 20:12:54 Running command echo "Installing Node.js version 18 ..."
Installing Node.js version 18 ...

[Container] 2023/06/14 20:12:54 Running command n $NODE_18_VERSION
     copying : node/18.16.0
   installed : v18.16.0 (with npm 9.5.1)

[Container] 2023/06/14 20:13:27 Moving to directory /codebuild/output/src326885626/src/git-codecommit.us-east-2.amazonaws.com/v1/repos/CodeBuild_Testing
[Container] 2023/06/14 20:13:27 Configuring ssm agent with target id: codebuild:a606c61c-2fe6-4423-8d5a-c1c67fb0784b
[Container] 2023/06/14 20:13:27 Successfully updated ssm agent configuration
[Container] 2023/06/14 20:13:27 Registering with agent
[Container] 2023/06/14 20:13:27 Phases found in YAML: 3
[Container] 2023/06/14 20:13:27  INSTALL: 1 commands
[Container] 2023/06/14 20:13:27  PRE_BUILD: 1 commands
[Container] 2023/06/14 20:13:27  POST_BUILD: 2 commands
[Container] 2023/06/14 20:13:27 Phase complete: DOWNLOAD_SOURCE State: SUCCEEDED
[Container] 2023/06/14 20:13:27 Phase context status code:  Message:
[Container] 2023/06/14 20:13:27 Entering phase INSTALL
[Container] 2023/06/14 20:13:27 Running command npm install
npm WARN deprecated formidable@1.2.6: Please upgrade to latest, formidable@v2 or formidable@v3! Check these notes: https://bit.ly/2ZEqIau
npm WARN deprecated superagent@3.8.3: Please upgrade to v7.0.2+ of superagent.  We have fixed numerous issues with streams, form-data, attach(), filesystem errors not bubbling up (ENOENT on attach()), and all tests are now passing.  See the releases tab for more information at <https://github.com/visionmedia/superagent/releases>.

added 254 packages, and audited 255 packages in 8s

32 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

[Container] 2023/06/14 20:13:36 Phase complete: INSTALL State: SUCCEEDED
[Container] 2023/06/14 20:13:36 Phase context status code:  Message:
[Container] 2023/06/14 20:13:36 Entering phase PRE_BUILD
[Container] 2023/06/14 20:13:36 Running command npm test

> codebuild_testing@1.0.0 test
> mocha --recursive tests --exit

(node:250) [DEP0111] DeprecationWarning: Access to process.binding('http_parser') is deprecated.
(Use `node --trace-deprecation ...` to show where the warning was created)
restify listening at http://[::]:8080


  Tests hello/nick
    ✔ verifies get /hello/nick

  Tests root
    1) verifies get /

  Array
    #indexOf()
      ✔ should return -1 when the value is not present


  2 passing (22ms)
  1 failing

  1) Tests root
       verifies get /:

      Uncaught AssertionError: "\"root\"" must include "droot"
      + expected - actual

      -"root"
      +droot

      at StringAsserter.contains (node_modules/unit.js/src/assertions.js:913:22)
      at Test.<anonymous> (tests/get_root.js:12:32)
      at Test.assert (node_modules/supertest/lib/test.js:172:8)
      at localAssert (node_modules/supertest/lib/test.js:120:14)
      at /codebuild/output/src326885626/src/git-codecommit.us-east-2.amazonaws.com/v1/repos/CodeBuild_Testing/node_modules/supertest/lib/test.js:125:7
      at Request.callback (node_modules/superagent/lib/node/index.js:857:12)
      at /codebuild/output/src326885626/src/git-codecommit.us-east-2.amazonaws.com/v1/repos/CodeBuild_Testing/node_modules/superagent/lib/node/index.js:1070:18
      at IncomingMessage.<anonymous> (node_modules/superagent/lib/node/parsers/json.js:21:7)
      at IncomingMessage.emit (node:events:525:35)
      at endReadableNT (node:internal/streams/readable:1359:12)
      at process.processTicksAndRejections (node:internal/process/task_queues:82:21)




[Container] 2023/06/14 20:13:37 Command did not exit successfully npm test exit status 1
[Container] 2023/06/14 20:13:37 Phase complete: PRE_BUILD State: FAILED
[Container] 2023/06/14 20:13:37 Phase context status code: COMMAND_EXECUTION_ERROR Message: Error while executing command: npm test. Reason: exit status 1
```
