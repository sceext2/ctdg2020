// trim_line.js
// trim empty line
// usage: node trim_line.js 1.txt

const fs = require("fs");


function trim_one(f) {
  const t = fs.readFileSync(f, "utf-8");
  const l = t.split("\n");
  const o = [];
  for (let i of l) {
    if (i.trim().length < 1) {
      o.push("");
    } else {
      o.push(i);
    }
  }
  fs.writeFileSync(f, o.join("\n"), "utf-8");
}

function trim_main() {
  for (let i of process.argv.slice(2)) {
    console.log("TRIM  " + i);
    trim_one(i);
  }
}

trim_main();

// 20200312 0533
