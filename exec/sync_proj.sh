#!/usr/bin/env node

const shell = require('shelljs');
const syncProjCmd = '/Users/Aaron/exec/proj2ram.sh';
const syncEmacsCmd = '/Users/Aaron/exec/emacs2ram.sh';

const projList = [
  // 'beats-ex'
];

if (process.argv.length !== 3) {
  console.log('Usage: sync_proj.sh [operation]');
  console.log('operation:');
  console.log('\tr: restore from ramdisk to disk');
  console.log('\ts: sync from disk to ramdisk');
  console.log("Please type operation to 's' or 'r'");
  process.exit(1);
}

const operation = process.argv[2];

// sync emacs
shell.exec(`USER=aaron ${syncEmacsCmd} ${operation}`);

// sync projects
projList.forEach((p) => shell.exec(`USER=aaron ${syncProjCmd} ${operation} ${p}`));
