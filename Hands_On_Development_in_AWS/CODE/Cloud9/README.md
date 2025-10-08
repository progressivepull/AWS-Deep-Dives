# Cloud9
The code in this directory is for the Cloud9 demonstration using the readline-sync node.js module.

## Install
```
npm install readline-sync
```

## Code
```
var readline = require('readline-sync');
var i = 10;
var input;

console.log("Hello Cloud9!");
console.log("i is " + i);

do {
    input = readline.question("Enter a number (or 'q' to quit): ");
    if (input === 'q') {
        console.log('OK, exiting.')
    }
    else{
        i += Number(input);
        console.log("i is now " + i);
    }
} while (input != 'q');

console.log("Goodbye!");
```

## Run
Use a Run Configuration from within Cloud9  
```
Debugger listening on ws://127.0.0.1:15454/7c9c7f84-6320-4262-93e4-f1c5d438ca60
For help, see: https://nodejs.org/en/docs/inspector
Debugger attached.
Hello Cloud9!
i is 10
Enter a number (or 'q' to quit): 3
i is now 13
Enter a number (or 'q' to quit): 4
i is now 17
Enter a number (or 'q' to quit): 5
i is now 22
Enter a number (or 'q' to quit): 383883838383
i is now 383883838405
Enter a number (or 'q' to quit): q
OK, exiting.
Goodbye!
Waiting for the debugger to disconnect...
```
