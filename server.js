// 诗云 · 本地静态文件服务器
// 用法: node server.js
const http = require('http');
const fs   = require('fs');
const path = require('path');

const PORT = 8080;
const HOST = '127.0.0.1';
const ROOT = __dirname;

const MIME = {
  '.html':     'text/html; charset=utf-8',
  '.js':       'application/javascript',
  '.wasm':     'application/wasm',
  '.tflite':   'application/octet-stream',
  '.binarypb': 'application/octet-stream',
  '.data':     'application/octet-stream',
  '.css':      'text/css',
  '.json':     'application/json',
  '.png':      'image/png',
  '.svg':      'image/svg+xml',
};

http.createServer((req, res) => {
  let urlPath = req.url.split('?')[0];
  try { urlPath = decodeURIComponent(urlPath); } catch (_) { /* keep raw */ }
  const filePath = path.join(ROOT, urlPath);
  const ext = path.extname(filePath);
  res.setHeader('Content-Type', MIME[ext] || 'text/plain');
  res.setHeader('Access-Control-Allow-Origin', '*');
  try {
    res.end(fs.readFileSync(filePath));
  } catch (_) {
    res.statusCode = 404;
    res.end('404 Not Found: ' + urlPath);
  }
}).listen(PORT, HOST, () => {
  console.log('');
  console.log('  ✦ 诗云服务器已就绪 ✦');
  console.log('  http://' + HOST + ':' + PORT + '/诗云.html');
  console.log('');
  console.log('  按 Ctrl+C 停止服务器');
  console.log('');
});
