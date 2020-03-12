// no_c2a0-1.js
// clean 0xc2a0 (utf-8 encode, U+00A0, Unicode NO BREAKING SPACE in text files
// usage: node no_c2a0.js 1.txt 2.txt

const fs = require("fs");

const CODE_C2A0 = 160;


function clean(f) {
  console.log("CLEAN " + f);

 const b = fs.readFileSync(f);
  const t = b.toString("utf-8");

  let o = "";

 for (let i = 0; i < t.length; i += 1) {
  const c = t.charCodeAt(i);
  if (c != CODE_C2A0) {
   o += t[i];
   }

  //if (c < 128) {
  // o += t[i];
  //} else {
  // console.log("pos " + i + ", code " + c);
  //}
  }

  fs.writeFileSync(f, o, "utf-8");
}

function no_c2a0() {
  const f = process.argv.slice(2);

 for (let i of f) {
  clean(i);
  }
}

no_c2a0();

// 20200312 0357
